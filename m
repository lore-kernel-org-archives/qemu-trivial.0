Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dHYIj-00028J-2x
	for mharc-qemu-trivial@gnu.org; Sun, 04 Jun 2017 12:22:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39390)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHYId-00023T-8u
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 12:22:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHYIc-0004Y1-Em
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 12:22:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40005)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dHYIW-0004O9-Da; Sun, 04 Jun 2017 12:22:36 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1F2DF404E3;
	Sun,  4 Jun 2017 19:22:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 874D25E6;
	Sun,  4 Jun 2017 18:45:28 +0300 (MSK)
Received: (nullmailer pid 16372 invoked by uid 1000);
	Sun, 04 Jun 2017 15:45:27 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  4 Jun 2017 18:45:13 +0300
Message-Id: <f85d66f47feffc1a223d8336022b17a3c7aafd47.1496591095.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 09/22] block: Correct documentation for
 BLOCK_WRITE_THRESHOLD
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
X-List-Received-Date: Sun, 04 Jun 2017 16:22:44 -0000

From: Eric Blake <eblake@redhat.com>

Use the correct command name.

Signed-off-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qapi/block-core.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index ea0b3e8b13..309b1df214 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -3624,7 +3624,7 @@
 # means the device should be extended to avoid pausing for
 # disk exhaustion.
 # The event is one shot. Once triggered, it needs to be
-# re-registered with another block-set-threshold command.
+# re-registered with another block-set-write-threshold command.
 #
 # @node-name: graph node name on which the threshold was exceeded.
 #
-- 
2.11.0


