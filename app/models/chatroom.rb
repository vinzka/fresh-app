class Chatroom < ApplicationRecord
  belongs_to :activity
  has_many :messages, dependent: :destroy

  def self.connect_all_chatrooms
    Activity.all.each { |activity| activity.add_chatroom if !activity.my_chatroom}
  end
end
