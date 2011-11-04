Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RMLnj-0003b2-No
	for mharc-qemu-trivial@gnu.org; Fri, 04 Nov 2011 11:35:27 -0400
Received: from eggs.gnu.org ([140.186.70.92]:42395)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony.perard@citrix.com>) id 1RMLng-0003Qp-NL
	for qemu-trivial@nongnu.org; Fri, 04 Nov 2011 11:35:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony.perard@citrix.com>) id 1RMLnf-0006SM-CK
	for qemu-trivial@nongnu.org; Fri, 04 Nov 2011 11:35:24 -0400
Received: from smtp.citrix.com ([66.165.176.89]:30459)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony.perard@citrix.com>)
	id 1RMLnc-0006S0-Qq; Fri, 04 Nov 2011 11:35:20 -0400
X-IronPort-AV: E=Sophos;i="4.69,456,1315195200"; d="scan'208";a="18830587"
Received: from ftlpmailmx01.citrite.net ([10.13.107.65])
	by FTLPIPO01.CITRIX.COM with ESMTP/TLS/RC4-MD5;
	04 Nov 2011 11:35:19 -0400
Received: from smtp01.ad.xensource.com (10.219.128.104) by
	smtprelay.citrix.com (10.13.107.65) with Microsoft SMTP Server id
	8.3.137.0; Fri, 4 Nov 2011 11:35:19 -0400
Received: from perard.uk.xensource.com (dhcp-3-28.uk.xensource.com
	[10.80.3.28] (may be forged))	by smtp01.ad.xensource.com
	(8.13.1/8.13.1) with
	ESMTP id pA4FZH3c027464;	Fri, 4 Nov 2011 08:35:17 -0700
From: Anthony PERARD <anthony.perard@citrix.com>
To: QEMU-devel <qemu-devel@nongnu.org>, QEMU-devel <qemu-devel@nongnu.org>
Date: Fri, 4 Nov 2011 15:35:11 +0000
Message-ID: <1320420911-32151-1-git-send-email-anthony.perard@citrix.com>
X-Mailer: git-send-email 1.7.2.5
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.165.176.89
Cc: Anthony PERARD <anthony.perard@citrix.com>, qemu-trivial@nongnu.org,
	Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Subject: [Qemu-trivial] [PATCH] xen-platform: Fix IO port read/write
	functions
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
X-List-Received-Date: Fri, 04 Nov 2011 15:35:25 -0000

Somehow, the read/write functions handle an offset that does not exist anymore.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

---
 hw/xen_platform.c |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/xen_platform.c b/hw/xen_platform.c
index 6e3ba8b..5e792f5 100644
--- a/hw/xen_platform.c
+++ b/hw/xen_platform.c
@@ -113,7 +113,7 @@ static void platform_fixed_ioport_writew(void *opaque, uint32_t addr, uint32_t v
 {
     PCIXenPlatformState *s = opaque;
 
-    switch (addr - XEN_PLATFORM_IOPORT) {
+    switch (addr) {
     case 0:
         /* Unplug devices.  Value is a bitmask of which devices to
            unplug, with bit 0 the IDE devices, bit 1 the network
@@ -152,7 +152,7 @@ static void platform_fixed_ioport_writew(void *opaque, uint32_t addr, uint32_t v
 static void platform_fixed_ioport_writel(void *opaque, uint32_t addr,
                                          uint32_t val)
 {
-    switch (addr - XEN_PLATFORM_IOPORT) {
+    switch (addr) {
     case 0:
         /* PV driver version */
         break;
@@ -163,7 +163,7 @@ static void platform_fixed_ioport_writeb(void *opaque, uint32_t addr, uint32_t v
 {
     PCIXenPlatformState *s = opaque;
 
-    switch (addr - XEN_PLATFORM_IOPORT) {
+    switch (addr) {
     case 0: /* Platform flags */ {
         hvmmem_type_t mem_type = (val & PFFLAG_ROM_LOCK) ?
             HVMMEM_ram_ro : HVMMEM_ram_rw;
@@ -186,7 +186,7 @@ static uint32_t platform_fixed_ioport_readw(void *opaque, uint32_t addr)
 {
     PCIXenPlatformState *s = opaque;
 
-    switch (addr - XEN_PLATFORM_IOPORT) {
+    switch (addr) {
     case 0:
         if (s->drivers_blacklisted) {
             /* The drivers will recognise this magic number and refuse
@@ -205,7 +205,7 @@ static uint32_t platform_fixed_ioport_readb(void *opaque, uint32_t addr)
 {
     PCIXenPlatformState *s = opaque;
 
-    switch (addr - XEN_PLATFORM_IOPORT) {
+    switch (addr) {
     case 0:
         /* Platform flags */
         return s->flags;
@@ -221,7 +221,7 @@ static void platform_fixed_ioport_reset(void *opaque)
 {
     PCIXenPlatformState *s = opaque;
 
-    platform_fixed_ioport_writeb(s, XEN_PLATFORM_IOPORT, 0);
+    platform_fixed_ioport_writeb(s, 0, 0);
 }
 
 const MemoryRegionPortio xen_platform_ioport[] = {
@@ -251,7 +251,7 @@ static void platform_fixed_ioport_init(PCIXenPlatformState* s)
 static uint32_t xen_platform_ioport_readb(void *opaque, uint32_t addr)
 {
     if (addr == 0) {
-        return platform_fixed_ioport_readb(opaque, XEN_PLATFORM_IOPORT);
+        return platform_fixed_ioport_readb(opaque, 0);
     } else {
         return ~0u;
     }
@@ -263,7 +263,7 @@ static void xen_platform_ioport_writeb(void *opaque, uint32_t addr, uint32_t val
 
     switch (addr) {
     case 0: /* Platform flags */
-        platform_fixed_ioport_writeb(opaque, XEN_PLATFORM_IOPORT, val);
+        platform_fixed_ioport_writeb(opaque, 0, val);
         break;
     case 8:
         log_writeb(s, val);
@@ -321,7 +321,7 @@ static int xen_platform_post_load(void *opaque, int version_id)
 {
     PCIXenPlatformState *s = opaque;
 
-    platform_fixed_ioport_writeb(s, XEN_PLATFORM_IOPORT, s->flags);
+    platform_fixed_ioport_writeb(s, 0, s->flags);
 
     return 0;
 }
-- 
tg: (47abe9a..) fix/pci-platform (depends on: master)

