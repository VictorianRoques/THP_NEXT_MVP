# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id                  :bigint(8)        not null, primary key
#  original_price      :float            not null
#  has_discount        :boolean          default(FALSE)
#  discount_percentage :integer          default(0)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Item < ApplicationRecord
  validates :discount_percentage, inclusion: { in: 0..100 }
  has_many :categorizations, dependent: :destroy
  has_many :items, through: :categorizations
  def price
    return original_price unless has_discount

    original_price - (original_price * discount_percentage / 100)
  end

  def self.average_price
    Item.all.inject(0) { |sum, item| sum + item.price }
  end
end
