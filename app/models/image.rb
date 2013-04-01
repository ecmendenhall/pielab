class Image < ActiveRecord::Base
  attr_accessible :post_id, :image_file
  belongs_to :post

  has_attached_file :image_file, { :styles => { :large => "700x700>",
                                                :medium => "500x500>",
                                                :small => "300x300>",
                                                :thumb => "100x100>" },
                                   :url => "/system/:class/:attachment/:filename_:style",
                                   :path => ":rails_root/public/system/:class/:attachment/:filename_:style" }

  validates_attachment :image_file,
      :presence => :true,
      :content_type => { :content_type => ["image/jpg", "image/png", "image/gif"] },
      :size =>  { :in => 0..5120.kilobytes }
end
