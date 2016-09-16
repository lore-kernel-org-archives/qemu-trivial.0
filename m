Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bktfk-0005LA-FZ
	for mharc-qemu-trivial@gnu.org; Fri, 16 Sep 2016 09:59:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60304)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bktfa-000592-NX
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:59:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bktfJ-0000JK-5D
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:59:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45704)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1bktf2-0006iO-8Y; Fri, 16 Sep 2016 09:58:36 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 470EC65F5D;
	Fri, 16 Sep 2016 13:56:42 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-33.ams2.redhat.com [10.36.112.33])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8GDuHkD024127; Fri, 16 Sep 2016 09:56:40 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Date: Fri, 16 Sep 2016 15:56:02 +0200
Message-Id: <1474034177-17663-12-git-send-email-lvivier@redhat.com>
In-Reply-To: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 16 Sep 2016 13:56:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 11/26] pci,
 virtio: use exit(EXIT_SUCCESS) and exit(EXIT_FAILURE)
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
X-List-Received-Date: Fri, 16 Sep 2016 13:59:18 -0000

This patch is the result of coccinelle script
scripts/coccinelle/exit.cocci

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/9pfs/9p.c                    |  2 +-
 hw/block/virtio-blk.c           |  6 +++---
 hw/net/virtio-net.c             | 10 +++++-----
 hw/pci/pci.c                    | 12 ++++++------
 hw/scsi/vhost-scsi.c            |  4 ++--
 hw/scsi/virtio-scsi-dataplane.c |  2 +-
 hw/scsi/virtio-scsi.c           |  6 +++---
 hw/virtio/virtio.c              | 28 ++++++++++++++--------------
 8 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index dfe293d..6fe7a1c 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -3513,7 +3513,7 @@ static void __attribute__((__constructor__)) v9fs_set_fd_limit(void)
     struct rlimit rlim;
     if (getrlimit(RLIMIT_NOFILE, &rlim) < 0) {
         error_report("Failed to get the resource limit");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     open_fd_hw = rlim.rlim_cur - MIN(400, rlim.rlim_cur/3);
     open_fd_rc = rlim.rlim_cur/2;
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 3a6112f..8561265 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -478,20 +478,20 @@ void virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
 
     if (req->elem.out_num < 1 || req->elem.in_num < 1) {
         error_report("virtio-blk missing headers");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     if (unlikely(iov_to_buf(iov, out_num, 0, &req->out,
                             sizeof(req->out)) != sizeof(req->out))) {
         error_report("virtio-blk request outhdr too short");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     iov_discard_front(&iov, &out_num, sizeof(req->out));
 
     if (in_iov[in_num - 1].iov_len < sizeof(struct virtio_blk_inhdr)) {
         error_report("virtio-blk request inhdr too short");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     /* We always touch the last byte, so just see how big in_iov is.  */
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 01f1351..f596cc1 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -893,7 +893,7 @@ static void virtio_net_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
         if (iov_size(elem->in_sg, elem->in_num) < sizeof(status) ||
             iov_size(elem->out_sg, elem->out_num) < sizeof(ctrl)) {
             error_report("virtio-net ctrl missing headers");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         iov_cnt = elem->out_num;
@@ -1131,12 +1131,12 @@ static ssize_t virtio_net_receive(NetClientState *nc, const uint8_t *buf, size_t
                          i, n->mergeable_rx_bufs, offset, size,
                          n->guest_hdr_len, n->host_hdr_len,
                          vdev->guest_features);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         if (elem->in_num < 1) {
             error_report("virtio-net receive queue contains no in buffers");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         sg = elem->in_sg;
@@ -1239,14 +1239,14 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
         out_sg = elem->out_sg;
         if (out_num < 1) {
             error_report("virtio-net header not in first element");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         if (n->has_vnet_hdr) {
             if (iov_to_buf(out_sg, out_num, 0, &mhdr, n->guest_hdr_len) <
                 n->guest_hdr_len) {
                 error_report("virtio-net header incorrect");
-                exit(1);
+                exit(EXIT_FAILURE);
             }
             if (n->needs_vnet_hdr_swap) {
                 virtio_net_hdr_swap(vdev, (void *) &mhdr);
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 24fae16..04723d5 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -884,7 +884,7 @@ static uint16_t pci_req_id_cache_extract(PCIReqIDCache *cache)
     default:
         error_printf("Invalid PCI requester ID cache type: %d\n",
                      cache->type);
-        exit(1);
+        exit(EXIT_FAILURE);
         break;
     }
 
@@ -1085,7 +1085,7 @@ void pci_register_bar(PCIDevice *pci_dev, int region_num,
     if (size & (size-1)) {
         fprintf(stderr, "ERROR: PCI region size must be pow2 "
                     "type=0x%x, size=0x%"FMT_PCIBUS"\n", type, size);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     r = &pci_dev->io_regions[region_num];
@@ -1787,19 +1787,19 @@ PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
     int i;
 
     if (qemu_show_nic_models(nd->model, pci_nic_models)) {
-        exit(0);
+        exit(EXIT_SUCCESS);
     }
 
     i = qemu_find_nic_model(nd, pci_nic_models, default_model);
     if (i < 0) {
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     bus = pci_get_bus_devfn(&devfn, rootbus, devaddr);
     if (!bus) {
         error_report("Invalid PCI device address %s for device %s",
                      devaddr, pci_nic_names[i]);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     pci_dev = pci_create(bus, devfn, pci_nic_names[i]);
@@ -1810,7 +1810,7 @@ PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
     if (err) {
         error_report_err(err);
         object_unparent(OBJECT(dev));
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     return pci_dev;
diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
index 5b26946..1cbdc92 100644
--- a/hw/scsi/vhost-scsi.c
+++ b/hw/scsi/vhost-scsi.c
@@ -172,7 +172,7 @@ static void vhost_scsi_set_config(VirtIODevice *vdev,
     if ((uint32_t) virtio_ldl_p(vdev, &scsiconf->sense_size) != vs->sense_size ||
         (uint32_t) virtio_ldl_p(vdev, &scsiconf->cdb_size) != vs->cdb_size) {
         error_report("vhost-scsi does not support changing the sense data and CDB sizes");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 }
 
@@ -194,7 +194,7 @@ static void vhost_scsi_set_status(VirtIODevice *vdev, uint8_t val)
                          strerror(-ret));
 
             /* There is no userspace virtio-scsi fallback so exit */
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     } else {
         vhost_scsi_stop(s);
diff --git a/hw/scsi/virtio-scsi-dataplane.c b/hw/scsi/virtio-scsi-dataplane.c
index b173b94..18e8701 100644
--- a/hw/scsi/virtio-scsi-dataplane.c
+++ b/hw/scsi/virtio-scsi-dataplane.c
@@ -34,7 +34,7 @@ void virtio_scsi_set_iothread(VirtIOSCSI *s, IOThread *iothread)
     if (!k->set_guest_notifiers || !k->ioeventfd_started) {
         fprintf(stderr, "virtio-scsi: Failed to set iothread "
                    "(transport does not support notifiers)");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 }
 
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index e596b64..eaf4e18 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -84,7 +84,7 @@ static void virtio_scsi_complete_req(VirtIOSCSIReq *req)
 static void virtio_scsi_bad_req(void)
 {
     error_report("wrong size for virtio-scsi headers");
-    exit(1);
+    exit(EXIT_FAILURE);
 }
 
 static size_t qemu_sgl_concat(VirtIOSCSIReq *req, struct iovec *iov,
@@ -208,7 +208,7 @@ static void *virtio_scsi_load_request(QEMUFile *f, SCSIRequest *sreq)
     if (virtio_scsi_parse_req(req, sizeof(VirtIOSCSICmdReq) + vs->cdb_size,
                               sizeof(VirtIOSCSICmdResp) + vs->sense_size) < 0) {
         error_report("invalid SCSI request migration data");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     scsi_req_ref(sreq);
@@ -628,7 +628,7 @@ static void virtio_scsi_set_config(VirtIODevice *vdev,
     if ((uint32_t) virtio_ldl_p(vdev, &scsiconf->sense_size) >= 65536 ||
         (uint32_t) virtio_ldl_p(vdev, &scsiconf->cdb_size) >= 256) {
         error_report("bad data written to virtio-scsi configuration space");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     vs->sense_size = virtio_ldl_p(vdev, &scsiconf->sense_size);
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index fcf3358..8eb6ebb 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -339,7 +339,7 @@ static int virtqueue_num_heads(VirtQueue *vq, unsigned int idx)
     if (num_heads > vq->vring.num) {
         error_report("Guest moved used index from %u to %u",
                      idx, vq->shadow_avail_idx);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     /* On success, callers read a descriptor at vq->last_avail_idx.
      * Make sure descriptor read does not bypass avail index read. */
@@ -361,7 +361,7 @@ static unsigned int virtqueue_get_head(VirtQueue *vq, unsigned int idx)
     /* If their number is silly, that's a fatal mistake. */
     if (head >= vq->vring.num) {
         error_report("Guest says index %u is available", head);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     return head;
@@ -384,7 +384,7 @@ static unsigned virtqueue_read_next_desc(VirtIODevice *vdev, VRingDesc *desc,
 
     if (next >= max) {
         error_report("Desc next is %u", next);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     vring_desc_read(vdev, desc, desc_pa, next);
@@ -417,13 +417,13 @@ void virtqueue_get_avail_bytes(VirtQueue *vq, unsigned int *in_bytes,
         if (desc.flags & VRING_DESC_F_INDIRECT) {
             if (desc.len % sizeof(VRingDesc)) {
                 error_report("Invalid size for indirect buffer table");
-                exit(1);
+                exit(EXIT_FAILURE);
             }
 
             /* If we've got too many, that implies a descriptor loop. */
             if (num_bufs >= max) {
                 error_report("Looped descriptor");
-                exit(1);
+                exit(EXIT_FAILURE);
             }
 
             /* loop over the indirect descriptor table */
@@ -438,7 +438,7 @@ void virtqueue_get_avail_bytes(VirtQueue *vq, unsigned int *in_bytes,
             /* If we've got too many, that implies a descriptor loop. */
             if (++num_bufs > max) {
                 error_report("Looped descriptor");
-                exit(1);
+                exit(EXIT_FAILURE);
             }
 
             if (desc.flags & VRING_DESC_F_WRITE) {
@@ -483,7 +483,7 @@ static void virtqueue_map_desc(unsigned int *p_num_sg, hwaddr *addr, struct iove
 
     if (!sz) {
         error_report("virtio: zero sized buffers are not allowed");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     while (sz) {
@@ -491,7 +491,7 @@ static void virtqueue_map_desc(unsigned int *p_num_sg, hwaddr *addr, struct iove
 
         if (num_sg == max_num_sg) {
             error_report("virtio: too many write descriptors in indirect table");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         iov[num_sg].iov_base = cpu_physical_memory_map(pa, &len, is_write);
@@ -529,11 +529,11 @@ static void virtqueue_map_iovec(struct iovec *sg, hwaddr *addr,
         sg[i].iov_base = cpu_physical_memory_map(addr[i], &len, is_write);
         if (!sg[i].iov_base) {
             error_report("virtio: error trying to map MMIO memory");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         if (len != sg[i].iov_len) {
             error_report("virtio: unexpected memory split");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     }
 }
@@ -592,7 +592,7 @@ void *virtqueue_pop(VirtQueue *vq, size_t sz)
 
     if (vq->inuse >= vq->vring.num) {
         error_report("Virtqueue size exceeded");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     i = head = virtqueue_get_head(vq, vq->last_avail_idx++);
@@ -604,7 +604,7 @@ void *virtqueue_pop(VirtQueue *vq, size_t sz)
     if (desc.flags & VRING_DESC_F_INDIRECT) {
         if (desc.len % sizeof(VRingDesc)) {
             error_report("Invalid size for indirect buffer table");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         /* loop over the indirect descriptor table */
@@ -622,7 +622,7 @@ void *virtqueue_pop(VirtQueue *vq, size_t sz)
         } else {
             if (in_num) {
                 error_report("Incorrect order for descriptors");
-                exit(1);
+                exit(EXIT_FAILURE);
             }
             virtqueue_map_desc(&out_num, addr, iov,
                                VIRTQUEUE_MAX_SIZE, false, desc.addr, desc.len);
@@ -631,7 +631,7 @@ void *virtqueue_pop(VirtQueue *vq, size_t sz)
         /* If we've got too many, that implies a descriptor loop. */
         if ((in_num + out_num) > max) {
             error_report("Looped descriptor");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     } while ((i = virtqueue_read_next_desc(vdev, &desc, desc_pa, max)) != max);
 
-- 
2.5.5


