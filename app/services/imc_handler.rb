class ImcHandler
  include ActiveModel::Validations

  attr_accessor :height, :weight

  validates :height, presence: true
  validates :weight, presence: true

  IMC_CLASSIFICATION = {
    0.0..18.4 => ["Magreza", "0"],
    18.5..24.9 => ["Normal", "0"],
    25.0..29.9 => ["Sobrepeso", "I"],
    30.0..39.9 => ["Obesidade" , "II"],
    40.0..Float::INFINITY => ["Obesidade grave", "III"],
  }

  def self.execute(params)
    imc = self.new(params[:height], params[:weight])
    if imc.valid?
      imc.get_imc
    else
      {"errors": "invalid params."}
    end
  end

  def initialize(height, weight)
    @weight = weight.to_f
    @height = height
  end

  def get_imc
    imc = (@weight / (@height ** 2)).round(1)
    target_classification = IMC_CLASSIFICATION.select{ |item| item === imc }.values.flatten

    {
      "imc": "#{imc}",
      "classification": target_classification.first,
      "obesity": target_classification.second
    }
  end
end
