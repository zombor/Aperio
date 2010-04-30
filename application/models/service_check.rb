module Picombo
	module Models
		class Service_Check < Picombo::Model
			storage_names[:default] = 'service_checks'

			property :id,     Serial
			property :result, String
			property :date,   DateTime

			belongs_to :service, :model => 'Picombo::Models::Service'
		end
	end
end