namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_posts
  end
end

def make_posts
  500.times do |n|
    title = Faker::Lorem.characters Random.new.rand(5..30)
    body = Faker::Lorem.sentence 12
    asset = File.open(Dir.glob(File.join('/Users/leo/Pictures/leo', '*', '*.jpg')).sample)
    i_title = Faker::Lorem.characters Random.new.rand(5..30)
    i_legend = Faker::Lorem.sentence 1
    image = Image.create!(
        title: i_title,
        legend: i_legend,
        asset: asset
    )
    u = User.find 1
    Post.create!(
        title: title,
        body: body,
        published: true,
        test_image: image,
        user: u
    )
  end
  change_date
end

def change_date
  Post.all.each do |p|
    p.updated_at = p.created_at = rand_time(Time.zone.now-5.year)
    p.save
  end
end

def rand_time(from, to=Time.zone.now)
  DateTime.at(rand_in_range(from.to_f, to.to_f))
end

def rand_in_range(from, to)
  rand * (to - from) + from
end
