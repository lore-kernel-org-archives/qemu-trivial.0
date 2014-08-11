Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XGkhj-0002DD-B8
	for mharc-qemu-trivial@gnu.org; Mon, 11 Aug 2014 04:11:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38689)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XGkhc-0001yD-EZ
	for qemu-trivial@nongnu.org; Mon, 11 Aug 2014 04:11:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XGkhW-00028I-RW
	for qemu-trivial@nongnu.org; Mon, 11 Aug 2014 04:11:36 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:60195)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XGkhF-00024i-TG; Mon, 11 Aug 2014 04:11:14 -0400
Received: from 172.24.2.119 (EHLO szxeml462-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CAC25430; Mon, 11 Aug 2014 16:11:06 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml462-hub.china.huawei.com
	(10.82.67.205) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 11 Aug 2014 16:10:56 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 11 Aug 2014 16:10:26 +0800
Message-ID: <1407744626-4984-3-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1407744626-4984-1-git-send-email-arei.gonglei@huawei.com>
References: <1407744626-4984-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Gonglei <arei.gonglei@huawei.com>, weidong.huang@huawei.com, mst@redhat.com
Subject: [Qemu-trivial] [PATCH 2/2] pci-host: update uncorresponding
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
X-List-Received-Date: Mon, 11 Aug 2014 08:11:41 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/pci-host/pam.c | 2 +-
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
1.7.12.4



