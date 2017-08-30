/* Original Numerical Semigroups Code by Florent Hivert: https://www.lri.fr/~hivert/
   Link: https://github.com/hivert/NumericMonoid/blob/master/src/Cilk++/monoid.hpp
 */

#include <hpx/hpx.hpp>
#include <hpx/hpx_init.hpp>

#include <vector>

#include "enumerate/skeletons.hpp"

#include "monoid.hpp"
#include "util/func.hpp"

// Numerical Semigroups don't have a space
struct Empty {};

struct NodeGen : skeletons::Enum::NodeGenerator<Empty, Monoid> {
  // TODO: Ideally we want this to be a reference type
  Monoid group;
  generator_iter<CHILDREN> it;

  NodeGen() : group(Monoid()), it(generator_iter<CHILDREN>(Monoid())) {
    this->numChildren = 0;
  }

  NodeGen(const Monoid & s) : group(s), it(generator_iter<CHILDREN>(s)){
    this->numChildren = it.count();
    it.move_next(); // Original code skips begin
  }

  Monoid next() override {
    auto res = remove_generator(group, it.get_gen());
    it.move_next();
    return res;
  }
};

NodeGen generateChildren(const Empty & space, const Monoid & s) {
  return NodeGen(s);
}

typedef func<decltype(&generateChildren), &generateChildren> genChildren_func;
REGISTER_ENUM_REGISTRY(Empty, Monoid)

// Annoying way to get large stack sizes by default (hide this if possible)
namespace hpx { namespace traits {
  template <>
  struct action_stacksize<skeletons::Enum::DistCount<Empty, Monoid, genChildren_func>::ChildTask> {
    enum { value = threads::thread_stacksize_large };
  };

  template <>
  struct action_stacksize<skeletons::Enum::DistCount<Empty, Monoid, genChildren_func, skeletons::Enum::Indexed>::ChildTask> {
    enum { value = threads::thread_stacksize_large };
  };
}};

int hpx_main(boost::program_options::variables_map & opts) {
  auto spawnDepth = opts["spawn-depth"].as<unsigned>();
  auto maxDepth   = opts["until-depth"].as<unsigned>();
  auto skeleton   = opts["skeleton-type"].as<std::string>();

  Monoid root;
  init_full_N(root);

  std::vector<std::uint64_t> counts(maxDepth);
  if (skeleton == "seq") {
    counts = skeletons::Enum::Count<Empty, Monoid, genChildren_func>::search(maxDepth, Empty(), root);
  } else
  if (skeleton == "seq-stack") {
    counts = skeletons::Enum::Count<Empty, Monoid, genChildren_func, skeletons::Enum::Stack, std::integral_constant<std::size_t, MAX_GENUS> >::search(maxDepth, Empty(), root);
  } else if (skeleton == "dist") {
    counts = skeletons::Enum::DistCount<Empty, Monoid, genChildren_func>::count(spawnDepth, maxDepth, Empty(), root);
  } else if (skeleton == "indexed"){
    counts = skeletons::Enum::DistCount<Empty, Monoid, genChildren_func, skeletons::Enum::Indexed>::count(maxDepth, Empty(), root);
  } else {
    std::cout << "Invalid skeleton type: " << skeleton << std::endl;
    return hpx::finalize();
  }

  std::cout << "Results Table: " << std::endl;
  for (auto i = 0; i <= maxDepth; ++i) {
    std::cout << i << ": " << counts[i] << std::endl;
  }
  std::cout << "=====" << std::endl;

  return hpx::finalize();
}

int main(int argc, char* argv[]) {
  boost::program_options::options_description
    desc_commandline("Usage: " HPX_APPLICATION_STRING " [options]");

  desc_commandline.add_options()
    ( "skeleton-type",
      boost::program_options::value<std::string>()->default_value("dist"),
      "Which skeleton to use"
    )
    ( "spawn-depth,s",
      boost::program_options::value<unsigned>()->default_value(0),
      "Depth in the tree to spawn until (for parallel skeletons only)"
    )
    ( "until-depth,d",
      boost::program_options::value<unsigned>()->default_value(0),
      "Depth in the tree to count until"
    );

  // hpx::register_startup_function(&workstealing::registerPerformanceCounters);
  // hpx::register_startup_function(&workstealing::indexed::registerPerformanceCounters);

  return hpx::init(desc_commandline, argc, argv);
}