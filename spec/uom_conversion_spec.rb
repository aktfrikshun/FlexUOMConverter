# spec/uom_conversion_spec.rb
require 'uom_conversion'
describe 'UOMConversion' do

  describe ".create" do
    context "given all supported unit names" do
      it "create unitwise unit" do
        UOMConversion.addCustom()

        UOMConversion.listUMOMUnits().each do | unit |
          expect(Unitwise(1,unit).value()).to eql(1)
        end
      end
    end
  end

  describe ".convert" do
    context "given all supported unit names" do
      it "can convert temparature" do
        UOMConversion.listUnitsForProperty('temperature').each do | unit1 |
          UOMConversion.listUnitsForProperty('temperature').each do | unit2 |
            expect(UOMConversion.check_answer(1,unit1,unit2,1)).not_to eql('invalid')
          end
        end
      end

      it "can convert volume" do
        UOMConversion.listUnitsForProperty('volume').each do | unit1 |
          UOMConversion.listUnitsForProperty('volume').each do | unit2 |
            expect(UOMConversion.check_answer(1,unit1,unit2,1)).not_to eql('invalid')
          end
        end
      end

      it "can can't convert different properties" do
        UOMConversion.listUnitsForProperty('volume').each do | unit1 |
          UOMConversion.listUnitsForProperty('temparature').each do | unit2 |
            expect(UOMConversion.check_answer(1,unit1,unit2,1)).to eql('invalid')
          end
        end
      end
    end
  end

  describe ".check" do
    context "given an input value, to, from and answer" do
      it "can can check correct student answer" do
        expect(UOMConversion.check_answer(84.2,'Fahrenheit','Rankine',543.94)).to eql('correct')
      end
      it "can can check incorrect student answer" do
        expect(UOMConversion.check_answer(317.33,'Kelvin','Fahrenheit',111.554)).to eql('incorrect')
      end
      it "can can check invalid question" do
        expect(UOMConversion.check_answer(126.1,'dog','Celsius',45.32)).to eql('invalid')
      end
    end
  end

end
