module Grade
  class UserScore < ApplicationRecord
    def increase_score(change_score, message)
      new_score = self.score + change_score
      self.update(score: new_score)
      options = {
        message: message,
        user_id: self.user_id,
        score: change_score,
        after_score: new_score,
        change_type: :increase
      }
      generate_log(options)
    end

    def decrease_score(change_score, message)
      new_score = self.score - change_score
      self.update(score: new_score)
      options = {
        message: message,
        user_id: self.user_id,
        score: change_score,
        after_score: new_score,
        change_type: :decrease
      }
      generate_log(options)
    end

    private

    def generate_log(options)
      UserScoreLog.create(options)
    end
  end
end
