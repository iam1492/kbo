class Comment < ActiveRecord::Base
  attr_accessible :ball, :base, :comment, :extra_1, :extra_2, :game_id, :out_count, :stage, :strike, :team_idx, :type, :user_id, :created_at
  belongs_to :user
  acts_as_api

  def self.getComments(_teamIdx, _count)
    where("team_idx = ?", _teamIdx).limit(_count).order('id desc')
  end

  def self.getMoreComments(_createdAt, _teamIdx)
    where("created_at > ? AND team_idx = ?", _createdAt, _teamIdx)
  end

  api_accessible :user_with_comments do |t|
  	t.add :ball
  	t.add :base
  	t.add :comment
  	t.add :game_id
  	t.add :out_count
  	t.add :stage
  	t.add :strike
  	t.add :team_idx
  	t.add :type
  	t.add :user_id
    t.add :created_at
  end

end
