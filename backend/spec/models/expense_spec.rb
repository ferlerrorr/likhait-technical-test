require 'rails_helper'

RSpec.describe Expense, type: :model do
  let!(:category) { Category.create!(name: "Food") }

  it "is valid when dated today" do
    expense = Expense.new(description: "Lunch", amount: 10.00, category: category, date: Date.current)

    expect(expense).to be_valid
  end

  it "is invalid when dated in the future" do
    expense = Expense.new(description: "Lunch", amount: 10.00, category: category, date: Date.current + 1)

    expect(expense).not_to be_valid
    expect(expense.errors[:date]).to include("cannot be in the future")
  end
end
