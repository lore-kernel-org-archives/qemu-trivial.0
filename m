Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V2z1X-0003yE-Cz
	for mharc-qemu-trivial@gnu.org; Sat, 27 Jul 2013 03:34:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40563)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V2z1S-0003ot-2f
	for qemu-trivial@nongnu.org; Sat, 27 Jul 2013 03:34:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V2z1Q-0006AZ-DY
	for qemu-trivial@nongnu.org; Sat, 27 Jul 2013 03:34:37 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54501)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V2z1M-00068v-K5; Sat, 27 Jul 2013 03:34:32 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id E667F42FBE;
	Sat, 27 Jul 2013 11:34:31 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 41A2A202887; Sat, 27 Jul 2013 11:33:28 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: anthony@codemonkey.ws
Date: Sat, 27 Jul 2013 11:33:23 +0400
Message-Id: <1374910406-15273-9-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1374910406-15273-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1374910406-15273-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL trivial 08/11] misc: Fix new typos in comments
	and strings
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
X-List-Received-Date: Sat, 27 Jul 2013 07:34:39 -0000

From: Stefan Weil <sw@weilnetz.de>

All these typos were found by codespell.

sould -> should
emperical -> empirical
intialization -> initialization
successfuly -> successfully
gaurantee -> guarantee

Fix also another error (before before) in the same context.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 block/vhdx.h               |    2 +-
 docs/rdma.txt              |    2 +-
 hw/virtio/virtio-balloon.c |    4 ++--
 hw/xen/xen_pt.c            |    3 ++-
 migration-rdma.c           |    4 ++--
 5 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/block/vhdx.h b/block/vhdx.h
index c3b64c6..fb687ed 100644
--- a/block/vhdx.h
+++ b/block/vhdx.h
@@ -168,7 +168,7 @@ typedef struct QEMU_PACKED VHDXLogEntryHeader {
                                            vhdx_header.  If not found in
                                            vhdx_header, it is invalid */
     uint64_t    flushed_file_offset;    /* see spec for full details - this
-                                           sould be vhdx file size in bytes */
+                                           should be vhdx file size in bytes */
     uint64_t    last_file_offset;       /* size in bytes that all allocated
                                            file structures fit into */
 } VHDXLogEntryHeader;
diff --git a/docs/rdma.txt b/docs/rdma.txt
index 45d1c8a..8d1e003 100644
--- a/docs/rdma.txt
+++ b/docs/rdma.txt
@@ -199,7 +199,7 @@ Version #1 requires that all server implementations of the protocol must
 check this field and register all requests found in the array of commands located
 in the data portion and return an equal number of results in the response.
 The maximum number of repeats is hard-coded to 4096. This is a conservative
-limit based on the maximum size of a SEND message along with emperical
+limit based on the maximum size of a SEND message along with empirical
 observations on the maximum future benefit of simultaneous page registrations.
 
 The 'type' field has 12 different command values:
diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 3fa72a9..337cfa5 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -53,8 +53,8 @@ static const char *balloon_stat_names[] = {
 /*
  * reset_stats - Mark all items in the stats array as unset
  *
- * This function needs to be called at device intialization and before
- * before updating to a set of newly-generated stats.  This will ensure that no
+ * This function needs to be called at device initialization and before
+ * updating to a set of newly-generated stats.  This will ensure that no
  * stale values stick around in case the guest reports a subset of the supported
  * statistics.
  */
diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index d7ee774..d15a729 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -756,7 +756,8 @@ static int xen_pt_initfn(PCIDevice *d)
 out:
     memory_listener_register(&s->memory_listener, &address_space_memory);
     memory_listener_register(&s->io_listener, &address_space_io);
-    XEN_PT_LOG(d, "Real physical device %02x:%02x.%d registered successfuly!\n",
+    XEN_PT_LOG(d,
+               "Real physical device %02x:%02x.%d registered successfully!\n",
                s->hostaddr.bus, s->hostaddr.slot, s->hostaddr.function);
 
     return 0;
diff --git a/migration-rdma.c b/migration-rdma.c
index d044830..4828738 100644
--- a/migration-rdma.c
+++ b/migration-rdma.c
@@ -2494,7 +2494,7 @@ static int qemu_rdma_close(void *opaque)
  *    @size == 0 :
  *        A 'hint' or 'advice' that means that we wish to speculatively
  *        and asynchronously unregister this memory. In this case, there is no
- *        gaurantee that the unregister will actually happen, for example,
+ *        guarantee that the unregister will actually happen, for example,
  *        if the memory is being actively transmitted. Additionally, the memory
  *        may be re-registered at any future time if a write within the same
  *        chunk was requested again, even if you attempted to unregister it
@@ -2570,7 +2570,7 @@ static size_t qemu_rdma_save_page(QEMUFile *f, void *opaque,
         qemu_rdma_signal_unregister(rdma, index, chunk, 0);
 
         /*
-         * TODO: Synchronous, gauranteed unregistration (should not occur during
+         * TODO: Synchronous, guaranteed unregistration (should not occur during
          * fast-path). Otherwise, unregisters will process on the next call to
          * qemu_rdma_drain_cq()
         if (size < 0) {
-- 
1.7.10.4


