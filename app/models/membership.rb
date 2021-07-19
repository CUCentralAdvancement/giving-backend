# frozen_string_literal: true

class Membership < ApplicationRecord
  belongs_to :space
  belongs_to :user
  enum level: { cadet: 10, captain: 20 }

  include AASM

  aasm do # default column: aasm_state
    state :pending, initial: true
    state :active
    state :inactive

    event :activate do
      transitions from: :pending, to: :active
    end

    event :deactivate do
      transitions from: :active, to: :inactive
    end

    event :reactivate do
      transitions from: :inactive, to: :active
    end
  end
end
