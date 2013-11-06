require "csv"

id = 1
# Create Events
Event.delete_all
CSV.foreach('db/seeds/events.csv') do | row|
  Event.create(id: id,title: row[0], description: row[1], capacity: row[2], place: row[3], start_at: row[4], finish_at: row[5], upcoming: row[6])
end

# Create Booths
id = 1
Booth.delete_all
CSV.foreach('db/seeds/booths.csv') do | row|
  Booth.create(id: id, name: row[0], capacity: row[1])
  id += 1
end

# Create Contents
Content.delete_all
CSV.foreach('db/seeds/contents.csv') do | row|
  Content.create(id: id, event_id: row[0], booth_id: row[1], title: row[2], description: row[3], start_at: row[4], finish_at: row[5], speaker_name: row[6], speaker_profile: row[7])
  id += 1
end

# Create Users
id = 1
User.delete_all
CSV.foreach('db/seeds/users.csv') do | row|
  User.create(id: id, email: row[0], password: row[1], admin: row[2], nickname: row[3], code: row[4])
  id += 1
end

# Create Entries
id = 1
Entry.delete_all
CSV.foreach('db/seeds/entries.csv') do | row|
  Entry.create(id: id, content_id: row[0], user_id: row[1])
  id += 1
end
