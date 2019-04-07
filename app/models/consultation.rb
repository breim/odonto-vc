# frozen_string_literal: true

# Consultation model
class Consultation < ApplicationRecord
  belongs_to :user
  belongs_to :customer

  def send_sms
    uri = build_url(customer.name, customer.celphone, user, date, hour)
    _response = Net::HTTP.get(uri)
    update(sms_date: Time.now, sms_sent: true)
    # SmsLog.create(msg: msg, number: number, msg_callback: JSON.parse(response)["msg"], customer_id: @customer.id, user_id: @customer.user_id)
  end

  def build_url(customer_name, customer_celphone, user, date, hour)
    msg = "#{customer_name.try(:split, ' ').first}, você tem consulta com Dr/Dra #{user.name.try(:split, ' ').first} no dia #{date.try(:strftime, '%d/%m')} #{I18n.l(date, format: '%A').downcase} as #{hour}. Se precisar reagendar/cancelar ligue para: #{user.celphone}." # rubocop:disable LineLength
    escaped_address = CGI.escape("#{ENV['sms_web_service']}&lgn=#{ENV['loca_sms_number']}&pwd=#{ENV['loca_sms_pass']}&msg=#{msg}&numbers=#{customer_celphone.delete('^[0-9]*$')}") # rubocop:disable LineLength
    URI.parse(escaped_address)
  end
end
