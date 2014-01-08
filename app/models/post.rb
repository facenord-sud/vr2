class Post < ActiveRecord::Base

  belongs_to :user

  #mount_uploader :image, ImageUploader

  has_one :test_image, class_name: 'Image', dependent: :destroy

  accepts_nested_attributes_for :test_image, allow_destroy: true

  scope :published, -> { where(published: true) }

  validates_presence_of :title
  validates_presence_of :body
  validates_presence_of :test_image

  def start_year
    created_at.year
  end

  def start_month
    created_at.month
  end

  def self.posts_by_month
    posts = self.where('posts.created_at <= ?', Time.zone.now-1.month).order('created_at DESC').all
    return [] if posts.empty?
    year =  posts.first.start_year
    month = posts.first.start_month
    posts_to_return = {year => {month => {}}}
    posts.each do |a_post|
      if year != a_post.start_year
        year = a_post.start_year
        posts_to_return[year] = {}
      end
      if month != a_post.start_month
        month = a_post.start_month
        posts_to_return[year][month] = {}
      end
      posts_to_return[a_post.start_year][a_post.start_month][a_post.id] = a_post
    end
    posts_to_return
  end
end
