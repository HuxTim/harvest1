class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  helper ProductsHelper
  helper ApplicationHelper
  layout 'mailer'
end
