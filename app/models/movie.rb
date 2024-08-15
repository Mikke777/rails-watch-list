class Movie < ApplicationRecord
  has_many :bookmarks
  before_destroy :check_bookmarks

  def check_bookmarks
    if bookmarks.any?
      errors.add(:base, "Cannot delete movie with bookmarks")
      return false
    end
  end

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
end
