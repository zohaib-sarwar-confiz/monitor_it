class CreateMonitorItRequests < ActiveRecord::Migration
  def self.up
    create_table :monitor_it_requests do |t|
      t.string :name
      t.text :parameters
      t.text :query
      t.text :extra
      t.text :binds
      t.text :connection_id
      t.text :path
      t.datetime :duration

      t.timestamps
    end
    add_index :monitor_it_requests, :id
    add_index :monitor_it_requests, :name
  end

  #revert db changes
  def self.down
    drop_table :monitor_it_requests
  end

end