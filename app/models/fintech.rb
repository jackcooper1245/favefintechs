class Fintech < ActiveRecord::Base
    validates_uniqueness_of :name
    belongs_to :user
    has_many :reviews

    def slug 
        self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
      end 
    
    def self.find_by_slug(slug)
        self.all.find{|fintech| fintech.slug == slug}
    end

end