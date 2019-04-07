# frozen_string_literal: true

# frozen_string_literal: true.

task sms: :environment do
  loop do
    sleep 600
    next if Time.zone.now.strftime('%H:%M') < '07:00' || Time.zone.now.strftime('%H:%M') > '22:00'

    @consultations = Consultation
                     .joins(:customer).where.not(customers: { celphone: nil })
                     .where(consultations: { date: Time.zone.now.beginning_of_day..(Time.zone.now + 1.day).end_of_day,
                                             canceled: false, sms_sent: false })

    @consultations.each do |consultation|
      # A consulta e no mesmo dia, podemos mandar a sms
      if consultation.date == Date.today
        # O horario da consulta deve mais tarde que a hora atual, pois nao faz sentido mandar msg em uma data do passado
        if consultation.hour > Time.zone.now.strftime('%H:%M')
          # O Horario da consulta tem que ser em horarios comerciais dentre
          consultation.send_sms
        end
      # A consulta nao e no mesmo dia
      # A hora da consulta e menor que 10h da manha manda a msg ainda hoje, informando sobre a consulta amanha.
      # So vamos enviar essa msg apos as 19 da data autal, assim nao temos problema de mandar uma msg 20h antes da consulta
      # DESATIVADO pois a msg nao esta sendo entregada em minutos, as vezes demoram dias para ser entregue. precisamos mudar de
      # operadora de envio. Por isso fiz esse ELSE
      # elsif (consultation.hour < '10:00') && Time.zone.now.strftime('%H:%M') > '20:00'
      #  consultation.send_sms
      # end
      else
        consultation.send_sms
      end
    end
  end
end
