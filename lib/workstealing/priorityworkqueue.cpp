#include "priorityworkqueue.hpp"
#include "hpx/runtime/components/component_factory.hpp"        // for compon...
#include "hpx/runtime/components/component_factory_base.hpp"   // for compon...
#include "hpx/runtime/components/component_registry.hpp"       // for compon...
#include "hpx/runtime/components/component_registry_base.hpp"  // for compon...
#include "hpx/runtime/components/component_type.hpp"           // for compon...
#include "hpx/runtime/components/server/component.hpp"         // for component
#include "hpx/runtime/components/static_factory_data.hpp"      // for init_r...
#include "hpx/runtime/components/unique_component_name.hpp"    // for unique...
#include "hpx/traits/component_type_database.hpp"              // for compon...
#include "hpx/util/plugin/concrete_factory.hpp"                // for concre...
#include "hpx/util/plugin/export_plugin.hpp"                   // for actname
#include "hpx/util/tuple.hpp"                                  // for get
#include "hpx/lcos/base_lco_with_value.hpp"
namespace hpx { namespace naming { struct id_type; } }
namespace hpx { namespace util { namespace plugin { template <class BasePlugin> struct abstract_factory; } } }

namespace workstealing
{
  using funcType = hpx::util::function<void(hpx::naming::id_type)>;
  funcType priorityworkqueue::steal() {
    if (!tasks.empty()) {
      auto task = tasks.top();
      tasks.pop();
      return hpx::util::get<1>(task);
    }
    return nullptr;
  }

  void priorityworkqueue::addWork(int priority, funcType task) {
    tasks.push(hpx::util::make_tuple(priority, std::move(task)));
  }
}
HPX_REGISTER_COMPONENT_MODULE();

typedef hpx::components::component<workstealing::priorityworkqueue> workqueue_type;

HPX_REGISTER_COMPONENT(workqueue_type, priority_workqueue);

HPX_REGISTER_ACTION(workstealing::priorityworkqueue::steal_action, workqueue_prio_steal_action);
HPX_REGISTER_ACTION(workstealing::priorityworkqueue::addWork_action, workqueue_prio_addWork_action);
