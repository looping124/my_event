class UserMailer < ApplicationMailer
  default from: 'looping124@yopmail.com'

  def create(user)
    @user = user
    @url  = 'http://monsite.fr/login' 

    mail(to:user.email, subject:'Sujet de test')
    puts "x"*60
    puts user.email
  end

end
