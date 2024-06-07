class Player < ApplicationRecord
  belongs_to :user
  has_many :shares
  has_many :teams, through: :shares

  validates :name, presence: true, uniqueness: true

  def points
    @points ||= shares.inject(0) do |total , share|
      total + share.points
    end
  end

  def spend_credits(amount)
    raise StandardError, "Not enough Credits!" if credits < amount.to_i
    update(credits: credits - amount.to_i)
  end
end
