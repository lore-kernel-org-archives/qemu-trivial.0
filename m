Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UbSeE-0004JY-IA
	for mharc-qemu-trivial@gnu.org; Sun, 12 May 2013 05:32:54 -0400
Received: from eggs.gnu.org ([208.118.235.92]:57079)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UbSeB-0004DG-0U
	for qemu-trivial@nongnu.org; Sun, 12 May 2013 05:32:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UbSe9-0004ZF-30
	for qemu-trivial@nongnu.org; Sun, 12 May 2013 05:32:50 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33448)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UbSe3-0004XV-EZ; Sun, 12 May 2013 05:32:43 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 1709540759;
	Sun, 12 May 2013 13:32:42 +0400 (MSK)
Message-ID: <518F61B9.9050803@msgid.tls.msk.ru>
Date: Sun, 12 May 2013 13:32:41 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Anthony Liguori <aliguori@us.ibm.com>, qemu-devel <qemu-devel@nongnu.org>
X-Enigmail-Version: 1.6a1pre
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [GIT PULL for-1.5] Trivial patches for 2013-05-12
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
X-List-Received-Date: Sun, 12 May 2013 09:32:52 -0000

Here goes the official pull request for the trivial patch queue
for qemu 1.5 release.  I already sent a smaller pull request
when 1.5-rc0 has been tagged, but that one went unanswered.
So the next pull request includes patches previously sent.

This series contains just the trivial stuff, with the exception
of the patch by Ed Maste titled "m25p80.c: Sync Flash chip list
with Linux", which I verified and re-verified several times, and
which appears to be harmless and correct.

Please pull.

/mjt

The following changes since commit 38ebb396c955ceb2ef7e246248ceb7f8bfe1b7=
74:

  target-i386: ROR r8/r16 imm instruction fix (2013-05-10 19:59:54 +0200)

are available in the git repository at:

  git://git.corpit.ru/qemu.git trivial-patches-next

for you to fetch changes up to 98b2d199c109c9eabebb70965db0ae24f3f75a79:

  osdep.h: include sys/types.h for ssize_t definition (2013-05-12 13:25:5=
5 +0400)

----------------------------------------------------------------
Dong Xu Wang (2):
      clean unnecessary code: don't check g_strdup arg for NULL
      remove double semicolons

Ed Maste (2):
      bsd-user: OS-agnostic 64-bit SYSCTL types
      m25p80.c: Sync Flash chip list with Linux

Herv=C3=A9 Poussineau (1):
      audio: update documentation after removing --audio-card-list option

Igor Mitsyanko (1):
      osdep.h: include sys/types.h for ssize_t definition

Paolo Bonzini (1):
      docs: mention AddressSpaces in docs/memory.txt

 block/nbd.c                 |    2 +-
 bsd-user/syscall.c          |    7 ++++---
 docs/memory.txt             |   11 +++++++----
 fsdev/virtfs-proxy-helper.c |    4 ++--
 hw/9pfs/virtio-9p-local.c   |    2 +-
 hw/block/m25p80.c           |   31 ++++++++++++++++++++++++++-----
 hw/i386/pc_q35.c            |    2 +-
 hw/intc/imx_avic.c          |    2 +-
 hw/usb/host-linux.c         |    4 ++--
 include/qemu/osdep.h        |    2 +-
 qemu-doc.texi               |    4 ----
 qga/channel-win32.c         |    2 +-
 util/uri.c                  |    2 +-
 vl.c                        |    2 +-
 14 files changed, 49 insertions(+), 28 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index fab114b..30e3b78 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -609,7 +609,7 @@ static int nbd_co_discard(BlockDriverState *bs, int64=
_t sector_num,
         return 0;
     }
     request.type =3D NBD_CMD_TRIM;
-    request.from =3D sector_num * 512;;
+    request.from =3D sector_num * 512;
     request.len =3D nb_sectors * 512;

     nbd_coroutine_start(s, &request);
diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index 69e3466..a4d1583 100644
--- a/bsd-user/syscall.c
+++ b/bsd-user/syscall.c
@@ -211,10 +211,11 @@ static int sysctl_oldcvt(void *holdp, size_t holdle=
n, uint32_t kind)
         *(uint64_t *)holdp =3D tswap64(*(unsigned long *)holdp);
         break;
 #endif
-#if !defined(__FreeBSD_version) || __FreeBSD_version < 900031
-    case CTLTYPE_QUAD:
-#else
+#ifdef CTLTYPE_U64
+    case CTLTYPE_S64:
     case CTLTYPE_U64:
+#else
+    case CTLTYPE_QUAD:
 #endif
         *(uint64_t *)holdp =3D tswap64(*(uint64_t *)holdp);
         break;
diff --git a/docs/memory.txt b/docs/memory.txt
index 5bbee8e..feb9fe9 100644
--- a/docs/memory.txt
+++ b/docs/memory.txt
@@ -15,10 +15,13 @@ The memory model provides support for
  - setting up coalesced memory for kvm
  - setting up ioeventfd regions for kvm

-Memory is modelled as a tree (really acyclic graph) of MemoryRegion obje=
cts.
-The root of the tree is memory as seen from the CPU's viewpoint (the sys=
tem
-bus).  Nodes in the tree represent other buses, memory controllers, and
-memory regions that have been rerouted.  Leaves are RAM and MMIO regions=
.
+Memory is modelled as an acyclic graph of MemoryRegion objects.  Sinks
+(leaves) are RAM and MMIO regions, while other nodes represent
+buses, memory controllers, and memory regions that have been rerouted.
+
+In addition to MemoryRegion objects, the memory API provides AddressSpac=
e
+objects for every root and possibly for intermediate MemoryRegions too.
+These represent memory as seen from the CPU or a device's viewpoint.

 Types of regions
 ----------------
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
         header.type =3D T_ERROR;
@@ -381,7 +381,7 @@ static int send_response(int sock, struct iovec *iove=
c, int size)
     proxy_marshal(iovec, 0, "dd", header.type, header.size);
     retval =3D socket_write(sock, iovec->iov_base, header.size + PROXY_H=
DR_SZ);
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
@@ -878,7 +878,7 @@ static int local_remove(FsContext *ctx, const char *p=
ath)
          * Now remove the name from parent directory
          * .virtfs_metadata directory
          */
-        err =3D remove(local_mapped_attr_path(ctx, path, buffer));;
+        err =3D remove(local_mapped_attr_path(ctx, path, buffer));
         if (err < 0 && errno !=3D ENOENT) {
             /*
              * We didn't had the .virtfs_metadata file. May be file crea=
ted
diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index b3ca19a..759c84d 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -91,18 +91,27 @@ static const FlashPartInfo known_devices[] =3D {
     { INFO("at26df161a",  0x1f4601,      0,  64 << 10,  32, ER_4K) },
     { INFO("at26df321",   0x1f4700,      0,  64 << 10,  64, ER_4K) },

+    { INFO("at45db081d",  0x1f2500,      0,  64 << 10,  16, ER_4K) },
+
     /* EON -- en25xxx */
     { INFO("en25f32",     0x1c3116,      0,  64 << 10,  64, ER_4K) },
     { INFO("en25p32",     0x1c2016,      0,  64 << 10,  64, 0) },
     { INFO("en25q32b",    0x1c3016,      0,  64 << 10,  64, 0) },
     { INFO("en25p64",     0x1c2017,      0,  64 << 10, 128, 0) },
+    { INFO("en25q64",     0x1c3017,      0,  64 << 10, 128, ER_4K) },
+
+    /* GigaDevice */
+    { INFO("gd25q32",     0xc84016,      0,  64 << 10,  64, ER_4K) },
+    { INFO("gd25q64",     0xc84017,      0,  64 << 10, 128, ER_4K) },

     /* Intel/Numonyx -- xxxs33b */
     { INFO("160s33b",     0x898911,      0,  64 << 10,  32, 0) },
     { INFO("320s33b",     0x898912,      0,  64 << 10,  64, 0) },
     { INFO("640s33b",     0x898913,      0,  64 << 10, 128, 0) },
+    { INFO("n25q064",     0x20ba17,      0,  64 << 10, 128, 0) },

     /* Macronix */
+    { INFO("mx25l2005a",  0xc22012,      0,  64 << 10,   4, ER_4K) },
     { INFO("mx25l4005a",  0xc22013,      0,  64 << 10,   8, ER_4K) },
     { INFO("mx25l8005",   0xc22014,      0,  64 << 10,  16, 0) },
     { INFO("mx25l1606e",  0xc22015,      0,  64 << 10,  32, ER_4K) },
@@ -113,15 +122,16 @@ static const FlashPartInfo known_devices[] =3D {
     { INFO("mx25l25635e", 0xc22019,      0,  64 << 10, 512, 0) },
     { INFO("mx25l25655e", 0xc22619,      0,  64 << 10, 512, 0) },

+    /* Micron */
+    { INFO("n25q128a11",  0x20bb18,      0,  64 << 10, 256, 0) },
+    { INFO("n25q128a13",  0x20ba18,      0,  64 << 10, 256, 0) },
+    { INFO("n25q256a",    0x20ba19,      0,  64 << 10, 512, ER_4K) },
+
     /* Spansion -- single (large) sector size only, at least
      * for the chips listed here (without boot sectors).
      */
-    { INFO("s25sl004a",   0x010212,      0,  64 << 10,   8, 0) },
-    { INFO("s25sl008a",   0x010213,      0,  64 << 10,  16, 0) },
-    { INFO("s25sl016a",   0x010214,      0,  64 << 10,  32, 0) },
-    { INFO("s25sl032a",   0x010215,      0,  64 << 10,  64, 0) },
     { INFO("s25sl032p",   0x010215, 0x4d00,  64 << 10,  64, ER_4K) },
-    { INFO("s25sl064a",   0x010216,      0,  64 << 10, 128, 0) },
+    { INFO("s25sl064p",   0x010216, 0x4d00,  64 << 10, 128, ER_4K) },
     { INFO("s25fl256s0",  0x010219, 0x4d00, 256 << 10, 128, 0) },
     { INFO("s25fl256s1",  0x010219, 0x4d01,  64 << 10, 512, 0) },
     { INFO("s25fl512s",   0x010220, 0x4d00, 256 << 10, 256, 0) },
@@ -130,6 +140,11 @@ static const FlashPartInfo known_devices[] =3D {
     { INFO("s25sl12801",  0x012018, 0x0301,  64 << 10, 256, 0) },
     { INFO("s25fl129p0",  0x012018, 0x4d00, 256 << 10,  64, 0) },
     { INFO("s25fl129p1",  0x012018, 0x4d01,  64 << 10, 256, 0) },
+    { INFO("s25sl004a",   0x010212,      0,  64 << 10,   8, 0) },
+    { INFO("s25sl008a",   0x010213,      0,  64 << 10,  16, 0) },
+    { INFO("s25sl016a",   0x010214,      0,  64 << 10,  32, 0) },
+    { INFO("s25sl032a",   0x010215,      0,  64 << 10,  64, 0) },
+    { INFO("s25sl064a",   0x010216,      0,  64 << 10, 128, 0) },
     { INFO("s25fl016k",   0xef4015,      0,  64 << 10,  32, ER_4K | ER_3=
2K) },
     { INFO("s25fl064k",   0xef4017,      0,  64 << 10, 128, ER_4K | ER_3=
2K) },

@@ -153,11 +168,13 @@ static const FlashPartInfo known_devices[] =3D {
     { INFO("m25p32",      0x202016,      0,  64 << 10,  64, 0) },
     { INFO("m25p64",      0x202017,      0,  64 << 10, 128, 0) },
     { INFO("m25p128",     0x202018,      0, 256 << 10,  64, 0) },
+    { INFO("n25q032",     0x20ba16,      0,  64 << 10,  64, 0) },

     { INFO("m45pe10",     0x204011,      0,  64 << 10,   2, 0) },
     { INFO("m45pe80",     0x204014,      0,  64 << 10,  16, 0) },
     { INFO("m45pe16",     0x204015,      0,  64 << 10,  32, 0) },

+    { INFO("m25pe20",     0x208012,      0,  64 << 10,   4, 0) },
     { INFO("m25pe80",     0x208014,      0,  64 << 10,  16, 0) },
     { INFO("m25pe16",     0x208015,      0,  64 << 10,  32, ER_4K) },

@@ -174,8 +191,12 @@ static const FlashPartInfo known_devices[] =3D {
     { INFO("w25x16",      0xef3015,      0,  64 << 10,  32, ER_4K) },
     { INFO("w25x32",      0xef3016,      0,  64 << 10,  64, ER_4K) },
     { INFO("w25q32",      0xef4016,      0,  64 << 10,  64, ER_4K) },
+    { INFO("w25q32dw",    0xef6016,      0,  64 << 10,  64, ER_4K) },
     { INFO("w25x64",      0xef3017,      0,  64 << 10, 128, ER_4K) },
     { INFO("w25q64",      0xef4017,      0,  64 << 10, 128, ER_4K) },
+    { INFO("w25q80",      0xef5014,      0,  64 << 10,  16, ER_4K) },
+    { INFO("w25q80bl",    0xef4014,      0,  64 << 10,  16, ER_4K) },
+    { INFO("w25q256",     0xef4019,      0,  64 << 10, 512, ER_4K) },

     /* Numonyx -- n25q128 */
     { INFO("n25q128",      0x20ba18,      0,  64 << 10, 256, 0) },
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 4160e2b..6825380 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -128,7 +128,7 @@ static void pc_q35_init(QEMUMachineInitArgs *args)
     q35_host->mch.ram_memory =3D ram_memory;
     q35_host->mch.pci_address_space =3D pci_memory;
     q35_host->mch.system_memory =3D get_system_memory();
-    q35_host->mch.address_space_io =3D get_system_io();;
+    q35_host->mch.address_space_io =3D get_system_io();
     q35_host->mch.below_4g_mem_size =3D below_4g_mem_size;
     q35_host->mch.above_4g_mem_size =3D above_4g_mem_size;
     /* pci */
diff --git a/hw/intc/imx_avic.c b/hw/intc/imx_avic.c
index 4e280b6..ff45dcd 100644
--- a/hw/intc/imx_avic.c
+++ b/hw/intc/imx_avic.c
@@ -370,7 +370,7 @@ static void imx_avic_reset(DeviceState *dev)

 static int imx_avic_init(SysBusDevice *dev)
 {
-    IMXAVICState *s =3D FROM_SYSBUS(IMXAVICState, dev);;
+    IMXAVICState *s =3D FROM_SYSBUS(IMXAVICState, dev);

     memory_region_init_io(&s->iomem, &imx_avic_ops, s, "imx_avic", 0x100=
0);
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
@@ -1429,7 +1429,7 @@ static void usb_host_exit_notifier(struct Notifier =
*n, void *data)

     usb_host_release_port(s);
     if (s->fd !=3D -1) {
-        usb_host_do_reset(s);;
+        usb_host_do_reset(s);
     }
 }

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 42545bc..3bcd4ab 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -5,8 +5,8 @@
 #include <stdarg.h>
 #include <stddef.h>
 #include <stdbool.h>
-#ifdef __OpenBSD__
 #include <sys/types.h>
+#ifdef __OpenBSD__
 #include <sys/signal.h>
 #endif

diff --git a/qemu-doc.texi b/qemu-doc.texi
index 64493eb..5fc0eae 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -214,10 +214,6 @@ PCI UHCI USB controller and a virtual USB hub.

 SMP is supported with up to 255 CPUs.

-Note that adlib, gus and cs4231a are only available when QEMU was
-configured with --audio-card-list option containing the name(s) of
-required card(s).
-
 QEMU uses the PC BIOS from the Bochs project and the Plex86/Bochs LGPL
 VGA BIOS.

diff --git a/qga/channel-win32.c b/qga/channel-win32.c
index 7ed98d7..8a303f3 100644
--- a/qga/channel-win32.c
+++ b/qga/channel-win32.c
@@ -268,7 +268,7 @@ static GIOStatus ga_channel_write(GAChannel *c, const=
 char *buf, size_t size,

 GIOStatus ga_channel_write_all(GAChannel *c, const char *buf, size_t siz=
e)
 {
-    GIOStatus status =3D G_IO_STATUS_NORMAL;;
+    GIOStatus status =3D G_IO_STATUS_NORMAL;
     size_t count;

     while (size) {
diff --git a/util/uri.c b/util/uri.c
index 4238729..e348c17 100644
--- a/util/uri.c
+++ b/util/uri.c
@@ -2162,7 +2162,7 @@ query_params_append (struct QueryParams *ps,
     }

     ps->p[ps->n].name =3D g_strdup(name);
-    ps->p[ps->n].value =3D value ? g_strdup(value) : NULL;
+    ps->p[ps->n].value =3D g_strdup(value);
     ps->p[ps->n].ignore =3D 0;
     ps->n++;

diff --git a/vl.c b/vl.c
index 6e6225f..be0a93c 100644
--- a/vl.c
+++ b/vl.c
@@ -1215,7 +1215,7 @@ void add_boot_device_path(int32_t bootindex, Device=
State *dev,

     node =3D g_malloc0(sizeof(FWBootEntry));
     node->bootindex =3D bootindex;
-    node->suffix =3D suffix ? g_strdup(suffix) : NULL;
+    node->suffix =3D g_strdup(suffix);
     node->dev =3D dev;

     QTAILQ_FOREACH(i, &fw_boot_order, link) {

