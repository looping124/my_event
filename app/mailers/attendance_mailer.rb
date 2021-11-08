class AttendanceMailer < ApplicationMailer
  default from: 'lenetcedric@gmail.com'

  def create(attendance)
    @attendance = attendance
    @url  = 'http://monsite.fr/login' 

    mail(to:attendance.user.email, subject:'attendance créé')
    puts "x"*60
    puts user.email
  end

end
