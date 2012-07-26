require 'qlive/rack'
require 'qlive/dev_reload'
require 'qlive/suite'

module Qlive
  class Engine < Rails::Engine

    initializer "qlive" do |app|
      Qlive.setup[:base_path] ||= "#{Rails.root}/spec/qunits"

      puts "Mounting Qlive::Rack to allow qunit testing against your server's backend. (Never use this rack on production systems.)"
      if Qlive.setup[:hand_mounted]
        Qlive.setup[:hand_mounted].call
      else
        app.middleware.insert_after(::ActionDispatch::ParamsParser, Qlive::Rack, {
          :base_path => Qlive.setup[:base_path]
        })
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      if Qlive.setup[:gem_dev_mode]
        app.middleware.insert_before(::ActionDispatch::ParamsParser, Qlive::DevReload)
      end
    end

  end
end
