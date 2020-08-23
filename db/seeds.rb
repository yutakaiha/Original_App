table_names = %w[information subsidies categories]
table_names.each do |table_name|
  environment = (Rails.env == "test") ? "development" : Rails.env
  path = Rails.root.join("db/seeds", environment, table_name + ".rb")
  if File.exist?(path)
    puts "Creating #{table_name}...."
    require path
  end
end