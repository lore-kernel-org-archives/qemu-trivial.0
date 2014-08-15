Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XIJSx-0000fm-3K
	for mharc-qemu-trivial@gnu.org; Fri, 15 Aug 2014 11:30:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33471)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJSq-0000aA-DM
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:30:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJSk-0002Oo-5f
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:30:48 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54421)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XIJSX-0002Bh-JY; Fri, 15 Aug 2014 11:30:29 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CDC7E43079;
	Fri, 15 Aug 2014 19:30:28 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 977D26E6;
	Fri, 15 Aug 2014 19:15:14 +0400 (MSK)
Received: (nullmailer pid 17912 invoked by uid 1000);
	Fri, 15 Aug 2014 15:15:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 15 Aug 2014 19:14:56 +0400
Message-Id: <1408115711-17836-6-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 05/20] pci-host: update uncorresponding
	description
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
X-List-Received-Date: Fri, 15 Aug 2014 15:30:53 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/pci-host/pam.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-host/pam.c b/hw/pci-host/pam.c
index 6abee4f..8272de3 100644
--- a/hw/pci-host/pam.c
+++ b/hw/pci-host/pam.c
@@ -1,5 +1,5 @@
 /*
- * QEMU i440FX/PIIX3 PCI Bridge Emulation
+ * QEMU Smram/pam logic implementation
  *
  * Copyright (c) 2006 Fabrice Bellard
  * Copyright (c) 2011 Isaku Yamahata <yamahata at valinux co jp>
-- 
1.7.10.4


