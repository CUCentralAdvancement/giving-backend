require 'redis'

class Redirect < ApplicationRecord
  enum status: { active: 'active', inactive: 'inactive' }

  validates :source, uniqueness: true

  # Someone said you should use after_commit since it runs after persisted where after_save does not.
  # after_commit :save_redirect, if: :persisted?
  after_save :save_redirect
  after_destroy :destroy_redirect

  # This can lead to pool connection issues and is definitely not the smartest way to proceed.
  after_initialize do
    @redis = Redis.new
  end

  private

  def save_redirect
    @redis.set(source, redirect)
  end

  def destroy_redirect
    @redis.del(source)
  end

end
