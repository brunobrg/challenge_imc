class IMC
  IMC_CLASSIFICATION = {
    0.0..18.4 => ["Magreza", "0"],
    18.5..24.9 => ["Normal", "0"],
    25.0..29.9 => ["Sobrepeso", "I"],
    30.0..39.9 => ["Obesidade" , "II"],
    40.0..Float::INFINITY => ["Obesidade grave", "III"],
  }
  def initialize(height, weight)
    @height = height
    @weight = weight
  end

  def get_imc
    imc = (@weight / (@height ** 2)).round(1)
    target_classification = IMC_CLASSIFICATION.select{ |item| item === imc }.values.flatten

    {
      "imc": "#{imc}",
      "classification": target_classification.first
      "obesity": target_classification.second
    }
  end
end
