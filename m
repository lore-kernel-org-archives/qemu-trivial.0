Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7DPJ-00023G-Gz
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jun 2015 21:53:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60348)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Z7DPG-0001wi-OQ
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 21:53:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Z7DPD-0003G4-Ci
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 21:53:46 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:28996)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Z7DPC-0003EB-O1; Mon, 22 Jun 2015 21:53:43 -0400
Received: from 172.24.2.119 (EHLO szxeml430-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CPV49947; Tue, 23 Jun 2015 09:53:36 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml430-hub.china.huawei.com
	(10.82.67.185) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 23 Jun 2015 09:53:10 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 23 Jun 2015 09:53:05 +0800
Message-ID: <1435024385-9084-3-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1435024385-9084-1-git-send-email-arei.gonglei@huawei.com>
References: <1435024385-9084-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Gonglei <arei.gonglei@huawei.com>,
	Gerd Hoffmann <kraxel@redhat.com>, mst@redhat.com
Subject: [Qemu-trivial] [PATCH 2/2] qdev: fix OVERFLOW_BEFORE_WIDEN
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
X-List-Received-Date: Tue, 23 Jun 2015 01:53:47 -0000

From: Gonglei <arei.gonglei@huawei.com>

Potentially overflowing expression "1 << prop->bitnr" with
type "int" (32 bits, signed) is evaluated using 32-bit arithmetic,
and then used in a context that expects an expression of type
"uint64_t" (64 bits, unsigned).

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/core/qdev-properties.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index a1606de..f78b335 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -130,7 +130,7 @@ PropertyInfo qdev_prop_bit = {
 static uint64_t qdev_get_prop_mask64(Property *prop)
 {
     assert(prop->info == &qdev_prop_bit);
-    return 0x1 << prop->bitnr;
+    return 0x1ull << prop->bitnr;
 }
 
 static void bit64_prop_set(DeviceState *dev, Property *props, bool val)
-- 
1.7.12.4



