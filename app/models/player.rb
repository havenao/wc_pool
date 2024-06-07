class Player < ApplicationRecord
  belongs_to :user
  has_many :shares
  has_many :teams, through: :shares

  validates :name, presence: true, uniqueness: true

  def display_name
    @display_name ||= nickname || name
  end

  def points
    @points ||= shares.inject(0) { |total , share| total + share.points } || 0
  end

  def spend_credits(amount)
    raise StandardError, "Not enough Credits!" if credits < amount.to_i
    update(credits: credits - amount.to_i)
  end
end
