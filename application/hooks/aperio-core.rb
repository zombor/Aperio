# Provides autoloading for Aperio classes
module Aperio
	module Models
		def Models.const_missing(name)
			filename = name.to_s

			require 'models/aperio/'+filename.downcase

			raise filename+' not found!' if ! const_defined?(name)

			klass = const_get(name)
			return klass if klass
			raise klass+" not found!"
		end
	end
end

Picombo::Models::Service.services = ['ping']