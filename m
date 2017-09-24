Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwEVY-0004zg-5u
	for mharc-qemu-trivial@gnu.org; Sun, 24 Sep 2017 17:32:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45760)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwEVS-0004sp-SD
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 17:32:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwEVR-0000LC-Mv
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 17:32:06 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55355)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dwEVN-0000Ht-65; Sun, 24 Sep 2017 17:32:01 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B178F41C92;
	Mon, 25 Sep 2017 00:31:59 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id A17EAB8C;
	Mon, 25 Sep 2017 00:22:55 +0300 (MSK)
Received: (nullmailer pid 28272 invoked by uid 1000);
	Sun, 24 Sep 2017 21:22:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 25 Sep 2017 00:22:34 +0300
Message-Id: <94299fffab0071bdc75a90d334e50baba7bfbabd.1506288070.git.mjt@msgid.tls.msk.ru>
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
Subject: [Qemu-trivial] [PULL 16/31] MAINTAINERS: update docs/interop/
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
X-List-Received-Date: Sun, 24 Sep 2017 21:32:08 -0000

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

moved in commit 7746cf8aab68

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Acked-by: Fam Zheng <famz@redhat.com>
Acked-by: John Snow <jsnow@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f4444467e0..932443df41 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1271,7 +1271,7 @@ F: block/dirty-bitmap.c
 F: include/qemu/hbitmap.h
 F: include/block/dirty-bitmap.h
 F: tests/test-hbitmap.c
-F: docs/bitmaps.md
+F: docs/interop/bitmaps.rst
 T: git git://github.com/famz/qemu.git bitmaps
 T: git git://github.com/jnsnow/qemu.git bitmaps
=20
@@ -1857,7 +1857,7 @@ M: Denis V. Lunev <den@openvz.org>
 L: qemu-block@nongnu.org
 S: Supported
 F: block/parallels.c
-F: docs/specs/parallels.txt
+F: docs/interop/parallels.txt
=20
 qed
 M: Stefan Hajnoczi <stefanha@redhat.com>
--=20
2.11.0


