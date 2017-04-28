Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d469e-0001uF-Mx
	for mharc-qemu-trivial@gnu.org; Fri, 28 Apr 2017 09:41:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44520)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <a.perevalov@samsung.com>) id 1d45Gz-00005m-G7
	for qemu-trivial@nongnu.org; Fri, 28 Apr 2017 08:45:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <a.perevalov@samsung.com>) id 1d45Gw-0004un-8v
	for qemu-trivial@nongnu.org; Fri, 28 Apr 2017 08:45:21 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:25972)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <a.perevalov@samsung.com>)
	id 1d45Gw-0004uY-0o
	for qemu-trivial@nongnu.org; Fri, 28 Apr 2017 08:45:18 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com
	(Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May 5
	2014)) with ESMTP id <0OP400DP4E3D4P10@mailout1.w1.samsung.com> for
	qemu-trivial@nongnu.org; Fri, 28 Apr 2017 13:45:13 +0100 (BST)
Received: from eusmges5.samsung.com (unknown [203.254.199.245])
	by	eucas1p1.samsung.com (KnoxPortal) with ESMTP
	id	20170428124513eucas1p1d2a543d4b60adcf1d97c695c8287bc31~5kGSlP9Mw0819108191eucas1p13;
	Fri, 28 Apr 2017 12:45:13 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207])
	by	eusmges5.samsung.com (EUCPMTA) with SMTP id 67.F9.25577.85933095;
	Fri, 28	Apr 2017 13:45:12 +0100 (BST)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180])
	by	eucas1p2.samsung.com (KnoxPortal) with ESMTP
	id	20170428124512eucas1p22b7206327414f53e82b8e4681ab6c236~5kGR1YMhV2294622946eucas1p2A;
	Fri, 28 Apr 2017 12:45:12 +0000 (GMT)
X-AuditID: cbfec7f5-f792f6d0000063e9-fb-590339585dc4
Received: from eusync4.samsung.com ( [203.254.199.214])
	by	eusmgms2.samsung.com (EUCPMTA) with SMTP id 07.1E.20206.37933095;
	Fri, 28	Apr 2017 13:45:39 +0100 (BST)
Received: from aperevalov-ubuntu.rnd.samsung.ru ([106.109.129.199])
	by	eusync4.samsung.com
	(Oracle Communications Messaging Server 7.0.5.31.0 64bit	(built May 5
	2014)) with ESMTPA id <0OP4004RBE36EMA0@eusync4.samsung.com>;	Fri,
	28 Apr 2017 13:45:12 +0100 (BST)
From: Alexey Perevalov <a.perevalov@samsung.com>
To: qemu-trivial@nongnu.org
Cc: a.perevalov@samsung.com
Date: Fri, 28 Apr 2017 15:44:52 +0300
Message-id: <1493383492-14187-2-git-send-email-a.perevalov@samsung.com>
X-Mailer: git-send-email 1.9.1
In-reply-to: <1493383492-14187-1-git-send-email-a.perevalov@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRmVeSWpSXmKPExsWy7djP87oRlsyRBj2/bCzm3j3PYrH2zFxW
	ByaPJ9c2M3n0bVnFGMAUxWWTkpqTWZZapG+XwJVx+9xMtoLzwRXnFh9ibmA8aNvFyMkhIWAi
	8eDqfSYIW0ziwr31bF2MXBxCAksZJa5d3ckO4XxmlNja1sQE07G1by4zRGIZUGLPTBYIp5tJ
	4uv9O0AtHBxsAgYS++6BrRARkJY4duk0E0iYGcg++1YUJCwsoC+x7NVDdhCbRUBV4sqG22A2
	r4C7xOUnH9khdslJnDw2mRXE5hTwkDjftoYJZJWEwA42ickPp7GBzJQQkJXYdIAZot5FouvJ
	PhYIW1ji1fEtUHNkJC5P7maB6G1nlOje2ckK4UxglDgz/S9Ulb3EqZtXwb5kFuCTmLRtOjPE
	Al6JjjYhiBIPiZ9n97BC2I4Sm1YfZYX4fTajxMltPxgnMMosYGRYxSiSWlqcm55abKpXnJhb
	XJqXrpecn7uJERhzp/8d/7qDcekxq0OMAhyMSjy8DB8YI4VYE8uKK3MPMUpwMCuJ8Hb+YYoU
	4k1JrKxKLcqPLyrNSS0+xCjNwaIkzst16lqEkEB6YklqdmpqQWoRTJaJg1OqgTHfNsfg7Tu/
	3Wz9n+ew317RdmNVzI+lGkzpT11rynU03ujUMTWdcl59/kjDFqmZt0Ua7ZoTQms+5WxpiZ0Q
	cNNgrnDlhW01fu6iG00Fb7y5+7NukZD2uaJf088251Qlek9M8gzY0hZ09NyTU9eOTvZKqdYK
	XXSxyLdLolZlqf73o2rb5Vu+syixFGckGmoxFxUnAgAQNok/tQIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrALMWRmVeSWpSXmKPExsVy+t/xa7rFlsyRBotuKFrMvXuexWLtmbms
	DkweT65tZvLo27KKMYApys0mIzUxJbVIITUvOT8lMy/dVik0xE3XQkkhLzE31VYpQtc3JEhJ
	oSwxpxTIMzJAAw7OAe7BSvp2CW4Zt8/NZCs4H1xxbvEh5gbGg7ZdjJwcEgImElv75jJD2GIS
	F+6tZ+ti5OIQEljCKLHi7zR2CKeXSeL1xlMsXYwcHGwCBhL77oE1iwhISxy7dJoJJMwMZJ99
	KwoSFhbQl1j26iE7iM0ioCpxZcNtMJtXwF3i8pOP7BC75CROHpvMCmJzCnhInG9bwwRiCwHV
	3D5+nXUCI+8CRoZVjCKppcW56bnFRnrFibnFpXnpesn5uZsYgaG37djPLTsYu94FH2IU4GBU
	4uGN+MQYKcSaWFZcmXuIUYKDWUmEt/MPU6QQb0piZVVqUX58UWlOavEhRlOgoyYyS4km5wPj
	Iq8k3tDE0NzS0MjYwsLcyEhJnHfqhyvhQgLpiSWp2ampBalFMH1MHJxSDYxrF4d9CP/PfLIz
	KKGkLTR2hl1UkFzU+ubJezND5lvNPDuzpfd3i9Bdc0u9P3YlCx8WR545r3Bu2uQrH0qKm5xl
	FIM7P68LOp9zqNHaZ7ZIu826jxe/7eK2vHTjLvdPpwnafhNWfLBxusZ27IvJftWKdWsr+9f2
	Myqfer0iU2yfKJtqiYHB8ylKLMUZiYZazEXFiQA98+hSUwIAAA==
X-MTR: 20000000000000000@CPGS
X-CMS-MailID: 20170428124512eucas1p22b7206327414f53e82b8e4681ab6c236
X-Msg-Generator: CA
X-Sender-IP: 182.198.249.180
X-Local-Sender: =?UTF-8?B?QWxleGV5IFBlcmV2YWxvdhtTUlItVmlydHVhbGl6YXRpb24g?=
	=?UTF-8?B?TGFiG+yCvOyEseyghOyekBtTZW5pb3IgRW5naW5lZXI=?=
X-Global-Sender: =?UTF-8?B?QWxleGV5IFBlcmV2YWxvdhtTUlItVmlydHVhbGl6YXRpb24g?=
	=?UTF-8?B?TGFiG1NhbXN1bmcgRWxlY3Ryb25pY3MbU2VuaW9yIEVuZ2luZWVy?=
X-Sender-Code: =?UTF-8?B?QzEwG0NJU0hRG0MxMEdEMDFHRDAxMDE1NA==?=
CMS-TYPE: 201P
X-HopCount: 7
X-CMS-RootMailID: 20170428124512eucas1p22b7206327414f53e82b8e4681ab6c236
X-RootMTR: 20170428124512eucas1p22b7206327414f53e82b8e4681ab6c236
References: <1493383492-14187-1-git-send-email-a.perevalov@samsung.com>
	<CGME20170428124512eucas1p22b7206327414f53e82b8e4681ab6c236@eucas1p2.samsung.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 210.118.77.11
X-Mailman-Approved-At: Fri, 28 Apr 2017 09:41:48 -0400
Subject: [Qemu-trivial] [PATCH V1] migration: Fixed code style
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
X-List-Received-Date: Fri, 28 Apr 2017 12:45:23 -0000

This patch fixes:
     - WARNING: line over 80 characters
     - ERROR: do not initialise globals to 0 or NULL
     - ERROR: spaces required around that '+' and other ariphmetic
     operations
     - ERROR: braces {} are necessary for all arms of this statement
     and braces of the functions
     - ERROR: do not use C99 // comments

Signed-off-by: Alexey Perevalov <a.perevalov@samsung.com>
---
 migration/exec.c         |  3 ++-
 migration/migration.c    |  6 +++---
 migration/postcopy-ram.c |  2 +-
 migration/ram.c          | 13 ++++++++-----
 migration/rdma.c         | 23 ++++++++++++++---------
 migration/savevm.c       |  9 ++++++---
 migration/vmstate.c      | 10 +++++-----
 7 files changed, 39 insertions(+), 27 deletions(-)

diff --git a/migration/exec.c b/migration/exec.c
index 9157721..48fb890 100644
--- a/migration/exec.c
+++ b/migration/exec.c
@@ -25,7 +25,8 @@
 #include "trace.h"
 
 
-void exec_start_outgoing_migration(MigrationState *s, const char *command, Error **errp)
+void exec_start_outgoing_migration(MigrationState *s, const char *command,
+                                   Error **errp)
 {
     QIOChannel *ioc;
     const char *argv[] = { "/bin/sh", "-c", command, NULL };
diff --git a/migration/migration.c b/migration/migration.c
index 353f272..c5a6494 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1472,8 +1472,8 @@ static void migrate_handle_rp_req_pages(MigrationState *ms, const char* rbname,
      * Since we currently insist on matching page sizes, just sanity check
      * we're being asked for whole host pages.
      */
-    if (start & (our_host_ps-1) ||
-       (len & (our_host_ps-1))) {
+    if (start & (our_host_ps - 1) ||
+       (len & (our_host_ps - 1))) {
         error_report("%s: Misaligned page request, start: " RAM_ADDR_FMT
                      " len: %zd", __func__, start, len);
         mark_source_rp_bad(ms);
@@ -2021,7 +2021,7 @@ static void *migration_thread(void *opaque)
         }
         if (qemu_file_rate_limit(s->to_dst_file)) {
             /* usleep expects microseconds */
-            g_usleep((initial_time + BUFFER_DELAY - current_time)*1000);
+            g_usleep((initial_time + BUFFER_DELAY - current_time) * 1000);
         }
     }
 
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 85fd8d7..40acf5e 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -166,7 +166,7 @@ bool postcopy_ram_supported_by_host(void)
                      strerror(errno));
         goto out;
     }
-    g_assert(((size_t)testarea & (pagesize-1)) == 0);
+    g_assert(((size_t)testarea & (pagesize - 1)) == 0);
 
     reg_struct.range.start = (uintptr_t)testarea;
     reg_struct.range.len = pagesize;
diff --git a/migration/ram.c b/migration/ram.c
index f48664e..10fd7c3 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -82,14 +82,16 @@ static uint8_t *xbzrle_decoded_buf;
 
 static void XBZRLE_cache_lock(void)
 {
-    if (migrate_use_xbzrle())
+    if (migrate_use_xbzrle()) {
         qemu_mutex_lock(&XBZRLE.lock);
+    }
 }
 
 static void XBZRLE_cache_unlock(void)
 {
-    if (migrate_use_xbzrle())
+    if (migrate_use_xbzrle()) {
         qemu_mutex_unlock(&XBZRLE.lock);
+    }
 }
 
 /**
@@ -1258,7 +1260,7 @@ int ram_save_queue_pages(const char *rbname, ram_addr_t start, ram_addr_t len)
         rs->last_req_rb = ramblock;
     }
     trace_ram_save_queue_pages(ramblock->idstr, start, len);
-    if (start+len > ramblock->used_length) {
+    if (start + len > ramblock->used_length) {
         error_report("%s request overrun start=" RAM_ADDR_FMT " len="
                      RAM_ADDR_FMT " blocklen=" RAM_ADDR_FMT,
                      __func__, start, len, ramblock->used_length);
@@ -2085,7 +2087,8 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
            iterations
         */
         if ((i & 63) == 0) {
-            uint64_t t1 = (qemu_clock_get_ns(QEMU_CLOCK_REALTIME) - t0) / 1000000;
+            uint64_t t1 =
+                (qemu_clock_get_ns(QEMU_CLOCK_REALTIME) - t0) / 1000000;
             if (t1 > MAX_WAIT) {
                 trace_ram_save_iterate_big_wait(t1, i);
                 break;
@@ -2230,7 +2233,7 @@ static int load_xbzrle(QEMUFile *f, ram_addr_t addr, void *host)
  */
 static inline RAMBlock *ram_block_from_stream(QEMUFile *f, int flags)
 {
-    static RAMBlock *block = NULL;
+    static RAMBlock *block;
     char id[256];
     uint8_t len;
 
diff --git a/migration/rdma.c b/migration/rdma.c
index fe0a4b5..9d89456 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -257,7 +257,8 @@ static uint64_t htonll(uint64_t v)
     return u.llv;
 }
 
-static uint64_t ntohll(uint64_t v) {
+static uint64_t ntohll(uint64_t v)
+{
     union { uint32_t lv[2]; uint64_t llv; } u;
     u.llv = v;
     return ((uint64_t)ntohl(u.lv[0]) << 32) | (uint64_t) ntohl(u.lv[1]);
@@ -586,7 +587,8 @@ static int rdma_add_block(RDMAContext *rdma, const char *block_name,
     block->is_ram_block = local->init ? false : true;
 
     if (rdma->blockmap) {
-        g_hash_table_insert(rdma->blockmap, (void *)(uintptr_t)block_offset, block);
+        g_hash_table_insert(rdma->blockmap, (void *)(uintptr_t)block_offset,
+                block);
     }
 
     trace_rdma_add_block(block_name, local->nb_blocks,
@@ -827,7 +829,7 @@ static int qemu_rdma_broken_ipv6_kernel(struct ibv_context *verbs, Error **errp)
      */
     if (!verbs) {
         int num_devices, x;
-        struct ibv_device ** dev_list = ibv_get_device_list(&num_devices);
+        struct ibv_device **dev_list = ibv_get_device_list(&num_devices);
         bool roce_found = false;
         bool ib_found = false;
 
@@ -1261,7 +1263,7 @@ const char *print_wrid(int wrid)
  * workload information or LRU information is available, do not attempt to use
  * this feature except for basic testing.
  */
-//#define RDMA_UNREGISTRATION_EXAMPLE
+/*#define RDMA_UNREGISTRATION_EXAMPLE*/
 
 /*
  * Perform a non-optimized memory unregistration after every transfer
@@ -3245,7 +3247,8 @@ static int qemu_rdma_registration_handle(QEMUFile *f, void *opaque)
                 reg_result = &results[count];
 
                 trace_qemu_rdma_registration_handle_register_loop(count,
-                         reg->current_index, reg->key.current_addr, reg->chunks);
+                         reg->current_index, reg->key.current_addr,
+                         reg->chunks);
 
                 if (reg->current_index >= rdma->local_ram_blocks.nb_blocks) {
                     error_report("rdma: 'register' bad block index %u (vs %d)",
@@ -3475,13 +3478,15 @@ static int qemu_rdma_registration_stop(QEMUFile *f, void *opaque,
         /*
          * The protocol uses two different sets of rkeys (mutually exclusive):
          * 1. One key to represent the virtual address of the entire ram block.
-         *    (dynamic chunk registration disabled - pin everything with one rkey.)
+         *    (dynamic chunk registration disabled - pin everything with one
+         *    rkey.)
          * 2. One to represent individual chunks within a ram block.
          *    (dynamic chunk registration enabled - pin individual chunks.)
          *
-         * Once the capability is successfully negotiated, the destination transmits
-         * the keys to use (or sends them later) including the virtual addresses
-         * and then propagates the remote ram block descriptions to his local copy.
+         * Once the capability is successfully negotiated, the destination
+         * transmits the keys to use (or sends them later) including the
+         * virtual addresses and then propagates the remote ram block
+         * descriptions to his local copy.
          */
 
         if (local->nb_blocks != nb_dest_blocks) {
diff --git a/migration/savevm.c b/migration/savevm.c
index 03ae1bd..72e509b 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -732,7 +732,8 @@ static int vmstate_load(QEMUFile *f, SaveStateEntry *se, int version_id)
     return vmstate_load_state(f, se->vmsd, se->opaque, version_id);
 }
 
-static void vmstate_save_old_style(QEMUFile *f, SaveStateEntry *se, QJSON *vmdesc)
+static void vmstate_save_old_style(QEMUFile *f, SaveStateEntry *se,
+        QJSON *vmdesc)
 {
     int64_t old_offset, size;
 
@@ -1324,14 +1325,16 @@ static SaveStateEntry *find_se(const char *idstr, int instance_id)
     QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
         if (!strcmp(se->idstr, idstr) &&
             (instance_id == se->instance_id ||
-             instance_id == se->alias_id))
+             instance_id == se->alias_id)) {
             return se;
+        }
         /* Migrating from an older version? */
         if (strstr(se->idstr, idstr) && se->compat) {
             if (!strcmp(se->compat->idstr, idstr) &&
                 (instance_id == se->compat->instance_id ||
-                 instance_id == se->alias_id))
+                 instance_id == se->alias_id)) {
                 return se;
+            }
         }
     }
     return NULL;
diff --git a/migration/vmstate.c b/migration/vmstate.c
index 7b4a607..d55b05e 100644
--- a/migration/vmstate.c
+++ b/migration/vmstate.c
@@ -21,13 +21,13 @@ static int vmstate_n_elems(void *opaque, VMStateField *field)
     if (field->flags & VMS_ARRAY) {
         n_elems = field->num;
     } else if (field->flags & VMS_VARRAY_INT32) {
-        n_elems = *(int32_t *)(opaque+field->num_offset);
+        n_elems = *(int32_t *)(opaque + field->num_offset);
     } else if (field->flags & VMS_VARRAY_UINT32) {
-        n_elems = *(uint32_t *)(opaque+field->num_offset);
+        n_elems = *(uint32_t *)(opaque + field->num_offset);
     } else if (field->flags & VMS_VARRAY_UINT16) {
-        n_elems = *(uint16_t *)(opaque+field->num_offset);
+        n_elems = *(uint16_t *)(opaque + field->num_offset);
     } else if (field->flags & VMS_VARRAY_UINT8) {
-        n_elems = *(uint8_t *)(opaque+field->num_offset);
+        n_elems = *(uint8_t *)(opaque + field->num_offset);
     }
 
     if (field->flags & VMS_MULTIPLY_ELEMENTS) {
@@ -43,7 +43,7 @@ static int vmstate_size(void *opaque, VMStateField *field)
     int size = field->size;
 
     if (field->flags & VMS_VBUFFER) {
-        size = *(int32_t *)(opaque+field->size_offset);
+        size = *(int32_t *)(opaque + field->size_offset);
         if (field->flags & VMS_MULTIPLY) {
             size *= field->size;
         }
-- 
1.9.1


