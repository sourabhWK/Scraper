# frozen_string_literal: true

require 'csv'
require 'aws-sdk-s3'

# This is a top level comment for this file
class InteractWithS3
  def initialize; end

  def setup_s3
    @s3 = Aws::S3::Client.new(
      access_key_id: ENV['ACCESS_KEY_ID'],
      secret_access_key: ENV['SECREAT_ASSESS_KEY'],
      region: ENV['REGION']
    )
  end

  def upload_to_s3
    # s3 = Aws::S3::Client.new(
    #   access_key_id: ENV['ACCESS_KEY_ID'],
    #   secret_access_key: ENV['SECREAT_ASSESS_KEY'],
    #   region: ENV['REGION']
    # )

    file_path = Rails.root.join(ENV['FILE_PATH'])

    @s3.put_object(
      bucket: ENV['BUCKET'],
      key: ENV['FILE_KEY'],
      body: File.open(file_path)
    )
    true
  end

  def create_link_to_download
    presigner = Aws::S3::Presigner.new(client: @s3)

    @url = presigner.presigned_url(:get_object, bucket: ENV['BUCKET'], key: ENV['FILE_KEY'])

    true
  end
end
