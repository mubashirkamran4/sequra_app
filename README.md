### Technical Components

* The db structure contains 3 models for data persistence:
  * Merchant
  * Shopper
  * Order

All of them contain the same attributes as from original data except **Order** model 
which contains 2 extra attributes for disbursement calculation i.e. **disbursement_amount** and **disbursed_at**.

* For calculation of the disbursement_amount, I used **whenever** gem due to time restraints however should have used **sidekiq** alongwith **redis** in an ideal scenario.

* The job for calcualtion of disbursement is `app/workers/disburse_worker.rb`.
It calculates the disbursed amount and stores it in `disbursement_amount` along with current timestamp at `disbursed_at` column.

* The API endpoint is via `OrdersController` as information relates to Order.
* Dockerizing and covering the code with test cases was also in my todo list which I couldn't.

### How to Run

* Clone the repo via:
`git clone git@github.com:mubashirkamran4/sequra_app.git`


* Change to cloned project directory in terminal via `cd sequra_app` and run following commands successively:

  * `bundle install`

  * `rails db:create db:migrate db:seed`
  

* To schedule the job within the current hour go to `config/schedule.rb` and change line 3 to `every :tuesday, at: "6:49 PM" do:`to `every :<current_day_of_week>, at: "<current_hour>:<after 5 minutes> <AM or PM>" do:` and execute the following command to get the job scheduled:

  * `whenever --update-crontab --set environment=development`
.
  This would schedule the job to be run every week at the configured time in the step

* It takes less than a minute to finish the job as per data imported.

* To view the disbursements for a merchant for current week just go to terminal and start server via:

`rails s`

and go to [http://localhost:3000/disbursements_per_week.json?merchant_id=8&date=2022-08-30](localhost:3000/disbursements_per_week.json?merchant_id=8)

* You can enter any id of merchant at `merchant_id` parameter to see all the disbursements for the given week of the date provided in `date` parameter
* Or you can skip the parameter `merchant_id` to see the the disbursements for all the merchants for the week of the provided date like [http://localhost:3000/disbursements_per_week.json?date=2022-08-01](http://localhost:3000/disbursements_per_week.json?date=2022-08-01)



