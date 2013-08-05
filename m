Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V6QH4-0000dt-MU
	for mharc-qemu-trivial@gnu.org; Mon, 05 Aug 2013 15:16:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1V6QGz-0000Rq-FV
	for qemu-trivial@nongnu.org; Mon, 05 Aug 2013 15:16:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1V6QGw-0003Lx-MB
	for qemu-trivial@nongnu.org; Mon, 05 Aug 2013 15:16:53 -0400
Received: from
	1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.d.1.0.0.b.8.0.1.0.0.2.ip6.arpa
	([2001:8b0:1d0::1]:59112 helo=mnementh.archaic.org.uk)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1V6QGo-0003KZ-Ez; Mon, 05 Aug 2013 15:16:42 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1V6QGm-0005ma-LU; Mon, 05 Aug 2013 20:16:40 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  5 Aug 2013 20:16:40 +0100
Message-Id: <1375730200-22203-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] configure: disable clang -Wstring-plus-int
	warning
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
X-List-Received-Date: Mon, 05 Aug 2013 19:16:57 -0000

Some versions of clang will warn about adding integers to strings:

disas/i386.c:4753:23: error: adding 'char' to a string does not append
      to the string [-Werror,-Wstring-plus-int]
      oappend ("%es:" + intel_syntax);
               ~~~~~~~^~~~~~~~~~~~~~
disas/i386.c:4753:23: note: use array indexing to silence this warning
      oappend ("%es:" + intel_syntax);
                      ^
               &      [             ]

disas/i386.c uses this idiom to to skip a "%" prefix if using intel
rather than AT&T syntax. This seems like a reasonable  thing to do,
and I don't think anybody contributing to QEMU is likely to believe
that '+' is a string concatenation operator in C, so just disable
-Wstring-plus-int.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure |    1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index a3bd9be..a1d1701 100755
--- a/configure
+++ b/configure
@@ -1204,6 +1204,7 @@ gcc_flags="-Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers $gcc_
 gcc_flags="-Wmissing-include-dirs -Wempty-body -Wnested-externs $gcc_flags"
 gcc_flags="-Wendif-labels $gcc_flags"
 gcc_flags="-Wno-initializer-overrides $gcc_flags"
+gcc_flags="-Wno-string-plus-int $gcc_flags"
 # Note that we do not add -Werror to gcc_flags here, because that would
 # enable it for all configure tests. If a configure test failed due
 # to -Werror this would just silently disable some features,
-- 
1.7.9.5


