Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XGpEz-0003WI-4D
	for mharc-qemu-trivial@gnu.org; Mon, 11 Aug 2014 09:02:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43723)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XGpEr-0003Gz-43
	for qemu-trivial@nongnu.org; Mon, 11 Aug 2014 09:02:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XGpEl-0003hi-HR
	for qemu-trivial@nongnu.org; Mon, 11 Aug 2014 09:02:13 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:25433)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XGpEZ-0003dN-HQ; Mon, 11 Aug 2014 09:01:56 -0400
Received: from 172.24.2.119 (EHLO szxeml408-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id BXZ04223; Mon, 11 Aug 2014 21:01:21 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml408-hub.china.huawei.com
	(10.82.67.95) with Microsoft SMTP Server id 14.3.158.1; Mon, 11 Aug 2014
	21:01:13 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 11 Aug 2014 21:00:58 +0800
Message-ID: <1407762058-11512-9-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1407762058-11512-1-git-send-email-arei.gonglei@huawei.com>
References: <1407762058-11512-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: peter.maydell@linaro.org, peter.crosthwaite@xilinx.com,
	weidong.huang@huawei.com, mst@redhat.com,
	qemu-trivial@nongnu.org, mjt@tls.msk.ru, marcel.a@redhat.com,
	luonengjun@huawei.com, armbru@redhat.com, lcapitulino@redhat.com,
	Gonglei <arei.gonglei@huawei.com>, av1474@comtv.ru,
	kraxel@redhat.com, stefanha@redhat.com, imammedo@redhat.com,
	dmitry@daynix.com, pbonzini@redhat.com,
	peter.huangpeng@huawei.com, eblake@redhat.com, afaerber@suse.de,
	dgilbert@redhat.com
Subject: [Qemu-trivial] [PATCH v5 8/8] vmxnet3: don't use 'Yoda conditions'
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
X-List-Received-Date: Mon, 11 Aug 2014 13:02:19 -0000

From: Gonglei <arei.gonglei@huawei.com>

imitate nearby code about using '!value' or 'value == NULL'

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 hw/net/vmxnet3.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index 77bea6f..588149d 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -1009,7 +1009,7 @@ vmxnet3_indicate_packet(VMXNET3State *s)
 
         vmxnet3_dump_rx_descr(&rxd);
 
-        if (0 != ready_rxcd_pa) {
+        if (ready_rxcd_pa != 0) {
             cpu_physical_memory_write(ready_rxcd_pa, &rxcd, sizeof(rxcd));
         }
 
@@ -1020,7 +1020,7 @@ vmxnet3_indicate_packet(VMXNET3State *s)
         rxcd.gen = new_rxcd_gen;
         rxcd.rqID = RXQ_IDX + rx_ridx * s->rxq_num;
 
-        if (0 == bytes_left) {
+        if (bytes_left == 0) {
             vmxnet3_rx_update_descr(s->rx_pkt, &rxcd);
         }
 
@@ -1038,16 +1038,16 @@ vmxnet3_indicate_packet(VMXNET3State *s)
         num_frags++;
     }
 
-    if (0 != ready_rxcd_pa) {
+    if (ready_rxcd_pa != 0) {
         rxcd.eop = 1;
-        rxcd.err = (0 != bytes_left);
+        rxcd.err = (bytes_left != 0);
         cpu_physical_memory_write(ready_rxcd_pa, &rxcd, sizeof(rxcd));
 
         /* Flush RX descriptor changes */
         smp_wmb();
     }
 
-    if (0 != new_rxcd_pa) {
+    if (new_rxcd_pa != 0) {
         vmxnet3_revert_rxc_descr(s, RXQ_IDX);
     }
 
@@ -1190,8 +1190,8 @@ static void vmxnet3_update_mcast_filters(VMXNET3State *s)
     s->mcast_list_len = list_bytes / sizeof(s->mcast_list[0]);
 
     s->mcast_list = g_realloc(s->mcast_list, list_bytes);
-    if (NULL == s->mcast_list) {
-        if (0 == s->mcast_list_len) {
+    if (!s->mcast_list) {
+        if (s->mcast_list_len == 0) {
             VMW_CFPRN("Current multicast list is empty");
         } else {
             VMW_ERPRN("Failed to allocate multicast list of %d elements",
@@ -1667,7 +1667,7 @@ vmxnet3_io_bar1_write(void *opaque,
          * memory address. We save it to temp variable and set the
          * shared address only after we get the high part
          */
-        if (0 == val) {
+        if (val == 0) {
             s->device_active = false;
         }
         s->temp_shared_guest_driver_memory = val;
-- 
1.7.12.4



