Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SzvQt-0003Hm-Ea
	for mharc-qemu-trivial@gnu.org; Fri, 10 Aug 2012 16:03:43 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34123)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SzvQn-0002yB-4K
	for qemu-trivial@nongnu.org; Fri, 10 Aug 2012 16:03:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SzvQk-000103-Hg
	for qemu-trivial@nongnu.org; Fri, 10 Aug 2012 16:03:37 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:59819)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1SzvQg-0000yE-8k; Fri, 10 Aug 2012 16:03:30 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	1E8597280031; Fri, 10 Aug 2012 22:03:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id NDiF+s-B844m; Fri, 10 Aug 2012 22:03:28 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 77A1372800CC; Fri, 10 Aug 2012 22:03:28 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Fri, 10 Aug 2012 22:03:25 +0200
Message-Id: <1344629007-23311-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] Spelling fixes in comments and documentation
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
X-List-Received-Date: Fri, 10 Aug 2012 20:03:38 -0000

These wrong spellings were detected by codespell:

* successully -> successfully

* alot -> a lot

* wanna -> want to

* infomation -> information

* occured -> occurred

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 docs/specs/ppc-spapr-hcalls.txt |    2 +-
 docs/usb2.txt                   |    4 ++--
 hw/xen_pt.h                     |    4 ++--
 hw/xen_pt_config_init.c         |   14 +++++++-------
 qemu-img.c                      |    2 +-
 qemu-img.texi                   |    2 +-
 6 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/docs/specs/ppc-spapr-hcalls.txt b/docs/specs/ppc-spapr-hcalls.txt
index 52ba8d4..667b3fa 100644
--- a/docs/specs/ppc-spapr-hcalls.txt
+++ b/docs/specs/ppc-spapr-hcalls.txt
@@ -31,7 +31,7 @@ Arguments:
 
 Returns:
 
-  H_SUCCESS   : Successully called the RTAS function (RTAS result
+  H_SUCCESS   : Successfully called the RTAS function (RTAS result
                 will have been stored in the parameter block)
   H_PARAMETER : Unknown token
 
diff --git a/docs/usb2.txt b/docs/usb2.txt
index d17e3c0..21f6d14 100644
--- a/docs/usb2.txt
+++ b/docs/usb2.txt
@@ -58,11 +58,11 @@ try ...
 xhci controller support
 -----------------------
 
-There also is xhci host controller support available.  It got alot
+There also is xhci host controller support available.  It got a lot
 less testing than ehci and there are a bunch of known limitations, so
 ehci may work better for you.  On the other hand the xhci hardware
 design is much more virtualization-friendly, thus xhci emulation uses
-less ressources (especially cpu).  If you wanna give xhci a try
+less ressources (especially cpu).  If you want to give xhci a try
 use this to add the host controller ...
 
     qemu -device nec-usb-xhci,id=xhci
diff --git a/hw/xen_pt.h b/hw/xen_pt.h
index 41904ec..112477a 100644
--- a/hw/xen_pt.h
+++ b/hw/xen_pt.h
@@ -96,7 +96,7 @@ typedef struct XenPTRegion {
  * - do NOT use ALL F for init_val, otherwise the tbl will not be registered.
  */
 
-/* emulated register infomation */
+/* emulated register information */
 struct XenPTRegInfo {
     uint32_t offset;
     uint32_t size;
@@ -140,7 +140,7 @@ typedef int (*xen_pt_reg_size_init_fn)
     (XenPCIPassthroughState *, const XenPTRegGroupInfo *,
      uint32_t base_offset, uint8_t *size);
 
-/* emulated register group infomation */
+/* emulated register group information */
 struct XenPTRegGroupInfo {
     uint8_t grp_id;
     XenPTRegisterGroupType grp_type;
diff --git a/hw/xen_pt_config_init.c b/hw/xen_pt_config_init.c
index 00eb3d9..e524a40 100644
--- a/hw/xen_pt_config_init.c
+++ b/hw/xen_pt_config_init.c
@@ -562,7 +562,7 @@ static int xen_pt_exp_rom_bar_reg_write(XenPCIPassthroughState *s,
     return 0;
 }
 
-/* Header Type0 reg static infomation table */
+/* Header Type0 reg static information table */
 static XenPTRegInfo xen_pt_emu_reg_header0[] = {
     /* Vendor ID reg */
     {
@@ -753,7 +753,7 @@ static XenPTRegInfo xen_pt_emu_reg_header0[] = {
  * Vital Product Data Capability
  */
 
-/* Vital Product Data Capability Structure reg static infomation table */
+/* Vital Product Data Capability Structure reg static information table */
 static XenPTRegInfo xen_pt_emu_reg_vpd[] = {
     {
         .offset     = PCI_CAP_LIST_NEXT,
@@ -775,7 +775,7 @@ static XenPTRegInfo xen_pt_emu_reg_vpd[] = {
  * Vendor Specific Capability
  */
 
-/* Vendor Specific Capability Structure reg static infomation table */
+/* Vendor Specific Capability Structure reg static information table */
 static XenPTRegInfo xen_pt_emu_reg_vendor[] = {
     {
         .offset     = PCI_CAP_LIST_NEXT,
@@ -866,7 +866,7 @@ static int xen_pt_linkctrl2_reg_init(XenPCIPassthroughState *s,
     return 0;
 }
 
-/* PCI Express Capability Structure reg static infomation table */
+/* PCI Express Capability Structure reg static information table */
 static XenPTRegInfo xen_pt_emu_reg_pcie[] = {
     /* Next Pointer reg */
     {
@@ -981,7 +981,7 @@ static int xen_pt_pmcsr_reg_write(XenPCIPassthroughState *s,
     return 0;
 }
 
-/* Power Management Capability reg static infomation table */
+/* Power Management Capability reg static information table */
 static XenPTRegInfo xen_pt_emu_reg_pm[] = {
     /* Next Pointer reg */
     {
@@ -1259,7 +1259,7 @@ static int xen_pt_msgdata_reg_write(XenPCIPassthroughState *s,
     return 0;
 }
 
-/* MSI Capability Structure reg static infomation table */
+/* MSI Capability Structure reg static information table */
 static XenPTRegInfo xen_pt_emu_reg_msi[] = {
     /* Next Pointer reg */
     {
@@ -1396,7 +1396,7 @@ static int xen_pt_msixctrl_reg_write(XenPCIPassthroughState *s,
     return 0;
 }
 
-/* MSI-X Capability Structure reg static infomation table */
+/* MSI-X Capability Structure reg static information table */
 static XenPTRegInfo xen_pt_emu_reg_msix[] = {
     /* Next Pointer reg */
     {
diff --git a/qemu-img.c b/qemu-img.c
index f20116a..3a21cc1 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -89,7 +89,7 @@ static void help(void)
            "  '-r' tries to repair any inconsistencies that are found during the check.\n"
            "       '-r leaks' repairs only cluster leaks, whereas '-r all' fixes all\n"
            "       kinds of errors, with a higher risk of choosing the wrong fix or\n"
-           "       hiding corruption that has already occured.\n"
+           "       hiding corruption that has already occurred.\n"
            "\n"
            "Parameters to snapshot subcommand:\n"
            "  'snapshot' is the name of the snapshot to create, apply or delete\n"
diff --git a/qemu-img.texi b/qemu-img.texi
index 77c6d0b..9f3ac3f 100644
--- a/qemu-img.texi
+++ b/qemu-img.texi
@@ -77,7 +77,7 @@ Perform a consistency check on the disk image @var{filename}.
 If @code{-r} is specified, qemu-img tries to repair any inconsistencies found
 during the check. @code{-r leaks} repairs only cluster leaks, whereas
 @code{-r all} fixes all kinds of errors, with a higher risk of choosing the
-wrong fix or hiding corruption that has already occured.
+wrong fix or hiding corruption that has already occurred.
 
 Only the formats @code{qcow2}, @code{qed} and @code{vdi} support
 consistency checks.
-- 
1.7.0.4


