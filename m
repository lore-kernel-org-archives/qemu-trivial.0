Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwEfB-0003EU-Oe
	for mharc-qemu-trivial@gnu.org; Sun, 24 Sep 2017 17:42:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48528)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwEf9-0003Bt-Bg
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 17:42:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwEf8-0004pA-JH
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 17:42:07 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52395)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dwEf3-0004mD-AW; Sun, 24 Sep 2017 17:42:01 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0546141C95;
	Mon, 25 Sep 2017 00:42:00 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 0613AC29;
	Mon, 25 Sep 2017 00:22:56 +0300 (MSK)
Received: (nullmailer pid 28262 invoked by uid 1000);
	Sun, 24 Sep 2017 21:22:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 25 Sep 2017 00:22:29 +0300
Message-Id: <6882507b6d2d524ab6d3e7ac2a83e987ac1e191a.1506288070.git.mjt@msgid.tls.msk.ru>
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
Subject: [Qemu-trivial] [PULL 11/31] MAINTAINERS: add missing entries for
 throttling infra
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
X-List-Received-Date: Sun, 24 Sep 2017 21:42:08 -0000

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 041605ce13..c40935f441 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1595,8 +1595,10 @@ M: Alberto Garcia <berto@igalia.com>
 S: Supported
 F: block/throttle-groups.c
 F: include/block/throttle-groups.h
-F: include/qemu/throttle.h
+F: include/qemu/throttle*.h
 F: util/throttle.c
+F: docs/throttle.txt
+F: tests/test-throttle.c
 L: qemu-block@nongnu.org
=20
 UUID
--=20
2.11.0


