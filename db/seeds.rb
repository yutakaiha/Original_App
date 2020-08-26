table_names = %w[information categories events subsidies]
table_names.each do |table_name|
  environment = (Rails.env == "test") ? "development" : Rails.env
  path = Rails.root.join("db/seeds", environment, table_name + ".rb")
  if File.exist?(path)
    puts "Creating #{table_name}...."
    require path
  end
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?