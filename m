Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eQh3V-00031B-VJ
	for mharc-qemu-trivial@gnu.org; Sun, 17 Dec 2017 17:05:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47785)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQh3T-0002yH-5W
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 17:05:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQh3S-00068Z-A3
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 17:05:07 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:54919)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1eQh3N-00065k-Up; Sun, 17 Dec 2017 17:05:02 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 035074115E;
	Mon, 18 Dec 2017 01:04:55 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B8C0ACDC;
	Mon, 18 Dec 2017 00:25:46 +0300 (MSK)
Received: (nullmailer pid 30903 invoked by uid 1000);
	Sun, 17 Dec 2017 21:28:08 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Vicente Jimenez Aguilar <googuy@gmail.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 18 Dec 2017 00:27:15 +0300
Message-Id: <2b5490ad0f8bbe152d2356ec322c93941a73b777.1513545944.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 10/61] Document pretty parameter for mon option
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
X-List-Received-Date: Sun, 17 Dec 2017 22:05:08 -0000

From: Vicente Jimenez Aguilar <googuy@gmail.com>

Documentation: document pretty parameter for mon option
that turns on JSON pretty printing

Signed-off-by: Vicente Jimenez Aguilar <googuy@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-options.hx | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index fe0c29271f..32d9378172 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3487,11 +3487,12 @@ Like -qmp but uses pretty JSON formatting.
 ETEXI
 
 DEF("mon", HAS_ARG, QEMU_OPTION_mon, \
-    "-mon [chardev=]name[,mode=readline|control]\n", QEMU_ARCH_ALL)
+    "-mon [chardev=]name[,mode=readline|control][,pretty[=on|off]]\n", QEMU_ARCH_ALL)
 STEXI
-@item -mon [chardev=]name[,mode=readline|control]
+@item -mon [chardev=]name[,mode=readline|control][,pretty[=on|off]]
 @findex -mon
-Setup monitor on chardev @var{name}.
+Setup monitor on chardev @var{name}. @code{pretty} turns on JSON pretty printing
+easing human reading and debugging.
 ETEXI
 
 DEF("debugcon", HAS_ARG, QEMU_OPTION_debugcon, \
-- 
2.11.0


