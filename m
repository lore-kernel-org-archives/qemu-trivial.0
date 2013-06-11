Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmGyA-000193-HX
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jun 2013 01:18:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56726)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UmGy6-00011p-VC
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 01:18:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UmGy5-0004zS-Sn
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 01:18:06 -0400
Received: from [222.73.24.84] (port=11837 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1UmGy5-0004wa-Iw; Tue, 11 Jun 2013 01:18:05 -0400
X-IronPort-AV: E=Sophos;i="4.87,842,1363104000"; 
   d="scan'208";a="7517753"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 11 Jun 2013 13:15:10 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r5B5I3aO030110;
	Tue, 11 Jun 2013 13:18:03 +0800
Received: from liguang.fnst.cn.fujitsu.com ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013061113161287-2018080 ;
	Tue, 11 Jun 2013 13:16:12 +0800 
From: liguang <lig.fnst@cn.fujitsu.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 11 Jun 2013 13:15:19 +0800
Message-Id: <1370927720-4348-4-git-send-email-lig.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1370927720-4348-1-git-send-email-lig.fnst@cn.fujitsu.com>
References: <1370927720-4348-1-git-send-email-lig.fnst@cn.fujitsu.com>
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/06/11 13:16:12,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/06/11 13:16:13,
	Serialize complete at 2013/06/11 13:16:13
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: liguang <lig.fnst@cn.fujitsu.com>
Subject: [Qemu-trivial] [PATCH 4/5] memory: use '=' instead of '|=' for
	memory_region_update_pending
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
X-List-Received-Date: Tue, 11 Jun 2013 05:18:09 -0000

because memory_region_update_pending is bool

Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
---
 memory.c |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/memory.c b/memory.c
index 5cb8f4a..d99eecd 100644
--- a/memory.c
+++ b/memory.c
@@ -1114,7 +1114,7 @@ void memory_region_set_log(MemoryRegion *mr, bool log, unsigned client)
 
     memory_region_transaction_begin();
     mr->dirty_log_mask = (mr->dirty_log_mask & ~mask) | (log * mask);
-    memory_region_update_pending |= mr->enabled;
+    memory_region_update_pending = mr->enabled;
     memory_region_transaction_commit();
 }
 
@@ -1168,7 +1168,7 @@ void memory_region_set_readonly(MemoryRegion *mr, bool readonly)
     if (mr->readonly != readonly) {
         memory_region_transaction_begin();
         mr->readonly = readonly;
-        memory_region_update_pending |= mr->enabled;
+        memory_region_update_pending = mr->enabled;
         memory_region_transaction_commit();
     }
 }
@@ -1178,7 +1178,7 @@ void memory_region_rom_device_set_romd(MemoryRegion *mr, bool romd_mode)
     if (mr->romd_mode != romd_mode) {
         memory_region_transaction_begin();
         mr->romd_mode = romd_mode;
-        memory_region_update_pending |= mr->enabled;
+        memory_region_update_pending = mr->enabled;
         memory_region_transaction_commit();
     }
 }
@@ -1321,7 +1321,7 @@ void memory_region_add_eventfd(MemoryRegion *mr,
     memmove(&mr->ioeventfds[i+1], &mr->ioeventfds[i],
             sizeof(*mr->ioeventfds) * (mr->ioeventfd_nb-1 - i));
     mr->ioeventfds[i] = mrfd;
-    memory_region_update_pending |= mr->enabled;
+    memory_region_update_pending = mr->enabled;
     memory_region_transaction_commit();
 }
 
@@ -1354,7 +1354,7 @@ void memory_region_del_eventfd(MemoryRegion *mr,
     --mr->ioeventfd_nb;
     mr->ioeventfds = g_realloc(mr->ioeventfds,
                                   sizeof(*mr->ioeventfds)*mr->ioeventfd_nb + 1);
-    memory_region_update_pending |= mr->enabled;
+    memory_region_update_pending = mr->enabled;
     memory_region_transaction_commit();
 }
 
@@ -1398,7 +1398,7 @@ static void memory_region_add_subregion_common(MemoryRegion *mr,
     }
     QTAILQ_INSERT_TAIL(&mr->subregions, subregion, subregions_link);
 done:
-    memory_region_update_pending |= mr->enabled && subregion->enabled;
+    memory_region_update_pending = mr->enabled && subregion->enabled;
     memory_region_transaction_commit();
 }
 
@@ -1429,7 +1429,7 @@ void memory_region_del_subregion(MemoryRegion *mr,
     assert(subregion->parent == mr);
     subregion->parent = NULL;
     QTAILQ_REMOVE(&mr->subregions, subregion, subregions_link);
-    memory_region_update_pending |= mr->enabled && subregion->enabled;
+    memory_region_update_pending = mr->enabled && subregion->enabled;
     memory_region_transaction_commit();
 }
 
@@ -1475,7 +1475,7 @@ void memory_region_set_alias_offset(MemoryRegion *mr, hwaddr offset)
 
     memory_region_transaction_begin();
     mr->alias_offset = offset;
-    memory_region_update_pending |= mr->enabled;
+    memory_region_update_pending = mr->enabled;
     memory_region_transaction_commit();
 }
 
@@ -1634,7 +1634,7 @@ void address_space_init(AddressSpace *as, MemoryRegion *root)
     QTAILQ_INSERT_TAIL(&address_spaces, as, address_spaces_link);
     as->name = NULL;
     address_space_init_dispatch(as);
-    memory_region_update_pending |= root->enabled;
+    memory_region_update_pending = root->enabled;
     memory_region_transaction_commit();
 }
 
-- 
1.7.2.5


