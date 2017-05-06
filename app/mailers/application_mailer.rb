class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  helper ProductsHelper
  layout 'mailer'
end
