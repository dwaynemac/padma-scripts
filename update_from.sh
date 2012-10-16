echo "pulling from repository"
git pull $1 $2
echo "building bundle..."
bundle > log/update_from.log
echo "updating databases..."
rake db:migrate RAILS_ENV=development
# rake db:migrate RAILS_ENV=test
# migrate db and copy it. this way is faster
cp db/development.sqlite3 db/test.sqlite3