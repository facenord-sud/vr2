# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  body       :text
#  published  :boolean
#  image      :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  to_front   :boolean          default(FALSE)
#  video_id   :integer
#

class Post < ActiveRecord::Base

  belongs_to :user

  #mount_uploader :image, ImageUploader

  has_one :test_image, class_name: 'Image', dependent: :destroy
  belongs_to :video

  accepts_nested_attributes_for :test_image, allow_destroy: true

  scope :published, -> { where(published: true) }
  scope :a_la_une, -> {where(published: true, to_front: true)}

  validates_presence_of :title
  validates_presence_of :body

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
