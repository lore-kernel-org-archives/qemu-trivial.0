Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aCTPO-000218-Mt
	for mharc-qemu-trivial@gnu.org; Fri, 25 Dec 2015 09:31:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58740)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jm.ouwerkerk@gmail.com>) id 1aCEQ6-0008N2-Cz
	for qemu-trivial@nongnu.org; Thu, 24 Dec 2015 17:31:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jm.ouwerkerk@gmail.com>) id 1aCEQ5-0003Yw-1g
	for qemu-trivial@nongnu.org; Thu, 24 Dec 2015 17:31:38 -0500
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:35850)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jm.ouwerkerk@gmail.com>)
	id 1aCEQ0-0003Y5-L2; Thu, 24 Dec 2015 17:31:32 -0500
Received: by mail-wm0-x242.google.com with SMTP id l65so14089081wmf.3;
	Thu, 24 Dec 2015 14:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=9xdbok/h4b4MRqIEm02nCyL8fkO3OmUb46yJ3Jpj+qs=;
	b=dXjwKnGplpI3vQFYQH0BTPk28Isv9eHHcsJ+BCgxbwzyZR6C2Ckxn193N1XJ0corLG
	Ns/MVrFETyWNXFKR7bozGF+iKrOXJiu36LUENGGv8guzN3GOiARbrE71saNetzL+AoYq
	xsXShlOc41JJpz6kHK49P1k2ymQqnny5qpJ6X57vl0T3GTVVpWfFysQvpiLWU813NaBO
	IeTee8s/2G9Gyxu8J/mznAK8Dp+Ffqp7BlnoXCk29MFHObmfxMoS7y1CBgVDxAyCFW1J
	rRI1c2ImPdTQ2W1orWM0z14gUB9TmTXVDcb4PJsS3uEDd1is80Q/8MjwvPMPlLmbb6YD
	d1GA==
X-Received: by 10.194.112.130 with SMTP id iq2mr29661929wjb.102.1450996291917; 
	Thu, 24 Dec 2015 14:31:31 -0800 (PST)
Received: from localhost.localdomain (g194109.upc-g.chello.nl. [80.57.194.109])
	by smtp.gmail.com with ESMTPSA id
	143sm34947937wmv.18.2015.12.24.14.31.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Dec 2015 14:31:31 -0800 (PST)
From: Johan Ouwerkerk <jm.ouwerkerk@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu, 24 Dec 2015 23:31:26 +0100
Message-Id: <1450996286-23127-1-git-send-email-jm.ouwerkerk@gmail.com>
X-Mailer: git-send-email 2.6.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::242
X-Mailman-Approved-At: Fri, 25 Dec 2015 09:31:53 -0500
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] Add missing syscall nrs. This updates the
	QEMU syscall tables to more recent Linux kernels.
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
X-List-Received-Date: Thu, 24 Dec 2015 22:31:39 -0000

This change covers arm, aarch64, mips. Others to follow?

The change was prompted by QEMU warning about a syscall 384 (get_random()) with Debian armhf binaries (ARMv7).

Signed-off-by: Johan Ouwerkerk <jm.ouwerkerk@gmail.com>
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
2.6.4


