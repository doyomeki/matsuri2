require "csv"

# Create Events
if Rails.env.development?
  id = 1
  Event.delete_all
  CSV.foreach('db/seeds/events.csv') do | row|
    Event.create(id: id,title: row[0], description: row[1], capacity: row[2], place: row[3], start_at: row[4], finish_at: row[5], upcoming: row[6])
  end
end

## Create Booths
if Rails.env.development?
  id = 1
  Booth.delete_all
  CSV.foreach('db/seeds/booths.csv') do | row|
    Booth.create(id: id, name: row[0], capacity: row[1])
    id += 1
  end
end

# Create Contents
id = 1
Content.delete_all
CSV.foreach('db/seeds/contents.csv') do | row|
  Content.create(id: id, event_id: row[0], booth_id: row[1], title: row[2], description: row[3], start_at: row[4], finish_at: row[5], speaker_name: row[6], speaker_profile: row[7], speaker_image_file_name: row[8], speaker_image_content_type: row[9], speaker_image_file_size: row[10], content_image_path: row[11])
  id += 1
end

## Create Users
if Rails.env.development?
  id = 1
  User.delete_all
  CSV.foreach('db/seeds/users.csv') do | row|
    User.create(id: id, password: row[0], admin: row[1], nickname: row[2], code: row[3])
    id += 1
  end
end

## Create Entries
if Rails.env.development?
  id = 1
  Entry.delete_all
  CSV.foreach('db/seeds/entries.csv') do | row|
    Entry.create(id: id, content_id: row[0], user_id: row[1])
    id += 1
  end
end
