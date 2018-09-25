class Book < ActiveRecord::Base
	 validates :name, presence: true
	 validates :name, uniqueness: true
	 validates :name, length: { minimum: 3 ,message: "Please enter minimum 3 chars"}
	 validates :author, presence: true
	 validates :price, numericality: true
	 
before_save :merge_names

after_destroy :update_log

def merge_names
	self.name = self.name + " By " + self.author
end

def update_log
	logger.error "=======================================Alas! A book has been deleted! with id #{self.id} name #{self.name} =========================================="
end

end
