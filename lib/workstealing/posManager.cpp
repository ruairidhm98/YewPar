#include "posManager.hpp"
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
namespace hpx { namespace util { namespace plugin { template <class BasePlugin> struct abstract_factory; } } }

HPX_REGISTER_COMPONENT_MODULE();

typedef hpx::components::component<workstealing::indexed::posManager> posMgr_type;
HPX_REGISTER_COMPONENT(posMgr_type, posManager);

HPX_REGISTER_ACTION(workstealing::indexed::posManager::registerDistributedManagers_action, posManager_registerDistributedManagers_action);
HPX_REGISTER_ACTION(workstealing::indexed::posManager::getWork_action, posManager_getWork_action);
HPX_REGISTER_ACTION(workstealing::indexed::posManager::addWork_action, posManager_addWork_action);
HPX_REGISTER_ACTION(workstealing::indexed::posManager::done_action, posManager_done_action);
