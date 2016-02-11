Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aTqKo-0005D4-5W
	for mharc-qemu-trivial@gnu.org; Thu, 11 Feb 2016 07:26:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60158)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aTqKh-000500-K7
	for qemu-trivial@nongnu.org; Thu, 11 Feb 2016 07:26:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aTqKg-0008Qe-RT
	for qemu-trivial@nongnu.org; Thu, 11 Feb 2016 07:26:51 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46638)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aTqKd-0008LQ-5b; Thu, 11 Feb 2016 07:26:47 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B611941469;
	Thu, 11 Feb 2016 15:26:45 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id A0291AB1;
	Thu, 11 Feb 2016 15:19:06 +0300 (MSK)
Received: (nullmailer pid 11185 invoked by uid 1000);
	Thu, 11 Feb 2016 12:19:04 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Feb 2016 15:18:56 +0300
Message-Id: <190f34f81e311f2901164790bd21dd4ecdf72b73.1455192968.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1455192968.git.mjt@msgid.tls.msk.ru>
References: <cover.1455192968.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Wei Yang <richard.weiyang@gmail.com>
Subject: [Qemu-trivial] [PULL 07/14] qmp-spec: fix index in doc
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
X-List-Received-Date: Thu, 11 Feb 2016 12:26:53 -0000

From: Wei Yang <richard.weiyang@gmail.com>

The index is duplicated. Just change it.

Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 docs/qmp-spec.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/qmp-spec.txt b/docs/qmp-spec.txt
index 4fb10a5..8e4bc3d 100644
--- a/docs/qmp-spec.txt
+++ b/docs/qmp-spec.txt
@@ -180,7 +180,7 @@ Some events are rate-limited to at most one per second.  If additional
 dropped, and the last one is delayed.  "Similar" normally means same
 event type.  See qmp-events.txt for details.
 
-2.5 QGA Synchronization
+2.6 QGA Synchronization
 -----------------------
 
 When using QGA, an additional synchronization feature is built into
-- 
2.1.4


