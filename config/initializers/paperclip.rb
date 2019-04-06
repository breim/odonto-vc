# config/initializers/paperclip.rb
Paperclip::Attachment.default_options[:use_timestamp] = false
Paperclip::Attachment.default_options[:url] = ''
Paperclip::Attachment.default_options[:s3_protocol] = 'https'
