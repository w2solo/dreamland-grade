module Grade
  class UserScoreLog < ApplicationRecord
    enum change_type: { increase: 0, decrease: 1 }
  end
end
