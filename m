Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T4Chx-00035X-AO
	for mharc-qemu-trivial@gnu.org; Wed, 22 Aug 2012 11:19:01 -0400
Received: from eggs.gnu.org ([208.118.235.92]:38413)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1T4Chv-0002zf-6E
	for qemu-trivial@nongnu.org; Wed, 22 Aug 2012 11:19:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1T4Chu-0000qE-Ac
	for qemu-trivial@nongnu.org; Wed, 22 Aug 2012 11:18:59 -0400
Received: from mono.eik.bme.hu ([152.66.115.2]:61120)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>)
	id 1T4Chb-0000ky-QN; Wed, 22 Aug 2012 11:18:39 -0400
Received: from localhost (localhost [127.0.0.1])
	by mono.eik.bme.hu (Postfix) with ESMTP id F417A283;
	Wed, 22 Aug 2012 17:18:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from mono.eik.bme.hu ([127.0.0.1])
	by localhost (mono.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7OUzKf9dQgr6; Wed, 22 Aug 2012 17:18:38 +0200 (CEST)
Received: by mono.eik.bme.hu (Postfix, from userid 432)
	id 99C7691F; Wed, 22 Aug 2012 17:18:38 +0200 (CEST)
Date: Wed, 22 Aug 2012 17:18:38 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
X-X-Sender: balaton@mono
To: qemu-devel@nongnu.org
Message-ID: <Pine.GSO.4.64.1208221717460.28960@mono>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: Solaris 10 (beta)
X-Received-From: 152.66.115.2
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH v2] Fix copy&paste typos in documentation
	comments
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
X-List-Received-Date: Wed, 22 Aug 2012 15:19:00 -0000


Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
  memory.h |   11 ++++++-----
  1 file changed, 6 insertions(+), 5 deletions(-)

  v2: indented memory_region_init_ram_ptr

diff --git a/memory.h b/memory.h
index bd1bbae..f6c8e32 100644
--- a/memory.h
+++ b/memory.h
@@ -252,9 +252,9 @@ void memory_region_init_ram(MemoryRegion *mr,
                              uint64_t size);

  /**
- * memory_region_init_ram:  Initialize RAM memory region from a user-provided.
- *                          pointer.  Accesses into the region will modify
- *                          memory directly.
+ * memory_region_init_ram_ptr:  Initialize RAM memory region from a
+ *                              user-provided pointer.  Accesses into the
+ *                              region will modify memory directly.
   *
   * @mr: the #MemoryRegion to be initialized.
   * @name: the name of the region.
@@ -581,7 +581,8 @@ void memory_region_add_subregion(MemoryRegion *mr,
                                   target_phys_addr_t offset,
                                   MemoryRegion *subregion);
  /**
- * memory_region_add_subregion: Add a subregion to a container, with overlap.
+ * memory_region_add_subregion_overlap: Add a subregion to a container
+ *                                      with overlap.
   *
   * Adds a subregion at @offset.  The subregion may overlap with other
   * subregions.  Conflicts are resolved by having a higher @priority hide a
@@ -743,7 +744,7 @@ void memory_listener_unregister(MemoryListener *listener);
  void memory_global_dirty_log_start(void);

  /**
- * memory_global_dirty_log_stop: begin dirty logging for all regions
+ * memory_global_dirty_log_stop: end dirty logging for all regions
   */
  void memory_global_dirty_log_stop(void);

-- 
1.7.10

