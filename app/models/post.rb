class Post < ActiveRecord::Base

  validates :title,
    presence: true,
    length: {minimum: 10, maximum: 100}

  validates :link,
    presence: true

  belongs_to :user

end
