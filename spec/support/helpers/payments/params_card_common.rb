# @return [Hash]
def params_for_card
  {
    card:  {
      pan: current_card.to_s,
      expires: expires.to_s,
      holder: holder.to_s,
      cvv: cvv.to_s
    }
  }
end
