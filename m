Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XIJJB-0001fu-Ub
	for mharc-qemu-trivial@gnu.org; Fri, 15 Aug 2014 11:20:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59285)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJJ5-0001ZK-0J
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:20:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJJ0-0007M7-Gs
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:20:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59486)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XIJIr-0007IZ-If; Fri, 15 Aug 2014 11:20:29 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 008DC4307A;
	Fri, 15 Aug 2014 19:20:29 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id A10DD6EE;
	Fri, 15 Aug 2014 19:15:15 +0400 (MSK)
Received: (nullmailer pid 17929 invoked by uid 1000);
	Fri, 15 Aug 2014 15:15:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 15 Aug 2014 19:15:04 +0400
Message-Id: <1408115711-17836-14-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 13/20] vmxnet3: don't use 'Yoda conditions'
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
X-List-Received-Date: Fri, 15 Aug 2014 15:20:47 -0000

From: Gonglei <arei.gonglei@huawei.com>

imitate nearby code about using '!value' or 'value == NULL'

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/net/vmxnet3.c |   16 ++++++++--------
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
1.7.10.4


