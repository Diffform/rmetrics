#  Copyright (C) 2012 Yohan Chalabi
#
#  This program is free software; you can redistribute it and/or
#  modify it under the terms of the GNU General Public License as
#  published by the Free Software Foundation; either version 2 or 3 of
#  the License (at your option).
#
#  This program is distributed in the hope that it will be useful, but
#  WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#  General Public License for more details.
#
#  A copy of the GNU General Public License is available at
#  http://www.r-project.org/Licenses/

qgl <- function(p, med = 0, iqr = 1, chi = 0, xi = 0.6)
    .Call("gldist_qgl", p, med, iqr, chi, xi)

