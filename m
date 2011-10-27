Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RJJwX-0002KY-Oz
	for mharc-qemu-trivial@gnu.org; Thu, 27 Oct 2011 03:00:01 -0400
Received: from eggs.gnu.org ([140.186.70.92]:37545)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wuzhy@linux.vnet.ibm.com>) id 1RJJwV-0002KM-6T
	for qemu-trivial@nongnu.org; Thu, 27 Oct 2011 03:00:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wuzhy@linux.vnet.ibm.com>) id 1RJJwU-0003Y9-6o
	for qemu-trivial@nongnu.org; Thu, 27 Oct 2011 02:59:59 -0400
Received: from e36.co.us.ibm.com ([32.97.110.154]:52139)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wuzhy@linux.vnet.ibm.com>) id 1RJJwT-0003Xu-Vu
	for qemu-trivial@nongnu.org; Thu, 27 Oct 2011 02:59:58 -0400
Received: from /spool/local
	by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <wuzhy@linux.vnet.ibm.com>;
	Thu, 27 Oct 2011 00:59:55 -0600
Received: from d03relay01.boulder.ibm.com ([9.17.195.226])
	by e36.co.us.ibm.com ([192.168.1.136]) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 27 Oct 2011 00:59:36 -0600
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay01.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	p9R6xZLF270784; Thu, 27 Oct 2011 00:59:35 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP
	id p9R6xZYg000940; Thu, 27 Oct 2011 00:59:35 -0600
Received: from us.ibm.com ([9.115.118.38])
	by d03av01.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with SMTP id
	p9R6xWcD031680; Thu, 27 Oct 2011 00:59:32 -0600
Received: by us.ibm.com (sSMTP sendmail emulation);
	Thu, 27 Oct 2011 14:58:57 +0800
From: Zhi Yong Wu <wuzhy@linux.vnet.ibm.com>
To: kwolf@redhat.com
Date: Thu, 27 Oct 2011 14:58:57 +0800
Message-Id: <1319698737-17270-1-git-send-email-wuzhy@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.6
x-cbid: 11102706-3352-0000-0000-000000680E51
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 32.97.110.154
Cc: qemu-trivial@nongnu.org, wuzhy@linux.vnet.ibm.com, qemu-devel@nongnu.org,
	stefanha@linux.vnet.ibm.com
Subject: [Qemu-trivial] [PATCH] qcow2: fix some errors and typo in qcow2.txt
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
X-List-Received-Date: Thu, 27 Oct 2011 07:00:00 -0000

Signed-off-by: Zhi Yong Wu <wuzhy@linux.vnet.ibm.com>
---
 docs/specs/qcow2.txt |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/specs/qcow2.txt b/docs/specs/qcow2.txt
index 8fc3cb2..e792953 100644
--- a/docs/specs/qcow2.txt
+++ b/docs/specs/qcow2.txt
@@ -108,8 +108,8 @@ as follows:
 
     refcount_block_entries = (cluster_size / sizeof(uint16_t))
 
-    refcount_block_index = (offset / cluster_size) % refcount_table_entries
-    refcount_table_index = (offset / cluster_size) / refcount_table_entries
+    refcount_block_index = (offset / cluster_size) % refcount_block_entries
+    refcount_table_index = (offset / cluster_size) / refcount_block_entries
 
     refcount_block = load_cluster(refcount_table[refcount_table_index]);
     return refcount_block[refcount_block_index];
@@ -211,7 +211,7 @@ switch the active L1 table, so that a different set of host clusters are
 exposed to the guest.
 
 When creating a snapshot, the L1 table should be copied and the refcount of all
-L2 tables and clusters reachable form this L1 table must be increased, so that
+L2 tables and clusters reachable from this L1 table must be increased, so that
 a write causes a COW and isn't visible in other snapshots.
 
 When loading a snapshot, bit 63 of all entries in the new active L1 table and
-- 
1.7.6


