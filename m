Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cVxaA-00065L-Tt
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2017 04:40:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40939)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVxa7-00062M-A1
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 04:40:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVxa0-0000sO-3P
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 04:40:03 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:49566)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cVxZm-0000hA-Vw; Tue, 24 Jan 2017 04:39:43 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2487C42102;
	Tue, 24 Jan 2017 12:39:42 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 6AD4755D;
	Tue, 24 Jan 2017 12:39:41 +0300 (MSK)
Received: (nullmailer pid 12638 invoked by uid 1000);
	Tue, 24 Jan 2017 09:39:41 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 24 Jan 2017 12:39:19 +0300
Message-Id: <3c1951092c88d594c365fc7d570e8417a6f56a07.1485250702.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 15/31] qga: fix erroneous argument to strerror
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Jan 2017 09:40:04 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

process_command returns a negative value in case of error.  Make this
clear in the "if" statement and fix the strerror argument to flip it
to positive.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qga/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qga/main.c b/qga/main.c
index 6caf215..538e4ee 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -558,8 +558,8 @@ static void process_command(GAState *s, QDict *req)
     rsp =3D qmp_dispatch(QOBJECT(req));
     if (rsp) {
         ret =3D send_response(s, rsp);
-        if (ret) {
-            g_warning("error sending response: %s", strerror(ret));
+        if (ret < 0) {
+            g_warning("error sending response: %s", strerror(-ret));
         }
         qobject_decref(rsp);
     }
--=20
2.1.4


