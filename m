Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VSkoM-000725-Rf
	for mharc-qemu-trivial@gnu.org; Sun, 06 Oct 2013 05:39:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47706)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VSkoG-0006sx-5C
	for qemu-trivial@nongnu.org; Sun, 06 Oct 2013 05:39:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VSkoB-0003Pj-8d
	for qemu-trivial@nongnu.org; Sun, 06 Oct 2013 05:39:32 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39036)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VSknv-0003LM-MT; Sun, 06 Oct 2013 05:39:11 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id EBB5540D02;
	Sun,  6 Oct 2013 13:39:09 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id F33BD526;
	Sun,  6 Oct 2013 13:33:03 +0400 (MSK)
Received: (nullmailer pid 25823 invoked by uid 1000);
	Sun, 06 Oct 2013 09:33:02 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Sun,  6 Oct 2013 13:32:56 +0400
Message-Id: <1381051979-25742-12-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1381051979-25742-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1381051979-25742-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 11/14] vl: Clean up unnecessary boot_order
	complications
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
X-List-Received-Date: Sun, 06 Oct 2013 09:39:37 -0000

From: Markus Armbruster <armbru@redhat.com>

Messed up in commit 8281abd.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 vl.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/vl.c b/vl.c
index 983cdc6..7e1f408 100644
--- a/vl.c
+++ b/vl.c
@@ -2825,7 +2825,7 @@ int main(int argc, char **argv, char **envp)
     const char *icount_option = NULL;
     const char *initrd_filename;
     const char *kernel_filename, *kernel_cmdline;
-    const char *boot_order = NULL;
+    const char *boot_order;
     DisplayState *ds;
     int cyls, heads, secs, translation;
     QemuOpts *hda_opts = NULL, *opts, *machine_opts;
@@ -4050,9 +4050,7 @@ int main(int argc, char **argv, char **envp)
     initrd_filename = qemu_opt_get(machine_opts, "initrd");
     kernel_cmdline = qemu_opt_get(machine_opts, "append");
 
-    if (!boot_order) {
-        boot_order = machine->default_boot_order;
-    }
+    boot_order = machine->default_boot_order;
     opts = qemu_opts_find(qemu_find_opts("boot-opts"), NULL);
     if (opts) {
         char *normal_boot_order;
-- 
1.7.10.4


