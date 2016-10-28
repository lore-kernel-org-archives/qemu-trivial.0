Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c092Y-0001vn-Ka
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2016 11:25:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57956)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c092U-0001rE-R4
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:25:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c092U-0007ty-25
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:25:50 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41385)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1c092P-0007qu-9G; Fri, 28 Oct 2016 11:25:45 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3564043730;
	Fri, 28 Oct 2016 18:25:43 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id D74A2B69;
	Fri, 28 Oct 2016 18:18:58 +0300 (MSK)
Received: (nullmailer pid 6083 invoked by uid 1000);
	Fri, 28 Oct 2016 15:18:56 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Fri, 28 Oct 2016 18:18:50 +0300
Message-Id: <e7709b499c55de12b73949921e0fc6d3d9d835cd.1477667878.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 19/23] qemu-ga: Remove stray 'q' in
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
X-List-Received-Date: Fri, 28 Oct 2016 15:25:52 -0000

From: Stefan Weil <sw@weilnetz.de>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Michael Roth <mdroth@linux.vnet.ibm.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-ga.texi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-ga.texi b/qemu-ga.texi
index 0e53bf6..4c7a8fd 100644
--- a/qemu-ga.texi
+++ b/qemu-ga.texi
@@ -30,7 +30,7 @@ set user's password
 @end itemize
 
 qemu-ga will read a system configuration file on startup (located at
-q@file{/etc/qemu/qemu-ga.conf} by default), then parse remaining
+@file{/etc/qemu/qemu-ga.conf} by default), then parse remaining
 configuration options on the command line. For the same key, the last
 option wins, but the lists accumulate (see below for configuration
 file format).
-- 
2.1.4


