This is an example for advanced mode. To use DATuner, users should descript the search space and support a Python program. Detailed information is shown below.

##########Search space definition############

Should follow the specific format. A space definition example is supported.

In the space definition file, each line defines one dimension of search space.

In each line, specify the NAME, TYPE and VALUE_RANGE
  
  Three types of parameters are supported: EnumParameter, FloatParameter, IntegerParameter
  
  EnumParameter: Enum type. Parameter with discrete limited values. 
  
  FloatParameter: Floating point. Parameter has a range of continuous values
  
  IntegerParameter: integer.

E.g., resyn EnumParameter {on, off}
      
      alpha_clustering FloatParameter [0, 1]

We support a space definition example in space.txt

#########Python code#########################

We support a wrapper program, in which we deal with the input/output with C code. More specificly, 
the wrapper program parses the space definition file and build the manipulator(which is used by OpenTuner).
wrapper program also generate the result file for C code to use.

User python code should inherit the wrapper program. In the user Python code, it should implement manipulator
and run function. 

We support an example in tuneProgram.py











