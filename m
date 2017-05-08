Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7dCn-0003rq-Cq
	for mharc-qemu-trivial@gnu.org; Mon, 08 May 2017 03:35:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36124)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1d7dCk-0003qE-Tn
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 03:35:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1d7dCk-0005hh-4p
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 03:35:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37494)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1d7dCe-0005gu-VR; Mon, 08 May 2017 03:35:33 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A65287F4BB;
	Mon,  8 May 2017 07:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A65287F4BB
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=pbonzini@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com A65287F4BB
Received: from donizetti.redhat.com (ovpn-116-21.ams2.redhat.com
	[10.36.116.21])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v487ZTio030362; Mon, 8 May 2017 03:35:30 -0400
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>, qemu-trivial@nongnu.org
Date: Mon,  8 May 2017 09:35:29 +0200
Message-Id: <20170508073529.23449-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 08 May 2017 07:35:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] xtensa: use g_malloc/g_new/g_free
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 08 May 2017 07:35:39 -0000

Replace malloc/free with g_malloc/g_free to get a program exit on
out of memory.

Replace g_malloc with g_new when allocating the MemoryRegion to
get more type safety.

Reported by Coverity.

Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: qemu-trivial@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/xtensa/sim.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/xtensa/sim.c b/hw/xtensa/sim.c
index d2d1d3a6fd..97307728f7 100644
--- a/hw/xtensa/sim.c
+++ b/hw/xtensa/sim.c
@@ -41,13 +41,13 @@ static void xtensa_create_memory_regions(const XtensaMemory *memory,
                                          const char *name)
 {
     unsigned i;
-    char *num_name = malloc(strlen(name) + sizeof(i) * 3 + 1);
+    char *num_name = g_malloc(strlen(name) + sizeof(i) * 3 + 1);
 
     for (i = 0; i < memory->num; ++i) {
         MemoryRegion *m;
 
         sprintf(num_name, "%s%u", name, i);
-        m = g_malloc(sizeof(*m));
+        m = g_new(MemoryRegion, 1);
         memory_region_init_ram(m, NULL, num_name,
                                memory->location[i].size,
                                &error_fatal);
@@ -55,7 +55,7 @@ static void xtensa_create_memory_regions(const XtensaMemory *memory,
         memory_region_add_subregion(get_system_memory(),
                                     memory->location[i].addr, m);
     }
-    free(num_name);
+    g_free(num_name);
 }
 
 static uint64_t translate_phys_addr(void *opaque, uint64_t addr)
-- 
2.12.2


