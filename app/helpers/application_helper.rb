module ApplicationHelper
  def active_users
    User.all.count
  end

  def reg_devices
    User.all.map {|_| _.devices}.count
  end

  def reg_dealers
    User.all.select {|_| _.dealer? }.count
  end
end
