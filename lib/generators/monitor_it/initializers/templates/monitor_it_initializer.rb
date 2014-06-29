#Default Configurations for MonitorIt Engine
AppName::Application.config.middleware.use MonitorIt::Rack,
  :subscribe_me => { :options => ["process_action.action_controller"],
                     :enabled_environments => ["development", "production"],
                     :host => "http://localhost",
                     :port => "3000"}