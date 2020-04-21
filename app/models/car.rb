class Car < ApplicationRecord
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  validates :brand, :model, :seats, :body, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 1}
  validates :image_url, allow_blank: true, format: {
      with: %r{.*\.(gif|jpg|png)\Z}i,
      message: 'must be a URL for GIF, JPG or PNG image.'
  }
  validates :transmission, allow_blank: false, format: {
      with: %r{[A-Z]{1}[a-z]{5,10},\s\dx\d\Z}i,
      message: "Transmission must be like 'Automatic, 4x2'"
  }

  private

  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line Items present')
      throw :abort
    end
  end
end
