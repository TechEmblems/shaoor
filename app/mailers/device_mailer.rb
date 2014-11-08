class DeviceMailer < ActionMailer::Base
  default from: 'info@regdevice.com'

  def device_registered(user, device)
    mail(
        to: user.email, subject: 'Device Successfully Registered',
        body: "Your #{device.type} with key: #{device.key} is successfully registered with RegDevice.com"
    )
  end

  def pending_request(user, device)
    mail(
        to: user.email, subject: 'Device Registration Pending',
        body: "Your #{device.type} with key: #{device.key} registration is in pending state. It will take another 24 hours to complete registration."
    )
  end
end
