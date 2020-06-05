class Talk < ApplicationRecord
    validates :question, presence: true, length: {maximum:255}
end
