Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwEMj-0008W5-2D
	for mharc-qemu-trivial@gnu.org; Sun, 24 Sep 2017 17:23:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43286)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwEMf-0008QS-AT
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 17:23:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwEMe-0004Aa-Ja
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 17:23:01 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36735)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dwEMa-00048z-6z; Sun, 24 Sep 2017 17:22:56 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 53F4741C98;
	Mon, 25 Sep 2017 00:22:54 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id D831E3C3;
	Mon, 25 Sep 2017 00:22:53 +0300 (MSK)
Received: (nullmailer pid 28253 invoked by uid 1000);
	Sun, 24 Sep 2017 21:22:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 25 Sep 2017 00:22:25 +0300
Message-Id: <a24aa9fe9aa159d665e69a5f8d7933be5067890f.1506288070.git.mjt@msgid.tls.msk.ru>
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
Subject: [Qemu-trivial] [PULL 07/31] MAINTAINERS: add missing Guest Agent
 entries
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
X-List-Received-Date: Sun, 24 Sep 2017 21:23:02 -0000

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Acked-by: Michael Roth <mdroth@linux.vnet.ibm.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4d7a06a0ed..f86c68a107 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1462,6 +1462,10 @@ QEMU Guest Agent
 M: Michael Roth <mdroth@linux.vnet.ibm.com>
 S: Maintained
 F: qga/
+F: qemu-ga.texi
+F: scripts/qemu-guest-agent/
+F: tests/test-qga.c
+F: docs/interop/qemu-ga-ref.texi
 T: git git://github.com/mdroth/qemu.git qga
=20
 QOM
--=20
2.11.0


