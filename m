Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V2z0Z-00022x-KN
	for mharc-qemu-trivial@gnu.org; Sat, 27 Jul 2013 03:33:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40312)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V2z0U-0001qO-1c
	for qemu-trivial@nongnu.org; Sat, 27 Jul 2013 03:33:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V2z0S-0005ff-9z
	for qemu-trivial@nongnu.org; Sat, 27 Jul 2013 03:33:37 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51743)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V2z0M-0005dO-AD; Sat, 27 Jul 2013 03:33:30 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 9466542FC0;
	Sat, 27 Jul 2013 11:33:29 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 409DB202882; Sat, 27 Jul 2013 11:33:28 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: anthony@codemonkey.ws
Date: Sat, 27 Jul 2013 11:33:19 +0400
Message-Id: <1374910406-15273-5-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1374910406-15273-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1374910406-15273-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL trivial 04/11] exec: Remove env from list of
	poisoned names
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
X-List-Received-Date: Sat, 27 Jul 2013 07:33:39 -0000

From: Stefan Weil <sw@weilnetz.de>

The global variable env was removed some time ago, so this name may be
used without any restriction now.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/exec/poison.h |    1 -
 1 file changed, 1 deletion(-)

diff --git a/include/exec/poison.h b/include/exec/poison.h
index 2341a75..a4b1eca 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -36,7 +36,6 @@
 #pragma GCC poison TARGET_PAGE_ALIGN
 
 #pragma GCC poison CPUArchState
-#pragma GCC poison env
 
 #pragma GCC poison lduw_phys
 #pragma GCC poison ldl_phys
-- 
1.7.10.4


