class Landmark < ActiveRecord::Base
  belongs_to :figure

    def slug
    name.split(" ").join("-").downcase
   end

    def self.find_by_slug(slug)
    all_landmarks = self.all
    landmark = all_landmarks.find do |landmark|
               landmark.slug == slug
            end
    return landmark
  end
end
