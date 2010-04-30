module Picombo
	module Controllers
		class Server < Picombo::Controllers::Template
			def initialize
				super
			end

			def index
				@@template.set('body', 'foo')
			end
		end
	end
end