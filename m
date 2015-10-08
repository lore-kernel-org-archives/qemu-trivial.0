Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZkEcS-00077n-A8
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2015 13:04:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48967)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkEbK-0005NL-Rs
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 13:04:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkEal-0004iz-45
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 13:03:30 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52678)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZkEZn-0002rC-RD; Thu, 08 Oct 2015 13:01:56 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9007940A5E;
	Thu,  8 Oct 2015 20:01:49 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 3B9FCA8E;
	Thu,  8 Oct 2015 19:52:32 +0300 (MSK)
Received: (nullmailer pid 11996 invoked by uid 1000);
	Thu, 08 Oct 2015 16:52:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu,  8 Oct 2015 19:52:19 +0300
Message-Id: <f9b8e7f63acf9418238444aec654aba249a334ba.1444323071.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1444323071.git.mjt@msgid.tls.msk.ru>
References: <cover.1444323071.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Shraddha Barke <shraddha.6596@gmail.com>
Subject: [Qemu-trivial] [PULL 10/19] target-ppc: Remove unnecessary variable
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
X-List-Received-Date: Thu, 08 Oct 2015 17:04:37 -0000

From: Shraddha Barke <shraddha.6596@gmail.com>

Compress lines and remove the variable.

Signed-off-by: Shraddha Barke <shraddha.6596@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-ppc/kvm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target-ppc/kvm.c b/target-ppc/kvm.c
index e641680..f8ea783 100644
--- a/target-ppc/kvm.c
+++ b/target-ppc/kvm.c
@@ -1782,8 +1782,7 @@ uint32_t kvmppc_get_tbfreq(void)
 
     ns++;
 
-    retval = atoi(ns);
-    return retval;
+    return atoi(ns);
 }
 
 bool kvmppc_get_host_serial(char **value)
-- 
2.1.4


