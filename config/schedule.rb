require_relative('../app/workers/disburse_worker.rb')

every :tuesday, at: "6:49 PM" do
  runner "DisburseWorker.perform", output: {error: "#{path}/log/error.log", standard: "#{path}/log/cron.log"}
end