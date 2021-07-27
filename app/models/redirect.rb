require 'redis'

class Redirect < ApplicationRecord
  enum status: { active: 'active', inactive: 'inactive' }

  validates :source, uniqueness: true

  # after_commit :save_redirect, if: :persisted?
  after_save :save_redirect
  after_destroy :destroy_redirect

  after_initialize do
    @redis = Redis.new
  end

  private

  def save_redirect
    # byebug
    @redis.set(source, redirect)
  end

  def destroy_redirect
    @redis.del(source)
  end

end
