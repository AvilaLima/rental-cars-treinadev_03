class Rental < ApplicationRecord
  belongs_to :customer
  belongs_to :carcategory

  before_create :generate_code

  private

  def generate_code
    self.code = SecureRandom.alphanumeric(6).upcase
  end
end
