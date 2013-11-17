Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vi6eq-0006XM-3u
	for mharc-qemu-trivial@gnu.org; Sun, 17 Nov 2013 13:01:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55122)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Vi6en-0006Qu-3G
	for qemu-trivial@nongnu.org; Sun, 17 Nov 2013 13:01:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Vi6em-00022C-8j
	for qemu-trivial@nongnu.org; Sun, 17 Nov 2013 13:01:13 -0500
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:55615
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Vi6ek-00021s-Ck; Sun, 17 Nov 2013 13:01:10 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id DE684180136; Sun, 17 Nov 2013 19:01:07 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: Anthony Liguori <aliguori@amazon.com>
Date: Sun, 17 Nov 2013 19:01:07 +0100
Message-Id: <1384711267-9032-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH for 1.7] qga: Fix compiler warnings (missing
	gnu_printf format attribute, wrong format string)
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
X-List-Received-Date: Sun, 17 Nov 2013 18:01:14 -0000

gcc 4.8.2 reports this warning when extra warnings are enabled (-Wextra):

  CC    qga/commands.o
qga/commands.c: In function =E2=80=98slog=E2=80=99:
qga/commands.c:28:5: error:
 function might be possible candidate for =E2=80=98gnu_printf=E2=80=99 fo=
rmat attribute [-Werror=3Dsuggest-attribute=3Dformat]
     g_logv("syslog", G_LOG_LEVEL_INFO, fmt, ap);
     ^

gcc 4.8.2 reports this warning when slog is declared with the
gnu_printf format attribute:

qga/commands-posix.c: In function =E2=80=98qmp_guest_file_open=E2=80=99:
qga/commands-posix.c:404:5: warning:
 format =E2=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99=
, but argument 2 has type =E2=80=98int64_t=E2=80=99 [-Wformat=3D]
     slog("guest-file-open, handle: %d", handle);
     ^

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

Note: checkpatch.pl wrongly reports an error.

 qga/commands-posix.c   |    2 +-
 qga/guest-agent-core.h |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index f453132..182279d 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -401,7 +401,7 @@ int64_t qmp_guest_file_open(const char *path, bool ha=
s_mode, const char *mode, E
         return -1;
     }
=20
-    slog("guest-file-open, handle: %d", handle);
+    slog("guest-file-open, handle: %" PRId64, handle);
     return handle;
 }
=20
diff --git a/qga/guest-agent-core.h b/qga/guest-agent-core.h
index 624a559..95721eb 100644
--- a/qga/guest-agent-core.h
+++ b/qga/guest-agent-core.h
@@ -29,7 +29,7 @@ GACommandState *ga_command_state_new(void);
 bool ga_logging_enabled(GAState *s);
 void ga_disable_logging(GAState *s);
 void ga_enable_logging(GAState *s);
-void slog(const gchar *fmt, ...);
+void GCC_FMT_ATTR(1, 2) slog(const gchar *fmt, ...);
 void ga_set_response_delimited(GAState *s);
 bool ga_is_frozen(GAState *s);
 void ga_set_frozen(GAState *s);
--=20
1.7.10.4


