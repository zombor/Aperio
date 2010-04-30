module Picombo
	module Models
		class User < Picombo::Model
			storage_names[:default] = 'users'

			property :id,		Serial
			property :username,	String, :unique => :u1
			property :password,	String
			property :email,	String

			has n, :twoots, :model => 'Picombo::Models::Twoot'
		end
	end
end