class Member < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :dob, presence: true
    validates :external_member_id, presence: true, uniqueness: true
    validates :zip, presence: true
    encrypts :first_name, :last_name, deterministic: true
end
