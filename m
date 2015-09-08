Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZZQho-0003Vx-IX
	for mharc-qemu-trivial@gnu.org; Tue, 08 Sep 2015 17:45:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55023)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vlajos@gmail.com>) id 1ZZQhi-0003Us-Sr
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 17:45:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vlajos@gmail.com>) id 1ZZQhZ-0006j7-Hq
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 17:45:26 -0400
Received: from mail-wi0-x235.google.com ([2a00:1450:400c:c05::235]:36617)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vlajos@gmail.com>)
	id 1ZZQhZ-0006hT-2o; Tue, 08 Sep 2015 17:45:17 -0400
Received: by wicgb1 with SMTP id gb1so94166304wic.1;
	Tue, 08 Sep 2015 14:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:user-agent:mime-version
	:content-type; bh=WfbRXMzROlw73JyErCabZSNSbdQChwBhrIGXJ0KV8mg=;
	b=M+XIgvXBSHWopgGv1olWNA+y8/nr36OScS8kjr8XEpapokNQ//cZAUvpOHrCIw9gS5
	oGXRebe5tiSpXTPCKo8cCJPK6jLz2U2cwICm/Z4s8T0fFtc4o8otd0uJRaVEpQrdULUv
	fQK8MwpKmlsm8//T5239LwD+MaXV0/xcv7g3GDMJlRM3lDCpXvqkVJCgr7pCNmByc8lK
	xpiWXzKe6NFJEm6PMeNFHqQHTn9XnX5dOflE02CC/UMhc1XQcGcCpSPdnhcl9PoMIZgH
	vXRwRpAel6mKjKxX9+3mQsSFGm8FHfWrQl6pqkyNs78iiCTABjtfZmZMhu3/sjiyGmyC
	eYPA==
X-Received: by 10.194.91.193 with SMTP id cg1mr42681083wjb.88.1441748716408;
	Tue, 08 Sep 2015 14:45:16 -0700 (PDT)
Received: from citymarket.hu (citymarket.hu. [188.227.225.139])
	by smtp.gmail.com with ESMTPSA id xs1sm6882851wjc.7.2015.09.08.14.45.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Sep 2015 14:45:15 -0700 (PDT)
Date: Tue, 8 Sep 2015 22:45:14 +0100 (BST)
From: Veres Lajos <vlajos@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel <qemu-devel@nongnu.org>
Message-ID: <alpine.DEB.2.02.1509082244420.7825@citymarket.hu>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::235
Subject: [Qemu-trivial] [PATCH] typofixes - v4 -
	https://github.com/vlajos/misspell_fixer
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
X-List-Received-Date: Tue, 08 Sep 2015 21:45:31 -0000

Signed-off-by: Veres Lajos <vlajos@gmail.com>
---
 disas/i386.c                    |    2 +-
 disas/s390.c                    |    4 ++--
 docs/specs/ppc-spapr-hcalls.txt |    4 ++--
 docs/writing-qmp-commands.txt   |    2 +-
 hw/audio/fmopl.c                |    2 +-
 hw/core/qdev.c                  |    2 +-
 hw/cris/axis_dev88.c            |    2 +-
 hw/display/qxl-render.c         |    2 +-
 hw/dma/xilinx_axidma.c          |    2 +-
 hw/input/stellaris_input.c      |    2 +-
 hw/intc/xics.c                  |    2 +-
 hw/net/fsl_etsec/etsec.c        |    2 +-
 hw/sd/pl181.c                   |    2 +-
 hw/vfio/pci.c                   |    2 +-
 hw/xen/xen-host-pci-device.c    |    2 +-
 include/block/scsi.h            |    2 +-
 include/exec/memory.h           |    2 +-
 libcacard/card_7816t.h          |    2 +-
 libdecnumber/decContext.c       |    2 +-
 libdecnumber/decNumber.c        |    8 ++++----
 linux-user/syscall.c            |    1 -
 linux-user/syscall_defs.h       |    4 ++--
 qga/commands-posix.c            |    2 +-
 target-alpha/mem_helper.c       |    2 +-
 target-arm/cpu.h                |    4 ++--
 target-cris/cpu.h               |    2 +-
 target-cris/translate.c         |    6 +++---
 target-mips/helper.c            |    2 +-
 target-s390x/kvm.c              |    4 ++--
 target-sh4/helper.c             |    6 +++---
 tcg/ia64/tcg-target.c           |    2 +-
 tcg/tcg.c                       |    4 ++--
 tests/image-fuzzer/runner.py    |    2 +-
 tests/qemu-iotests/041          |    2 +-
 util/qemu-thread-posix.c        |    2 +-
 35 files changed, 47 insertions(+), 48 deletions(-)

diff --git a/disas/i386.c b/disas/i386.c
index 00ceca9..c63d4a0 100644
--- a/disas/i386.c
+++ b/disas/i386.c
@@ -357,7 +357,7 @@ fetch_data(struct disassemble_info *info, bfd_byte *addr)
 #define Rd { OP_R, d_mode }
 #define Rm { OP_R, m_mode }
 #define Ib { OP_I, b_mode }
-#define sIb { OP_sI, b_mode }	/* sign extened byte */
+#define sIb { OP_sI, b_mode }	/* sign extended byte */
 #define Iv { OP_I, v_mode }
 #define Iq { OP_I, q_mode }
 #define Iv64 { OP_I64, v_mode }
diff --git a/disas/s390.c b/disas/s390.c
index 974460c..c29bc4e 100644
--- a/disas/s390.c
+++ b/disas/s390.c
@@ -613,7 +613,7 @@ static const struct s390_operand s390_operands[] =
       names of the instruction format that you can find in the principals
       of operation.
    2) the last part of the definition (y in INSTR_x_y) gives you an idea
-      which operands the binary represenation of the instruction has.
+      which operands the binary representation of the instruction has.
       The meanings of the letters in y are:
       a - access register
       c - control register
@@ -627,7 +627,7 @@ static const struct s390_operand s390_operands[] =
       m - mode field, 4 bit
       0 - operand skipped.
       The order of the letters reflects the layout of the format in
-      storage and not the order of the paramaters of the instructions.
+      storage and not the order of the parameters of the instructions.
       The use of the letters is not a 100% match with the PoP but it is
       quite close.

diff --git a/docs/specs/ppc-spapr-hcalls.txt b/docs/specs/ppc-spapr-hcalls.txt
index 667b3fa..5bd8eab 100644
--- a/docs/specs/ppc-spapr-hcalls.txt
+++ b/docs/specs/ppc-spapr-hcalls.txt
@@ -41,8 +41,8 @@ When the guest runs in "real mode" (in powerpc lingua this means
 with MMU disabled, ie guest effective == guest physical), it only
 has access to a subset of memory and no IOs.

-PAPR provides a set of hypervisor calls to perform cachable or
-non-cachable accesses to any guest physical addresses that the
+PAPR provides a set of hypervisor calls to perform cacheable or
+non-cacheable accesses to any guest physical addresses that the
 guest can use in order to access IO devices while in real mode.

 This is typically used by the firmware running in the guest.
diff --git a/docs/writing-qmp-commands.txt b/docs/writing-qmp-commands.txt
index ab1fdd3..f7693ca 100644
--- a/docs/writing-qmp-commands.txt
+++ b/docs/writing-qmp-commands.txt
@@ -122,7 +122,7 @@ There are a few things to be noticed:
 Now a little hack is needed. As we're still using the old QMP server we need
 to add the new command to its internal dispatch table. This step won't be
 required in the near future. Open the qmp-commands.hx file and add the
-following in the botton:
+following at the bottom:

     {
         .name       = "hello-world",
diff --git a/hw/audio/fmopl.c b/hw/audio/fmopl.c
index adcef2d..81c0c1b 100644
--- a/hw/audio/fmopl.c
+++ b/hw/audio/fmopl.c
@@ -1177,7 +1177,7 @@ void OPLResetChip(FM_OPL *OPL)
 	OPLWriteReg(OPL,0x03,0); /* Timer2 */
 	OPLWriteReg(OPL,0x04,0); /* IRQ mask clear */
 	for(i = 0xff ; i >= 0x20 ; i-- ) OPLWriteReg(OPL,i,0);
-	/* reset OPerator paramater */
+	/* reset operator parameter */
 	for( c = 0 ; c < OPL->max_ch ; c++ )
 	{
 		OPL_CH *CH = &OPL->P_CH[c];
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index b2f404a..a24493a 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -506,7 +506,7 @@ qemu_irq qdev_get_gpio_out_connector(DeviceState *dev, const char *name, int n)
     return ret;
 }

-/* disconnect a GPIO ouput, returning the disconnected input (if any) */
+/* disconnect a GPIO output, returning the disconnected input (if any) */

 static qemu_irq qdev_disconnect_gpio_out_named(DeviceState *dev,
                                                const char *name, int n)
diff --git a/hw/cris/axis_dev88.c b/hw/cris/axis_dev88.c
index 3cae480..2e8c2c7 100644
--- a/hw/cris/axis_dev88.c
+++ b/hw/cris/axis_dev88.c
@@ -138,7 +138,7 @@ static void tempsensor_clkedge(struct tempsensor_t *s,
                     s->count = 16;

                     if ((s->regs[0] & 0xff) == 0) {
-                        /* 25 degrees celcius.  */
+                        /* 25 degrees celsius.  */
                         s->shiftreg = 0x0b9f;
                     } else if ((s->regs[0] & 0xff) == 0xff) {
                         /* Sensor ID, 0x8100 LM70.  */
diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
index a542087..7e4ef1e 100644
--- a/hw/display/qxl-render.c
+++ b/hw/display/qxl-render.c
@@ -159,7 +159,7 @@ static void qxl_render_update_area_unlocked(PCIQXLDevice *qxl)
 /*
  * use ssd.lock to protect render_update_cookie_num.
  * qxl_render_update is called by io thread or vcpu thread, and the completion
- * callbacks are called by spice_server thread, defering to bh called from the
+ * callbacks are called by spice_server thread, deferring to bh called from the
  * io thread.
  */
 void qxl_render_update(PCIQXLDevice *qxl)
diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index cf842a3..b1cfa11 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -133,7 +133,7 @@ struct XilinxAXIDMA {
 };

 /*
- * Helper calls to extract info from desriptors and other trivial
+ * Helper calls to extract info from descriptors and other trivial
  * state from regs.
  */
 static inline int stream_desc_sof(struct SDesc *d)
diff --git a/hw/input/stellaris_input.c b/hw/input/stellaris_input.c
index 0609e80..ececd2a 100644
--- a/hw/input/stellaris_input.c
+++ b/hw/input/stellaris_input.c
@@ -69,7 +69,7 @@ static const VMStateDescription vmstate_stellaris_gamepad = {
     }
 };

-/* Returns an array 5 ouput slots.  */
+/* Returns an array of 5 output slots.  */
 void stellaris_gamepad_init(int n, qemu_irq *irq, const int *keycode)
 {
     gamepad_state *s;
diff --git a/hw/intc/xics.c b/hw/intc/xics.c
index 924b1ae..67881c7 100644
--- a/hw/intc/xics.c
+++ b/hw/intc/xics.c
@@ -739,7 +739,7 @@ int xics_alloc(XICSState *icp, int src, int irq_hint, bool lsi)
 }

 /*
- * Allocate block of consequtive IRQs, returns a number of the first.
+ * Allocate block of consecutive IRQs, and return the number of the first IRQ in the block.
  * If align==true, aligns the first IRQ number to num.
  */
 int xics_alloc_block(XICSState *icp, int src, int num, bool lsi, bool align)
diff --git a/hw/net/fsl_etsec/etsec.c b/hw/net/fsl_etsec/etsec.c
index 0f5cf44..04bb41d 100644
--- a/hw/net/fsl_etsec/etsec.c
+++ b/hw/net/fsl_etsec/etsec.c
@@ -353,7 +353,7 @@ static ssize_t etsec_receive(NetClientState *nc,
     etsec->need_flush = false;
     ret = etsec_rx_ring_write(etsec, buf, size);
     if (ret == 0) {
-        /* The packet will be queued, let's flush it when buffer is avilable
+        /* The packet will be queued, let's flush it when buffer is available
          * again. */
         etsec->need_flush = true;
     }
diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
index 11fcd47..5242176 100644
--- a/hw/sd/pl181.c
+++ b/hw/sd/pl181.c
@@ -46,7 +46,7 @@ typedef struct PL181State {
     int32_t fifo_pos;
     int32_t fifo_len;
     /* The linux 2.6.21 driver is buggy, and misbehaves if new data arrives
-       while it is reading the FIFO.  We hack around this be defering
+       while it is reading the FIFO.  We hack around this by deferring
        subsequent transfers until after the driver polls the status word.
        http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=4446/1
      */
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 4023d8e..8940807 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3378,7 +3378,7 @@ static bool vfio_radeon_smc_is_running(VFIOPCIDevice *vdev)
     uint32_t clk, pc_c;

     /*
-     * Registers 200h and 204h are index and data registers for acessing
+     * Registers 200h and 204h are index and data registers for accessing
      * indirect configuration registers within the device.
      */
     vfio_region_write(&vdev->bars[5].region, 0x200, 0x80000004, 4);
diff --git a/hw/xen/xen-host-pci-device.c b/hw/xen/xen-host-pci-device.c
index 743b37b..dc5f224 100644
--- a/hw/xen/xen-host-pci-device.c
+++ b/hw/xen/xen-host-pci-device.c
@@ -40,7 +40,7 @@ static int xen_host_pci_sysfs_path(const XenHostPCIDevice *d,
                   d->domain, d->bus, d->dev, d->func, name);

     if (rc >= size || rc < 0) {
-        /* The ouput is truncated or an other error is encountered */
+        /* The output is truncated, or some other error was encountered */
         return -ENODEV;
     }
     return 0;
diff --git a/include/block/scsi.h b/include/block/scsi.h
index edde960..a311341 100644
--- a/include/block/scsi.h
+++ b/include/block/scsi.h
@@ -229,7 +229,7 @@ const char *scsi_command_name(uint8_t cmd);
 #define MODE_PAGE_TO_PROTECT                  0x1d
 #define MODE_PAGE_CAPABILITIES                0x2a
 #define MODE_PAGE_ALLS                        0x3f
-/* Not in Mt. Fuji, but in ATAPI 2.6 -- depricated now in favor
+/* Not in Mt. Fuji, but in ATAPI 2.6 -- deprecated now in favor
  * of MODE_PAGE_SENSE_POWER */
 #define MODE_PAGE_CDROM                       0x0d

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 94d20ea..de3e4a9 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1138,7 +1138,7 @@ MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
  * address_space_init: initializes an address space
  *
  * @as: an uninitialized #AddressSpace
- * @root: a #MemoryRegion that routes addesses for the address space
+ * @root: a #MemoryRegion that routes addresses for the address space
  * @name: an address space name.  The name is only used for debugging
  *        output.
  */
diff --git a/libcacard/card_7816t.h b/libcacard/card_7816t.h
index 8eef0ce..386acc5 100644
--- a/libcacard/card_7816t.h
+++ b/libcacard/card_7816t.h
@@ -57,7 +57,7 @@ struct VCardAPDUHeader {
     unsigned char ah_p1;
     unsigned char ah_p2;
     unsigned char ah_Le;
-    unsigned char ah_body[1]; /* indefinate length */
+    unsigned char ah_body[1]; /* indefinite length */
 };

 /*
diff --git a/libdecnumber/decContext.c b/libdecnumber/decContext.c
index 8b6ae21..68e6f60 100644
--- a/libdecnumber/decContext.c
+++ b/libdecnumber/decContext.c
@@ -186,7 +186,7 @@ uInt decContextGetStatus(decContext *context) {
 /*  newstatus is the source for the bits to be restored		      */
 /*  mask indicates the bits to be restored (the status bit that	      */
 /*    corresponds to each 1 bit in the mask is set to the value of    */
-/*    the correspnding bit in newstatus)			      */
+/*    the corresponding bit in newstatus)			      */
 /*  returns context						      */
 /*								      */
 /* No error is possible.					      */
diff --git a/libdecnumber/decNumber.c b/libdecnumber/decNumber.c
index 58211e7..ca1412f 100644
--- a/libdecnumber/decNumber.c
+++ b/libdecnumber/decNumber.c
@@ -2238,7 +2238,7 @@ decNumber * decNumberPower(decNumber *res, const decNumber *lhs,
       /* if a negative power the constant 1 is needed, and if not subset */
       /* invert the lhs now rather than inverting the result later */
       if (decNumberIsNegative(rhs)) {	/* was a **-n [hence digits>0] */
-	decNumber *inv=invbuff;		/* asssume use fixed buffer */
+	decNumber *inv=invbuff;		/* assume use fixed buffer */
 	decNumberCopy(&dnOne, dac);	/* dnOne=1;  [needed now or later] */
 	#if DECSUBSET
 	if (set->extended) {		/* need to calculate 1/lhs */
@@ -3849,7 +3849,7 @@ static void decToString(const decNumber *dn, char *string, Flag eng) {
 /*								      */
 /* Addition, especially x=x+1, is speed-critical.		      */
 /* The static buffer is larger than might be expected to allow for    */
-/* calls from higher-level funtions (notable exp).		      */
+/* calls from higher-level functions (notably exp).		      */
 /* ------------------------------------------------------------------ */
 static decNumber * decAddOp(decNumber *res, const decNumber *lhs,
 			    const decNumber *rhs, decContext *set,
@@ -4263,7 +4263,7 @@ static decNumber * decAddOp(decNumber *res, const decNumber *lhs,
 /* long subtractions.  These are acc and var1 respectively.	      */
 /* var1 is a copy of the lhs coefficient, var2 is the rhs coefficient.*/
 /* The static buffers may be larger than might be expected to allow   */
-/* for calls from higher-level funtions (notable exp).		      */
+/* for calls from higher-level functions (notably exp).		      */
 /* ------------------------------------------------------------------ */
 static decNumber * decDivideOp(decNumber *res,
 			       const decNumber *lhs, const decNumber *rhs,
@@ -5254,7 +5254,7 @@ static decNumber * decMultiplyOp(decNumber *res, const decNumber *lhs,
 /*    exp(-x) where x can be the tiniest number (Ntiny).	      */
 /*								      */
 /* 2. Normalizing x to be <=0.1 (instead of <=1) reduces loop	      */
-/*    iterations by appoximately a third with additional (although    */
+/*    iterations by approximately a third with additional (although    */
 /*    diminishing) returns as the range is reduced to even smaller    */
 /*    fractions.  However, h (the power of 10 used to correct the     */
 /*    result at the end, see below) must be kept <=8 as otherwise     */
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f62c698..c0fabf7 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -3939,7 +3939,6 @@ static abi_long do_ioctl(int fd, int cmd, abi_long arg)
         break;
     case TYPE_PTRVOID:
     case TYPE_INT:
-        /* int argment */
         ret = get_errno(ioctl(fd, ie->host_cmd, arg));
         break;
     case TYPE_PTR:
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index edd5f3c..5256fe5 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -969,7 +969,7 @@ struct target_pollfd {
                                            (struct cdrom_multisession) */
 #define TARGET_CDROM_GET_MCN		0x5311 /* Obtain the "Universal Product Code"
                                            if available (struct cdrom_mcn) */
-#define TARGET_CDROM_GET_UPC		TARGET_CDROM_GET_MCN  /* This one is depricated,
+#define TARGET_CDROM_GET_UPC		TARGET_CDROM_GET_MCN  /* This one is deprecated,
                                           but here anyway for compatibility */
 #define TARGET_CDROMRESET		0x5312 /* hard-reset the drive */
 #define TARGET_CDROMVOLREAD		0x5313 /* Get the drive's volume setting
@@ -2289,7 +2289,7 @@ struct target_f_owner_ex {
 };

 /* soundcard defines */
-/* XXX: convert them all to arch indepedent entries */
+/* XXX: convert them all to arch independent entries */
 #define TARGET_SNDCTL_COPR_HALT           TARGET_IOWR('C',  7, int);
 #define TARGET_SNDCTL_COPR_LOAD           0xcfb04301
 #define TARGET_SNDCTL_COPR_RCODE          0xc0144303
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 675f4b4..383bc59 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2158,7 +2158,7 @@ static void transfer_memory_block(GuestMemoryBlock *mem_blk, bool sys2memblk,

         ga_read_sysfs_file(dirfd, "removable", &removable, 1, &local_err);
         if (local_err) {
-            /* if no 'removable' file, it does't support offline mem blk */
+            /* if no 'removable' file, it doesn't support offline mem blk */
             if (errno == ENOENT) {
                 error_free(local_err);
                 mem_blk->can_offline = false;
diff --git a/target-alpha/mem_helper.c b/target-alpha/mem_helper.c
index 7b5e30d..c9258f5 100644
--- a/target-alpha/mem_helper.c
+++ b/target-alpha/mem_helper.c
@@ -132,7 +132,7 @@ void alpha_cpu_unassigned_access(CPUState *cs, hwaddr addr,
     env->error_code = 0;

     /* ??? We should cpu_restore_state to the faulting insn, but this hook
-       does not have access to the retaddr value from the orignal helper.
+       does not have access to the retaddr value from the original helper.
        It's all moot until the QEMU PALcode grows an MCHK handler.  */

     cpu_loop_exit(cs);
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 7e89152..ca7aa42 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -221,8 +221,8 @@ typedef struct CPUARMState {
         };
         /* MMU translation table base control. */
         TCR tcr_el[4];
-        uint32_t c2_data; /* MPU data cachable bits.  */
-        uint32_t c2_insn; /* MPU instruction cachable bits.  */
+        uint32_t c2_data; /* MPU data cacheable bits.  */
+        uint32_t c2_insn; /* MPU instruction cacheable bits.  */
         union { /* MMU domain access control register
                  * MPU write buffer control.
                  */
diff --git a/target-cris/cpu.h b/target-cris/cpu.h
index d422e35..10c3f46 100644
--- a/target-cris/cpu.h
+++ b/target-cris/cpu.h
@@ -151,7 +151,7 @@ typedef struct CPUCRISState {
 	uint32_t sregs[4][16];

 	/* Linear feedback shift reg in the mmu. Used to provide pseudo
-	   randomness for the 'hint' the mmu gives to sw for chosing valid
+	   randomness for the 'hint' the mmu gives to sw for choosing valid
 	   sets on TLB refills.  */
 	uint32_t mmu_rand_lfsr;

diff --git a/target-cris/translate.c b/target-cris/translate.c
index 3e59601..c36e553 100644
--- a/target-cris/translate.c
+++ b/target-cris/translate.c
@@ -102,9 +102,9 @@ typedef struct DisasContext {

     int cc_size_uptodate; /* -1 invalid or last written value.  */

-    int cc_x_uptodate;  /* 1 - ccs, 2 - known | X_FLAG. 0 not uptodate.  */
-    int flags_uptodate; /* Wether or not $ccs is uptodate.  */
-    int flagx_known; /* Wether or not flags_x has the x flag known at
+    int cc_x_uptodate;  /* 1 - ccs, 2 - known | X_FLAG. 0 not up-to-date.  */
+    int flags_uptodate; /* Whether or not $ccs is up-to-date.  */
+    int flagx_known; /* Whether or not flags_x has the x flag known at
                 translation time.  */
     int flags_x;

diff --git a/target-mips/helper.c b/target-mips/helper.c
index 04ba19f..71f0b83 100644
--- a/target-mips/helper.c
+++ b/target-mips/helper.c
@@ -700,7 +700,7 @@ void mips_cpu_do_interrupt(CPUState *cs)
         goto set_EPC;
     case EXCP_DWATCH:
         cause = 23;
-        /* XXX: TODO: manage defered watch exceptions */
+        /* XXX: TODO: manage deferred watch exceptions */
         goto set_EPC;
     case EXCP_MCHECK:
         cause = 24;
diff --git a/target-s390x/kvm.c b/target-s390x/kvm.c
index ae3a0af..7e39045 100644
--- a/target-s390x/kvm.c
+++ b/target-s390x/kvm.c
@@ -588,9 +588,9 @@ int kvm_s390_set_clock(uint8_t *tod_high, uint64_t *tod_low)
  * @addr:      the logical start address in guest memory
  * @ar:        the access register number
  * @hostbuf:   buffer in host memory. NULL = do only checks w/o copying
- * @len:       length that should be transfered
+ * @len:       length that should be transferred
  * @is_write:  true = write, false = read
- * Returns:    0 on success, non-zero if an exception or error occured
+ * Returns:    0 on success, non-zero if an exception or error occurred
  *
  * Use KVM ioctl to read/write from/to guest memory. An access exception
  * is injected into the vCPU in case of translation errors.
diff --git a/target-sh4/helper.c b/target-sh4/helper.c
index a533f08..5230a9e 100644
--- a/target-sh4/helper.c
+++ b/target-sh4/helper.c
@@ -60,7 +60,7 @@ int superh_cpu_handle_mmu_fault(CPUState *cs, vaddr address, int rw,

 int cpu_sh4_is_cached(CPUSH4State * env, target_ulong addr)
 {
-    /* For user mode, only U0 area is cachable. */
+    /* For user mode, only U0 area is cacheable. */
     return !(addr & 0x80000000);
 }

@@ -826,11 +826,11 @@ int cpu_sh4_is_cached(CPUSH4State * env, target_ulong addr)

     /* check area */
     if (env->sr & (1u << SR_MD)) {
-        /* For previledged mode, P2 and P4 area is not cachable. */
+        /* For privileged mode, P2 and P4 area is not cacheable. */
         if ((0xA0000000 <= addr && addr < 0xC0000000) || 0xE0000000 <= addr)
             return 0;
     } else {
-        /* For user mode, only U0 area is cachable. */
+        /* For user mode, only U0 area is cacheable. */
         if (0x80000000 <= addr)
             return 0;
     }
diff --git a/tcg/ia64/tcg-target.c b/tcg/ia64/tcg-target.c
index 81cb9f7..5bf677e 100644
--- a/tcg/ia64/tcg-target.c
+++ b/tcg/ia64/tcg-target.c
@@ -1599,7 +1599,7 @@ static void tcg_out_tb_finalize(TCGContext *s)
         /* The out-of-line thunks are all the same; load the return address
            from B0, load the GP, and branch to the code.  Note that we are
            always post-call, so the register window has rolled, so we're
-           using incomming parameter register numbers, not outgoing.  */
+           using incoming parameter register numbers, not outgoing.  */
         if (dest == NULL) {
             uintptr_t *desc = (uintptr_t *)helpers[x];
             uintptr_t func = desc[0], gp = desc[1], disp;
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 0892a9b..f463e44 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1396,7 +1396,7 @@ static void tcg_liveness_analysis(TCGContext *s)
                             }
                         }
                     }
-                    /* input arguments are live for preceeding opcodes */
+                    /* input arguments are live for preceding opcodes */
                     for (i = nb_oargs; i < nb_oargs + nb_iargs; i++) {
                         arg = args[i];
                         dead_temps[arg] = 0;
@@ -1542,7 +1542,7 @@ static void tcg_liveness_analysis(TCGContext *s)
                         dead_args |= (1 << i);
                     }
                 }
-                /* input arguments are live for preceeding opcodes */
+                /* input arguments are live for preceding opcodes */
                 for (i = nb_oargs; i < nb_oargs + nb_iargs; i++) {
                     arg = args[i];
                     dead_temps[arg] = 0;
diff --git a/tests/image-fuzzer/runner.py b/tests/image-fuzzer/runner.py
index 0a8743e..be7e283 100755
--- a/tests/image-fuzzer/runner.py
+++ b/tests/image-fuzzer/runner.py
@@ -301,7 +301,7 @@ if __name__ == '__main__':
         JSON:

         '--command' accepts a JSON array of commands. Each command presents
-        an application under test with all its paramaters as a list of strings,
+        an application under test with all its parameters as a list of strings,
         e.g. ["qemu-io", "$test_img", "-c", "write $off $len"].

         Supported application aliases: 'qemu-img' and 'qemu-io'.
diff --git a/tests/qemu-iotests/041 b/tests/qemu-iotests/041
index 3d46ed7..dbc4a06 100755
--- a/tests/qemu-iotests/041
+++ b/tests/qemu-iotests/041
@@ -877,7 +877,7 @@ class TestRepairQuorum(iotests.QMPTestCase):
                              target=quorum_repair_img, format=iotests.imgfmt)
         self.assert_qmp(result, 'error/class', 'GenericError')

-    def test_unexistant_replaces(self):
+    def test_nonexistent_replaces(self):
         if not self.has_quorum():
             return

diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
index ba67cec..b1abe97 100644
--- a/util/qemu-thread-posix.c
+++ b/util/qemu-thread-posix.c
@@ -389,7 +389,7 @@ void qemu_event_wait(QemuEvent *ev)
             /*
              * Leave the event reset and tell qemu_event_set that there
              * are waiters.  No need to retry, because there cannot be
-             * a concurent busy->free transition.  After the CAS, the
+             * a concurrent busy->free transition.  After the CAS, the
              * event will be either set or busy.
              */
             if (atomic_cmpxchg(&ev->value, EV_FREE, EV_BUSY) == EV_SET) {
-- 
1.7.10.4

