# frozen_string_literal: true

# Consultation model
class Consultation < ApplicationRecord
  belongs_to :user
  belongs_to :customer

  def send_sms
    uri = build_url(customer, user, date, hour)
    _response = Net::HTTP.get(uri)
    update(sms_date: Time.now, sms_sent: true)
    # SmsLog.create(msg: msg, number: number, msg_callback: JSON.parse(response)["msg"], customer_id: @customer.id, user_id: @customer.user_id)
  end

  def build_url(customer, user, date, hour)
    msg = "#{customer.name.try(:split, ' ').first}, você tem consulta com Dr/Dra" \
          "#{user.name.try(:split, ' ').first} no dia #{date.try(:strftime, '%d/%m')}" \
          "#{I18n.l(date, format: '%A').downcase} as #{hour}. Se precisar reagendar/cancelar ligue para: (xx) xxxxx-xxxx"

    escaped_address = Addressable::URI.escape("#{ENV['sms_web_service']}&lgn=#{ENV['loca_sms_number']}&pwd=#{ENV['loca_sms_pass']}" \
                                              "&msg=#{msg}&numbers=#{customer.celphone.delete('^[0-9]*$')}")
    URI.parse(escaped_address)
  end
end
