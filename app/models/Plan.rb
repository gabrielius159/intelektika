class Plan < ApplicationRecord
  validates :pavadinimas,
            presence: { message: "Turi būti nurodytas plano pavadinimas." },
            length: { minimum: 3,
                      maximum: 24,
                      too_short: "Pavadinimas negali būti trumpesnis nei %{count} simboliai.",
                      too_long: "Pavadinimas negali būti ilgesnis nei %{count} simboliai." },
            uniqueness: { case_sensitive: false }

  validates :tinklas,
            presence: { message: "Turi būti nurodytas tinklas." },
            length: { minimum: 3, maximum: 24 }

  validates :zinutes,
            presence: { message: "Turi būti nurodytas žinučių skaičius." },
            numericality: { only_integer: true, message: "Žinučių skaičius turi būti skaičius." }

  validates :pokalbiai,
            presence: { message: "Turi būti nurodytas skambučių minučių skaičius." },
            numericality: { only_integer: true, message: "Pokalbių minutės turi būti skaičius." }

  validates :internetas,
            presence: { message: "Turi būti nurodyta kiek interneto planas suteikia." },
            numericality: { only_integer: true, message: "Interneto GB turi būti skaičius." }

  validates :kaina,
            presence: { message: "Turi būti nurodyta kaina per mėnesį." },
            numericality: true

end