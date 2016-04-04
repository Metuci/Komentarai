class Comment < ActiveRecord::Base
	belongs_to :article
	validates_presence_of :article
	validates :content, presence: true
end
