Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wopmk-000515-LR
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2014 03:57:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51609)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wopme-0004qC-CQ
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:57:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wopma-0001aV-AE
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:57:24 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53910)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WopmR-0001X6-S2; Mon, 26 May 2014 03:57:12 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D2AEB42FB3;
	Mon, 26 May 2014 11:57:09 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id EAABC6B0;
	Mon, 26 May 2014 11:20:14 +0400 (MSK)
Received: (nullmailer pid 23012 invoked by uid 1000);
	Mon, 26 May 2014 07:20:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 26 May 2014 11:20:00 +0400
Message-Id: <1401088811-22923-13-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [Qemu-trivial] [PULL 12/23] vl: fix 'name' option to work with
	-readconfig
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
X-List-Received-Date: Mon, 26 May 2014 07:57:28 -0000

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The 'name' option silently failed when used in config files
( http://lists.gnu.org/archive/html/qemu-devel/2014-04/msg00378.html )

-readconfig stores the configuration read in QemuOpts.  Command line
option parsing should do the same, and no more.  In particular it should
not act upon the option.  That needs to be done separately, where both
command line and -readconfig settings are visible in QemuOpts.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reported-by: William Dauchy <william@gandi.net>
Tested-by: William Dauchy <william@gandi.net>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
(mjt: added commit message by ambru@ and subject prefix)
---
 vl.c |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/vl.c b/vl.c
index 709d8cd..99b6fc0 100644
--- a/vl.c
+++ b/vl.c
@@ -965,7 +965,7 @@ static int parse_sandbox(QemuOpts *opts, void *opaque)
     return 0;
 }
 
-static void parse_name(QemuOpts *opts)
+static int parse_name(QemuOpts *opts, void *opaque)
 {
     const char *proc_name;
 
@@ -978,6 +978,8 @@ static void parse_name(QemuOpts *opts)
     if (proc_name) {
         os_set_proc_name(proc_name);
     }
+
+    return 0;
 }
 
 bool usb_enabled(bool default_usb)
@@ -3796,7 +3798,6 @@ int main(int argc, char **argv, char **envp)
                 if (!opts) {
                     exit(1);
                 }
-                parse_name(opts);
                 break;
             case QEMU_OPTION_prom_env:
                 if (nb_prom_envs >= MAX_PROM_ENVS) {
@@ -3971,6 +3972,10 @@ int main(int argc, char **argv, char **envp)
         exit(1);
     }
 
+    if (qemu_opts_foreach(qemu_find_opts("name"), parse_name, NULL, 1)) {
+        exit(1);
+    }
+
 #ifndef _WIN32
     if (qemu_opts_foreach(qemu_find_opts("add-fd"), parse_add_fd, NULL, 1)) {
         exit(1);
-- 
1.7.10.4


