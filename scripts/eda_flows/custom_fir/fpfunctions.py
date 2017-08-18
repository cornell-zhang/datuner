#=======================================================================
# fpfunctions.py
#=======================================================================
# Python implementation of Matlab fixed-point arithmetic library.
#
# Note that this implementation differs from the Matlab implementation
# as it expects input data to be floats, not lists or arrays.

import math

#------------------------------------------------------------------------
# QTypes constants
#------------------------------------------------------------------------

QTypes = [
  'WrpRnd',        'ClpRnd',        'SatRnd',
  'WrpRnd_NoWarn', 'ClpRnd_NoWarn', 'SatRnd_NoWarn',
  'WrpTrc',        'ClpTrc',        'SatTrc',
  'WrpTrc_NoWarn', 'ClpTrc_NoWarn', 'SatTrc_NoWarn',
]

#------------------------------------------------------------------------
# RealRESIZE
#------------------------------------------------------------------------
def RealRESIZE( x, FixP, QType, IDString=None ):
  """Quantize value x to fixpoint configuration FixP, using quantization
  type QType.
  """

  if QType not in QTypes:
    raise Exception('QType must be one of {}'.format( QTypes ))

def RealRESIZE(x, FixP, QType, IDString=None):
  LSB = 2**-FixP[1]                                      # FixP[1] represents the Fraction bits
  if   'Rnd' in QType: y = math.floor( x/LSB + 0.5 )   # change the position of the digital point
  elif 'Trc' in QType: y = math.floor( x/LSB )
  maxVal = 2**(FixP[0]+FixP[1])-1                       # Calculate the maximum of unsigned <I+F,0>

  # Signed a
  if   FixP[2] == 's':
    minVal_clp = -2**(FixP[0]+FixP[1])
    minVal_sat = minVal_clp + 1
  # Unsigned
  elif FixP[2] == 'u':
    minVal_clp = 0
    minVal_sat = minVal_clp
  else:
    raise Exception('FixP[2] (Type) must be one of "s" or "u"')

  if y > maxVal or y < minVal_sat:

    # Saturate
    if 'Sat' in QType:
      y = max(min( y, maxVal), minVal_sat )
      if 'NoWarn' not in QType:
        print 'Saturation performed!'

    # Overflow
    elif y > maxVal or y < minVal_clp:

      tmp = 2**(FixP[0] + FixP[1] + (FixP[2] == 's'))
      y   = (y-minVal_clp) % tmp + minVal_clp
      if 'NoWarn' not in QType:
        print 'Overflow performed!'

  return y * LSB

#------------------------------------------------------------------------
# RealABS
#------------------------------------------------------------------------
def RealABS( in_, FixP, QType, IDString=None ):
  """Absolute value of real number.

  in: input float
  FixP: fixedpoint configuration of output value [WINT,WFRAC,Type]
        WINT, WFRAC are integer, Type is either 's' or 'u'
  QType: Quantization type ('WrpTrc', 'WrpRnd', 'SatTrc' or 'SatRnd')
  """

  if FixP[2] != 'u':
    raise Exception('RealABS exists only for unsigned output type')

  return RealRESIZE( abs(in_), FixP, QType, IDString )

#------------------------------------------------------------------------
# RealADD
#------------------------------------------------------------------------
def RealADD( inA, inB, FixP, QType, IDString=None ):
  """Addition of two real numbers.

  inA, inB: input floats
  FixP: fixedpoint configuration of output value [WINT,WFRAC,Type]
        WINT, WFRAC are integer, Type is either 's' or 'u'
  QType: Quantization type ('WrpTrc', 'WrpRnd', 'SatTrc' or 'SatRnd')
  """

  return RealRESIZE( inA+inB, FixP, QType, IDString )

#------------------------------------------------------------------------
# RealAS
#------------------------------------------------------------------------
def RealAS( in_, Shift, FixP, QType, IDString=None ):
  """Arithmetic shift.

  in: input float
  Shift: number of shifted positions (pos. = left, neg. = right)
  FixP: fixedpoint configuration of output value [WINT,WFRAC,Type]
        WINT, WFRAC are integer, Type is either 's' or 'u'
  QType: Quantization type ('WrpTrc', 'WrpRnd', 'SatTrc' or 'SatRnd')
  """

  return RealRESIZE( in_ * 2**Shift, FixP, QType, IDString )

#------------------------------------------------------------------------
# RealASL
#------------------------------------------------------------------------
def RealASL( in_, Shift, FixP, QType, IDString=None ):
  """Arithmetic shift left.

  in: input float
  Shift: number of shifted positions ( >=0 )
  FixP: fixedpoint configuration of output value [WINT,WFRAC,Type]
        WINT, WFRAC are integer, Type is either 's' or 'u'
  QType: Quantization type ('WrpTrc', 'WrpRnd', 'SatTrc' or 'SatRnd')
  """

  if Shift < 0:
    raise Exception('Shift values must be >= 0!')

  return RealRESIZE( in_ * 2**Shift, FixP, QType, IDString )

#------------------------------------------------------------------------
# RealASR
#------------------------------------------------------------------------
def RealASR( in_, Shift, FixP, QType, IDString=None ):
  """Arithmetic shift right.

  in: input float
  Shift: number of shifted positions ( >=0 )
  FixP: fixedpoint configuration of output value [WINT,WFRAC,Type]
        WINT, WFRAC are integer, Type is either 's' or 'u'
  QType: Quantization type ('WrpTrc', 'WrpRnd', 'SatTrc' or 'SatRnd')
  """

  if Shift < 0:
    raise Exception('Shift values must be >= 0!')

  return RealRESIZE( in_ * 2**-Shift, FixP, QType, IDString )

#------------------------------------------------------------------------
# RealDIV
#------------------------------------------------------------------------
def RealDIV( inA, inB, FixP, QType, IDString=None ):
  """Division of two real numbers.

  inA, inB: input floats
  FixP: fixedpoint configuration of output value [WINT,WFRAC,Type]
        WINT, WFRAC are integer, Type is either 's' or 'u'
  QType: Quantization type ('WrpTrc', 'WrpRnd', 'SatTrc' or 'SatRnd')
  """

  if inB == 0:
    raise Exception('ReadDIV division by 0')

  return RealRESIZE( inA / inB, FixP, QType, IDString )

#------------------------------------------------------------------------
# RealMULT
#------------------------------------------------------------------------
def RealMULT( inA, inB, FixP, QType, IDString=None ):
  """Multiplication of two real numbers.

  inA, inB: input floats
  FixP: fixedpoint configuration of output value [WINT,WFRAC,Type]
        WINT, WFRAC are integer, Type is either 's' or 'u'
  QType: Quantization type ('WrpTrc', 'WrpRnd', 'SatTrc' or 'SatRnd')
  """

  return RealRESIZE( inA * inB, FixP, QType, IDString )

#------------------------------------------------------------------------
# RealNEG
#------------------------------------------------------------------------
def RealNEG( in_, FixP, QType, IDString=None ):
  """Absolute value of real number.

  in: input float
  FixP: fixedpoint configuration of output value [WINT,WFRAC,Type]
        WINT, WFRAC are integer, Type is either 's' or 'u'
  QType: Quantization type ('WrpTrc', 'WrpRnd', 'SatTrc' or 'SatRnd')
  """

  if FixP[2] != 's':
    raise Exception('RealNEG exists only for signed output type')

  return RealRESIZE( -in_, FixP, QType, IDString )

#------------------------------------------------------------------------
# RealSQRT
#------------------------------------------------------------------------
def RealSQRT( in_, FixP, QType, IDString=None ):
  """Square root of real number.

  in: input float
  FixP: fixedpoint configuration of output value [WINT,WFRAC,Type]
        WINT, WFRAC are integer, Type is either 's' or 'u'
  QType: Quantization type ('WrpTrc', 'WrpRnd', 'SatTrc' or 'SatRnd')
  """

  if FixP[2] != 'u':
    raise Exception('RealSQRT exists only for unsigned output type')

  return RealRESIZE( math.sqrt(in_), FixP, QType, IDString )

#------------------------------------------------------------------------
# RealSUB
#------------------------------------------------------------------------
def RealSUB( inA, inB, FixP, QType, IDString=None ):
  """Subtraction of two real numbers (inA-inB).

  inA, inB: input floats
  FixP: fixedpoint configuration of output value [WINT,WFRAC,Type]
        WINT, WFRAC are integer, Type is either 's' or 'u'
  QType: Quantization type ('WrpTrc', 'WrpRnd', 'SatTrc' or 'SatRnd')
  """

  return RealRESIZE( inA - inB, FixP, QType, IDString )

#------------------------------------------------------------------------
# RealWIDTH
#------------------------------------------------------------------------
def RealWIDTH( FixP ):
  """Get bitwidth.

  returns total number of bits that are required to represent a real
  number of type FixP (including sign bit if signal is of type signed)
  """

  if   FixP[2] != 's':
    return FixP[0] + FixP[1] + 1
  elif FixP[2] != 'u':
    return FixP[0] + FixP[1]
  else:
    raise Exception('Signal type of real numbers must be signed or unsigned')

#------------------------------------------------------------------------
# ComplexRESIZE
#------------------------------------------------------------------------
def ComplexRESIZE( in_, FixP, QType, IDString=None ):
  """Quantize comlex valued number to fixedpoint configuration

  in_: input complex
  FixP: fixedpoint configuration of output value [WINT,WFRAC,Type]
        WINT, WFRAC are integer, Type is either 's' or 'u'
  QType: Quantization type ('WrpTrc', 'WrpRnd', 'SatTrc' or 'SatRnd')
  """

  real = RealRESIZE( in_.real, FixP, QType, IDString )
  imag = RealRESIZE( in_.imag, FixP, QType, IDString )

  return complex( real, imag )

#------------------------------------------------------------------------
# ComplexADD
#------------------------------------------------------------------------
def ComplexADD( inA, inB, FixP, QType, IDString=None ):
  """Addition of two complex numbers.

  inA, inB: input complex
  FixP: fixedpoint configuration of output value [WINT,WFRAC,Type]
        WINT, WFRAC are integer, Type is either 's' or 'u'
  QType: Quantization type ('WrpTrc', 'WrpRnd', 'SatTrc' or 'SatRnd')
  """

  return ComplexRESIZE( inA+inB, FixP, QType, IDString )

#------------------------------------------------------------------------
# ComplexAS
#------------------------------------------------------------------------
def ComplexAS( in_, Shift, FixP, QType, IDString=None ):
  """Arithmetic shift.

  in: input complex
  Shift: number of shifted positions (pos. = left, neg. = right)
  FixP: fixedpoint configuration of output value [WINT,WFRAC,Type]
        WINT, WFRAC are integer, Type is either 's' or 'u'
  QType: Quantization type ('WrpTrc', 'WrpRnd', 'SatTrc' or 'SatRnd')
  """

  return ComplexRESIZE( in_ * 2**Shift, FixP, QType, IDString )

#------------------------------------------------------------------------
# ComplexASL
#------------------------------------------------------------------------
def ComplexASL( in_, Shift, FixP, QType, IDString=None ):
  """Arithmetic shift left.

  in: input complex
  Shift: number of shifted positions ( >=0 )
  FixP: fixedpoint configuration of output value [WINT,WFRAC,Type]
        WINT, WFRAC are integer, Type is either 's' or 'u'
  QType: Quantization type ('WrpTrc', 'WrpRnd', 'SatTrc' or 'SatRnd')
  """

  if Shift < 0:
    raise Exception('Shift values must be >= 0!')

  return ComplexRESIZE( in_ * 2**Shift, FixP, QType, IDString )

#------------------------------------------------------------------------
# ComplexASR
#------------------------------------------------------------------------
def ComplexASR( in_, Shift, FixP, QType, IDString=None ):
  """Arithmetic shift right.

  in: input complex
  Shift: number of shifted positions ( >=0 )
  FixP: fixedpoint configuration of output value [WINT,WFRAC,Type]
        WINT, WFRAC are integer, Type is either 's' or 'u'
  QType: Quantization type ('WrpTrc', 'WrpRnd', 'SatTrc' or 'SatRnd')
  """

  if Shift < 0:
    raise Exception('Shift values must be >= 0!')

  return ComplexRESIZE( in_ * 2**-Shift, FixP, QType, IDString )

#------------------------------------------------------------------------
# ComplexCONJ
#------------------------------------------------------------------------
def ComplexCONJ( in_, FixP, QType, IDString=None ):
  """Complex conjugate.

  in: input complex
  FixP: fixedpoint configuration of output value [WINT,WFRAC,Type]
        WINT, WFRAC are integer, Type is either 's' or 'u'
  QType: Quantization type ('WrpTrc', 'WrpRnd', 'SatTrc' or 'SatRnd')
  """

  return ComplexRESIZE( in_.conjugate(), FixP, QType, IDString )

#------------------------------------------------------------------------
# ComplexMERGE
#------------------------------------------------------------------------
def ComplexMERGE( inReal, inImag, FixP, QType, IDString=None ):
  """Merge real and imaginary part to one complex number with common
  fixedpoint config.

  inReal, inImag: Real inputs (real and imag part)
  FixP: fixedpoint configuration of output value [WINT,WFRAC,Type]
        WINT, WFRAC are integer, Type is either 's' or 'u'
  QType: Quantization type ('WrpTrc', 'WrpRnd', 'SatTrc' or 'SatRnd')
  """

  real = RealRESIZE( inReal, FixP, QType, IDString )
  imag = RealRESIZE( inImag, FixP, QType, IDString )

  return complex( real, imag )

#------------------------------------------------------------------------
# ComplexMULT
#------------------------------------------------------------------------
def ComplexMULT( inA, inB, FixP, QType, IDString=None ):
  """Multiplication of two complex numbers.

  inA, inB: input complex
  FixP: fixedpoint configuration of output value [WINT,WFRAC,Type]
        WINT, WFRAC are integer, Type is either 's' or 'u'
  QType: Quantization type ('WrpTrc', 'WrpRnd', 'SatTrc' or 'SatRnd')
  """

  return ComplexRESIZE( inA * inB, FixP, QType, IDString )

#------------------------------------------------------------------------
# ComplexNEG
#------------------------------------------------------------------------
def ComplexNEG( in_, FixP, QType, IDString=None ):
  """Absolute value of complex number.

  in: input complex
  FixP: fixedpoint configuration of output value [WINT,WFRAC,Type]
        WINT, WFRAC are integer, Type is either 's' or 'u'
  QType: Quantization type ('WrpTrc', 'WrpRnd', 'SatTrc' or 'SatRnd')
  """

  if FixP[2] != 's':
    raise Exception('ComplexNEG exists only for signed output type')

  return ComplexRESIZE( -in_, FixP, QType, IDString )

#------------------------------------------------------------------------
# ComplexSUB
#------------------------------------------------------------------------
def ComplexSUB( inA, inB, FixP, QType, IDString=None ):
  """Subtraction of two complex numbers (inA-inB).

  inA, inB: input complex
  FixP: fixedpoint configuration of output value [WINT,WFRAC,Type]
        WINT, WFRAC are integer, Type is either 's' or 'u'
  QType: Quantization type ('WrpTrc', 'WrpRnd', 'SatTrc' or 'SatRnd')
  """

  return ComplexRESIZE( inA - inB, FixP, QType, IDString )

#------------------------------------------------------------------------
# ComplexWIDTH
#------------------------------------------------------------------------
def ComplexWIDTH( FixP ):
  """Get bitwidth.

  returns total number of bits that are required to represent a real
  number of type FixP (including sign bit if signal is of type signed)
  """

  if   FixP[2] != 's':
    raise Exception('Signal type of complex numbers must be signed')

  return (FixP[1] + FixP[2] + 1) * 2

