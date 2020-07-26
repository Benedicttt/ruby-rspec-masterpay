shared_examples :list_param do |date, fixture_number, name_variable_response|
  let(:params_with_date) do
    params_for_payments_list.merge(payload: {:date_from => date})
  end

  let(:params_with_card) { add_param_to_payload params_for_card }

  let(:params) { !date.nil? ? params_with_date : params_with_card }

  let(name_variable_response) do
    call_payments_create "positive response Host to host #{fixture_number}", params
    call_payments_list "positive response Host to host get list #{fixture_number}", params
  end

  let("#{name_variable_response}_to_dot") { JSON.parse(send(name_variable_response).body).to_dot }
end
