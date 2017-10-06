Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cQR-0000Nh-5x
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:53:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41990)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQL-0000JJ-NH
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:53:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQK-0006De-Eu
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:52:57 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:34139)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQH-0006C3-DL; Fri, 06 Oct 2017 19:52:53 -0400
Received: by mail-qk0-x241.google.com with SMTP id b124so10272086qke.1;
	Fri, 06 Oct 2017 16:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=v0c03LlLVTDKRVqufvOxdy1EDAej4sFIE2Oul3BvDZY=;
	b=Ou8mQxrrgN5cojJbYRpPHGyLOuKczBaAlYIqXzSGIhC76OOigZXEdZGoOzGikWYmPq
	3dglgmCeimhhmY5YFnK9Xb8kl7/b0wWqBFwa5qAgNfupXZY3Rv/WGZoMWMS1i/6vHRRx
	rtSAN2fC4HJ7sLGLKngNIGTUu1ADlyjWplrmKnzOaro71IO7wsVJXEV19GkVkXV6syz1
	RnNEdrZV8IlFL7Fp6YEXqFdnh36cHxmj8T/pv4Ecv7Gy19VA2yJXG1tblZPudaUcpbMx
	w4GQuee2BDC8dm/+VmyB3nkxwbFa55d1wvLl/yr5fptU6DA5klFwa3nM/80ILzUvmRou
	stYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=v0c03LlLVTDKRVqufvOxdy1EDAej4sFIE2Oul3BvDZY=;
	b=fVPjyqnEjJ6rKdHg0VIbF65sH33sMtQeSIcK5WmxKdEHSiaO8BmdfuHr4cuFDFT+8B
	uU7PB3p3a2uehnqa6ORicVNJ0QyocoWaLkY8cY2R3XcIe39T4zPMTHnvybuif2WTAqT+
	Va4Cw7YU0l0mHoiz+rRau+uSlBkcYTwe7jWCAIcShCONbbHukSmlwyPFtcNSDz0NtzXS
	PUOQTA92rL1exIrA4aiNDFugXR7787V0Cf5y3bL7f7NnX4c0xaGEgy8OXxAhgfC75JWc
	QAor3XAUmSpwpimcwSPGrm33s/qz6YLNMC6/ruAqyv0KaCq4HTUMAdQKE98CKJRkd9Gz
	Twxg==
X-Gm-Message-State: AMCzsaXsoXVYqnIAXblUa6/9o48yyGpCf4DnEI5F5OIEKc/tWa0lv8nb
	70FGbNxk7gF5xn3vU8QliuI=
X-Google-Smtp-Source: AOwi7QDZcy43WjUTBdCfZNXWJfbcPdewDhbhQOEP00Jgx5i/sk0TW2r6dvlhzUeDXbP4CWhWVUx4og==
X-Received: by 10.55.122.130 with SMTP id v124mr698157qkc.209.1507333972818;
	Fri, 06 Oct 2017 16:52:52 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.52.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:52:52 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>,
	Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri,  6 Oct 2017 20:49:35 -0300
Message-Id: <20171006235023.11952-41-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH 40/88] hw/xen: use g_new() family of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:53:02 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: replaced g_new0() -> g_new() in xen_remap_bucket() (no bzero required),
      renamed X86 -> hw/xen and few other changes]
---
 hw/9pfs/xen-9p-backend.c   |  2 +-
 hw/display/xenfb.c         |  4 ++--
 hw/i386/xen/xen-hvm.c      | 10 +++++-----
 hw/i386/xen/xen-mapcache.c | 14 +++++++-------
 hw/xen/xen_pvdev.c         |  2 +-
 5 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/hw/9pfs/xen-9p-backend.c b/hw/9pfs/xen-9p-backend.c
index ee87f08926..d76fa0df8e 100644
--- a/hw/9pfs/xen-9p-backend.c
+++ b/hw/9pfs/xen-9p-backend.c
@@ -365,7 +365,7 @@ static int xen_9pfs_connect(struct XenDevice *xendev)
         return -1;
     }
 
-    xen_9pdev->rings = g_malloc0(xen_9pdev->num_rings * sizeof(Xen9pfsRing));
+    xen_9pdev->rings = g_new0(Xen9pfsRing, xen_9pdev->num_rings);
     for (i = 0; i < xen_9pdev->num_rings; i++) {
         char *str;
         int ring_order;
diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
index 8e2547ac05..5b5fa34131 100644
--- a/hw/display/xenfb.c
+++ b/hw/display/xenfb.c
@@ -479,8 +479,8 @@ static int xenfb_map_fb(struct XenFB *xenfb)
     n_fbdirs = xenfb->fbpages * mode / 8;
     n_fbdirs = DIV_ROUND_UP(n_fbdirs, XC_PAGE_SIZE);
 
-    pgmfns = g_malloc0(sizeof(xen_pfn_t) * n_fbdirs);
-    fbmfns = g_malloc0(sizeof(xen_pfn_t) * xenfb->fbpages);
+    pgmfns = g_new0(xen_pfn_t, n_fbdirs);
+    fbmfns = g_new0(xen_pfn_t, xenfb->fbpages);
 
     xenfb_copy_mfns(mode, n_fbdirs, pgmfns, pd);
     map = xenforeignmemory_map(xen_fmem, xenfb->c.xendev.dom,
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index d9ccd5d0d6..37a4e1cd6c 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -376,7 +376,7 @@ go_physmap:
 
     mr_name = memory_region_name(mr);
 
-    physmap = g_malloc(sizeof(XenPhysmap));
+    physmap = g_new(XenPhysmap, 1);
 
     physmap->start_addr = start_addr;
     physmap->size = size;
@@ -1188,7 +1188,7 @@ static void xen_read_physmap(XenIOState *state)
         return;
 
     for (i = 0; i < num; i++) {
-        physmap = g_malloc(sizeof (XenPhysmap));
+        physmap = g_new(XenPhysmap, 1);
         physmap->phys_offset = strtoull(entries[i], NULL, 16);
         snprintf(path, sizeof(path),
                 "/local/domain/0/device-model/%d/physmap/%s/start_addr",
@@ -1240,7 +1240,7 @@ void xen_hvm_init(PCMachineState *pcms, MemoryRegion **ram_memory)
     evtchn_port_t bufioreq_evtchn;
     XenIOState *state;
 
-    state = g_malloc0(sizeof (XenIOState));
+    state = g_new0(XenIOState, 1);
 
     state->xce_handle = xenevtchn_open(NULL, 0);
     if (state->xce_handle == NULL) {
@@ -1321,7 +1321,7 @@ void xen_hvm_init(PCMachineState *pcms, MemoryRegion **ram_memory)
     }
 
     /* Note: cpus is empty at this point in init */
-    state->cpu_by_vcpu_id = g_malloc0(max_cpus * sizeof(CPUState *));
+    state->cpu_by_vcpu_id = g_new0(CPUState *, max_cpus);
 
     rc = xen_set_ioreq_server_state(xen_domid, state->ioservid, true);
     if (rc < 0) {
@@ -1330,7 +1330,7 @@ void xen_hvm_init(PCMachineState *pcms, MemoryRegion **ram_memory)
         goto err;
     }
 
-    state->ioreq_local_port = g_malloc0(max_cpus * sizeof (evtchn_port_t));
+    state->ioreq_local_port = g_new0(evtchn_port_t, max_cpus);
 
     /* FIXME: how about if we overflow the page here? */
     for (i = 0; i < max_cpus; i++) {
diff --git a/hw/i386/xen/xen-mapcache.c b/hw/i386/xen/xen-mapcache.c
index baab93b614..93cba7fb83 100644
--- a/hw/i386/xen/xen-mapcache.c
+++ b/hw/i386/xen/xen-mapcache.c
@@ -109,7 +109,7 @@ void xen_map_cache_init(phys_offset_to_gaddr_t f, void *opaque)
     unsigned long size;
     struct rlimit rlimit_as;
 
-    mapcache = g_malloc0(sizeof (MapCache));
+    mapcache = g_new0(MapCache, 1);
 
     mapcache->phys_offset_to_gaddr = f;
     mapcache->opaque = opaque;
@@ -165,8 +165,7 @@ static void xen_remap_bucket(MapCacheEntry *entry,
 
     trace_xen_remap_bucket(address_index);
 
-    pfns = g_malloc0(nb_pfn * sizeof (xen_pfn_t));
-    err = g_malloc0(nb_pfn * sizeof (int));
+    err = g_new0(int, nb_pfn);
 
     if (entry->vaddr_base != NULL) {
         if (!(entry->flags & XEN_MAPCACHE_ENTRY_DUMMY)) {
@@ -180,6 +179,7 @@ static void xen_remap_bucket(MapCacheEntry *entry,
     g_free(entry->valid_mapping);
     entry->valid_mapping = NULL;
 
+    pfns = g_new(xen_pfn_t, nb_pfn);
     for (i = 0; i < nb_pfn; i++) {
         pfns[i] = (address_index << (MCACHE_BUCKET_SHIFT-XC_PAGE_SHIFT)) + i;
     }
@@ -212,8 +212,8 @@ static void xen_remap_bucket(MapCacheEntry *entry,
     entry->vaddr_base = vaddr_base;
     entry->paddr_index = address_index;
     entry->size = size;
-    entry->valid_mapping = (unsigned long *) g_malloc0(sizeof(unsigned long) *
-            BITS_TO_LONGS(size >> XC_PAGE_SHIFT));
+    entry->valid_mapping = g_new0(unsigned long,
+                                  BITS_TO_LONGS(size >> XC_PAGE_SHIFT));
 
     if (dummy) {
         entry->flags |= XEN_MAPCACHE_ENTRY_DUMMY;
@@ -300,7 +300,7 @@ tryagain:
         pentry = free_pentry;
     }
     if (!entry) {
-        entry = g_malloc0(sizeof (MapCacheEntry));
+        entry = g_new0(MapCacheEntry, 1);
         pentry->next = entry;
         xen_remap_bucket(entry, NULL, cache_size, address_index, dummy);
     } else if (!entry->lock) {
@@ -334,7 +334,7 @@ tryagain:
 
     mapcache->last_entry = entry;
     if (lock) {
-        MapCacheRev *reventry = g_malloc0(sizeof(MapCacheRev));
+        MapCacheRev *reventry = g_new0(MapCacheRev, 1);
         entry->lock++;
         reventry->dma = dma;
         reventry->vaddr_req = mapcache->last_entry->vaddr_base + address_offset;
diff --git a/hw/xen/xen_pvdev.c b/hw/xen/xen_pvdev.c
index aed783e844..8c1c14fb60 100644
--- a/hw/xen/xen_pvdev.c
+++ b/hw/xen/xen_pvdev.c
@@ -43,7 +43,7 @@ static void xenstore_cleanup_dir(char *dir)
 {
     struct xs_dirs *d;
 
-    d = g_malloc(sizeof(*d));
+    d = g_new(struct xs_dirs, 1);
     d->xs_dir = dir;
     QTAILQ_INSERT_TAIL(&xs_cleanup, d, list);
 }
-- 
2.14.2


