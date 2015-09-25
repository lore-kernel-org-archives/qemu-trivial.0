Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZfZMQ-0000zI-NJ
	for mharc-qemu-trivial@gnu.org; Fri, 25 Sep 2015 16:12:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33256)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ZfZMO-0000vj-FM
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 16:12:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ZfZMN-0002y1-F5
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 16:12:48 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:40926)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1ZfZMI-0002vb-9w; Fri, 25 Sep 2015 16:12:42 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 9794917F539; Fri, 25 Sep 2015 22:12:40 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Developer <qemu-devel@nongnu.org>
Date: Fri, 25 Sep 2015 22:12:30 +0200
Message-Id: <1443211950-8207-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 37.221.198.45
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [Qemu-trivial] [PATCH] trace/simple: Fix warning and wrong trace
	file name for MinGW
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
X-List-Received-Date: Fri, 25 Sep 2015 20:12:49 -0000

On Windows, getpid() always returns an int value, but pid_t (which is
expected by the format string) is either a 32 bit or a 64 bit value.

Without a type cast (or a modified format string), the compiler prints
a warning when building for 64 bit Windows and the resulting trace_file_n=
ame
will include a wrong pid:

trace/simple.c:332:9: warning:
 format =E2=80=98%lld=E2=80=99 expects argument of type =E2=80=98long lon=
g int=E2=80=99,
 but argument 2 has type =E2=80=98int=E2=80=99 [-Wformat=3D]

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 trace/simple.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/trace/simple.c b/trace/simple.c
index 11ad030..56a624c 100644
--- a/trace/simple.c
+++ b/trace/simple.c
@@ -329,7 +329,8 @@ bool st_set_trace_file(const char *file)
     g_free(trace_file_name);
=20
     if (!file) {
-        trace_file_name =3D g_strdup_printf(CONFIG_TRACE_FILE, getpid())=
;
+        /* Type cast needed for Windows where getpid() returns an int. *=
/
+        trace_file_name =3D g_strdup_printf(CONFIG_TRACE_FILE, (pid_t)ge=
tpid());
     } else {
         trace_file_name =3D g_strdup_printf("%s", file);
     }
--=20
2.1.4


