every 1.week, at: "3:30 am" do
  rake "api:legislators"
  rake "api:bills"
end
