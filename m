Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WInGe-0000rE-Pe
	for mharc-qemu-trivial@gnu.org; Wed, 26 Feb 2014 17:47:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43171)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WInGX-0000hF-Km
	for qemu-trivial@nongnu.org; Wed, 26 Feb 2014 17:47:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WInGS-0003hB-SW
	for qemu-trivial@nongnu.org; Wed, 26 Feb 2014 17:47:49 -0500
Received: from mnementh.archaic.org.uk ([81.2.115.146]:39328)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WInGS-0003fg-Lj
	for qemu-trivial@nongnu.org; Wed, 26 Feb 2014 17:47:44 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WInGP-0006Qw-Vi; Wed, 26 Feb 2014 22:47:41 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 26 Feb 2014 22:47:41 +0000
Message-Id: <1393454861-24705-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <andreas.faerber@web.de>,
	patches@linaro.org
Subject: [Qemu-trivial] [PATCH] tests/Makefile: Suppress format-security
	warnings on JSON tests
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
X-List-Received-Date: Wed, 26 Feb 2014 22:47:54 -0000

Some of our test binaries programmatically generate JSON format
strings to feed to qobject_from_json(). Since that function is
marked with GCC_FMT_ATTR(), clang complains about this:
 tests/test-qmp-input-visitor.c:76:35: warning: format string is not a
 string literal (potentially insecure) [-Wformat-security]
    data->obj = qobject_from_json(json_string);
                                  ^~~~~~~~~~~

Since these are only test cases and not potential attack vectors,
the simplest approach is simply to suppress this particular
compiler warning when compiling the relevant test cases.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I couldn't think of a better way to do this...

 tests/Makefile | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/Makefile b/tests/Makefile
index b17d41e..496c02f 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -146,6 +146,17 @@ check-qapi-schema-y := $(addprefix tests/qapi-schema/, \
 
 GENERATED_HEADERS += tests/test-qapi-types.h tests/test-qapi-visit.h tests/test-qmp-commands.h
 
+# These tests use the qobject_from_json() function with programmatically
+# generated format strings; since this would otherwise trip clang's
+# format-security warnings and these are only test binaries, disable
+# the warnings when building them.
+JSON_USERS=check-qjson \
+           check-input-visitor \
+           test-qmp-input-visitor \
+           test-visitor-serialization
+
+$(JSON_USERS:%=tests/%.o): CFLAGS += -Wno-format-security
+
 test-obj-y = tests/check-qint.o tests/check-qstring.o tests/check-qdict.o \
 	tests/check-qlist.o tests/check-qfloat.o tests/check-qjson.o \
 	tests/test-coroutine.o tests/test-string-output-visitor.o \
-- 
1.8.5.4


