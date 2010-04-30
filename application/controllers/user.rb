module Picombo
	module Controllers
		class User < Picombo::Controllers::Template
			def initialize
				super
			end

			def index
				body = Picombo::View::Core.new('user/login')
				body.set('post', Picombo::Session.instance.get.inspect)

				@@template.set('body', body.render(true))
			end

			def create
				if Picombo::Input.instance.post.length > 0

					user = Picombo::Models::User.new
					user.username = Picombo::Input.instance.post('username')
					user.email = Picombo::Input.instance.post('email')
					user.password = Digest::SHA1.hexdigest(Picombo::Input.instance.post('password'))
					user.save

					body = Picombo::View::Core.new('user/create_success')
					body.set('user', user.inspect)

					Picombo::Auth.instance.login(user.username, Picombo::Input.instance.post('password'))
				else
					body = Picombo::View::Core.new('user/create')
				end
				@@template.set('body', body.render(true))
			end

			def login
				if Picombo::Input.instance.post.length > 0
					if Picombo::Auth.instance.login(Picombo::Input.instance.post('username'), Picombo::Input.instance.post('password'))
						body = 'You have logged in!'
					else
						body = 'Invalid password or unknown username'
					end
				else
					body = Picombo::View::Core.new('user/login').render(true)
				end
				@@template.set('body', body)
			end
		end
	end
end