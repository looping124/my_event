class UserMailer < ApplicationMailer
  default from: 'lenetcedric@gmail.com'

  def create(user)
    @user = user
    @url  = 'http://monsite.fr/login' 

    mail(to:user.email, subject:'Sujet de test')
    puts "x"*60
    puts user.email
  end

end
