Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIYbI-0004A9-Fb
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jan 2016 04:17:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIYbF-000457-Nd
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 04:17:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIYbE-0000Iy-Ne
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 04:17:17 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:36442)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aIYb8-0000GK-Np; Mon, 11 Jan 2016 04:17:11 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 635B340404;
	Mon, 11 Jan 2016 12:17:08 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 1765EAD1;
	Mon, 11 Jan 2016 11:42:01 +0300 (MSK)
Received: (nullmailer pid 28785 invoked by uid 1000);
	Mon, 11 Jan 2016 08:41:59 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 11 Jan 2016 11:41:49 +0300
Message-Id: <9763af08f816cdd6f329cde1c97597a0041998f5.1452501577.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1452501577.git.mjt@msgid.tls.msk.ru>
References: <cover.1452501577.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Johan Ouwerkerk <jm.ouwerkerk@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 10/19] Add missing syscall nrs. according to
	more recent Linux kernels
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
X-List-Received-Date: Mon, 11 Jan 2016 09:17:19 -0000

From: Johan Ouwerkerk <jm.ouwerkerk@gmail.com>

This change covers arm, aarch64, mips. Others to follow?

The change was prompted by QEMU warning about a syscall 384 (get_random())
with Debian armhf binaries (ARMv7).

Signed-off-by: Johan Ouwerkerk <jm.ouwerkerk@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 linux-user/aarch64/syscall_nr.h | 13 +++++++++++++
 linux-user/arm/syscall_nr.h     | 12 ++++++++++++
 linux-user/mips/syscall_nr.h    | 12 ++++++++++++
 3 files changed, 37 insertions(+)

diff --git a/linux-user/aarch64/syscall_nr.h b/linux-user/aarch64/syscall_nr.h
index 743255d..74f4275 100644
--- a/linux-user/aarch64/syscall_nr.h
+++ b/linux-user/aarch64/syscall_nr.h
@@ -262,6 +262,19 @@
 #define TARGET_NR_process_vm_writev 271
 #define TARGET_NR_kcmp 272
 #define TARGET_NR_finit_module 273
+
+#define TARGET_NR_sched_setattr 274
+#define TARGET_NR_sched_getattr 275
+#define TARGET_NR_renameat2 276
+#define TARGET_NR_seccomp 277
+#define TARGET_NR_getrandom 278
+#define TARGET_NR_memfd_create 279
+#define TARGET_NR_bpf 280
+#define TARGET_NR_execveat 281
+#define TARGET_NR_userfaultfd 282
+#define TARGET_NR_membarrier 283
+#define TARGET_NR_mlock2 284
+
 #define TARGET_NR_open 1024
 #define TARGET_NR_link 1025
 #define TARGET_NR_unlink 1026
diff --git a/linux-user/arm/syscall_nr.h b/linux-user/arm/syscall_nr.h
index 53552be..cc9089c 100644
--- a/linux-user/arm/syscall_nr.h
+++ b/linux-user/arm/syscall_nr.h
@@ -384,3 +384,15 @@
 #define TARGET_NR_process_vm_writev            (377)
 #define TARGET_NR_kcmp                         (378)
 #define TARGET_NR_finit_module                 (379)
+
+#define TARGET_NR_sched_setattr                (380)
+#define TARGET_NR_sched_getattr                (381)
+#define TARGET_NR_renameat2                    (382)
+#define TARGET_NR_seccomp                      (383)
+#define TARGET_NR_getrandom                    (384)
+#define TARGET_NR_memfd_create                 (385)
+#define TARGET_NR_bpf                          (386)
+#define TARGET_NR_execveat                     (387)
+#define TARGET_NR_userfaultfd                  (388)
+#define TARGET_NR_membarrier                   (389)
+#define TARGET_NR_mlock2                       (390)
diff --git a/linux-user/mips/syscall_nr.h b/linux-user/mips/syscall_nr.h
index 2d1a13e..6819f86 100644
--- a/linux-user/mips/syscall_nr.h
+++ b/linux-user/mips/syscall_nr.h
@@ -351,3 +351,15 @@
 #define TARGET_NR_process_vm_writev     (TARGET_NR_Linux + 346)
 #define TARGET_NR_kcmp                  (TARGET_NR_Linux + 347)
 #define TARGET_NR_finit_module          (TARGET_NR_Linux + 348)
+
+#define TARGET_NR_sched_setattr         (TARGET_NR_Linux + 349)
+#define TARGET_NR_sched_getattr         (TARGET_NR_Linux + 350)
+#define TARGET_NR_renameat2             (TARGET_NR_Linux + 351)
+#define TARGET_NR_seccomp               (TARGET_NR_Linux + 352)
+#define TARGET_NR_getrandom             (TARGET_NR_Linux + 353)
+#define TARGET_NR_memfd_create          (TARGET_NR_Linux + 354)
+#define TARGET_NR_bpf                   (TARGET_NR_Linux + 355)
+#define TARGET_NR_execveat              (TARGET_NR_Linux + 356)
+#define TARGET_NR_userfaultfd           (TARGET_NR_Linux + 357)
+#define TARGET_NR_membarrier            (TARGET_NR_Linux + 358)
+#define TARGET_NR_mlock2                (TARGET_NR_Linux + 359)
-- 
2.1.4


