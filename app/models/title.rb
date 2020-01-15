class Title < ActiveRecord::Base
  has_many :figure_titles
   has_many :figures, through: :figure_titles

    def slug
    name.split(" ").join("-").downcase
   end

    def self.find_by_slug(slug)
    all_titles = self.all
    title = all_titles.find do |title|
               title.slug == slug
            end
    return title
  end

  end
