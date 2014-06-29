require 'net/http'
require 'httparty'

module MonitorIt
  class SaveData
    def self.to_store(events, host_port_path)
      retry_count = 0
      begin
        response = HTTParty.post(host_port_path,
                                 :body => {:name => events.name.to_s,
                                           :start => events.time.to_s,
                                           :finished => events.end.to_s,
                                           :duration => events.duration.to_s,
                                           :connection_id => events.transaction_id.to_s,
                                           :query => events.payload[:sql].to_s,
                                           :binds => events.payload[:binds].to_s,
                                           :path => events.payload[:path].to_s,
                                           :extra => events.payload.to_s,
                                           :parameters => events.payload[:params].to_s
                                 });
        return true;
      rescue Exception => ex
        Logger.info "MonitorIt: " + ex.message.to_s
        retry_count += 1
        retry if retry_count < 2
      end
    end
  end
end