require "monitor_it/engine"
require 'library/save_data'

module MonitorIt
  class Rack
    def initialize(app, options = {:subscribe_me => {:options => [], :enabled_environments=> [], :host => "", :port => "", :create_path => "", :fetch_path => "/" }})
      @app = app
      @@subscribe_to ||= (options[:subscribe_me][:options] and options[:subscribe_me][:enabled_environments].include?(Rails.env)) ? options[:subscribe_me][:options] : []
      @@subscribe_to.each do |opt|
        ActiveSupport::Notifications.subscribe /#{opt}/ do |*args|
          record_arguments(*args)
        end
      end

      options[:subscribe_me][:create_path] = '/request/create' if options[:subscribe_me][:create_path].blank?
      options[:subscribe_me][:fetch_path] = '/' if options[:subscribe_me][:fetch_path].blank?
      if options[:subscribe_me][:host].present? and options[:subscribe_me][:port].present?
        @@host_port_create_path = options[:subscribe_me][:host] + ":" + options[:subscribe_me][:port] + options[:subscribe_me][:create_path]
        @@host_port_fetch_path = options[:subscribe_me][:host] + ":" + options[:subscribe_me][:port] + options[:subscribe_me][:fetch_path]
      else
        @@host_port_create_path = nil
        @@host_port_fetch_path = nil
      end
    end

    def self.host_with_port_fetch_path
      @@host_port_fetch_path
    end

    def record_arguments(*args)
      events = ActiveSupport::Notifications::Event.new(*args)
      MonitorIt::SaveData.to_store(events, @@host_port_create_path) if @@host_port_create_path.present?
    end

    def call(env)
      @app.call(env)
    end
  end
end