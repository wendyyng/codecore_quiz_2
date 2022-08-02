class User < ApplicationRecord
    has_many :ideas, dependent: :destroy
    has_secure_password

    def full_name
        self.first_name + " " + self.last_name
    end
end
