require 'rails/generators/migration'

module MonitorIt
  module Generators
    #How to call this generator
    #rails g monitor_it:install
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      # write public methods that should run in order
      desc "Installs MonitorIt"

      def self.source_root
        @_monitor_it_source_root ||= File.expand_path('../', __FILE__)
      end

      # add initializer
      def copy_initializer_file
        template "initializers/templates/monitor_it_initializer.rb", "config/initializers/monitor_it.rb"
      end

      # create route
      def setup_routes
        path = File.expand_path('../', __FILE__)
        routing_code = File.read("#{path}/routes/templates/routes.rb")
        route "#{routing_code}"
      end
    end
  end
end