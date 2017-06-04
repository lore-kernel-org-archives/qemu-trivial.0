Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dHXzM-00079V-H6
	for mharc-qemu-trivial@gnu.org; Sun, 04 Jun 2017 12:02:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35203)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHXzF-00073q-B5
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 12:02:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHXzE-0003zC-EH
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 12:02:41 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55677)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dHXz9-0003uR-ET; Sun, 04 Jun 2017 12:02:35 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 251EE404E5;
	Sun,  4 Jun 2017 19:02:34 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 45DBC5EC;
	Sun,  4 Jun 2017 18:45:29 +0300 (MSK)
Received: (nullmailer pid 16391 invoked by uid 1000);
	Sun, 04 Jun 2017 15:45:27 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Suraj Jitindar Singh <sjitindarsingh@gmail.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  4 Jun 2017 18:45:22 +0300
Message-Id: <f603164ae409d23e1fba012ded3b5dda33f9df5a.1496591095.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 18/22] help: Add newline to end of thread
 option help text
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 04 Jun 2017 16:02:43 -0000

From: Suraj Jitindar Singh <sjitindarsingh@gmail.com>

The help text for the thread sub option of the accel option is missing
a newline at the end. This is annoying as it makes it hard to see the
help text for the next option.

Add the new line so that the following option help text (-smp) is
displayed on a new line rather on the same line and directly after
the thread help.

Before patch:

-accel [accel=]accelerator[,thread=single|multi]
                select accelerator (kvm, xen, hax or tcg; use 'help' for a list)
                thread=single|multi (enable multi-threaded TCG)-smp [cpus=]n[,maxcpus=cpus][,cores=cores][,threads=threads][,sockets=sockets]
                set the number of CPUs to 'n' [default=1]
                maxcpus= maximum number of total cpus, including
                offline CPUs for hotplug, etc
                cores= number of CPU cores on one socket
                threads= number of threads on one CPU core
                sockets= number of discrete sockets in the system

After patch:

-accel [accel=]accelerator[,thread=single|multi]
                select accelerator (kvm, xen, hax or tcg; use 'help' for a list)
                thread=single|multi (enable multi-threaded TCG)
-smp [cpus=]n[,maxcpus=cpus][,cores=cores][,threads=threads][,sockets=sockets]
                set the number of CPUs to 'n' [default=1]
                maxcpus= maximum number of total cpus, including
                offline CPUs for hotplug, etc
                cores= number of CPU cores on one socket
                threads= number of threads on one CPU core
                sockets= number of discrete sockets in the system

Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 10995dc932..30c4f9850f 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -102,7 +102,7 @@ ETEXI
 DEF("accel", HAS_ARG, QEMU_OPTION_accel,
     "-accel [accel=]accelerator[,thread=single|multi]\n"
     "                select accelerator (kvm, xen, hax or tcg; use 'help' for a list)\n"
-    "                thread=single|multi (enable multi-threaded TCG)", QEMU_ARCH_ALL)
+    "                thread=single|multi (enable multi-threaded TCG)\n", QEMU_ARCH_ALL)
 STEXI
 @item -accel @var{name}[,prop=@var{value}[,...]]
 @findex -accel
-- 
2.11.0


