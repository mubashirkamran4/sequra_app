
def show_progress(message)
  puts
  print "\e[32m==> \e[0m   " # show message prefix in green(==> )
  print "\e[1m#{message}\e[22m" # show the progress message in bold font
  puts
end

def show_progress_dot
  print "\e[32m. \e[0m"
end

def process_and_import_customers(file_path)
  records_file = Rails.root.join("lib/#{file_path}")
  customers = JSON.parse(File.read(records_file))["RECORDS"]
  record_entities = file_path.split('.')[0].capitalize
  show_progress "🥼 Creating #{record_entities} 🥼"
  customers.each do |customer|
    show_progress_dot if record_entities.singularize.constantize.create_with(customer).find_or_create_by(email: customer['email'])
  end
  show_progress "🥼 #{record_entities} Created 🥼 "
end

show_progress '🚦 Seeding process started 🚦'

process_and_import_customers('merchants.json')
process_and_import_customers('shoppers.json')


records_file = Rails.root.join("lib/orders.json")
orders = JSON.parse(File.read(records_file))["RECORDS"]

show_progress '📇 Creating Orders 📇'
orders.each do |order|
  show_progress_dot if Order.create!(order)
end
show_progress '📇 Orders Created 📇'


show_progress '💪💪💪 Seeding process finished successfully 💪💪💪'
