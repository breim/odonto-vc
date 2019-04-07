# frozen_string_literal: true

# config/initializers/paperclip.rb
Paperclip::DataUriAdapter.register
Paperclip::Attachment.default_options[:use_timestamp] = false
Paperclip::Attachment.default_options[:url] = ''
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
Paperclip::Attachment.default_options[:s3_protocol] = 'https'
