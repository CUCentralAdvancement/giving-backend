require "friendly_id/slug_generator"

class Fund < ApplicationRecord
  has_rich_text :marketing_content

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

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
