class Comment < ActiveRecord::Base
  attr_accessible :ball, :base, :comment, :extra_1, :extra_2, :game_id, :out_count, :stage, :strike, :team_idx, :type, :user_id

  belongs_to :user

  acts_as_api

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
  end

end
