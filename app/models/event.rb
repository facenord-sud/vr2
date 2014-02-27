# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  starting_at :date
#  ending_at   :date
#  title       :string(255)
#  description :text
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  to_front    :boolean
#  image       :string(255)
#  place       :string(255)
#

class Event < ActiveRecord::Base
  #attr_accessible :description, :ending_at, :starting_at, :title

  belongs_to :user

  mount_uploader :image, ImageUploader

  scope :month, -> (date = Time.zone.now) { where(
      '(events.starting_at BETWEEN :starting_at AND :ending_at) OR
  (events.ending_at BETWEEN :starting_at AND :ending_at)',
      starting_at: date.beginning_of_month,
      ending_at: date.end_of_month
  ) }
  scope :next, -> { where('events.starting_at >= ?', Time.zone.now).order('starting_at ASC').first }

  scope :future, -> { where('events.starting_at >= ? OR events.ending_at >= ?', Time.zone.now, Time.zone.now).order('starting_at ASC') }

  scope :sticky, -> { where(to_front: true).order('updated_at DESC').first }

  scope :past, -> { where('events.starting_at <= ?', Time.zone.now).order('starting_at DESC').all }

  validates_presence_of :title
  #validates_presence_of :description
  validates_presence_of :starting_at
  validates_presence_of :ending_at
  validates_presence_of :place
  #validates :to_front

  def unique_to_front
    if to_front
      if Event.where(to_front: true).any?
        false
      end
      false if image.nil?
    end
  end

  def start_month
    starting_at.month
  end

  def start_year
    starting_at.year
  end

  def end_year
    ending_at.year
  end

  def end_month
    ending_at.month
  end

  def one_day?
    starting_at == ending_at
  end

  def self.future_by_year
    events = self.future
    return [] if events.empty?
    year = events.first.start_year
    events_to_return = { year => {}}
    events.each do |an_event|
      if year != an_event.start_year
        year = an_event.start_year
        events_to_return[year] = {}
      end
      events_to_return[an_event.start_year][an_event.id] = an_event
    end
    events_to_return
  end

  def self.past_by_month
    events = self.where('events.starting_at <= ?', Time.zone.now).order('starting_at DESC').all
    return [] if events.empty?
    year =  events.first.start_year
    month = events.first.start_month
    events_to_return = {year => {month => {}}}
    events.each do |an_event|
      if year != an_event.start_year
        year = an_event.start_year
        events_to_return[year] = {}
      end
      if month != an_event.start_month
        month = an_event.start_month
        events_to_return[year][month] = {}
      end
      events_to_return[an_event.start_year][an_event.start_month][an_event.id] = an_event
    end
    events_to_return
  end

  def self.old
    events = []
    years = {}
    months_e = {}
    event = {}
    test = []
    past_by_month.each_with_index do |(year_key, months), index|
      years[:label] = year_key
      years[:children] = []
      months.each_with_index do |(month_key, events_by_month), index_m|
        months_e[:label] = month_key
        months_e[:children] = []
        events_by_month.each do |id_key, an_event|
          event[:label] = an_event.title
          months_e[:children] << event
        end
        test[index_m] = months_e
      end
      logger.debug(test)
    end
    test
  end

end
