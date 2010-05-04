module Picombo
	module Controllers
		class Service < Picombo::Controllers::Template
			def initialize
				super
			end

			def create(server_id)
				if Picombo::Input.instance.post.length > 0
					server = Picombo::Models::Server.get(server_id)
					post = Picombo::Input.instance.post
					service = Picombo::Models::Service.new
					service.name = post['name']
					service.port = post['port']
					service.priority = post['priority']
					service.server = server

					service.save

					body = 'Service successfully saved.'
				else
					body = Picombo::View::Core.new('service/create')
					body.set('server_id', server_id)
					body.set('service', Picombo::Models::Service.new)
					body = body.render(true)
				end

				@@template.set('body', body)
			end
		end
	end
end