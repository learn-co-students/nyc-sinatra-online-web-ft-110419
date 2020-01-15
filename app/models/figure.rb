class Figure < ActiveRecord::Base
  has_many :figure_titles
   has_many :titles, through: :figure_titles
   has_many :landmarks

    def slug
    name.split(" ").join("-").downcase
   end

    def self.find_by_slug(slug)
    all_figures = self.all
    figure = all_figures.find do |figure|
               figure.slug == slug
            end
    return figure
  end

  end
