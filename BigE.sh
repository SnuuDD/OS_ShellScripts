#!/usr/bin/ksh

# This program shows the use of arguments.
# Remember: Arguments are inputs from the command line.

# Lets validate that we get 3 arguments from the command line
if [ $# -eq 3 ]
then
  # Lets assign to x the first argument and to y the second argument
  x=$1
  y=$2
  z=$3
  echo -e "\nValue of x = $x, y = $y and z = $z"
  echo "The greatest of the 3 arguments is:"
  if [ $x -ge $y -a $x -ge $z ]
  then
    echo -e "x = $x \n"
  elif [ $y -ge $x -a $y -ge $z ]
  then
    echo -e "y = $y \n"
  elif [ $z -ge $x -a $z -ge $y ]
  then
     echo -e "z = $z \n"
  elif [ $x -eq $y -a $y -ge $z ]
  then
    echo -e "x = $x \n"
  fi
else
  echo -e "The script needs 3 values as an input.\a\n"
fi