module Grade
  class Rule < ApplicationRecord
    validates :action, presence: true, uniqueness: true
    validates :change_type, presence: true
    
    enum change_type: { increase: 0, decrease: 1 }
  end
end
