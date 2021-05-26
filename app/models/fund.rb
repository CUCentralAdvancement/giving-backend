require "friendly_id/slug_generator"

class Fund < ApplicationRecord
  has_rich_text :marketing_content

  validate :includes_reserved_slug?

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  include AlgoliaSearch
  algoliasearch do
    # Use all default configuration
  end

  def includes_reserved_slug?
    # Use a string literal instead of array since the IDE told me to do so. I'm not sure it's
    # better since I can't distinguish the individual words as easily.
    if %w[write-fund cu-anschutz-alumni-license-plate-fund cu-scholarship-license-plate-fund
    cu-denver-alumni-license-plate-program].include?(slug)
      errors.add(:slug, 'Slug cannot include reserved keys: "write-fund"
"cu-anschutz-alumni-license-plate-fund" "cu-scholarship-license-plate-fund"
"cu-denver-alumni-license-plate-program"')
    end
  end

  class ReusableSlugGenerator < FriendlyId::SlugGenerator

    def available?(slug)
      return false if self.includes_reserved_slug?(slug)

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
