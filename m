Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T4Gnc-0003Kp-HZ
	for mharc-qemu-trivial@gnu.org; Wed, 22 Aug 2012 15:41:08 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49709)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1T4GnV-0003J4-Lw
	for qemu-trivial@nongnu.org; Wed, 22 Aug 2012 15:41:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1T4GnO-0007CF-PH
	for qemu-trivial@nongnu.org; Wed, 22 Aug 2012 15:41:01 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:58817)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1T4GnO-0007Bc-JB
	for qemu-trivial@nongnu.org; Wed, 22 Aug 2012 15:40:54 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	030C87280028; Wed, 22 Aug 2012 21:40:53 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id g+5GAaB6N2n7; Wed, 22 Aug 2012 21:40:52 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 8670D728002A; Wed, 22 Aug 2012 21:40:52 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Wed, 22 Aug 2012 21:40:51 +0200
Message-Id: <1345664451-28890-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: Blue Swirl <blauwirbel@gmail.com>, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] w32: Always use standard instead of native
	format strings
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
X-List-Received-Date: Wed, 22 Aug 2012 19:41:07 -0000

GLib 2.0 include files use __printf__ for the format attribute
which resolves to native format strings on w32 hosts.

QEMU wants standard format strings instead of native format
strings, so we simply change any declaration with __printf__
to use __gnu_printf__.

This works because all basic printf functions support both
kinds of format strings.

This fixes a compiler warning:

qapi/string-output-visitor.c: In function =E2=80=98print_type_int=E2=80=99=
:
qapi/string-output-visitor.c:34:5: warning: unknown conversion type chara=
cter =E2=80=98l=E2=80=99 in format [-Wformat]
qapi/string-output-visitor.c:34:5: warning: too many arguments for format=
 [-Wformat-extra-args]

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 compiler.h |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/compiler.h b/compiler.h
index 07ba1f8..c734a71 100644
--- a/compiler.h
+++ b/compiler.h
@@ -44,6 +44,11 @@
    /* Use gnu_printf when supported (qemu uses standard format strings).=
 */
 #  define GCC_ATTR __attribute__((__unused__, format(gnu_printf, 1, 2)))
 #  define GCC_FMT_ATTR(n, m) __attribute__((format(gnu_printf, n, m)))
+#  if defined(_WIN32)
+    /* Map __printf__ to __gnu_printf__ because we want standard format =
strings
+     * even when MinGW or GLib include files use __printf__. */
+#   define __printf__ __gnu_printf__
+#  endif
 # endif
 #if defined(_WIN32)
 #define GCC_WEAK __attribute__((weak))
--=20
1.7.10


