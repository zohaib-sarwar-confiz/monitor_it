# MonitorIt

MonitorIt MonitorIt is a gem that can be help to monitor request performance. This Gem has two components, MonitorIt is agent/client and MonitorData is a ruby application that save statistics on which MonitorIt is installed. It is suggest that you clone and configure MonitorData application first for that GOTO http://github.com/zohaib-sarwar-confiz/MonitorData.

## Installation

Add this line to your application's Gemfile:

    gem 'monitor_it', :git => 'https://github.com/zohaib-sarwar-confiz/monitor_it.git'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install monitor_it

After you install MonitorIt and add it to your Gemfile, you need to run the generator:

    $ rails generate monitor_it:install

## Initializer Configuration

MonitorIt is used as a rack middleware and you have to do some changes in config/initializers/monitor_it.rb, replace 'AppName' with your application name, replace 'localhost' with the domain name at which MonitorData application is running and replace '3000' with port on which MonitorData application is listening.

## Install MonitorData

If have not clone and configure the MonitorData application that record statistics of yours application Goto http://github.com/zohaib-sarwar-confiz/MonitorData.

If you have configure monitor_it gem and clone and configure MonitorData application than you are done just explore few page from you application following instruction presented in next paragraph.

## Request Stats Monitoring
MonitorIt gem monitor yours request stats and send them to MonitorData server. You can open MonitorData url in browsers and can view stats of request OR open url of application on which monitor_it gem configured application_url/monitor_it.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request