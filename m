Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YV1WE-0003le-DX
	for mharc-qemu-trivial@gnu.org; Mon, 09 Mar 2015 13:31:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36109)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YV1W1-0003Fj-LA
	for qemu-trivial@nongnu.org; Mon, 09 Mar 2015 13:30:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YV1Vu-0005nV-NS
	for qemu-trivial@nongnu.org; Mon, 09 Mar 2015 13:30:53 -0400
Received: from e06smtp10.uk.ibm.com ([195.75.94.106]:33093)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YV1Vu-0005n7-FI
	for qemu-trivial@nongnu.org; Mon, 09 Mar 2015 13:30:46 -0400
Received: from /spool/local
	by e06smtp10.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Mon, 9 Mar 2015 17:30:44 -0000
Received: from d06dlp01.portsmouth.uk.ibm.com (9.149.20.13)
	by e06smtp10.uk.ibm.com (192.168.101.140) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 9 Mar 2015 17:30:42 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com
	(d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id 6A4DF17D805A; 
	Mon,  9 Mar 2015 17:31:03 +0000 (GMT)
Received: from d06av02.portsmouth.uk.ibm.com (d06av02.portsmouth.uk.ibm.com
	[9.149.37.228])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t29HUgfg46203108; Mon, 9 Mar 2015 17:30:42 GMT
Received: from d06av02.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av02.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t29HUfBr025068; Mon, 9 Mar 2015 11:30:41 -0600
Received: from oc7435384737.ibm.com (sig-9-81-34-230.evts.uk.ibm.com
	[9.81.34.230])
	by d06av02.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t29HUF7q024224; Mon, 9 Mar 2015 11:30:40 -0600
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org
Date: Mon,  9 Mar 2015 18:30:12 +0100
Message-Id: <1425922215-20819-6-git-send-email-thuth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1425922215-20819-1-git-send-email-thuth@linux.vnet.ibm.com>
References: <1425922215-20819-1-git-send-email-thuth@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15030917-0041-0000-0000-00000382B257
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.106
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
	Thomas Huth <thuth@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH 5/8] ioport: Remove unused functions
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
X-List-Received-Date: Mon, 09 Mar 2015 17:30:59 -0000

The functions portio_list_destroy() and portio_list_del()
are not used anywhere, so let's remove them.

Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
---
 include/exec/ioport.h |    2 --
 ioport.c              |   24 ------------------------
 2 files changed, 0 insertions(+), 26 deletions(-)

diff --git a/include/exec/ioport.h b/include/exec/ioport.h
index 3bd6722..218c835 100644
--- a/include/exec/ioport.h
+++ b/include/exec/ioport.h
@@ -71,10 +71,8 @@ void portio_list_init(PortioList *piolist, Object *owner,
                       const struct MemoryRegionPortio *callbacks,
                       void *opaque, const char *name);
 void portio_list_set_flush_coalesced(PortioList *piolist);
-void portio_list_destroy(PortioList *piolist);
 void portio_list_add(PortioList *piolist,
                      struct MemoryRegion *address_space,
                      uint32_t addr);
-void portio_list_del(PortioList *piolist);
 
 #endif /* IOPORT_H */
diff --git a/ioport.c b/ioport.c
index 783a3ae..712b9e2 100644
--- a/ioport.c
+++ b/ioport.c
@@ -147,19 +147,6 @@ void portio_list_set_flush_coalesced(PortioList *piolist)
     piolist->flush_coalesced_mmio = true;
 }
 
-void portio_list_destroy(PortioList *piolist)
-{
-    MemoryRegionPortioList *mrpio;
-    unsigned i;
-
-    for (i = 0; i < piolist->nr; ++i) {
-        mrpio = container_of(piolist->regions[i], MemoryRegionPortioList, mr);
-        object_unparent(OBJECT(&mrpio->mr));
-        g_free(mrpio);
-    }
-    g_free(piolist->regions);
-}
-
 static const MemoryRegionPortio *find_portio(MemoryRegionPortioList *mrpio,
                                              uint64_t offset, unsigned size,
                                              bool write)
@@ -290,14 +277,3 @@ void portio_list_add(PortioList *piolist,
     /* There will always be an open sub-list.  */
     portio_list_add_1(piolist, pio_start, count, start, off_low, off_high);
 }
-
-void portio_list_del(PortioList *piolist)
-{
-    MemoryRegionPortioList *mrpio;
-    unsigned i;
-
-    for (i = 0; i < piolist->nr; ++i) {
-        mrpio = container_of(piolist->regions[i], MemoryRegionPortioList, mr);
-        memory_region_del_subregion(piolist->address_space, &mrpio->mr);
-    }
-}
-- 
1.7.1


