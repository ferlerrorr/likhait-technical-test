class Expense < ApplicationRecord
  belongs_to :category

  # BONUS-001: money cannot be spent on a future date. Enforced on the model rather than in the
  # controller so `update` is guarded by the same rule as `create` -- both share `expense_params`.
  # Compared against Date.current, i.e. the server's day; see the PR for the timezone caveat.
  validates :date,
            comparison: { less_than_or_equal_to: ->(_expense) { Date.current },
                          message: "cannot be in the future" },
            allow_nil: true
end
