Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwEyc-0000CK-F2
	for mharc-qemu-trivial@gnu.org; Sun, 24 Sep 2017 18:02:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwEyZ-00006X-13
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 18:02:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwEyY-0006XI-Ee
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 18:02:11 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54989)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dwEyS-0006TA-Nd; Sun, 24 Sep 2017 18:02:04 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8F42541C94;
	Mon, 25 Sep 2017 01:02:00 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 9D120B6D;
	Mon, 25 Sep 2017 00:22:54 +0300 (MSK)
Received: (nullmailer pid 28255 invoked by uid 1000);
	Sun, 24 Sep 2017 21:22:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 25 Sep 2017 00:22:26 +0300
Message-Id: <ebc93aafbcccdcb87ef9141677beb10698756e87.1506288070.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
References: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
References: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 08/31] MAINTAINERS: add missing qcow2 entry
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
X-List-Received-Date: Sun, 24 Sep 2017 22:02:12 -0000

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Acked-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f86c68a107..b77131ec5f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1872,6 +1872,7 @@ M: Max Reitz <mreitz@redhat.com>
 L: qemu-block@nongnu.org
 S: Supported
 F: block/qcow2*
+F: docs/interop/qcow2.txt
=20
 qcow
 M: Kevin Wolf <kwolf@redhat.com>
--=20
2.11.0


