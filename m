Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7GoA-0001Va-PJ
	for mharc-qemu-trivial@gnu.org; Sun, 07 May 2017 03:40:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d7Go3-0001Qp-W8
	for qemu-trivial@nongnu.org; Sun, 07 May 2017 03:40:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d7Go2-000749-Sc
	for qemu-trivial@nongnu.org; Sun, 07 May 2017 03:40:40 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52571)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1d7Gny-00072O-V4; Sun, 07 May 2017 03:40:35 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id AB56A40483;
	Sun,  7 May 2017 10:40:32 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 157A1435;
	Sun,  7 May 2017 10:02:31 +0300 (MSK)
Received: (nullmailer pid 26571 invoked by uid 1000);
	Sun, 07 May 2017 07:02:29 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Chris Webb <chris@arachsys.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  7 May 2017 10:02:19 +0300
Message-Id: <5e78979d471f1fd49217155d4c6481c585c51ff1.1494140528.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 16/23] virtfs: allow a device id to be
 specified in the -virtfs option
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
X-List-Received-Date: Sun, 07 May 2017 07:40:41 -0000

From: Chris Webb <chris@arachsys.com>

When using a virtfs root filesystem, the mount_tag needs to be set to
/dev/root. This can be done long-hand as

  -fsdev local,id=root,path=/path/to/rootfs,...
  -device virtio-9p-pci,fsdev=root,mount_tag=/dev/root

but the -virtfs shortcut cannot be used as it hard-codes the device identifier
to match the mount_tag, and device identifiers may not contain '/':

  $ qemu-system-x86_64 -virtfs local,path=/foo,mount_tag=/dev/root,security_model=passthrough
  qemu-system-x86_64: -virtfs local,path=/foo,mount_tag=/dev/root,security_model=passthrough: duplicate fsdev id: /dev/root

To support this case using -virtfs, we allow the device identifier to be
specified explicitly when the mount_tag is not suitable:

  -virtfs local,id=root,path=/path/to/rootfs,mount_tag=/dev/root,...

Signed-off-by: Chris Webb <chris@arachsys.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-options.hx | 2 +-
 vl.c            | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index a24fef2107..a5b0589cb7 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -876,7 +876,7 @@ ETEXI
 
 DEF("virtfs", HAS_ARG, QEMU_OPTION_virtfs,
     "-virtfs local,path=path,mount_tag=tag,security_model=[mapped-xattr|mapped-file|passthrough|none]\n"
-    "        [,writeout=immediate][,readonly][,socket=socket|sock_fd=sock_fd]\n",
+    "        [,id=id][,writeout=immediate][,readonly][,socket=socket|sock_fd=sock_fd]\n",
     QEMU_ARCH_ALL)
 
 STEXI
diff --git a/vl.c b/vl.c
index 42d4bce439..10f3afd860 100644
--- a/vl.c
+++ b/vl.c
@@ -3524,10 +3524,11 @@ int main(int argc, char **argv, char **envp)
                     exit(1);
                 }
                 fsdev = qemu_opts_create(qemu_find_opts("fsdev"),
+                                         qemu_opts_id(opts) ?:
                                          qemu_opt_get(opts, "mount_tag"),
                                          1, NULL);
                 if (!fsdev) {
-                    error_report("duplicate fsdev id: %s",
+                    error_report("duplicate or invalid fsdev id: %s",
                                  qemu_opt_get(opts, "mount_tag"));
                     exit(1);
                 }
@@ -3565,7 +3566,7 @@ int main(int argc, char **argv, char **envp)
                                           &error_abort);
                 qemu_opt_set(device, "driver", "virtio-9p-pci", &error_abort);
                 qemu_opt_set(device, "fsdev",
-                             qemu_opt_get(opts, "mount_tag"), &error_abort);
+                             qemu_opts_id(fsdev), &error_abort);
                 qemu_opt_set(device, "mount_tag",
                              qemu_opt_get(opts, "mount_tag"), &error_abort);
                 break;
-- 
2.11.0


