# frozen_string_literal: true

class ConsultationSerializer < ActiveModel::Serializer
  attributes :id, :title, :start, :end

  def title
    object.customer.name
  end

  def start
    "#{object.date}T#{object.hour}:00"
  end

  def end
    sum_date_to_min(object.date, object.hour, object.duration).try(:strftime, '%Y-%m-%dT%H:%M:00')
  end

  private

  def sum_date_to_min(date, hour, duration)
    "#{date} #{hour}".to_time + hours_to_minutes(duration).minutes unless duration.nil?
  end

  def hours_to_minutes(val)
    val.split(':')[0].to_i * 60 + val.split(':')[1].to_i unless val.nil?
  end
end
