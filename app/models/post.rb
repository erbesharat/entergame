class Post < ApplicationRecord
  before_create :randomize_id
  belongs_to :user

  private
  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000)
    end while Post.where(id: self.id).exists?
  end
end
