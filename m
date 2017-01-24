Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cVzqL-0000kN-3H
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2017 07:04:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47350)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVzqI-0000hC-FZ
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 07:04:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVzqH-00009f-Nh
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 07:04:54 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:53471)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cVzqC-00005S-B3; Tue, 24 Jan 2017 07:04:48 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E7A204212D;
	Tue, 24 Jan 2017 15:04:47 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id EFD54573;
	Tue, 24 Jan 2017 12:39:43 +0300 (MSK)
Received: (nullmailer pid 12661 invoked by uid 1000);
	Tue, 24 Jan 2017 09:39:41 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@gnu.org>, qemu-trivial@nongnu.org,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 24 Jan 2017 12:39:30 +0300
Message-Id: <7bebc948e2ffaf0786c973bde6b9ea2bfe2271ed.1485250702.git.mjt@msgid.tls.msk.ru>
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
Subject: [Qemu-trivial] [PULL 26/31] Drop duplicate display option
 documentation
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
X-List-Received-Date: Tue, 24 Jan 2017 12:04:55 -0000

From: Samuel Thibault <samuel.thibault@gnu.org>

The curses and none possibilities are already documented on a separate li=
ne,
so documenting it on the sdl line was both unneeded and confusing.

Introduced in commit f04ec5afbb7d60a56863add800fd90ceee66f362
Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 84b7bd9..659b88d 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -926,7 +926,7 @@ ETEXI
=20
 DEF("display", HAS_ARG, QEMU_OPTION_display,
     "-display sdl[,frame=3Don|off][,alt_grab=3Don|off][,ctrl_grab=3Don|o=
ff]\n"
-    "            [,window_close=3Don|off][,gl=3Don|off]|curses|none|\n"
+    "            [,window_close=3Don|off][,gl=3Don|off]\n"
     "-display gtk[,grab_on_hover=3Don|off][,gl=3Don|off]|\n"
     "-display vnc=3D<display>[,<optargs>]\n"
     "-display curses\n"
--=20
2.1.4


