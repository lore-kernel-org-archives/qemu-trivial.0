Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZkLRt-0007gi-29
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2015 20:22:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkLRi-0007Tm-Mp
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 20:22:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkLRf-0006Bx-8m
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 20:22:02 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43506)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZkER0-0000tu-D9; Thu, 08 Oct 2015 12:52:51 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 93D1C40A5E;
	Thu,  8 Oct 2015 19:52:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 7BC61A88;
	Thu,  8 Oct 2015 19:52:31 +0300 (MSK)
Received: (nullmailer pid 11998 invoked by uid 1000);
	Thu, 08 Oct 2015 16:52:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu,  8 Oct 2015 19:52:20 +0300
Message-Id: <885bdc95b165dc2b63bdc756be4919e948b9d27b.1444323071.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1444323071.git.mjt@msgid.tls.msk.ru>
References: <cover.1444323071.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 11/19] MAINTAINERS: Add NSIS file for W32,
	W64 hosts
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
X-List-Received-Date: Fri, 09 Oct 2015 00:22:11 -0000

From: Stefan Weil <sw@weilnetz.de>

The NSIS installer configuration is maintained by me.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7603ea2..9bde832 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -275,6 +275,7 @@ L: qemu-devel@nongnu.org
 M: Stefan Weil <sw@weilnetz.de>
 S: Maintained
 F: *win32*
+F: qemu.nsi
 
 ARM Machines
 ------------
-- 
2.1.4


