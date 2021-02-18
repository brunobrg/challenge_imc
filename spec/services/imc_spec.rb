require 'rails_helper'

RSpec.describe ImcHandler, type: :model do
  describe '#execute' do
    let(:valid_attributes) {
        { :height => 1.79, :weight => 70 }
    }
    let(:wrong_attributes) {
        { :teste => 1.79, :weight => 70 }
    }
    
    it 'calculates the imc of a given patient' do
      imc = ImcHandler.execute(valid_attributes)

      expect(imc[:imc]).to eq("21.8")
      expect(imc[:classification]).to eq("Normal")
      expect(imc[:obesity]).to eq("0")
    end

    it 'should return invalid parameters' do
      imc = ImcHandler.execute(wrong_attributes)

      expect(imc[:errors]).to eq("invalid params.")
    end
  end
end
