Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XGpF7-0003ka-JU
	for mharc-qemu-trivial@gnu.org; Mon, 11 Aug 2014 09:02:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43834)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XGpF0-0003YT-Kv
	for qemu-trivial@nongnu.org; Mon, 11 Aug 2014 09:02:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XGpEr-0003jy-84
	for qemu-trivial@nongnu.org; Mon, 11 Aug 2014 09:02:22 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:64915)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XGpEf-0003fo-NW; Mon, 11 Aug 2014 09:02:02 -0400
Received: from 172.24.2.119 (EHLO szxeml461-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CAC71201; Mon, 11 Aug 2014 21:01:16 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml461-hub.china.huawei.com
	(10.82.67.204) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 11 Aug 2014 21:01:07 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 11 Aug 2014 21:00:54 +0800
Message-ID: <1407762058-11512-5-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1407762058-11512-1-git-send-email-arei.gonglei@huawei.com>
References: <1407762058-11512-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: peter.maydell@linaro.org, peter.crosthwaite@xilinx.com,
	weidong.huang@huawei.com, mst@redhat.com,
	qemu-trivial@nongnu.org, mjt@tls.msk.ru, marcel.a@redhat.com,
	luonengjun@huawei.com, armbru@redhat.com, lcapitulino@redhat.com,
	Gonglei <arei.gonglei@huawei.com>, av1474@comtv.ru,
	kraxel@redhat.com, stefanha@redhat.com, imammedo@redhat.com,
	dmitry@daynix.com, pbonzini@redhat.com,
	peter.huangpeng@huawei.com, eblake@redhat.com, afaerber@suse.de,
	dgilbert@redhat.com
Subject: [Qemu-trivial] [PATCH v5 4/8] isa-bus: don't use 'Yoda conditions'
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
X-List-Received-Date: Mon, 11 Aug 2014 13:02:28 -0000

From: Gonglei <arei.gonglei@huawei.com>

imitate nearby code about using '!value' or 'value == NULL'

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 hw/isa/isa-bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index b28981b..cc85e53 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -50,7 +50,7 @@ ISABus *isa_bus_new(DeviceState *dev, MemoryRegion *address_space_io)
         fprintf(stderr, "Can't create a second ISA bus\n");
         return NULL;
     }
-    if (NULL == dev) {
+    if (!dev) {
         dev = qdev_create(NULL, "isabus-bridge");
         qdev_init_nofail(dev);
     }
-- 
1.7.12.4



