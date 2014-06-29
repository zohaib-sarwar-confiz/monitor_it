require_dependency "monitor_it/application_controller"

module MonitorIt
  class MonitorItController < ApplicationController
    def index
      @url_and_params = MonitorIt::Rack.host_with_port_fetch_path
    end
  end
end
