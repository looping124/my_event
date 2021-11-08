class AttendanceMailer < ApplicationMailer
  default from: 'lenetcedric@gmail.com'

  def create(attendance)
    @attendance = attendance
    @url  = 'http://monsite.fr/login' 

    mail(to:attendance.user.email, subject:'Votre participation à l\'evenement est confirmée')
    puts "x"*60
    puts attendance.user.email
  end

end
