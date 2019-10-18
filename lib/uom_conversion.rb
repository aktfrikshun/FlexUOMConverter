require 'unitwise'
module UOMConversion

    VALID_UNITS = {
      'kelvin' => {
         'name' => 'kelvin',
         'property' => 'temperature'
      },
      'fahrenheit' => {
         'name' => 'degree Fahrenheit',
         'property' => 'temperature'
      },
      'celsius' => {
         'name' => 'degree Celsius',
         'property' => 'temperature'
      },
      'rankine' => {
         'name' => 'degree Rankine',
         'property' => 'temperature'
      },
      'liters' => {
         'name' => 'liter',
         'property' => 'volume'
      },
      'tablespoon' => {
         'name' => 'tablespoon',
         'property' => 'volume'
      },
      'cubic-inches' => {
         'name' => "[in_i]3",
         'property' => 'volume'
      },
      'cups' => {
         'name' => 'cup',
         'property' => 'volume'
      },
      'cubic-feet' => {
         'name' => "[ft_i]3",
         'property' => 'volume'
      },
      'gallon' => {
         'name' => 'gallon',
         'property' => 'volume'
      },
      'fingers' => {
         'name' => 'finger',
         'property' => 'volume'
      },
    }

  def UOMConversion.check_answer(input, from, to, answer)
    begin
      from_unit = VALID_UNITS[from.downcase]["name"]
      to_unit = VALID_UNITS[to.downcase]["name"]
      Unitwise(input, from_unit).convert_to(to_unit).value().round(1) == answer.round(1) ? "correct" : "incorrect"
    rescue
      "invalid"
    end
  end

  def UOMConversion.listUnits()
    #List application support unit names
    VALID_UNITS.keys
  end

  def UOMConversion.listUMOMUnits()
    #List UMOM supported unit names
    VALID_UNITS.keys.collect { | key | VALID_UNITS[key]['name'] }
  end

  def UOMConversion.listUnitsForProperty(prop)
    #List units compatible with property
    VALID_UNITS.keys.select { | key | key if VALID_UNITS[key]["property"] == prop }
  end

  def UOMConversion.addCustom()

    # Example of adding custom units
    Unitwise.register(
      names: ["finger", "fingers"],
      symbol: "🥃",
      primary_code: "fng",
      secondary_code: "fng",
      scale: {
        value: 1.0,
        unit_code: '[foz_us]'
      },
      property: 'fluid volume'
    )
  end

end
