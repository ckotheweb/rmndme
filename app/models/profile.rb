class Profile < ActiveRecord::Base
  belongs_to :user #one-to-one relationship
end
