class DeveloperMailer < ApplicationMailer
  default from: 'sagarvandari1@gmail.com'
  def bug_assign
    @user = User.find_by_id(params[:id])
    @url = 'http://localhost:3000/users/sign_in'
    mail(to: @user.email, subject: 'A Bug has been assigned to you')
  end
end
