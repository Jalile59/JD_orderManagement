class Order < ActiveRecord::Base
  belongs_to :StatusOrder, foreign_key: true
  has_many :deviceBytracks  
  has_one_attached :file

  validate :file

  private

  def file
    if file.attached? && !file.content_type.in?(%w(application/msword application/pdf))
      errors.add(:file, 'Must be a PDF or a DOC file')
    end

  end



end
