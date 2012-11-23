Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tbxjw-0002c1-2o
	for mharc-qemu-trivial@gnu.org; Fri, 23 Nov 2012 13:12:36 -0500
Received: from eggs.gnu.org ([208.118.235.92]:43258)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1Tbxjn-00028f-7I
	for qemu-trivial@nongnu.org; Fri, 23 Nov 2012 13:12:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1Tbxjm-0001Xa-AN
	for qemu-trivial@nongnu.org; Fri, 23 Nov 2012 13:12:27 -0500
Received: from oxygen.pond.sub.org ([2a01:4f8:121:10e4::3]:53003)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1Tbxjj-0001WZ-3w; Fri, 23 Nov 2012 13:12:23 -0500
Received: from blackfin.pond.sub.org (p57B0F971.dip.t-dialin.net
	[87.176.249.113])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 87BC99FE67;
	Fri, 23 Nov 2012 19:12:19 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id C510E2009A; Fri, 23 Nov 2012 19:12:18 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Nov 2012 19:12:17 +0100
Message-Id: <1353694338-13162-2-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1353694338-13162-1-git-send-email-armbru@redhat.com>
References: <1353694338-13162-1-git-send-email-armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:121:10e4::3
Cc: qemu-trivial@nongnu.org, jordan.l.justen@intel.com
Subject: [Qemu-trivial] [PATCH 1/2] pc_sysfw: Check for qemu_find_file()
	failure
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
X-List-Received-Date: Fri, 23 Nov 2012 18:12:28 -0000

pc_fw_add_pflash_drv() ignores qemu_find_file() failure, and happily
creates a drive without a medium.

When pc_system_flash_init() asks for its size, bdrv_getlength() fails
with -ENOMEDIUM, which isn't checked either.  It fails relatively
cleanly only because -ENOMEDIUM isn't a multiple of 4096:

    $ qemu-system-x86_64 -S -vnc :0 -bios nonexistant
    qemu: PC system firmware (pflash) must be a multiple of 0x1000
    [Exit 1 ]

Fix by handling the qemu_find_file() failure.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/pc_sysfw.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/pc_sysfw.c b/hw/pc_sysfw.c
index 9d7c5f4..066c4fe 100644
--- a/hw/pc_sysfw.c
+++ b/hw/pc_sysfw.c
@@ -84,6 +84,11 @@ static void pc_fw_add_pflash_drv(void)
         bios_name = BIOS_FILENAME;
     }
     filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
+    if (!filename) {
+        error_report("Can't open BIOS image %s: %s",
+                     bios_name, strerror(errno));
+        exit(1);
+    }
 
     opts = drive_add(IF_PFLASH, -1, filename, "readonly=on");
 
-- 
1.7.11.7


