module Grade
  class ScoreService
    def self.current_score(user_id)
      return 0 if user_id.nil?
      user_score = Grade::UserScore.find_or_create_by(user_id: user_id)
      user_score.score
    end

    def self.score_logs(user_id)
      Grade::UserScoreLog.where(user_id: user_id)
    end

    def self.change_score(user_id, action)
      return if user_id.nil?
      user_score = Grade::UserScore.find_or_create_by(user_id: user_id)
      rule = Grade::Rule.find_by(action: action)
      return if rule.nil?
      if rule.increase?
        user_score.increase_score(rule.score, rule.message)
      else
        user_score.decrease_score(rule.score, rule.message)
      end
    end
  end
end
