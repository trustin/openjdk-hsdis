openjdk-hsdis
=============

OpenJDK disassembler plugin for HotSpot JVM (based on binutils)

History
-------
Recent versions of HotSpot (including current builds of JDK 8, 7 and 6)
can load a plug-in disassembler for diagnosing code quality.

This plugin comes from actual OpenJDK source repository (and is based on binutils
tools for disassembler).

Why this repository?
--------------------
This is just a "repackaging" of original hsdis based on source code from
http://hg.openjdk.java.net/jdk8u/jdk8u/hotspot/file/8015f8f73cde/src/share/tools/hsdis

Build
-----
```
git clone https://github.com/trustin/openjdk-hsdis.git
cd openjdk-hsdis
cmake .
make
sudo make install
```

Build Debian package
--------------------
```
sudo apt-get install build-essential devscripts
sudo mk-build-deps -i -r

git clone https://github.com/trustin/openjdk-hsdis.git
cd openjdk-hsdis
debuild -b -uc -us

sudo debi --with-depends
```

License
-------
```
Copyright (c) 2008, Oracle and/or its affiliates. All rights reserved.

This code is free software; you can redistribute it and/or modify it
under the terms of the GNU General Public License version 2 only, as
published by the Free Software Foundation.
  
This code is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
version 2 for more details (a copy is included in the LICENSE file that
accompanied this code).
 
You should have received a copy of the GNU General Public License version
2 along with this work; if not, write to the Free Software Foundation,
Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
  
Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
or visit www.oracle.com if you need additional information or have any
questions.
```
