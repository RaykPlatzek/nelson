release: rake db:migrate db:seed
web: bundle exec puma -p $PORT -C ./config/puma.rb
clock: bundle exec clockwork config/clock.rb