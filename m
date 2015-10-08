Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zkdcu-0003qq-87
	for mharc-qemu-trivial@gnu.org; Fri, 09 Oct 2015 15:46:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44988)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkEja-00030T-0Q
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 13:12:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkEjY-0004Bt-J6
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 13:12:01 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54526)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZkEjQ-0003v4-3q; Thu, 08 Oct 2015 13:11:52 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6440340A5F;
	Thu,  8 Oct 2015 20:11:49 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id CB3DFAA1;
	Thu,  8 Oct 2015 19:52:32 +0300 (MSK)
Received: (nullmailer pid 12009 invoked by uid 1000);
	Thu, 08 Oct 2015 16:52:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu,  8 Oct 2015 19:52:25 +0300
Message-Id: <778358d0a8f74a76488daea3c1b6fb327d8135b4.1444323071.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1444323071.git.mjt@msgid.tls.msk.ru>
References: <cover.1444323071.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 16/19] rocker: Use g_new() & friends where
	that makes obvious sense
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
X-List-Received-Date: Thu, 08 Oct 2015 17:12:07 -0000

From: Markus Armbruster <armbru@redhat.com>

g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
for two reasons.  One, it catches multiplication overflowing size_t.
Two, it returns T * rather than void *, which lets the compiler catch
more type errors.

This commit only touches allocations with size arguments of the form
sizeof(T).  Same Coccinelle semantic patchas in commit b45c03f.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Jiri Pirko <jiri@resnulli.us>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Jiri Pirko <jiri@mellanox.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/net/rocker/rocker.c        | 2 +-
 hw/net/rocker/rocker_desc.c   | 4 ++--
 hw/net/rocker/rocker_fp.c     | 2 +-
 hw/net/rocker/rocker_of_dpa.c | 9 ++++-----
 4 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/hw/net/rocker/rocker.c b/hw/net/rocker/rocker.c
index 7e7bda4..bb6fdc3 100644
--- a/hw/net/rocker/rocker.c
+++ b/hw/net/rocker/rocker.c
@@ -1362,7 +1362,7 @@ static int pci_rocker_init(PCIDevice *dev)
         r->fp_ports = ROCKER_FP_PORTS_MAX;
     }
 
-    r->rings = g_malloc(sizeof(DescRing *) * rocker_pci_ring_count(r));
+    r->rings = g_new(DescRing *, rocker_pci_ring_count(r));
     if (!r->rings) {
         goto err_rings_alloc;
     }
diff --git a/hw/net/rocker/rocker_desc.c b/hw/net/rocker/rocker_desc.c
index b5c0b4a..5e697b1 100644
--- a/hw/net/rocker/rocker_desc.c
+++ b/hw/net/rocker/rocker_desc.c
@@ -142,7 +142,7 @@ bool desc_ring_set_size(DescRing *ring, uint32_t size)
     ring->size = size;
     ring->head = ring->tail = 0;
 
-    ring->info = g_realloc(ring->info, size * sizeof(DescInfo));
+    ring->info = g_renew(DescInfo, ring->info, size);
     if (!ring->info) {
         return false;
     }
@@ -345,7 +345,7 @@ DescRing *desc_ring_alloc(Rocker *r, int index)
 {
     DescRing *ring;
 
-    ring = g_malloc0(sizeof(DescRing));
+    ring = g_new0(DescRing, 1);
     if (!ring) {
         return NULL;
     }
diff --git a/hw/net/rocker/rocker_fp.c b/hw/net/rocker/rocker_fp.c
index c693ae5..5906396 100644
--- a/hw/net/rocker/rocker_fp.c
+++ b/hw/net/rocker/rocker_fp.c
@@ -218,7 +218,7 @@ FpPort *fp_port_alloc(Rocker *r, char *sw_name,
                       MACAddr *start_mac, unsigned int index,
                       NICPeers *peers)
 {
-    FpPort *port = g_malloc0(sizeof(FpPort));
+    FpPort *port = g_new0(FpPort, 1);
 
     if (!port) {
         return NULL;
diff --git a/hw/net/rocker/rocker_of_dpa.c b/hw/net/rocker/rocker_of_dpa.c
index 874fb01..1ad2791 100644
--- a/hw/net/rocker/rocker_of_dpa.c
+++ b/hw/net/rocker/rocker_of_dpa.c
@@ -367,7 +367,7 @@ static OfDpaFlow *of_dpa_flow_alloc(uint64_t cookie)
     OfDpaFlow *flow;
     int64_t now = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) / 1000;
 
-    flow = g_malloc0(sizeof(OfDpaFlow));
+    flow = g_new0(OfDpaFlow, 1);
     if (!flow) {
         return NULL;
     }
@@ -811,7 +811,7 @@ static int of_dpa_group_get_stats(OfDpa *of_dpa, uint32_t id)
 
 static OfDpaGroup *of_dpa_group_alloc(uint32_t id)
 {
-    OfDpaGroup *group = g_malloc0(sizeof(OfDpaGroup));
+    OfDpaGroup *group = g_new0(OfDpaGroup, 1);
 
     if (!group) {
         return NULL;
@@ -2039,15 +2039,14 @@ static int of_dpa_cmd_add_l2_flood(OfDpa *of_dpa, OfDpaGroup *group,
     group->l2_flood.group_count =
         rocker_tlv_get_le16(group_tlvs[ROCKER_TLV_OF_DPA_GROUP_COUNT]);
 
-    tlvs = g_malloc0((group->l2_flood.group_count + 1) *
-                     sizeof(RockerTlv *));
+    tlvs = g_new0(RockerTlv *, group->l2_flood.group_count + 1);
     if (!tlvs) {
         return -ROCKER_ENOMEM;
     }
 
     g_free(group->l2_flood.group_ids);
     group->l2_flood.group_ids =
-        g_malloc0(group->l2_flood.group_count * sizeof(uint32_t));
+        g_new0(uint32_t, group->l2_flood.group_count);
     if (!group->l2_flood.group_ids) {
         err = -ROCKER_ENOMEM;
         goto err_out;
-- 
2.1.4


