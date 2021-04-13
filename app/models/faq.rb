require "friendly_id/slug_generator"

class Faq < ApplicationRecord
  enum category: { common_giving_terms: 1203, ways_to_give: 1204, general_questions: 1205 }
  has_rich_text :content

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  include AlgoliaSearch
  algoliasearch do
    # Use all default configuration
  end

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
