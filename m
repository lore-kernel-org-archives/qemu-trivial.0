Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZJoZy-0001LB-Sm
	for mharc-qemu-trivial@gnu.org; Mon, 27 Jul 2015 16:00:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59678)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZJoZu-0001BG-Qm
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 16:00:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZJoZp-0005bM-HL
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 16:00:50 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57639)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZJoZj-0005VJ-89; Mon, 27 Jul 2015 16:00:39 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id DC47A425B3;
	Mon, 27 Jul 2015 23:00:37 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 65AE8A69;
	Mon, 27 Jul 2015 22:54:21 +0300 (MSK)
Received: (nullmailer pid 9533 invoked by uid 1000);
	Mon, 27 Jul 2015 19:54:20 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 27 Jul 2015 22:54:12 +0300
Message-Id: <801db5ecdac7575a1b0250243eea1767da553e50.1438026619.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438026619.git.mjt@msgid.tls.msk.ru>
References: <cover.1438026619.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 09/10] qapi: add missing @
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
X-List-Received-Date: Mon, 27 Jul 2015 20:00:53 -0000

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qapi-schema.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi-schema.json b/qapi-schema.json
index a0a45f7..4342a08 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -15,7 +15,7 @@
 { 'include': 'qapi/trace.json' }
=20
 ##
-# LostTickPolicy:
+# @LostTickPolicy:
 #
 # Policy for handling lost ticks in timer devices.
 #
--=20
2.1.4


