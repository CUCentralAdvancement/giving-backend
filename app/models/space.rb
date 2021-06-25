require "friendly_id/slug_generator"
class Space < ApplicationRecord
  has_and_belongs_to_many :users

  # def user_name=(email)
  #   self.users.first = User.find_or_create_by(email: email)
  # end
  #
  # def user_name
  #   self.users ? self.users.first : nil
  # end

  class ReusableSlugGenerator < FriendlyId::SlugGenerator
    def available?(slug)
      if @config.uses?(::FriendlyId::Reserved) && @config.reserved_words.present? && @config.treat_reserved_as_conflict
        return false if @config.reserved_words.include?(slug)
      end

      # Only active slugs.
      !@scope.unscoped.where(slug: slug).exists?

      # Slugs including ones in history.
      # !@scope.exists_by_friendly_id?(slug)
    end
  end
end
