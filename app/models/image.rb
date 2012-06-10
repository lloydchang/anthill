class Image < ActiveRecord::Base

  belongs_to :idea

  has_attached_file :image,
  	  :path => ":rails_root/public/photos/:idea_id/:id_:style",
      :url => "/photos/:idea_id/:id_:style",
  	:styles => {
  		:thumb=> "280x187",
  		:small  => "50x50" },
    :storage => :s3,
    :bucket => 'joinme',
    :s3_credentials => {
      :access_key_id => 'AKIAJ4XWOBHDDCG7TJXQ',
      :secret_access_key => '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'
    }

end
