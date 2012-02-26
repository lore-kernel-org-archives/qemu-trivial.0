Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S1eKv-0001CD-Sg
	for mharc-qemu-trivial@gnu.org; Sun, 26 Feb 2012 08:40:25 -0500
Received: from eggs.gnu.org ([208.118.235.92]:33441)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S1eKn-0000mo-2U
	for qemu-trivial@nongnu.org; Sun, 26 Feb 2012 08:40:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S1eKh-0005RJ-AJ
	for qemu-trivial@nongnu.org; Sun, 26 Feb 2012 08:40:16 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:57577)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1S1eKV-0005M0-Dk; Sun, 26 Feb 2012 08:39:59 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	8C83F7280013; Sun, 26 Feb 2012 14:39:58 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id R15yqTkkmyFs; Sun, 26 Feb 2012 14:39:57 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 4EBC6728009A; Sun, 26 Feb 2012 14:39:57 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>
Date: Sun, 26 Feb 2012 14:39:56 +0100
Message-Id: <1330263596-4988-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.9
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] Fix spelling in comments (iff -> if)
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
X-List-Received-Date: Sun, 26 Feb 2012 13:40:22 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 a.out.h                |    2 +-
 arm-dis.c              |   22 +++++++++++-----------
 block.c                |    2 +-
 block/qcow2-refcount.c |    4 ++--
 hw/alpha_typhoon.c     |    2 +-
 hw/hid.h               |    2 +-
 hw/pcnet.c             |    2 +-
 m68k-dis.c             |    4 ++--
 memory.h               |    4 ++--
 monitor.c              |    2 +-
 net/socket.c           |    2 +-
 qemu-img.c             |    2 +-
 tcg/hppa/tcg-target.c  |    6 +++---
 13 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/a.out.h b/a.out.h
index 33ca7f7..7ea8d5a 100644
--- a/a.out.h
+++ b/a.out.h
@@ -136,7 +136,7 @@ struct external_scnhdr {
  */
 struct external_lineno {
   union {
-    host_ulong l_symndx; /* function name symbol index, iff l_lnno 0 */
+    host_ulong l_symndx; /* function name symbol index, if l_lnno 0 */
     host_ulong l_paddr;	/* (physical) address of line number	*/
   } l_addr;
   unsigned short l_lnno;	/* line number		*/
diff --git a/arm-dis.c b/arm-dis.c
index 6bc4d71..db15eca 100644
--- a/arm-dis.c
+++ b/arm-dis.c
@@ -130,8 +130,8 @@ struct opcode16
    %z<code>		print a double precision VFP reg
 			  Codes: 0=>Dm, 1=>Dd, 2=>Dn, 3=>multi-list
 
-   %<bitfield>'c	print specified char iff bitfield is all ones
-   %<bitfield>`c	print specified char iff bitfield is all zeroes
+   %<bitfield>'c	print specified char if bitfield is all ones
+   %<bitfield>`c	print specified char if bitfield is all zeroes
    %<bitfield>?ab...    select from array of values in big endian order
 
    %L			print as an iWMMXt N/M width field.
@@ -522,8 +522,8 @@ static const struct opcode32 coprocessor_opcodes[] =
    %<bitfield>Tn	print short scaled width limited by n
    %<bitfield>Un	print long scaled width limited by n
 
-   %<bitfield>'c	print specified char iff bitfield is all ones
-   %<bitfield>`c	print specified char iff bitfield is all zeroes
+   %<bitfield>'c	print specified char if bitfield is all ones
+   %<bitfield>`c	print specified char if bitfield is all zeroes
    %<bitfield>?ab...    select from array of values in big endian order  */
 
 static const struct opcode32 neon_opcodes[] =
@@ -787,8 +787,8 @@ static const struct opcode32 neon_opcodes[] =
    %c			print condition code (always bits 28-31)
    %m			print register mask for ldm/stm instruction
    %o			print operand2 (immediate or register + shift)
-   %p			print 'p' iff bits 12-15 are 15
-   %t			print 't' iff bit 21 set and bit 24 clear
+   %p			print 'p' if bits 12-15 are 15
+   %t			print 't' if bit 21 set and bit 24 clear
    %B			print arm BLX(1) destination
    %C			print the PSR sub type.
    %U			print barrier type.
@@ -800,8 +800,8 @@ static const struct opcode32 neon_opcodes[] =
    %<bitfield>x		print the bitfield in hex
    %<bitfield>X		print the bitfield as 1 hex digit without leading "0x"
 
-   %<bitfield>'c	print specified char iff bitfield is all ones
-   %<bitfield>`c	print specified char iff bitfield is all zeroes
+   %<bitfield>'c	print specified char if bitfield is all ones
+   %<bitfield>`c	print specified char if bitfield is all zeroes
    %<bitfield>?ab...    select from array of values in big endian order
 
    %e                   print arm SMI operand (bits 0..7,8..19).
@@ -1090,7 +1090,7 @@ static const struct opcode32 arm_opcodes[] =
    %<bitfield>a         print (bitfield * 4) as a pc-rel offset + decoded symbol
    %<bitfield>B         print Thumb branch destination (signed displacement)
    %<bitfield>c         print bitfield as a condition code
-   %<bitnum>'c		print specified char iff bit is one
+   %<bitnum>'c		print specified char if bit is one
    %<bitnum>?ab		print a if bit is one else print b.  */
 
 static const struct opcode16 thumb_opcodes[] =
@@ -1248,8 +1248,8 @@ static const struct opcode16 thumb_opcodes[] =
        %<bitfield>r	print bitfield as an ARM register
        %<bitfield>c	print bitfield as a condition code
 
-       %<bitfield>'c	print specified char iff bitfield is all ones
-       %<bitfield>`c	print specified char iff bitfield is all zeroes
+       %<bitfield>'c	print specified char if bitfield is all ones
+       %<bitfield>`c	print specified char if bitfield is all zeroes
        %<bitfield>?ab... select from array of values in big endian order
 
    With one exception at the bottom (done because BL and BLX(1) need
diff --git a/block.c b/block.c
index e27d528..54c02f0 100644
--- a/block.c
+++ b/block.c
@@ -2269,7 +2269,7 @@ typedef struct BdrvCoIsAllocatedData {
 } BdrvCoIsAllocatedData;
 
 /*
- * Returns true iff the specified sector is present in the disk image. Drivers
+ * Returns true if the specified sector is present in the disk image. Drivers
  * not implementing the functionality are assumed to not support backing files,
  * hence all their sectors are reported as allocated.
  *
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 2db2ede..752eaca 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -934,7 +934,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                 inc_refcounts(bs, res, refcount_table, refcount_table_size,
                     offset & ~511, nb_csectors * 512);
             } else {
-                /* QCOW_OFLAG_COPIED must be set iff refcount == 1 */
+                /* QCOW_OFLAG_COPIED must be set if refcount == 1 */
                 if (check_copied) {
                     uint64_t entry = offset;
                     offset &= ~QCOW_OFLAG_COPIED;
@@ -1016,7 +1016,7 @@ static int check_refcounts_l1(BlockDriverState *bs,
     for(i = 0; i < l1_size; i++) {
         l2_offset = l1_table[i];
         if (l2_offset) {
-            /* QCOW_OFLAG_COPIED must be set iff refcount == 1 */
+            /* QCOW_OFLAG_COPIED must be set if refcount == 1 */
             if (check_copied) {
                 refcount = get_refcount(bs, (l2_offset & ~QCOW_OFLAG_COPIED)
                     >> s->cluster_bits);
diff --git a/hw/alpha_typhoon.c b/hw/alpha_typhoon.c
index b539416..3ab0511 100644
--- a/hw/alpha_typhoon.c
+++ b/hw/alpha_typhoon.c
@@ -334,7 +334,7 @@ static void cchip_write(void *opaque, target_phys_addr_t addr,
         } else {
             newval |= val & 0x00f00000;    /* ABT field is W1S */
             if ((newval & 0xf0000) == 0) {
-                newval |= val & 0xf0000;   /* ABW field is W1S iff zero */
+                newval |= val & 0xf0000;   /* ABW field is W1S if zero */
             }
         }
         newval |= (val & 0xf000) >> 4;     /* IPREQ field sets IPINTR.  */
diff --git a/hw/hid.h b/hw/hid.h
index 5315cf7..6567abd 100644
--- a/hw/hid.h
+++ b/hw/hid.h
@@ -8,7 +8,7 @@
 #define HID_KEYBOARD  3
 
 typedef struct HIDPointerEvent {
-    int32_t xdx, ydy; /* relative iff it's a mouse, otherwise absolute */
+    int32_t xdx, ydy; /* relative if it's a mouse, otherwise absolute */
     int32_t dz, buttons_state;
 } HIDPointerEvent;
 
diff --git a/hw/pcnet.c b/hw/pcnet.c
index c53f06e..7c22236 100644
--- a/hw/pcnet.c
+++ b/hw/pcnet.c
@@ -1355,7 +1355,7 @@ static void pcnet_csr_writew(PCNetState *s, uint32_t rap, uint32_t new_value)
 
         val = (val & 0x007f) | (s->csr[0] & 0x7f00);
 
-        /* IFF STOP, STRT and INIT are set, clear STRT and INIT */
+        /* If STOP, STRT and INIT are set, clear STRT and INIT */
         if ((val&7) == 7)
           val &= ~3;
 
diff --git a/m68k-dis.c b/m68k-dis.c
index 2b155de..7be2c67 100644
--- a/m68k-dis.c
+++ b/m68k-dis.c
@@ -133,7 +133,7 @@ floatformat_to_double (const struct floatformat *, const char *, double *);
 extern void
 floatformat_from_double (const struct floatformat *, const double *, char *);
 
-/* Return non-zero iff the data at FROM is a valid number in format FMT.  */
+/* Return non-zero if the data at FROM is a valid number in format FMT.  */
 
 extern int
 floatformat_is_valid (const struct floatformat *fmt, const char *from);
@@ -4973,7 +4973,7 @@ floatformat_from_double (const struct floatformat *fmt,
     }
 }
 
-/* Return non-zero iff the data at FROM is a valid number in format FMT.  */
+/* Return non-zero if the data at FROM is a valid number in format FMT.  */
 
 int
 floatformat_is_valid (const struct floatformat *fmt, const char *from)
diff --git a/memory.h b/memory.h
index 4cf8d2f..25eb37b 100644
--- a/memory.h
+++ b/memory.h
@@ -645,8 +645,8 @@ void memory_region_set_alias_offset(MemoryRegion *mr,
  * It will have the following characteristics:
  *    .@offset_within_address_space >= @addr
  *    .@offset_within_address_space + .@size <= @addr + @size
- *    .@size = 0 iff no overlap was found
- *    .@mr is non-%NULL iff an overlap was found
+ *    .@size = 0 if no overlap was found
+ *    .@mr is non-%NULL if an overlap was found
  *
  * @address_space: a top-level (i.e. parentless) region that contains
  *       the region to be found
diff --git a/monitor.c b/monitor.c
index 953e748..54cfba0 100644
--- a/monitor.c
+++ b/monitor.c
@@ -221,7 +221,7 @@ static inline int monitor_ctrl_mode(const Monitor *mon)
     return (mon->flags & MONITOR_USE_CONTROL);
 }
 
-/* Return non-zero iff we have a current monitor, and it is in QMP mode.  */
+/* Return non-zero if we have a current monitor, and it is in QMP mode.  */
 int monitor_cur_is_qmp(void)
 {
     return cur_mon && monitor_ctrl_mode(cur_mon);
diff --git a/net/socket.c b/net/socket.c
index 0bcf229..8669558 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -39,7 +39,7 @@ typedef struct NetSocketState {
     unsigned int index;
     unsigned int packet_len;
     uint8_t buf[4096];
-    struct sockaddr_in dgram_dst; /* contains inet host and port destination iff connectionless (SOCK_DGRAM) */
+    struct sockaddr_in dgram_dst; /* contains inet host and port destination if connectionless (SOCK_DGRAM) */
 } NetSocketState;
 
 typedef struct NetSocketListenState {
diff --git a/qemu-img.c b/qemu-img.c
index c4bcf41..b92d29d 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -515,7 +515,7 @@ static int img_commit(int argc, char **argv)
 }
 
 /*
- * Returns true iff the first sector pointed to by 'buf' contains at least
+ * Returns true if the first sector pointed to by 'buf' contains at least
  * a non-NUL byte.
  *
  * 'pnum' is set to the number of sectors (including and immediately following
diff --git a/tcg/hppa/tcg-target.c b/tcg/hppa/tcg-target.c
index 71f4a8a..9dcb3af 100644
--- a/tcg/hppa/tcg-target.c
+++ b/tcg/hppa/tcg-target.c
@@ -78,14 +78,14 @@ static const int tcg_target_call_oarg_regs[2] = {
     TCG_REG_RET1,
 };
 
-/* True iff val fits a signed field of width BITS.  */
+/* True if val fits a signed field of width BITS.  */
 static inline int check_fit_tl(tcg_target_long val, unsigned int bits)
 {
     return (val << ((sizeof(tcg_target_long) * 8 - bits))
             >> (sizeof(tcg_target_long) * 8 - bits)) == val;
 }
 
-/* True iff depi can be used to compute (reg | MASK).
+/* True if depi can be used to compute (reg | MASK).
    Accept a bit pattern like:
       0....01....1
       1....10....0
@@ -100,7 +100,7 @@ static inline int or_mask_p(tcg_target_ulong mask)
     return (mask & (mask - 1)) == 0;
 }
 
-/* True iff depi or extru can be used to compute (reg & mask).
+/* True if depi or extru can be used to compute (reg & mask).
    Accept a bit pattern like these:
       0....01....1
       1....10....0
-- 
1.7.9


