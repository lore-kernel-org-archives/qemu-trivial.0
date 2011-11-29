Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RVJRM-0005D2-Q0
	for mharc-qemu-trivial@gnu.org; Tue, 29 Nov 2011 03:53:24 -0500
Received: from eggs.gnu.org ([140.186.70.92]:57198)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RVJRG-0004vM-Am
	for qemu-trivial@nongnu.org; Tue, 29 Nov 2011 03:53:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RVJRA-0006av-Cg
	for qemu-trivial@nongnu.org; Tue, 29 Nov 2011 03:53:18 -0500
Received: from e23smtp06.au.ibm.com ([202.81.31.148]:49389)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RVJR9-0006ai-Gn
	for qemu-trivial@nongnu.org; Tue, 29 Nov 2011 03:53:12 -0500
Received: from /spool/local
	by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <wdongxu@linux.vnet.ibm.com>;
	Tue, 29 Nov 2011 08:50:54 +1000
Received: from d23relay04.au.ibm.com ([202.81.31.246])
	by e23smtp06.au.ibm.com ([202.81.31.212]) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 29 Nov 2011 08:50:53 +1000
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
	by d23relay04.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	pAT8nRa82740228; Tue, 29 Nov 2011 19:49:27 +1100
Received: from d23av04.au.ibm.com (loopback [127.0.0.1])
	by d23av04.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	pAT8qpwb026082; Tue, 29 Nov 2011 19:52:51 +1100
Received: from wdongxu-T410.cn.ibm.com (wdongxu-t410.cn.ibm.com
	[9.115.118.147] (may be forged))
	by d23av04.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	pAT8qls2025924; Tue, 29 Nov 2011 19:52:47 +1100
From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org
Date: Tue, 29 Nov 2011 16:52:38 +0800
Message-Id: <1322556759-19389-1-git-send-email-wdongxu@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.5.4
x-cbid: 11112822-7014-0000-0000-0000002B8C71
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 202.81.31.148
Cc: qemu-devel@nongnu.org, stefanha@linux.vnet.ibm.com
Subject: [Qemu-trivial] [PATCH 1/2 v2] fix typo: delete redundant semicolon
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
X-List-Received-Date: Tue, 29 Nov 2011 08:53:22 -0000

From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>

Double semicolons should be single.

Signed-off-by: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
---
 block/nbd.c                |    4 ++--
 cpus.c                     |    2 +-
 hw/9pfs/codir.c            |    6 +++---
 hw/9pfs/virtio-9p-handle.c |    2 +-
 hw/9pfs/virtio-9p.c        |    4 ++--
 hw/acpi.c                  |    2 +-
 hw/eepro100.c              |    2 +-
 hw/ide/via.c               |    2 +-
 hw/ppc.c                   |    2 +-
 hw/smc91c111.c             |    2 +-
 linux-user/syscall.c       |    2 +-
 net/tap-solaris.c          |    2 +-
 target-s390x/op_helper.c   |    4 ++--
 ui/vnc.c                   |    2 +-
 usb-redir.c                |    4 ++--
 15 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 882b2dc..95212da 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -189,7 +189,7 @@ static int nbd_read(BlockDriverState *bs, int64_t sector_num,
 
     request.type = NBD_CMD_READ;
     request.handle = (uint64_t)(intptr_t)bs;
-    request.from = sector_num * 512;;
+    request.from = sector_num * 512;
     request.len = nb_sectors * 512;
 
     if (nbd_send_request(s->sock, &request) == -1)
@@ -219,7 +219,7 @@ static int nbd_write(BlockDriverState *bs, int64_t sector_num,
 
     request.type = NBD_CMD_WRITE;
     request.handle = (uint64_t)(intptr_t)bs;
-    request.from = sector_num * 512;;
+    request.from = sector_num * 512;
     request.len = nb_sectors * 512;
 
     if (nbd_send_request(s->sock, &request) == -1)
diff --git a/cpus.c b/cpus.c
index 82530c4..a47783b 100644
--- a/cpus.c
+++ b/cpus.c
@@ -89,7 +89,7 @@ TimersState timers_state;
 int64_t cpu_get_icount(void)
 {
     int64_t icount;
-    CPUState *env = cpu_single_env;;
+    CPUState *env = cpu_single_env;
 
     icount = qemu_icount;
     if (env) {
diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
index 9b6d47d..3d18828 100644
--- a/hw/9pfs/codir.c
+++ b/hw/9pfs/codir.c
@@ -90,7 +90,7 @@ int v9fs_co_mkdir(V9fsPDU *pdu, V9fsFidState *fidp, V9fsString *name,
     V9fsState *s = pdu->s;
 
     if (v9fs_request_cancelled(pdu)) {
-        return -EINTR;;
+        return -EINTR;
     }
     cred_init(&cred);
     cred.fc_mode = mode;
@@ -124,7 +124,7 @@ int v9fs_co_opendir(V9fsPDU *pdu, V9fsFidState *fidp)
     V9fsState *s = pdu->s;
 
     if (v9fs_request_cancelled(pdu)) {
-        return -EINTR;;
+        return -EINTR;
     }
     v9fs_path_read_lock(s);
     v9fs_co_run_in_worker(
@@ -152,7 +152,7 @@ int v9fs_co_closedir(V9fsPDU *pdu, V9fsFidOpenState *fs)
     V9fsState *s = pdu->s;
 
     if (v9fs_request_cancelled(pdu)) {
-        return -EINTR;;
+        return -EINTR;
     }
     v9fs_co_run_in_worker(
         {
diff --git a/hw/9pfs/virtio-9p-handle.c b/hw/9pfs/virtio-9p-handle.c
index 7644ae5..f443da6 100644
--- a/hw/9pfs/virtio-9p-handle.c
+++ b/hw/9pfs/virtio-9p-handle.c
@@ -92,7 +92,7 @@ static inline int open_by_handle(int mountfd, const char *fh, int flags)
 static int handle_update_file_cred(int dirfd, const char *name, FsCred *credp)
 {
     int fd, ret;
-    fd = openat(dirfd, name, O_NONBLOCK | O_NOFOLLOW);;
+    fd = openat(dirfd, name, O_NONBLOCK | O_NOFOLLOW);
     if (fd < 0) {
         return fd;
     }
diff --git a/hw/9pfs/virtio-9p.c b/hw/9pfs/virtio-9p.c
index 1b2fc5d..150f9a2 100644
--- a/hw/9pfs/virtio-9p.c
+++ b/hw/9pfs/virtio-9p.c
@@ -1447,7 +1447,7 @@ static void v9fs_walk(void *opaque)
     int32_t fid, newfid;
     V9fsString *wnames = NULL;
     V9fsFidState *fidp;
-    V9fsFidState *newfidp = NULL;;
+    V9fsFidState *newfidp = NULL;
     V9fsPDU *pdu = opaque;
     V9fsState *s = pdu->s;
 
@@ -2353,7 +2353,7 @@ static void v9fs_link(void *opaque)
     V9fsState *s = pdu->s;
     int32_t dfid, oldfid;
     V9fsFidState *dfidp, *oldfidp;
-    V9fsString name;;
+    V9fsString name;
     size_t offset = 7;
     int err = 0;
 
diff --git a/hw/acpi.c b/hw/acpi.c
index 1cf35e1..9c35f2d 100644
--- a/hw/acpi.c
+++ b/hw/acpi.c
@@ -304,7 +304,7 @@ void acpi_pm_tmr_calc_overflow_time(ACPIPMTimer *tmr)
 
 uint32_t acpi_pm_tmr_get(ACPIPMTimer *tmr)
 {
-    uint32_t d = acpi_pm_tmr_get_clock();;
+    uint32_t d = acpi_pm_tmr_get_clock();
     return d & 0xffffff;
 }
 
diff --git a/hw/eepro100.c b/hw/eepro100.c
index 7d59e71..5eacb9a 100644
--- a/hw/eepro100.c
+++ b/hw/eepro100.c
@@ -258,7 +258,7 @@ typedef struct {
 
     /* Data in mem is always in the byte order of the controller (le).
      * It must be dword aligned to allow direct access to 32 bit values. */
-    uint8_t mem[PCI_MEM_SIZE] __attribute__((aligned(8)));;
+    uint8_t mem[PCI_MEM_SIZE] __attribute__((aligned(8)));
 
     /* Configuration bytes. */
     uint8_t configuration[22];
diff --git a/hw/ide/via.c b/hw/ide/via.c
index 098f150..a57134c 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -172,7 +172,7 @@ static void vt82c686b_init_ports(PCIIDEState *d) {
 /* via ide func */
 static int vt82c686b_ide_initfn(PCIDevice *dev)
 {
-    PCIIDEState *d = DO_UPCAST(PCIIDEState, dev, dev);;
+    PCIIDEState *d = DO_UPCAST(PCIIDEState, dev, dev);
     uint8_t *pci_conf = d->dev.config;
 
     pci_config_set_prog_interface(pci_conf, 0x8a); /* legacy ATA mode */
diff --git a/hw/ppc.c b/hw/ppc.c
index d29af0b..59882e2 100644
--- a/hw/ppc.c
+++ b/hw/ppc.c
@@ -1153,7 +1153,7 @@ void PPC_debug_write (void *opaque, uint32_t addr, uint32_t val)
 /* NVRAM helpers */
 static inline uint32_t nvram_read (nvram_t *nvram, uint32_t addr)
 {
-    return (*nvram->read_fn)(nvram->opaque, addr);;
+    return (*nvram->read_fn)(nvram->opaque, addr);
 }
 
 static inline void nvram_write (nvram_t *nvram, uint32_t addr, uint32_t val)
diff --git a/hw/smc91c111.c b/hw/smc91c111.c
index fc8c498..2af7ed0 100644
--- a/hw/smc91c111.c
+++ b/hw/smc91c111.c
@@ -429,7 +429,7 @@ static void smc91c111_writeb(void *opaque, target_phys_addr_t offset,
             smc91c111_update(s);
             return;
         }
-        break;;
+        break;
 
     case 3:
         switch (offset) {
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f227097..c84cc65 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -2377,7 +2377,7 @@ static inline abi_long host_to_target_semid_ds(abi_ulong target_addr,
     if (!lock_user_struct(VERIFY_WRITE, target_sd, target_addr, 0))
         return -TARGET_EFAULT;
     if (host_to_target_ipc_perm(target_addr,&(host_sd->sem_perm)))
-        return -TARGET_EFAULT;;
+        return -TARGET_EFAULT;
     target_sd->sem_nsems = tswapal(host_sd->sem_nsems);
     target_sd->sem_otime = tswapal(host_sd->sem_otime);
     target_sd->sem_ctime = tswapal(host_sd->sem_ctime);
diff --git a/net/tap-solaris.c b/net/tap-solaris.c
index c216d28..cf76463 100644
--- a/net/tap-solaris.c
+++ b/net/tap-solaris.c
@@ -65,7 +65,7 @@ static int tap_alloc(char *dev, size_t dev_size)
     static int arp_fd = 0;
     int ip_muxid, arp_muxid;
     struct strioctl  strioc_if, strioc_ppa;
-    int link_type = I_PLINK;;
+    int link_type = I_PLINK;
     struct lifreq ifr;
     char actual_name[32] = "";
 
diff --git a/target-s390x/op_helper.c b/target-s390x/op_helper.c
index 137bae7..b8a1a8a 100644
--- a/target-s390x/op_helper.c
+++ b/target-s390x/op_helper.c
@@ -1336,7 +1336,7 @@ void HELPER(meeb)(uint32_t f1, uint32_t val)
 uint32_t HELPER(cebr)(uint32_t f1, uint32_t f2)
 {
     float32 v1 = env->fregs[f1].l.upper;
-    float32 v2 = env->fregs[f2].l.upper;;
+    float32 v2 = env->fregs[f2].l.upper;
     HELPER_LOG("%s: comparing 0x%d from f%d and 0x%d\n", __FUNCTION__,
                v1, f1, v2);
     return set_cc_f32(v1, v2);
@@ -1346,7 +1346,7 @@ uint32_t HELPER(cebr)(uint32_t f1, uint32_t f2)
 uint32_t HELPER(cdbr)(uint32_t f1, uint32_t f2)
 {
     float64 v1 = env->fregs[f1].d;
-    float64 v2 = env->fregs[f2].d;;
+    float64 v2 = env->fregs[f2].d;
     HELPER_LOG("%s: comparing 0x%ld from f%d and 0x%ld\n", __FUNCTION__,
                v1, f1, v2);
     return set_cc_f64(v1, v2);
diff --git a/ui/vnc.c b/ui/vnc.c
index 40018f7..8de7079 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -2183,7 +2183,7 @@ static int protocol_client_auth(VncState *vs, uint8_t *data, size_t len)
 
 #ifdef CONFIG_VNC_TLS
        case VNC_AUTH_VENCRYPT:
-           VNC_DEBUG("Accept VeNCrypt auth\n");;
+           VNC_DEBUG("Accept VeNCrypt auth\n");
            start_auth_vencrypt(vs);
            break;
 #endif /* CONFIG_VNC_TLS */
diff --git a/usb-redir.c b/usb-redir.c
index c74b156..c31289f 100644
--- a/usb-redir.c
+++ b/usb-redir.c
@@ -538,9 +538,9 @@ static int usbredir_handle_data(USBDevice *udev, USBPacket *p)
     case USB_ENDPOINT_XFER_ISOC:
         return usbredir_handle_iso_data(dev, p, ep);
     case USB_ENDPOINT_XFER_BULK:
-        return usbredir_handle_bulk_data(dev, p, ep);;
+        return usbredir_handle_bulk_data(dev, p, ep);
     case USB_ENDPOINT_XFER_INT:
-        return usbredir_handle_interrupt_data(dev, p, ep);;
+        return usbredir_handle_interrupt_data(dev, p, ep);
     default:
         ERROR("handle_data ep %02X has unknown type %d\n", ep,
               dev->endpoint[EP2I(ep)].type);
-- 
1.7.5.4


