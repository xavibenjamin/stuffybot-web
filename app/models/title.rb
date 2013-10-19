class Title < ActiveRecord::Base
  attr_accessible :created_at, :irc_user_id, :show_id, :title, :votes_count

  validates :title, :presence => true, :length => { :maximum => 50 }
  validates :irc_user_id, :presence => true
  validates :show_id, :presence => true
  validates :title_lc, :presence => true

  validates_uniqueness_of :title_lc, :scope => :show_id, :message => 'Title already submitted'

  belongs_to :show
  belongs_to :irc_user

  has_many :votes

  after_initialize :set_title_lc

  def set_title_lc
  	if self.title
	  	self.title_lc = self.title.downcase
	  end
  end

end