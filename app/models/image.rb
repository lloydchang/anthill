class Image < ActiveRecord::Base

  belongs_to :idea

  has_attached_file :image,
  	  :path => "/photos/:idea_id/:id_:style",
  	:styles => {
  		:thumb => "260x187",
  		:med => "620x245#" },
    :storage => :s3,
    :bucket => 'joinme',
    :s3_credentials => {
      :access_key_id => 'AKIAJ4XWOBHDDCG7TJXQ',
      :secret_access_key => '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'
    }

end
