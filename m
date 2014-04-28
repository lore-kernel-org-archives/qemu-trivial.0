Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WeduL-0000UE-EZ
	for mharc-qemu-trivial@gnu.org; Mon, 28 Apr 2014 01:15:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WeduC-0000AF-Vh
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 01:15:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wedu8-0002Nb-0N
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 01:15:04 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59610)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Wedtp-0002Kr-BJ; Mon, 28 Apr 2014 01:14:41 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 866614303C;
	Mon, 28 Apr 2014 09:14:40 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id BEB3C66D;
	Mon, 28 Apr 2014 09:08:27 +0400 (MSK)
Received: (nullmailer pid 19147 invoked by uid 1000);
	Mon, 28 Apr 2014 05:08:25 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 28 Apr 2014 09:07:55 +0400
Message-Id: <1398661684-19059-10-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398661684-19059-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1398661684-19059-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Chen Gang <gang.chen.5i5j@gmail.com>
Subject: [Qemu-trivial] [PULL 09/18] vl: Eliminate a superfluous local
	variable
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
X-List-Received-Date: Mon, 28 Apr 2014 05:15:10 -0000

From: Chen Gang <gang.chen.5i5j@gmail.com>

CODING_STYLE frowns upon mixing declarations and statements.  main()
has such a declaration.  Clean up by eliminating the variable.

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 vl.c |   18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/vl.c b/vl.c
index 0b08a02..773649f 100644
--- a/vl.c
+++ b/vl.c
@@ -4404,15 +4404,15 @@ int main(int argc, char **argv, char **envp)
 
     qdev_machine_init();
 
-    QEMUMachineInitArgs args = { .machine = machine,
-                                 .ram_size = ram_size,
-                                 .boot_order = boot_order,
-                                 .kernel_filename = kernel_filename,
-                                 .kernel_cmdline = kernel_cmdline,
-                                 .initrd_filename = initrd_filename,
-                                 .cpu_model = cpu_model };
-
-    current_machine->init_args = args;
+    current_machine->init_args = (QEMUMachineInitArgs) {
+        .machine = machine,
+        .ram_size = ram_size,
+        .boot_order = boot_order,
+        .kernel_filename = kernel_filename,
+        .kernel_cmdline = kernel_cmdline,
+        .initrd_filename = initrd_filename,
+        .cpu_model = cpu_model };
+
     machine->init(&current_machine->init_args);
 
     audio_init();
-- 
1.7.10.4


