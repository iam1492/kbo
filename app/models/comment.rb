class Comment < ActiveRecord::Base
  attr_accessible :ball, :base, :comment, :extra_1, :extra_2, :game_id, :out_count, :stage, :strike, :team_idx, :type, :user_id
end
