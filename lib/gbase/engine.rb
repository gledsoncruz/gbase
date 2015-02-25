#require 'devise'
#require 'less-rails-bootstrap'
Gem.loaded_specs['gbase'].dependencies.each do |d|
 require d.name
end

require 'gbase/engine'

module Gbase
  class Engine < ::Rails::Engine
    isolate_namespace Gbase
	Time::DATE_FORMATS[:data_br] = "%d/%m/%Y"
	Time::DATE_FORMATS[:dia_semana] = "%A"
	Time::DATE_FORMATS[:hora] = "%H:%M:%S"
	Time::DATE_FORMATS[:month_and_year] = "%B %Y"
  end
end
