set :environment, 'production'
set :output, { error: 'cron_error.log', standard: 'cron.log' }

every :day, at: '10:30 am' do
  rake 'plans:renew'
end