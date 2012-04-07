Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SGQ09-0001vz-T6
	for mharc-qemu-trivial@gnu.org; Sat, 07 Apr 2012 03:24:01 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56370)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SGQ02-0001XN-2G
	for qemu-trivial@nongnu.org; Sat, 07 Apr 2012 03:23:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SGPzy-0008Is-UA
	for qemu-trivial@nongnu.org; Sat, 07 Apr 2012 03:23:53 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:38698)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1SGPzv-0008Hb-Be; Sat, 07 Apr 2012 03:23:47 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	D765A72800B3; Sat,  7 Apr 2012 09:23:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id urV-e5FnDpo8; Sat,  7 Apr 2012 09:23:45 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 5E9FB72800B5; Sat,  7 Apr 2012 09:23:45 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sat,  7 Apr 2012 09:23:37 +0200
Message-Id: <1333783419-7982-3-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.9
In-Reply-To: <1333783419-7982-1-git-send-email-sw@weilnetz.de>
References: <1333783419-7982-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: Anthony Liguori <aliguori@us.ibm.com>, qemu-trivial@nongnu.org,
	Stefan Weil <sw@weilnetz.de>, Alexander Graf <agraf@suse.de>,
	Blue Swirl <blauwirbel@gmail.com>, Richard Henderson <rth@twiddle.net>
Subject: [Qemu-trivial] [PATCH 2/4] Replace Qemu by QEMU in internal
	documentation
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
X-List-Received-Date: Sat, 07 Apr 2012 07:23:56 -0000

The official spelling is QEMU.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 CODING_STYLE                       |    2 +-
 docs/ccid.txt                      |    2 +-
 docs/specs/ivshmem_device_spec.txt |    2 +-
 target-alpha/STATUS                |    2 +-
 target-mips/TODO                   |    4 ++--
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/CODING_STYLE b/CODING_STYLE
index 7c82d4d..dcbce28 100644
--- a/CODING_STYLE
+++ b/CODING_STYLE
@@ -1,4 +1,4 @@
-Qemu Coding Style
+QEMU Coding Style
 =================
 
 Please use the script checkpatch.pl in the scripts directory to check
diff --git a/docs/ccid.txt b/docs/ccid.txt
index b8e504a..450a66a 100644
--- a/docs/ccid.txt
+++ b/docs/ccid.txt
@@ -1,4 +1,4 @@
-Qemu CCID Device Documentation.
+QEMU CCID Device Documentation.
 
 Contents
 1. USB CCID device
diff --git a/docs/specs/ivshmem_device_spec.txt b/docs/specs/ivshmem_device_spec.txt
index 23dd2ba..667a862 100644
--- a/docs/specs/ivshmem_device_spec.txt
+++ b/docs/specs/ivshmem_device_spec.txt
@@ -24,7 +24,7 @@ The device currently supports 4 registers of 32-bits each.  Registers
 are used for synchronization between guests sharing the same memory object when
 interrupts are supported (this requires using the shared memory server).
 
-The server assigns each VM an ID number and sends this ID number to the Qemu
+The server assigns each VM an ID number and sends this ID number to the QEMU
 process when the guest starts.
 
 enum ivshmem_registers {
diff --git a/target-alpha/STATUS b/target-alpha/STATUS
index 742e370..6c97445 100644
--- a/target-alpha/STATUS
+++ b/target-alpha/STATUS
@@ -4,7 +4,7 @@ Alpha emulation structure:
 cpu.h           : CPU definitions globally exported
 exec.h          : CPU definitions used only for translated code execution
 helper.c        : helpers that can be called either by the translated code
-                  or the Qemu core, including the exception handler.
+                  or the QEMU core, including the exception handler.
 op_helper.c     : helpers that can be called only from TCG
 helper.h        : TCG helpers prototypes
 translate.c     : Alpha instructions to micro-operations translator
diff --git a/target-mips/TODO b/target-mips/TODO
index 9101881..2a3546f 100644
--- a/target-mips/TODO
+++ b/target-mips/TODO
@@ -16,7 +16,7 @@ General
   Existing documentation is x86-centric.
 - Reverse endianness bit not implemented
 - The TLB emulation is very inefficient:
-  Qemu's softmmu implements a x86-style MMU, with separate entries
+  QEMU's softmmu implements a x86-style MMU, with separate entries
   for read/write/execute, a TLB index which is just a modulo of the
   virtual address, and a set of TLBs for each user/kernel/supervisor
   MMU mode.
@@ -25,7 +25,7 @@ General
   up to 256 ASID tags as additional matching criterion (which roughly
   equates to 256 MMU modes). It also has a global flag which causes
   entries to match regardless of ASID.
-  To cope with these differences, Qemu currently flushes the TLB at
+  To cope with these differences, QEMU currently flushes the TLB at
   each ASID change. Using the MMU modes to implement ASIDs hinges on
   implementing the global bit efficiently.
 - save/restore of the CPU state is not implemented (see machine.c).
-- 
1.7.9


