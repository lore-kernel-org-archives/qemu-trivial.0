Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UKPVf-0001GI-Az
	for mharc-qemu-trivial@gnu.org; Tue, 26 Mar 2013 04:45:35 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54377)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UKPVc-0001Co-6g
	for qemu-trivial@nongnu.org; Tue, 26 Mar 2013 04:45:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UKPVa-0000ae-6f
	for qemu-trivial@nongnu.org; Tue, 26 Mar 2013 04:45:32 -0400
Received: from [222.73.24.84] (port=17645 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1UKPVZ-0000ZQ-Ev; Tue, 26 Mar 2013 04:45:30 -0400
X-IronPort-AV: E=Sophos;i="4.87,351,1363104000"; 
   d="scan'208";a="6946830"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 26 Mar 2013 16:42:52 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r2Q8jNS2010234;
	Tue, 26 Mar 2013 16:45:23 +0800
Received: from liguang.fnst.cn.fujitsu.com ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013032616443738-57093 ;
	Tue, 26 Mar 2013 16:44:37 +0800 
From: liguang <lig.fnst@cn.fujitsu.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 26 Mar 2013 16:43:19 +0800
Message-Id: <1364287399-19186-1-git-send-email-lig.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.2.5
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/03/26 16:44:37,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/03/26 16:44:37,
	Serialize complete at 2013/03/26 16:44:37
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: liguang <lig.fnst@cn.fujitsu.com>
Subject: [Qemu-trivial] [Qemu-devel][PATCH] hw/i386/pc: format load_linux
	function
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
X-List-Received-Date: Tue, 26 Mar 2013 08:45:33 -0000

Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
---
 hw/i386/pc.c |  109 ++++++++++++++++++++++++++++++----------------------------
 1 files changed, 56 insertions(+), 53 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index ed7d9ba..b1e06fa 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -646,8 +646,8 @@ static long get_file_size(FILE *f)
 
 static void load_linux(void *fw_cfg,
                        const char *kernel_filename,
-		       const char *initrd_filename,
-		       const char *kernel_cmdline,
+                       const char *initrd_filename,
+                       const char *kernel_cmdline,
                        hwaddr max_ram_size)
 {
     uint16_t protocol;
@@ -664,60 +664,62 @@ static void load_linux(void *fw_cfg,
     /* load the kernel header */
     f = fopen(kernel_filename, "rb");
     if (!f || !(kernel_size = get_file_size(f)) ||
-	fread(header, 1, MIN(ARRAY_SIZE(header), kernel_size), f) !=
-	MIN(ARRAY_SIZE(header), kernel_size)) {
-	fprintf(stderr, "qemu: could not load kernel '%s': %s\n",
-		kernel_filename, strerror(errno));
-	exit(1);
+        fread(header, 1, MIN(ARRAY_SIZE(header), kernel_size), f) !=
+        MIN(ARRAY_SIZE(header), kernel_size)) {
+        fprintf(stderr, "qemu: could not load kernel '%s': %s\n",
+                kernel_filename, strerror(errno));
+        exit(1);
     }
 
     /* kernel protocol version */
 #if 0
     fprintf(stderr, "header magic: %#x\n", ldl_p(header+0x202));
 #endif
-    if (ldl_p(header+0x202) == 0x53726448)
-	protocol = lduw_p(header+0x206);
-    else {
-	/* This looks like a multiboot kernel. If it is, let's stop
-	   treating it like a Linux kernel. */
+    if (ldl_p(header+0x202) == 0x53726448) {
+        protocol = lduw_p(header+0x206);
+    } else {
+        /* This looks like a multiboot kernel. If it is, let's stop
+           treating it like a Linux kernel. */
         if (load_multiboot(fw_cfg, f, kernel_filename, initrd_filename,
-                           kernel_cmdline, kernel_size, header))
+                           kernel_cmdline, kernel_size, header)) {
             return;
-	protocol = 0;
+        }
+        protocol = 0;
     }
 
     if (protocol < 0x200 || !(header[0x211] & 0x01)) {
-	/* Low kernel */
-	real_addr    = 0x90000;
-	cmdline_addr = 0x9a000 - cmdline_size;
-	prot_addr    = 0x10000;
+        /* Low kernel */
+        real_addr    = 0x90000;
+        cmdline_addr = 0x9a000 - cmdline_size;
+        prot_addr    = 0x10000;
     } else if (protocol < 0x202) {
-	/* High but ancient kernel */
-	real_addr    = 0x90000;
-	cmdline_addr = 0x9a000 - cmdline_size;
-	prot_addr    = 0x100000;
+        /* High but ancient kernel */
+        real_addr    = 0x90000;
+        cmdline_addr = 0x9a000 - cmdline_size;
+        prot_addr    = 0x100000;
     } else {
-	/* High and recent kernel */
-	real_addr    = 0x10000;
-	cmdline_addr = 0x20000;
-	prot_addr    = 0x100000;
+        /* High and recent kernel */
+        real_addr    = 0x10000;
+        cmdline_addr = 0x20000;
+        prot_addr    = 0x100000;
     }
 
 #if 0
     fprintf(stderr,
-	    "qemu: real_addr     = 0x" TARGET_FMT_plx "\n"
-	    "qemu: cmdline_addr  = 0x" TARGET_FMT_plx "\n"
-	    "qemu: prot_addr     = 0x" TARGET_FMT_plx "\n",
-	    real_addr,
-	    cmdline_addr,
-	    prot_addr);
+            "qemu: real_addr     = 0x" TARGET_FMT_plx "\n"
+            "qemu: cmdline_addr  = 0x" TARGET_FMT_plx "\n"
+            "qemu: prot_addr     = 0x" TARGET_FMT_plx "\n",
+            real_addr,
+            cmdline_addr,
+            prot_addr);
 #endif
 
     /* highest address for loading the initrd */
-    if (protocol >= 0x203)
-	initrd_max = ldl_p(header+0x22c);
-    else
-	initrd_max = 0x37ffffff;
+    if (protocol >= 0x203) {
+        initrd_max = ldl_p(header+0x22c);
+    } else {
+        initrd_max = 0x37ffffff;
+    }
 
     if (initrd_max >= max_ram_size-ACPI_DATA_SIZE)
     	initrd_max = max_ram_size-ACPI_DATA_SIZE-1;
@@ -727,10 +729,10 @@ static void load_linux(void *fw_cfg,
     fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA, kernel_cmdline);
 
     if (protocol >= 0x202) {
-	stl_p(header+0x228, cmdline_addr);
+        stl_p(header+0x228, cmdline_addr);
     } else {
-	stw_p(header+0x20, 0xA33F);
-	stw_p(header+0x22, cmdline_addr-real_addr);
+        stw_p(header+0x20, 0xA33F);
+        stw_p(header+0x22, cmdline_addr-real_addr);
     }
 
     /* handle vga= parameter */
@@ -755,23 +757,23 @@ static void load_linux(void *fw_cfg,
     /* High nybble = B reserved for QEMU; low nybble is revision number.
        If this code is substantially changed, you may want to consider
        incrementing the revision. */
-    if (protocol >= 0x200)
-	header[0x210] = 0xB0;
-
+    if (protocol >= 0x200) {
+        header[0x210] = 0xB0;
+    }
     /* heap */
     if (protocol >= 0x201) {
-	header[0x211] |= 0x80;	/* CAN_USE_HEAP */
-	stw_p(header+0x224, cmdline_addr-real_addr-0x200);
+        header[0x211] |= 0x80;	/* CAN_USE_HEAP */
+        stw_p(header+0x224, cmdline_addr-real_addr-0x200);
     }
 
     /* load initrd */
     if (initrd_filename) {
-	if (protocol < 0x200) {
-	    fprintf(stderr, "qemu: linux kernel too old to load a ram disk\n");
-	    exit(1);
-	}
+        if (protocol < 0x200) {
+            fprintf(stderr, "qemu: linux kernel too old to load a ram disk\n");
+            exit(1);
+        }
 
-	initrd_size = get_image_size(initrd_filename);
+        initrd_size = get_image_size(initrd_filename);
         if (initrd_size < 0) {
             fprintf(stderr, "qemu: error reading initrd %s\n",
                     initrd_filename);
@@ -787,14 +789,15 @@ static void load_linux(void *fw_cfg,
         fw_cfg_add_i32(fw_cfg, FW_CFG_INITRD_SIZE, initrd_size);
         fw_cfg_add_bytes(fw_cfg, FW_CFG_INITRD_DATA, initrd_data, initrd_size);
 
-	stl_p(header+0x218, initrd_addr);
-	stl_p(header+0x21c, initrd_size);
+        stl_p(header+0x218, initrd_addr);
+        stl_p(header+0x21c, initrd_size);
     }
 
     /* load kernel and setup */
     setup_size = header[0x1f1];
-    if (setup_size == 0)
-	setup_size = 4;
+    if (setup_size == 0) {
+        setup_size = 4;
+    }
     setup_size = (setup_size+1)*512;
     kernel_size -= setup_size;
 
-- 
1.7.2.5


