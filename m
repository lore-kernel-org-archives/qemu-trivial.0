Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKsBp-0006Vv-ES
	for mharc-qemu-trivial@gnu.org; Sat, 14 Sep 2013 11:55:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49372)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VKsBn-0006Sc-4I
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 11:55:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VKsBm-0006Fq-08
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 11:55:14 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:54532
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VKsBj-0006FM-Lk; Sat, 14 Sep 2013 11:55:11 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id E0D5017F6F9; Sat, 14 Sep 2013 17:55:07 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Sat, 14 Sep 2013 17:55:07 +0200
Message-Id: <1379174107-4128-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH v2] configure: Enable extra compiler warnings
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
X-List-Received-Date: Sat, 14 Sep 2013 15:55:16 -0000

Compiler option -Wextra enables an additional set of compiler warnings.

Some of these warnings were already enabled explicitly in QEMU:
-Wold-style-declaration, -Wtype-limits, -Wignored-qualifiers and
-Wempty-body are now redundant and can be removed.

Others don't work with the current code and must be disabled to
avoid warnings: -Wno-missing-field-initializers, -Wno-override-init,
-Wno-sign-compare and -Wno-unused-parameter.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

v2: Removed unintentional change which added -fstack-protector-all
    and rebased for latest QEMU.

 configure |   12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index 2b83936..ff89d60 100755
--- a/configure
+++ b/configure
@@ -310,7 +310,7 @@ sdl_config="${SDL_CONFIG-${cross_prefix}sdl-config}"
 
 # default flags for all hosts
 QEMU_CFLAGS="-fno-strict-aliasing $QEMU_CFLAGS"
-QEMU_CFLAGS="-Wall -Wundef -Wwrite-strings -Wmissing-prototypes $QEMU_CFLAGS"
+QEMU_CFLAGS="-Wall -Wextra -Wundef -Wwrite-strings -Wmissing-prototypes $QEMU_CFLAGS"
 QEMU_CFLAGS="-Wstrict-prototypes -Wredundant-decls $QEMU_CFLAGS"
 QEMU_CFLAGS="-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE $QEMU_CFLAGS"
 QEMU_INCLUDES="-I. -I\$(SRC_PATH) -I\$(SRC_PATH)/include"
@@ -1236,12 +1236,16 @@ if test -z "$werror" ; then
     fi
 fi
 
-gcc_flags="-Wold-style-declaration -Wold-style-definition -Wtype-limits"
-gcc_flags="-Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers $gcc_flags"
-gcc_flags="-Wmissing-include-dirs -Wempty-body -Wnested-externs $gcc_flags"
+gcc_flags="-Wold-style-definition"
+gcc_flags="-Wformat-security -Wformat-y2k -Winit-self $gcc_flags"
+gcc_flags="-Wmissing-include-dirs -Wnested-externs $gcc_flags"
 gcc_flags="-Wendif-labels $gcc_flags"
 gcc_flags="-Wno-initializer-overrides $gcc_flags"
+gcc_flags="-Wno-missing-field-initializers $gcc_flags"
+gcc_flags="-Wno-override-init $gcc_flags"
+gcc_flags="-Wno-sign-compare $gcc_flags"
 gcc_flags="-Wno-string-plus-int $gcc_flags"
+gcc_flags="-Wno-unused-parameter $gcc_flags"
 # Note that we do not add -Werror to gcc_flags here, because that would
 # enable it for all configure tests. If a configure test failed due
 # to -Werror this would just silently disable some features,
-- 
1.7.10.4


