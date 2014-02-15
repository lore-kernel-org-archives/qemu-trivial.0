Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WEeIU-0007BR-4L
	for mharc-qemu-trivial@gnu.org; Sat, 15 Feb 2014 07:24:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48997)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WEeIN-0006xv-Dd
	for qemu-trivial@nongnu.org; Sat, 15 Feb 2014 07:24:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WEeII-0000Ci-Vx
	for qemu-trivial@nongnu.org; Sat, 15 Feb 2014 07:24:35 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:39454)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WEeI4-0000A2-Q9; Sat, 15 Feb 2014 07:24:17 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2A29D41C2A;
	Sat, 15 Feb 2014 16:24:16 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 5F29C643;
	Sat, 15 Feb 2014 16:18:23 +0400 (MSK)
Received: (nullmailer pid 21839 invoked by uid 1000);
	Sat, 15 Feb 2014 12:18:22 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat, 15 Feb 2014 16:18:19 +0400
Message-Id: <1392466700-21770-10-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1392466700-21770-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1392466700-21770-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 09/10] gitignore: anchor all ignored names
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
X-List-Received-Date: Sat, 15 Feb 2014 12:24:40 -0000

by default, patterns/names in .gitignore are applied
recursively to all subdirectories.  So any name mentioned
in .gitignore is ignored in all subdirectores.  This is good
for, say. object files (*.o), but not good for particular
names which should be ignored only in one directory.  For
example, qemu-img.1 file is generated in the top directory,
and it should be ignored only there, not in some subdir.

At first, this might not matter much, but we have lots of
examples already where it actually does not help at all.
For example, top-level .gitignore ignores a file/dir named
"patches" (which is very questionable by itself), but it
is applied recursively, so git also ignores, for example,
debian/patches/ which should not be ignored.

So anchor all the names where appropriate.  .gitignore
should be cleaned up further, which will be addressed in
a subsequent patch.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 .gitignore |  150 ++++++++++++++++++++++++++++++------------------------------
 1 file changed, 75 insertions(+), 75 deletions(-)

diff --git a/.gitignore b/.gitignore
index 1c9d63d..6e48b5e 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,64 +1,64 @@
-config-devices.*
-config-all-devices.*
-config-all-disas.*
-config-host.*
-config-target.*
-config.status
-trace/generated-tracers.h
-trace/generated-tracers.c
-trace/generated-tracers-dtrace.h
-trace/generated-tracers.dtrace
-trace/generated-events.h
-trace/generated-events.c
-libcacard/trace/generated-tracers.c
+/config-devices.*
+/config-all-devices.*
+/config-all-disas.*
+/config-host.*
+/config-target.*
+/config.status
+/trace/generated-tracers.h
+/trace/generated-tracers.c
+/trace/generated-tracers-dtrace.h
+/trace/generated-tracers.dtrace
+/trace/generated-events.h
+/trace/generated-events.c
+/libcacard/trace/generated-tracers.c
 *-timestamp
-*-softmmu
-*-darwin-user
-*-linux-user
-*-bsd-user
+/*-softmmu
+/*-darwin-user
+/*-linux-user
+/*-bsd-user
 libdis*
 libuser
-linux-headers/asm
-qapi-generated
-qapi-types.[ch]
-qapi-visit.[ch]
-qmp-commands.h
-qmp-marshal.c
-qemu-doc.html
-qemu-tech.html
-qemu-doc.info
-qemu-tech.info
-qemu.1
-qemu.pod
-qemu-img.1
-qemu-img.pod
-qemu-img
-qemu-nbd
-qemu-nbd.8
-qemu-nbd.pod
-qemu-options.def
-qemu-options.texi
-qemu-img-cmds.texi
-qemu-img-cmds.h
-qemu-io
-qemu-ga
-qemu-bridge-helper
-qemu-monitor.texi
-vscclient
-qmp-commands.txt
-test-bitops
-test-coroutine
-test-int128
-test-opts-visitor
-test-qmp-input-visitor
-test-qmp-output-visitor
-test-string-input-visitor
-test-string-output-visitor
-test-visitor-serialization
-fsdev/virtfs-proxy-helper
-fsdev/virtfs-proxy-helper.1
-fsdev/virtfs-proxy-helper.pod
-.gdbinit
+/linux-headers/asm
+/qapi-generated
+/qapi-types.[ch]
+/qapi-visit.[ch]
+/qmp-commands.h
+/qmp-marshal.c
+/qemu-doc.html
+/qemu-tech.html
+/qemu-doc.info
+/qemu-tech.info
+/qemu.1
+/qemu.pod
+/qemu-img.1
+/qemu-img.pod
+/qemu-img
+/qemu-nbd
+/qemu-nbd.8
+/qemu-nbd.pod
+/qemu-options.def
+/qemu-options.texi
+/qemu-img-cmds.texi
+/qemu-img-cmds.h
+/qemu-io
+/qemu-ga
+/qemu-bridge-helper
+/qemu-monitor.texi
+/qmp-commands.txt
+/vscclient
+/test-bitops
+/test-coroutine
+/test-int128
+/test-opts-visitor
+/test-qmp-input-visitor
+/test-qmp-output-visitor
+/test-string-input-visitor
+/test-string-output-visitor
+/test-visitor-serialization
+/fsdev/virtfs-proxy-helper
+/fsdev/virtfs-proxy-helper.1
+/fsdev/virtfs-proxy-helper.pod
+/.gdbinit
 *.a
 *.aux
 *.cp
@@ -77,7 +77,7 @@ fsdev/virtfs-proxy-helper.pod
 *.tp
 *.vr
 *.d
-!scripts/qemu-guest-agent/fsfreeze-hook.d
+!/scripts/qemu-guest-agent/fsfreeze-hook.d
 *.o
 *.lo
 *.la
@@ -90,22 +90,22 @@ fsdev/virtfs-proxy-helper.pod
 *.gcda
 *.gcno
 patches
-pc-bios/bios-pq/status
-pc-bios/vgabios-pq/status
-pc-bios/optionrom/linuxboot.asm
-pc-bios/optionrom/linuxboot.bin
-pc-bios/optionrom/linuxboot.raw
-pc-bios/optionrom/linuxboot.img
-pc-bios/optionrom/multiboot.asm
-pc-bios/optionrom/multiboot.bin
-pc-bios/optionrom/multiboot.raw
-pc-bios/optionrom/multiboot.img
-pc-bios/optionrom/kvmvapic.asm
-pc-bios/optionrom/kvmvapic.bin
-pc-bios/optionrom/kvmvapic.raw
-pc-bios/optionrom/kvmvapic.img
-pc-bios/s390-ccw/s390-ccw.elf
-pc-bios/s390-ccw/s390-ccw.img
+/pc-bios/bios-pq/status
+/pc-bios/vgabios-pq/status
+/pc-bios/optionrom/linuxboot.asm
+/pc-bios/optionrom/linuxboot.bin
+/pc-bios/optionrom/linuxboot.raw
+/pc-bios/optionrom/linuxboot.img
+/pc-bios/optionrom/multiboot.asm
+/pc-bios/optionrom/multiboot.bin
+/pc-bios/optionrom/multiboot.raw
+/pc-bios/optionrom/multiboot.img
+/pc-bios/optionrom/kvmvapic.asm
+/pc-bios/optionrom/kvmvapic.bin
+/pc-bios/optionrom/kvmvapic.raw
+/pc-bios/optionrom/kvmvapic.img
+/pc-bios/s390-ccw/s390-ccw.elf
+/pc-bios/s390-ccw/s390-ccw.img
 .stgit-*
 cscope.*
 tags
-- 
1.7.10.4


