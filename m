Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTF6D-00071P-Ej
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 14:36:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43237)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTF66-0006lx-1T
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 14:36:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTF61-0001V9-4G
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 14:36:45 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:50041)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTF5u-0001SE-G7; Wed, 04 Mar 2015 14:36:34 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7BA35408E9;
	Wed,  4 Mar 2015 22:36:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 9A58996C;
	Wed,  4 Mar 2015 20:07:10 +0300 (MSK)
Received: (nullmailer pid 17544 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:47 +0300
Message-Id: <00258facdfa50f013282c4896e06ba34dd9bd06f.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 30/47] sparc/leon3.c: fix memory leak
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
X-List-Received-Date: Wed, 04 Mar 2015 19:36:50 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/sparc/leon3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index 751392e..e41ec0b 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -186,6 +186,7 @@ static void leon3_generic_hw_init(MachineState *machine)
         fprintf(stderr, "Can't read bios image %s\n", filename);
         exit(1);
     }
+    g_free(filename);
 
     /* Can directly load an application. */
     if (kernel_filename != NULL) {
-- 
2.1.4


