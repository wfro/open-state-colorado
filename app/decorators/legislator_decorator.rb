class LegislatorDecorator < Draper::Decorator
  delegate_all

  decorates_finders

  def party_letter_in_paren
    "(" + legislator.party[0].upcase + ")"
  end
end
