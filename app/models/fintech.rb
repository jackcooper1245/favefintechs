class Fintech < ActiveRecord::Base
    validates_uniqueness_of :name
    belongs_to :user
    has_many :reviews


end