Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S5lMh-0004IP-QP
	for mharc-qemu-trivial@gnu.org; Thu, 08 Mar 2012 16:59:15 -0500
Received: from eggs.gnu.org ([208.118.235.92]:48881)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S5lMP-0004HM-EC
	for qemu-trivial@nongnu.org; Thu, 08 Mar 2012 16:59:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S5lLh-0000Rw-5K
	for qemu-trivial@nongnu.org; Thu, 08 Mar 2012 16:58:57 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:45742)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1S5lLd-0000RA-LR; Thu, 08 Mar 2012 16:58:09 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	1F7CA728009F; Thu,  8 Mar 2012 22:58:07 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id Pan3NGjdl-lU; Thu,  8 Mar 2012 22:58:06 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 8E1A872800A0; Thu,  8 Mar 2012 22:58:06 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Thu,  8 Mar 2012 22:58:06 +0100
Message-Id: <1331243886-19117-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.9
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	Anthony Liguori <aliguori@us.ibm.com>
Subject: [Qemu-trivial] [PATCH v2] vnc: Fix packed boolean struct members
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
X-List-Received-Date: Thu, 08 Mar 2012 21:59:15 -0000

This patch fixes warnings reported by splint:

For variables which are packed in a single bit, a signed data type
like 'int' does not make much sense.

There is no obvious reason why the two values should be packed,
so I removed the packing and changed the data type to bool
because both are used as boolean values.

v2:

Some versions of gcc complain after this modification,
for example gcc (Debian 4.4.5-8) 4.4.5):

ui/vnc-auth-sasl.c: In function =E2=80=98vnc_sasl_client_cleanup=E2=80=99=
:
ui/vnc-auth-sasl.c:34: error: suggest parentheses around assignment used =
as truth value

Obviously, the compiler does not like code which does
bool =3D unsigned =3D bool =3D 0

Splitting that code in three statements works.

Cc: Anthony Liguori <aliguori@us.ibm.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 ui/vnc-auth-sasl.c |    4 +++-
 ui/vnc-auth-sasl.h |    4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/ui/vnc-auth-sasl.c b/ui/vnc-auth-sasl.c
index e2045fc..8fba770 100644
--- a/ui/vnc-auth-sasl.c
+++ b/ui/vnc-auth-sasl.c
@@ -31,7 +31,9 @@
 void vnc_sasl_client_cleanup(VncState *vs)
 {
     if (vs->sasl.conn) {
-        vs->sasl.runSSF =3D vs->sasl.waitWriteSSF =3D vs->sasl.wantSSF =3D=
 0;
+        vs->sasl.runSSF =3D false;
+        vs->sasl.wantSSF =3D false;
+        vs->sasl.waitWriteSSF =3D 0;
         vs->sasl.encodedLength =3D vs->sasl.encodedOffset =3D 0;
         vs->sasl.encoded =3D NULL;
         g_free(vs->sasl.username);
diff --git a/ui/vnc-auth-sasl.h b/ui/vnc-auth-sasl.h
index fd9b18a..ee243a9 100644
--- a/ui/vnc-auth-sasl.h
+++ b/ui/vnc-auth-sasl.h
@@ -37,9 +37,9 @@ typedef struct VncDisplaySASL VncDisplaySASL;
 struct VncStateSASL {
     sasl_conn_t *conn;
     /* If we want to negotiate an SSF layer with client */
-    int wantSSF :1;
+    bool wantSSF;
     /* If we are now running the SSF layer */
-    int runSSF :1;
+    bool runSSF;
     /*
      * If this is non-zero, then wait for that many bytes
      * to be written plain, before switching to SSF encoding
--=20
1.7.9


