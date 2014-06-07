Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WtIlo-0003dK-07
	for mharc-qemu-trivial@gnu.org; Sat, 07 Jun 2014 11:43:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47196)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1WtIli-0003VN-6c
	for qemu-trivial@nongnu.org; Sat, 07 Jun 2014 11:42:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1WtIle-0003Wr-BB
	for qemu-trivial@nongnu.org; Sat, 07 Jun 2014 11:42:54 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:36298)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1WtIlW-0003UL-0S; Sat, 07 Jun 2014 11:42:42 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 0726B17F5D0; Sat,  7 Jun 2014 17:42:38 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sat,  7 Jun 2014 17:42:37 +0200
Message-Id: <1402155757-24977-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] checkpatch: Check *.cc files and allow C99
	comments for C++ code
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 07 Jun 2014 15:42:58 -0000

QEMU uses both *.cc and *.cpp for some files with C++ code:

disas/libvixl/utils.cc
disas/libvixl/a64/disasm-a64.cc
disas/libvixl/a64/instructions-a64.cc
disas/libvixl/a64/decoder-a64.cc
disas/arm-a64.cc
qga/vss-win32/provider.cpp
qga/vss-win32/install.cpp
qga/vss-win32/requester.cpp

*.cpp files were already checked. Add the cc pattern, so *.cc are checked
now, too.

Comments with // are quite common in C++ code, so don't forbid them.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

The current *.cc files now trigger several warnings and errors,
but that's not a good reason why they should be suppressed.

Regards,
Stefan Weil

 scripts/checkpatch.pl |   18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 9d46e5a..f29bdbe 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1363,7 +1363,7 @@ sub process {
 # Check for incorrect file permissions
 		if ($line =~ /^new (file )?mode.*[7531]\d{0,2}$/) {
 			my $permhere = $here . "FILE: $realfile\n";
-			if ($realfile =~ /(Makefile|Kconfig|\.c|\.cpp|\.h|\.S|\.tmpl)$/) {
+			if ($realfile =~ /(Makefile|Kconfig|\.c|\.cc|\.cpp|\.h|\.S|\.tmpl)$/) {
 				ERROR("do not set execute permissions for source files\n" . $permhere);
 			}
 		}
@@ -1460,7 +1460,7 @@ sub process {
 		}
 
 # check we are in a valid source file if not then ignore this hunk
-		next if ($realfile !~ /\.(h|c|cpp|s|S|pl|sh)$/);
+		next if ($realfile !~ /\.(h|c|cc|cpp|s|S|pl|sh)$/);
 
 #80 column limit
 		if ($line =~ /^\+/ && $prevrawline !~ /\/\*\*/ &&
@@ -1495,7 +1495,7 @@ sub process {
 		}
 
 # check we are in a valid source file C or perl if not then ignore this hunk
-		next if ($realfile !~ /\.(h|c|cpp|pl)$/);
+		next if ($realfile !~ /\.(h|c|cc|cpp|pl)$/);
 
 # in QEMU, no tabs are allowed
 		if ($rawline =~ /^\+.*\t/) {
@@ -1505,7 +1505,7 @@ sub process {
 		}
 
 # check we are in a valid C source file if not then ignore this hunk
-		next if ($realfile !~ /\.(h|c|cpp)$/);
+		next if ($realfile !~ /\.(h|c|cc|cpp)$/);
 
 # check for RCS/CVS revision markers
 		if ($rawline =~ /^\+.*\$(Revision|Log|Id)(?:\$|)/) {
@@ -1792,7 +1792,7 @@ sub process {
 		}
 
 # no C99 // comments
-		if ($line =~ m{//}) {
+		if (($line =~ m{//}) && !($realfile =~ /(\.cc|\.cpp)$/)) {
 			ERROR("do not use C99 // comments\n" . $herecurr);
 		}
 		# Remove C99 comments.
@@ -1970,7 +1970,7 @@ sub process {
 			{
 
 			# Ignore 'catch (...)' in C++
-			} elsif ($name =~ /^catch$/ && $realfile =~ /(\.cpp|\.h)$/) {
+			} elsif ($name =~ /^catch$/ && $realfile =~ /(\.cc|\.cpp|\.h)$/) {
 
 			# cpp #define statements have non-optional spaces, ie
 			# if there is a space between the name and the open
@@ -2067,7 +2067,7 @@ sub process {
 
 				# Ignore : used in class declaration in C++
 				} elsif ($opv eq ':B' && $ctx =~ /Wx[WE]/ &&
-						 $line =~ /class/ && $realfile =~ /(\.cpp|\.h)$/) {
+						 $line =~ /class/ && $realfile =~ /(\.cc|\.cpp|\.h)$/) {
 
 				# No spaces for:
 				#   ->
@@ -2095,7 +2095,7 @@ sub process {
 				} elsif ($op eq '!' || $op eq '~' ||
 					 $opv eq '*U' || $opv eq '-U' ||
 					 $opv eq '&U' || $opv eq '&&U') {
-					if ($op eq '~' && $ca =~ /::$/ && $realfile =~ /(\.cpp|\.h)$/) {
+					if ($op eq '~' && $ca =~ /::$/ && $realfile =~ /(\.cc|\.cpp|\.h)$/) {
 						# '~' used as a name of Destructor
 
 					} elsif ($ctx !~ /[WEBC]x./ && $ca !~ /(?:\)|!|~|\*|-|\&|\||\+\+|\-\-|\{)$/) {
@@ -2145,7 +2145,7 @@ sub process {
 				} elsif ($ctx !~ /[EWC]x[CWE]/) {
 					my $ok = 0;
 
-					if ($realfile =~ /\.cpp|\.h$/) {
+					if ($realfile =~ /\.cc|\.cpp|\.h$/) {
 						# Ignore template arguments <...> in C++
 						if (($op eq '<' || $op eq '>') && $line =~ /<.*>/) {
 							$ok = 1;
-- 
1.7.10.4


