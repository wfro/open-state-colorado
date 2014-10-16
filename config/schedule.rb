every 1.day, at: "3:30 am" do
  users = User.gets_notifications
  users.each do |user|
    user.send_periodic_email if user.due_for_notification?
  end
end

every 1.week, at: "3:30 am" do
  rake "api:legislators"
  rake "api:bills"
end
