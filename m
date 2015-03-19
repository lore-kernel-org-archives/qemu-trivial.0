Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YYWyf-0003Lh-E5
	for mharc-qemu-trivial@gnu.org; Thu, 19 Mar 2015 05:42:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41959)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWyb-0003CA-8S
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:42:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWyW-0001q5-R6
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:42:53 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53684)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YYWyL-0001kl-UF; Thu, 19 Mar 2015 05:42:38 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9F56C41E4F;
	Thu, 19 Mar 2015 12:42:36 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 436E2945;
	Thu, 19 Mar 2015 12:05:48 +0300 (MSK)
Received: (nullmailer pid 359 invoked by uid 1000);
	Thu, 19 Mar 2015 09:05:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 19 Mar 2015 12:05:35 +0300
Message-Id: <3ebd6cc8d30374da8b72909960f4426e82e5f6ef.1426755483.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
References: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, "Gabriel L. Somlo" <gsomlo@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Gabriel Somlo <somlo@cmu.edu>
Subject: [Qemu-trivial] [PULL 17/24] smbios: add max speed comdline option
	for type-17 (meory device) structure
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
X-List-Received-Date: Thu, 19 Mar 2015 09:42:54 -0000

From: "Gabriel L. Somlo" <gsomlo@gmail.com>

Signed-off-by: Gabriel Somlo <somlo@cmu.edu>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/i386/smbios.c | 10 ++++++++--
 qemu-options.hx  |  4 ++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/hw/i386/smbios.c b/hw/i386/smbios.c
index f2e9ab6..1341e02 100644
--- a/hw/i386/smbios.c
+++ b/hw/i386/smbios.c
@@ -91,6 +91,7 @@ static struct {
 
 static struct {
     const char *loc_pfx, *bank, *manufacturer, *serial, *asset, *part;
+    uint16_t speed;
 } type17;
 
 static QemuOptsList qemu_smbios_opts = {
@@ -304,6 +305,10 @@ static const QemuOptDesc qemu_smbios_type17_opts[] = {
         .name = "part",
         .type = QEMU_OPT_STRING,
         .help = "part number",
+    },{
+        .name = "speed",
+        .type = QEMU_OPT_NUMBER,
+        .help = "maximum capable speed",
     },
     { /* end of list */ }
 };
@@ -697,13 +702,13 @@ static void smbios_build_type_17_table(unsigned instance, uint64_t size)
     SMBIOS_TABLE_SET_STR(17, bank_locator_str, type17.bank);
     t->memory_type = 0x07; /* RAM */
     t->type_detail = cpu_to_le16(0x02); /* Other */
-    t->speed = cpu_to_le16(0); /* Unknown */
+    t->speed = cpu_to_le16(type17.speed);
     SMBIOS_TABLE_SET_STR(17, manufacturer_str, type17.manufacturer);
     SMBIOS_TABLE_SET_STR(17, serial_number_str, type17.serial);
     SMBIOS_TABLE_SET_STR(17, asset_tag_number_str, type17.asset);
     SMBIOS_TABLE_SET_STR(17, part_number_str, type17.part);
     t->attributes = 0; /* Unknown */
-    t->configured_clock_speed = cpu_to_le16(0); /* Unknown */
+    t->configured_clock_speed = t->speed; /* reuse value for max speed */
     t->minimum_voltage = cpu_to_le16(0); /* Unknown */
     t->maximum_voltage = cpu_to_le16(0); /* Unknown */
     t->configured_voltage = cpu_to_le16(0); /* Unknown */
@@ -1083,6 +1088,7 @@ void smbios_entry_add(QemuOpts *opts)
             save_opt(&type17.serial, opts, "serial");
             save_opt(&type17.asset, opts, "asset");
             save_opt(&type17.part, opts, "part");
+            type17.speed = qemu_opt_get_number(opts, "speed", 0);
             return;
         default:
             error_report("Don't know how to build fields for SMBIOS type %ld",
diff --git a/qemu-options.hx b/qemu-options.hx
index c513352..16ff72c 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1403,7 +1403,7 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
     "              [,asset=str][,part=str]\n"
     "                specify SMBIOS type 4 fields\n"
     "-smbios type=17[,loc_pfx=str][,bank=str][,manufacturer=str][,serial=str]\n"
-    "               [,asset=str][,part=str]\n"
+    "               [,asset=str][,part=str][,speed=%d]\n"
     "                specify SMBIOS type 17 fields\n",
     QEMU_ARCH_I386)
 STEXI
@@ -1426,7 +1426,7 @@ Specify SMBIOS type 3 fields
 @item -smbios type=4[,sock_pfx=@var{str}][,manufacturer=@var{str}][,version=@var{str}][,serial=@var{str}][,asset=@var{str}][,part=@var{str}]
 Specify SMBIOS type 4 fields
 
-@item -smbios type=17[,loc_pfx=@var{str}][,bank=@var{str}][,manufacturer=@var{str}][,serial=@var{str}][,asset=@var{str}][,part=@var{str}]
+@item -smbios type=17[,loc_pfx=@var{str}][,bank=@var{str}][,manufacturer=@var{str}][,serial=@var{str}][,asset=@var{str}][,part=@var{str}][,speed=@var{%d}]
 Specify SMBIOS type 17 fields
 ETEXI
 
-- 
2.1.4


