#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([daTuner], [1.0], [xuchang.xjtu@gmail.com])
AC_CONFIG_SRCDIR([src])
#AC_CONFIG_HEADERS(config.h)
AM_INIT_AUTOMAKE(daTuner,1.0)


# Checks for programs.
AC_PROG_CXX
AC_PROG_CC

# Checks for libraries.
AC_PROG_RANLIB
# Checks for header files.
AC_CHECK_HEADERS([unistd.h])

# Checks for typedefs, structures, and compiler characteristics.
AC_CHECK_HEADER_STDBOOL

# Checks for library functions.
AC_CHECK_FUNCS([floor sqrt])
#AC_CHECK_LIB
#AC_PROG_LIBTOOL
AC_OUTPUT(Makefile src/Makefile)
