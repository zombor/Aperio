module Picombo
	module Models
		class Service < Picombo::Model
			storage_names[:default] = 'services'

			property :id,       Serial
			property :name,     String
			property :port,     Integer
			property :priority, Integer

			belongs_to :server, :model => 'Picombo::Models::Server'

			@@services = []

			def self.services=(services)
				@@services+=services
			end

			def self.options
				@@services
			end
		end
	end
end