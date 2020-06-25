def symbolize(params)
  JSON.parse(params, symbolize_names: true)
end
