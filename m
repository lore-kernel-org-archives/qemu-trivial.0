Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UaLgO-0003bZ-2q
	for mharc-qemu-trivial@gnu.org; Thu, 09 May 2013 03:54:32 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50100)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <donald.open@gmail.com>) id 1UaLgK-0003W9-Pm
	for qemu-trivial@nongnu.org; Thu, 09 May 2013 03:54:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <donald.open@gmail.com>) id 1UaLgJ-0007BV-Lk
	for qemu-trivial@nongnu.org; Thu, 09 May 2013 03:54:28 -0400
Received: from mail-ob0-x234.google.com ([2607:f8b0:4003:c01::234]:55647)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <donald.open@gmail.com>)
	id 1UaLgJ-0007BN-6n; Thu, 09 May 2013 03:54:27 -0400
Received: by mail-ob0-f180.google.com with SMTP id xk17so470941obc.39
	for <multiple recipients>; Thu, 09 May 2013 00:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=D2ef8QAREib8HkJsjF9+b/0TCJz3/Vk1iXzjb8A1uy8=;
	b=ImSnLahDS4yx7h9sIUb3bVwJ2XrkOKaPmRmsFL1VCvqn4ebbDWI33LCAUC5mYAFXu2
	8YnyVVaFM+T5dgY3R91+OeV6UddafGNj6qlzycri4P2HwtmLagFxPqDAorVP7rQuorTl
	Y/hf0I9ruqmSeyHZyzNKMtpOoFMhlK87B7/8kHQdEQZ+wR4HXpGIOYqTUR42cOVO9joM
	fbM8xo9gaSklSux/R1f6+s5bM65p3e1zBZea0OIqs36qR3ZeZkpxVSKaqZyNml1O8AQ3
	tDio3bvkkynwdqj1SNZAqcnN8BpW4aughwaKQQDjFEWDO4Q/3pFemmOLfd/+Hw6ZFNMl
	GZsQ==
X-Received: by 10.60.131.143 with SMTP id om15mr3721518oeb.45.1368086066538;
	Thu, 09 May 2013 00:54:26 -0700 (PDT)
Received: from localhost.localdomain ([202.108.130.138])
	by mx.google.com with ESMTPSA id jz6sm2344394oeb.3.2013.05.09.00.54.18
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 09 May 2013 00:54:25 -0700 (PDT)
Sender: Dong Xu Wang <donald.open@gmail.com>
From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org
Date: Thu,  9 May 2013 15:53:50 +0800
Message-Id: <1368086030-3847-2-git-send-email-wdongxu@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1368086030-3847-1-git-send-email-wdongxu@linux.vnet.ibm.com>
References: <1368086030-3847-1-git-send-email-wdongxu@linux.vnet.ibm.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c01::234
Cc: hutao@cn.fujitsu.com, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH 2/2] remove double semicolons
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
X-List-Received-Date: Thu, 09 May 2013 07:54:30 -0000

Signed-off-by: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
---
 block/nbd.c                 | 2 +-
 fsdev/virtfs-proxy-helper.c | 4 ++--
 hw/9pfs/virtio-9p-local.c   | 2 +-
 hw/i386/pc_q35.c            | 2 +-
 hw/intc/imx_avic.c          | 2 +-
 hw/usb/host-linux.c         | 4 ++--
 qga/channel-win32.c         | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index fab114b..30e3b78 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -609,7 +609,7 @@ static int nbd_co_discard(BlockDriverState *bs, int64_t sector_num,
         return 0;
     }
     request.type = NBD_CMD_TRIM;
-    request.from = sector_num * 512;;
+    request.from = sector_num * 512;
     request.len = nb_sectors * 512;
 
     nbd_coroutine_start(s, &request);
diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
index 36f6616..713a7b2 100644
--- a/fsdev/virtfs-proxy-helper.c
+++ b/fsdev/virtfs-proxy-helper.c
@@ -248,7 +248,7 @@ static int send_fd(int sockfd, int fd)
 static int send_status(int sockfd, struct iovec *iovec, int status)
 {
     ProxyHeader header;
-    int retval, msg_size;;
+    int retval, msg_size;
 
     if (status < 0) {
         header.type = T_ERROR;
@@ -381,7 +381,7 @@ static int send_response(int sock, struct iovec *iovec, int size)
     proxy_marshal(iovec, 0, "dd", header.type, header.size);
     retval = socket_write(sock, iovec->iov_base, header.size + PROXY_HDR_SZ);
     if (retval < 0) {
-        return retval;;
+        return retval;
     }
     return 0;
 }
diff --git a/hw/9pfs/virtio-9p-local.c b/hw/9pfs/virtio-9p-local.c
index be898ec..6ece6f7 100644
--- a/hw/9pfs/virtio-9p-local.c
+++ b/hw/9pfs/virtio-9p-local.c
@@ -878,7 +878,7 @@ static int local_remove(FsContext *ctx, const char *path)
          * Now remove the name from parent directory
          * .virtfs_metadata directory
          */
-        err = remove(local_mapped_attr_path(ctx, path, buffer));;
+        err = remove(local_mapped_attr_path(ctx, path, buffer));
         if (err < 0 && errno != ENOENT) {
             /*
              * We didn't had the .virtfs_metadata file. May be file created
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 4160e2b..6825380 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -128,7 +128,7 @@ static void pc_q35_init(QEMUMachineInitArgs *args)
     q35_host->mch.ram_memory = ram_memory;
     q35_host->mch.pci_address_space = pci_memory;
     q35_host->mch.system_memory = get_system_memory();
-    q35_host->mch.address_space_io = get_system_io();;
+    q35_host->mch.address_space_io = get_system_io();
     q35_host->mch.below_4g_mem_size = below_4g_mem_size;
     q35_host->mch.above_4g_mem_size = above_4g_mem_size;
     /* pci */
diff --git a/hw/intc/imx_avic.c b/hw/intc/imx_avic.c
index 4e280b6..ff45dcd 100644
--- a/hw/intc/imx_avic.c
+++ b/hw/intc/imx_avic.c
@@ -370,7 +370,7 @@ static void imx_avic_reset(DeviceState *dev)
 
 static int imx_avic_init(SysBusDevice *dev)
 {
-    IMXAVICState *s = FROM_SYSBUS(IMXAVICState, dev);;
+    IMXAVICState *s = FROM_SYSBUS(IMXAVICState, dev);
 
     memory_region_init_io(&s->iomem, &imx_avic_ops, s, "imx_avic", 0x1000);
     sysbus_init_mmio(dev, &s->iomem);
diff --git a/hw/usb/host-linux.c b/hw/usb/host-linux.c
index 8994668..ca09a89 100644
--- a/hw/usb/host-linux.c
+++ b/hw/usb/host-linux.c
@@ -651,7 +651,7 @@ static void usb_host_handle_reset(USBDevice *dev)
 
     trace_usb_host_reset(s->bus_num, s->addr);
 
-    usb_host_do_reset(s);;
+    usb_host_do_reset(s);
 
     usb_host_claim_interfaces(s, 0);
     usb_linux_update_endp_table(s);
@@ -1429,7 +1429,7 @@ static void usb_host_exit_notifier(struct Notifier *n, void *data)
 
     usb_host_release_port(s);
     if (s->fd != -1) {
-        usb_host_do_reset(s);;
+        usb_host_do_reset(s);
     }
 }
 
diff --git a/qga/channel-win32.c b/qga/channel-win32.c
index 7ed98d7..8a303f3 100644
--- a/qga/channel-win32.c
+++ b/qga/channel-win32.c
@@ -268,7 +268,7 @@ static GIOStatus ga_channel_write(GAChannel *c, const char *buf, size_t size,
 
 GIOStatus ga_channel_write_all(GAChannel *c, const char *buf, size_t size)
 {
-    GIOStatus status = G_IO_STATUS_NORMAL;;
+    GIOStatus status = G_IO_STATUS_NORMAL;
     size_t count;
 
     while (size) {
-- 
1.7.11.7


