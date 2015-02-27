Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YRFhQ-0002l4-53
	for mharc-qemu-trivial@gnu.org; Fri, 27 Feb 2015 02:51:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48120)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YRFhH-0002Q1-RO
	for qemu-trivial@nongnu.org; Fri, 27 Feb 2015 02:51:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YRFh8-0007Vc-Nr
	for qemu-trivial@nongnu.org; Fri, 27 Feb 2015 02:50:55 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:23796)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YRFh7-0007V5-VS; Fri, 27 Feb 2015 02:50:46 -0500
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CJZ07462; Fri, 27 Feb 2015 15:50:37 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml428-hub.china.huawei.com
	(10.82.67.183) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 27 Feb 2015 15:50:30 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 27 Feb 2015 15:50:17 +0800
Message-ID: <1425023419-12244-8-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1425023419-12244-1-git-send-email-arei.gonglei@huawei.com>
References: <1425023419-12244-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Gonglei <arei.gonglei@huawei.com>, peter.huangpeng@huawei.com,
	armbru@redhat.com
Subject: [Qemu-trivial] [PATCH 7/9] milkymist.c: fix memory leak
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
X-List-Received-Date: Fri, 27 Feb 2015 07:51:01 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/lm32/milkymist.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/lm32/milkymist.c b/hw/lm32/milkymist.c
index 256c102..7f62261 100644
--- a/hw/lm32/milkymist.c
+++ b/hw/lm32/milkymist.c
@@ -155,6 +155,7 @@ milkymist_init(MachineState *machine)
                 bios_name);
         exit(1);
     }
+    g_free(bios_filename);
 
     milkymist_uart_create(0x60000000, irq[0]);
     milkymist_sysctl_create(0x60001000, irq[1], irq[2], irq[3],
-- 
1.7.12.4



