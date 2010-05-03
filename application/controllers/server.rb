module Picombo
	module Controllers
		class Server < Picombo::Controllers::Template
			def initialize
				super
			end

			def index
				servers = Picombo::Models::Server.all
				body = Picombo::View::Core.new('server/index')
				body.set('servers', servers)

				@@template.set('body', body.render(true))
			end

			def create
				if Picombo::Input.instance.post.length > 0
					post = Picombo::Input.instance.post
					server = Picombo::Models::Server.new
					server.hostname = post['hostname']
					server.identifier = post['identifier']
					server.default_service_priority = post['default_service_priority']

					server.save
					body = 'Server successfully saved.'
				else
					body = Picombo::View::Core.new('server/create').render(true)
				end

				@@template.set('body', body)
			end

			def services(server_id)
				server = Picombo::Models::Server.get(server_id)
				services = server.services
				body = Picombo::View::Core.new('server/services')
				body.set('services', services)
				body.set('server', server)

				@@template.set('body', body.render(true))
			end
		end
	end
end