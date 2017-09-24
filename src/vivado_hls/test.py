import xml.etree.ElementTree as et
    
filename = './fixed_9_8_20.prj/solution1/syn/report/cordic_csynth.xml'
tree = et.parse(filename)
root = tree.getroot()

for item in root.iter('Resources'):
  for index in item.getchildren():
   print index.text
#BRAM_18K = root.find('BRAM_18K').text
#FF = root.find('FF').text
#DSP_48E = root.find('DSP_48E').text
print timing


