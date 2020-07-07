class Schema
  def payments_get_200

    Dry::Schema.JSON do
      required(:success).filled(:bool).value(eql?: true)
      required(:result).filled(:integer).value(eql?: 0)
      required(:status).filled(:integer).value(eql?: 200)

      required(:payment).hash do
        required(:id).filled(:integer).value(eql?: 2425)
        required(:status).filled(:string).value(eql?: "refunded")
        required(:token).filled(:string).value(eql?: "fb61ba921048670c8e062f261b228a8e")
        required(:currency).filled(:string).value(eql?: "RUB")
        required(:product).filled(:string).value(eql?: "fatribpeyyry")
        required(:callback_url).maybe(:string).value(eql?: "http://callback.com/")
        required(:redirect_success_url).maybe(:string).value(eql?: "http://success.com?token=fb61ba921048670c8e062f261b228a8e&type=pay&status=approved&extraReturnParam=Test_2889&orderNumber=24547615&walletDisplayName=&amount=100&currency=RUB&gatewayAmount=100&gatewayCurrency=RUB&gatewayDetails=%7B%22ip%22%3D%3E%7B%22ccode_iso%22%3D%3E%22CHN%22%2C+%22ccode_short%22%3D%3E%22CN%22%2C+%22country%22%3D%3E%22CHINA%22%7D%2C+%22bin%22%3D%3E%7B%22bank_name%22%3D%3E%22EXPRESSBANK+OSC%22%2C+%22ccode_iso%22%3D%3E%22AZE%22%2C+%22ccode_short%22%3D%3E%22AZ%22%2C+%22code%22%3D%3E31%2C+%22country%22%3D%3E%22AZERBAIJAN%22%2C+%22ps%22%3D%3E%22VISA%22%2C+%22sub_type%22%3D%3E%22CLASSIC%22%2C+%22type%22%3D%3E%22CREDIT%22%2C+%22www%22%3D%3E%22HTTP%3A%2F%2FWWW.EXPRESSBANK.AZ%2FDEFAULT.HTML%22%7D%2C+%22approval%22%3D%3E%22181218%22%7D&sanitizedMask=472492******8434&walletToken=de1a08f1618d2d4ae2e15eb4adb441976799&signature=ec0cc9312727c8342769ec750e1386fb")
        required(:redirect_fail_url).maybe(:string).value(eql?: "http://reject.com/?token=fb61ba921048670c8e062f261b228a8e&type=pay&status=declined&extraReturnParam=Test_2889&orderNumber=24547615&walletDisplayName=&amount=100&currency=RUB&gatewayAmount=100&gatewayCurrency=RUB&gatewayDetails=%7B%22ip%22%3D%3E%7B%22ccode_iso%22%3D%3E%22CHN%22%2C+%22ccode_short%22%3D%3E%22CN%22%2C+%22country%22%3D%3E%22CHINA%22%7D%2C+%22bin%22%3D%3E%7B%22bank_name%22%3D%3E%22EXPRESSBANK+OSC%22%2C+%22ccode_iso%22%3D%3E%22AZE%22%2C+%22ccode_short%22%3D%3E%22AZ%22%2C+%22code%22%3D%3E31%2C+%22country%22%3D%3E%22AZERBAIJAN%22%2C+%22ps%22%3D%3E%22VISA%22%2C+%22sub_type%22%3D%3E%22CLASSIC%22%2C+%22type%22%3D%3E%22CREDIT%22%2C+%22www%22%3D%3E%22HTTP%3A%2F%2FWWW.EXPRESSBANK.AZ%2FDEFAULT.HTML%22%7D%2C+%22approval%22%3D%3E%22181218%22%7D&sanitizedMask=472492******8434&walletToken=de1a08f1618d2d4ae2e15eb4adb441976799&signature=ec0cc9312727c8342769ec750e1386fb")
        required(:amount).filled(:integer).value(eql?: 100)
        required(:created_at).filled(:string).value(eql?: "2019-08-01T10:49:37.033Z")
        required(:updated_at).filled(:string).value(eql?: "2020-04-16T20:41:10.671Z")
        required(:extra_return_param).filled(:string).value(eql?: "Test_2889")
        required(:operation_type).filled(:string).value(eql?: "pay")
        required(:order_number).filled(:string).value(eql?: "24547615")
        required(:bank_card_id).filled(:integer).value(eql?: 1474)
        required(:business_account_legal_name).filled(:string).value(eql?: "demoshop test rake")
        required(:business_account_profileID).filled(:string).value(eql?: "3")
        required(:card_masked_number).filled(:string).value(eql?: "472492******8434")
        required(:cardpass_through)
        required(:charge_request_id)
        required(:declination_reason)
        required(:country_code_by_BIN).filled(:string).value(eql?: "AZ")
        required(:gateway_amount).filled(:integer).value(eql?: 100)
        required(:gateway_currency).filled(:string).value(eql?: "RUB")

        required(:gateway_details).hash do
          required(:ip).hash do
            required(:country).filled(:string).value(eql?: "CHINA")
            required(:ccode_iso).filled(:string).value(eql?: "CHN")
            required(:ccode_short).filled(:string).value(eql?: "CN")
          end

          required(:bin).hash do
            required(:ps).filled(:string).value(eql?: "VISA")
            required(:www).filled(:string).value(eql?: "HTTP://WWW.EXPRESSBANK.AZ/DEFAULT.HTML")
            required(:code).filled(:integer).value(eql?: 31)
            required(:type).filled(:string).value(eql?: "CREDIT")
            required(:country).filled(:string).value(eql?: "AZERBAIJAN")
            required(:sub_type).filled(:string).value(eql?: "CLASSIC")
            required(:bank_name).filled(:string).value(eql?: "EXPRESSBANK OSC")
            required(:ccode_iso).filled(:string).value(eql?: "AZE")
            required(:ccode_short).filled(:string).value(eql?: "AZ")
          end

          required(:approval).filled(:string).value(eql?: "181218")
        end

        required(:gateway_id).filled(:string).value(eql?: "115750424050")
        required(:gatewayable_id).filled(:integer).value(eql?: 1092)
        required(:gatewayable_type).filled(:string).value(eql?: "Gateway::QiwiPayment")
        required(:ip).filled(:string).value(eql?: "8.208.12.12")
        required(:kind).filled(:string).value(eql?: "wallet")
        required(:lead_id).filled(:integer).value(eql?: 1378)
        required(:merchant_private_key).filled(:string).value(eql?: "846033ed8492b96ca457")
        required(:refund_id).filled(:integer).value(eql?: 2426)
        required(:scoring_remark).filled(:string).value(eql?: "success")
        required(:no_cvv)
        required(:threeds_status).filled(:string).value(eql?: "UNK")
        required(:customer_email)
        required(:bank_card_brand).filled(:string).value(eql?: "visa")
      end
    end
  end
end

