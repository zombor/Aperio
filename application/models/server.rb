module Picombo
	module Models
		class Server < Picombo::Model
			storage_names[:default] = 'servers'

			property :id,               Serial
			property :hostname,         String, :unique => :u1
			property :identifier,       String
			property :default_priority, Integer

			has n, :services, :model => 'Picombo::Models::Service'
		end
	end
end