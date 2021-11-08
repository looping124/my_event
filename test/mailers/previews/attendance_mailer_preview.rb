# Preview all emails at http://localhost:3000/rails/mailers/attendance_mailer
class AttendanceMailerPreview < ActionMailer::Preview
  def create
    AttendanceMailer.create(Attendance.first)
  end
end
