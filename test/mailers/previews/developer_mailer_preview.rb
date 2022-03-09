# Preview all emails at http://localhost:3000/rails/mailers/developer_mailer
class DeveloperMailerPreview < ActionMailer::Preview
  def bug_assign
    DeveloperMailer.with(id: User.first.id).bug_assign
  end
end
