#
# Copyright 2002 Sun Microsystems, Inc.  All Rights Reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.
#
# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).
#
# You should have received a copy of the GNU General Public License version
# 2 along with this work; if not, write to the Free Software Foundation,
# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#
# Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara,
# CA 95054 USA or visit www.sun.com if you need additional information or
# have any questions.
#

# @test
# @bug 4765255
# @summary Verify proper functioning of package equality checks used to
#          determine accessibility of superclass constructor and inherited
#          writeReplace/readResolve methods.

if [ "${TESTJAVA}" = "" ]
then
	echo "TESTJAVA not set.  Test cannot execute.  Failed."
exit 1
fi

if [ "${TESTSRC}" = "" ]
then
	TESTSRC="."
fi

set -ex

${TESTJAVA}/bin/javac -d . ${TESTSRC}/A.java ${TESTSRC}/B.java \
    ${TESTSRC}/C.java ${TESTSRC}/D.java ${TESTSRC}/Test.java
${TESTJAVA}/bin/jar cf foo.jar B.class D.class
rm -f B.class D.class

${TESTJAVA}/bin/java Test
rm -f *.class *.jar
