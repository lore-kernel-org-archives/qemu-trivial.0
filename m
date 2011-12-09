Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RZ9lJ-0006Pg-PQ
	for mharc-qemu-trivial@gnu.org; Fri, 09 Dec 2011 18:21:53 -0500
Received: from eggs.gnu.org ([140.186.70.92]:48351)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RZ9lG-0006By-3a
	for qemu-trivial@nongnu.org; Fri, 09 Dec 2011 18:21:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RZ9lE-0000jg-Gi
	for qemu-trivial@nongnu.org; Fri, 09 Dec 2011 18:21:50 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:46815)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1RZ9lB-0000j6-0y; Fri, 09 Dec 2011 18:21:45 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	92F6B728188B; Sat, 10 Dec 2011 00:21:34 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id kK+cChHxNtKN; Sat, 10 Dec 2011 00:21:13 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id D2F397281C26; Sat, 10 Dec 2011 00:20:00 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sat, 10 Dec 2011 00:19:46 +0100
Message-Id: <1323472786-26821-7-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1323472786-26821-1-git-send-email-sw@weilnetz.de>
References: <1323472786-26821-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH 6/6] Fix spelling in comments,
	documentation and messages
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
X-List-Received-Date: Fri, 09 Dec 2011 23:21:52 -0000

accidently->accidentally
annother->another
choosen->chosen
consideres->considers
decriptor->descriptor
developement->development
paramter->parameter
preceed->precede
preceeding->preceding
priviledge->privilege
propogation->propagation
substraction->subtraction
throught->through
upto->up to
usefull->useful

Fix also grammar in posix-aio-compat.c

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 Changelog                     |    4 ++--
 audio/audio.c                 |    2 +-
 block.h                       |    2 +-
 bsd-user/x86_64/syscall.h     |    2 +-
 gdbstub.c                     |    2 +-
 linux-user/x86_64/syscall.h   |    2 +-
 pc-bios/ohw.diff              |    2 +-
 pc-bios/optionrom/multiboot.S |    2 +-
 posix-aio-compat.c            |    4 ++--
 qapi-schema-guest.json        |    2 +-
 qemu-options.hx               |    2 +-
 qerror.c                      |    2 +-
 scripts/checkpatch.pl         |    4 ++--
 target-mips/helper.c          |    2 +-
 target-s390x/cpu.h            |    8 ++++----
 ui/vnc-enc-zywrle-template.c  |    2 +-
 ui/vnc-enc-zywrle.h           |    2 +-
 17 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/Changelog b/Changelog
index 28a69af..8b63258 100644
--- a/Changelog
+++ b/Changelog
@@ -78,7 +78,7 @@ version 0.10.2:
 
   - fix savevm/loadvm (Anthony Liguori)
   - live migration: fix dirty tracking windows (Glauber Costa)
-  - live migration: improve error propogation (Glauber Costa)
+  - live migration: improve error propagation (Glauber Costa)
   - qcow2: fix image creation for > ~2TB images (Chris Wright)
   - hotplug: fix error handling for if= parameter (Eduardo Habkost)
   - qcow2: fix data corruption (Nolan Leake)
@@ -386,7 +386,7 @@ version 0.5.3:
   - support of CD-ROM change
   - multiple network interface support
   - initial x86-64 host support (Gwenole Beauchesne)
-  - lret to outer priviledge fix (OS/2 install fix)
+  - lret to outer privilege fix (OS/2 install fix)
   - task switch fixes (SkyOS boot)
   - VM save/restore commands
   - new timer API
diff --git a/audio/audio.c b/audio/audio.c
index 50d0d71..5fff6de 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1665,7 +1665,7 @@ static void audio_pp_nb_voices (const char *typ, int nb)
         printf ("Theoretically supports many %s voices\n", typ);
         break;
     default:
-        printf ("Theoretically supports upto %d %s voices\n", nb, typ);
+        printf ("Theoretically supports up to %d %s voices\n", nb, typ);
         break;
     }
 
diff --git a/block.h b/block.h
index 1790f99..0e3ff9f 100644
--- a/block.h
+++ b/block.h
@@ -21,7 +21,7 @@ typedef struct QEMUSnapshotInfo {
     char id_str[128]; /* unique snapshot id */
     /* the following fields are informative. They are not needed for
        the consistency of the snapshot */
-    char name[256]; /* user choosen name */
+    char name[256]; /* user chosen name */
     uint32_t vm_state_size; /* VM state info size */
     uint32_t date_sec; /* UTC date of the snapshot */
     uint32_t date_nsec;
diff --git a/bsd-user/x86_64/syscall.h b/bsd-user/x86_64/syscall.h
index 5f71b7c..630514a 100644
--- a/bsd-user/x86_64/syscall.h
+++ b/bsd-user/x86_64/syscall.h
@@ -8,7 +8,7 @@ struct target_pt_regs {
 	abi_ulong r12;
 	abi_ulong rbp;
 	abi_ulong rbx;
-/* arguments: non interrupts/non tracing syscalls only save upto here*/
+/* arguments: non interrupts/non tracing syscalls only save up to here */
  	abi_ulong r11;
 	abi_ulong r10;
 	abi_ulong r9;
diff --git a/gdbstub.c b/gdbstub.c
index 640cf4e..a5806ef 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -2678,7 +2678,7 @@ gdb_handlesig (CPUState *env, int sig)
         }
       else if (n == 0 || errno != EAGAIN)
         {
-          /* XXX: Connection closed.  Should probably wait for annother
+          /* XXX: Connection closed.  Should probably wait for another
              connection before continuing.  */
           return sig;
         }
diff --git a/linux-user/x86_64/syscall.h b/linux-user/x86_64/syscall.h
index 2a8d696..81314cf 100644
--- a/linux-user/x86_64/syscall.h
+++ b/linux-user/x86_64/syscall.h
@@ -8,7 +8,7 @@ struct target_pt_regs {
 	abi_ulong r12;
 	abi_ulong rbp;
 	abi_ulong rbx;
-/* arguments: non interrupts/non tracing syscalls only save upto here*/
+/* arguments: non interrupts/non tracing syscalls only save up to here */
  	abi_ulong r11;
 	abi_ulong r10;
 	abi_ulong r9;
diff --git a/pc-bios/ohw.diff b/pc-bios/ohw.diff
index 4fb5422..c6b6623 100644
--- a/pc-bios/ohw.diff
+++ b/pc-bios/ohw.diff
@@ -1065,7 +1065,7 @@ diff -wruN --exclude '*~' --exclude '*.o' --exclude '*.bin' --exclude '*.out' --
 +                        tab, 4 * sizeof(uint32_t));
 +    }
 +#if 0
-     /* escc is usefull to get MacOS X debug messages */
+     /* escc is useful to get MacOS X debug messages */
      {
          OF_regprop_t regs[8];
 @@ -2645,85 +2843,12 @@
diff --git a/pc-bios/optionrom/multiboot.S b/pc-bios/optionrom/multiboot.S
index cc5ca1b..f08222a 100644
--- a/pc-bios/optionrom/multiboot.S
+++ b/pc-bios/optionrom/multiboot.S
@@ -50,7 +50,7 @@ run_multiboot:
 	shr		$0x4, %ecx
 	mov		%cx, %gs
 
-	/* now push the indirect jump decriptor there */
+	/* now push the indirect jump descriptor there */
 	mov		(prot_jump), %ebx
 	add		%eax, %ebx
 	movl		%ebx, %gs:GS_PROT_JUMP
diff --git a/posix-aio-compat.c b/posix-aio-compat.c
index 0c0035c..c380ec1 100644
--- a/posix-aio-compat.c
+++ b/posix-aio-compat.c
@@ -128,8 +128,8 @@ static ssize_t handle_aiocb_ioctl(struct qemu_paiocb *aiocb)
         return -errno;
 
     /*
-     * This looks weird, but the aio code only consideres a request
-     * successful if it has written the number full number of bytes.
+     * This looks weird, but the aio code only considers a request
+     * successful if it has written the full number of bytes.
      *
      * Now we overload aio_nbytes as aio_ioctl_cmd for the ioctl command,
      * so in fact we return the ioctl command here to make posix_aio_read()
diff --git a/qapi-schema-guest.json b/qapi-schema-guest.json
index fde5971..f4bcd1a 100644
--- a/qapi-schema-guest.json
+++ b/qapi-schema-guest.json
@@ -13,7 +13,7 @@
 # partially-delivered JSON text in such a way that this response
 # can be obtained.
 #
-# Such clients should also preceed this command
+# Such clients should also precede this command
 # with a 0xFF byte to make such the guest agent flushes any
 # partially read JSON data from a previous session.
 #
diff --git a/qemu-options.hx b/qemu-options.hx
index b3db10c..087a3b9 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -217,7 +217,7 @@ qcow2.  If performance is more important than correctness,
 In case you don't care about data integrity over host failures, use
 cache=unsafe. This option tells qemu that it never needs to write any data
 to the disk but can instead keeps things in cache. If anything goes wrong,
-like your host losing power, the disk storage getting disconnected accidently,
+like your host losing power, the disk storage getting disconnected accidentally,
 etc. you're image will most probably be rendered unusable.   When using
 the @option{-snapshot} option, unsafe caching is always used.
 
diff --git a/qerror.c b/qerror.c
index 656efc2..d9ab396 100644
--- a/qerror.c
+++ b/qerror.c
@@ -253,7 +253,7 @@ static const QErrorStringTable qerror_table[] = {
     },
     {
         .error_fmt = QERR_INVALID_PARAMETER_COMBINATION,
-        .desc      = "Invalid paramter combination",
+        .desc      = "Invalid parameter combination",
     },
     {}
 };
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index cce8f86..8850a5f 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1907,7 +1907,7 @@ sub process {
 			my $ok = 0;
 			for (my $ln = $linenr - 1; $ln >= $first_line; $ln--) {
 				#print "CHECK<$lines[$ln - 1]\n";
-				# we have a preceeding printk if it ends
+				# we have a preceding printk if it ends
 				# with "\n" ignore it, else it is to blame
 				if ($lines[$ln - 1] =~ m{\bprintk\(}) {
 					if ($rawlines[$ln - 1] !~ m{\\n"}) {
@@ -1999,7 +1999,7 @@ sub process {
 			for (my $n = 0; $n < $#elements; $n += 2) {
 				$off += length($elements[$n]);
 
-				# Pick up the preceeding and succeeding characters.
+				# Pick up the preceding and succeeding characters.
 				my $ca = substr($opline, 0, $off);
 				my $cc = '';
 				if (length($opline) >= ($off + length($elements[$n + 1]))) {
diff --git a/target-mips/helper.c b/target-mips/helper.c
index 1c58e0c..7225616 100644
--- a/target-mips/helper.c
+++ b/target-mips/helper.c
@@ -497,7 +497,7 @@ void do_interrupt (CPUState *env)
                 }
             } else {
                 /* For VEIC mode, the external interrupt controller feeds the
-                   vector throught the CP0Cause IP lines.  */
+                   vector through the CP0Cause IP lines.  */
                 vector = pending;
             }
             offset = 0x200 + vector * spacing;
diff --git a/target-s390x/cpu.h b/target-s390x/cpu.h
index 202c098..b8893b3 100644
--- a/target-s390x/cpu.h
+++ b/target-s390x/cpu.h
@@ -513,15 +513,15 @@ enum cc_op {
 
     CC_OP_ADD_64,               /* overflow on add (64bit) */
     CC_OP_ADDU_64,              /* overflow on unsigned add (64bit) */
-    CC_OP_SUB_64,               /* overflow on substraction (64bit) */
-    CC_OP_SUBU_64,              /* overflow on unsigned substraction (64bit) */
+    CC_OP_SUB_64,               /* overflow on subtraction (64bit) */
+    CC_OP_SUBU_64,              /* overflow on unsigned subtraction (64bit) */
     CC_OP_ABS_64,               /* sign eval on abs (64bit) */
     CC_OP_NABS_64,              /* sign eval on nabs (64bit) */
 
     CC_OP_ADD_32,               /* overflow on add (32bit) */
     CC_OP_ADDU_32,              /* overflow on unsigned add (32bit) */
-    CC_OP_SUB_32,               /* overflow on substraction (32bit) */
-    CC_OP_SUBU_32,              /* overflow on unsigned substraction (32bit) */
+    CC_OP_SUB_32,               /* overflow on subtraction (32bit) */
+    CC_OP_SUBU_32,              /* overflow on unsigned subtraction (32bit) */
     CC_OP_ABS_32,               /* sign eval on abs (64bit) */
     CC_OP_NABS_32,              /* sign eval on nabs (64bit) */
 
diff --git a/ui/vnc-enc-zywrle-template.c b/ui/vnc-enc-zywrle-template.c
index 4cde6e4..561f7bf 100644
--- a/ui/vnc-enc-zywrle-template.c
+++ b/ui/vnc-enc-zywrle-template.c
@@ -9,7 +9,7 @@
  *                                                                  *
  * THE 'ZYWRLE' VNC CODEC SOURCE CODE IS (C) COPYRIGHT 2006         *
  * BY Hitachi Systems & Services, Ltd.                              *
- * (Noriaki Yamazaki, Research & Developement Center)               *
+ * (Noriaki Yamazaki, Research & Development Center)               *
  *                                                                  *
  *                                                                  *
  ********************************************************************
diff --git a/ui/vnc-enc-zywrle.h b/ui/vnc-enc-zywrle.h
index ac5d27a..1ff40b1 100644
--- a/ui/vnc-enc-zywrle.h
+++ b/ui/vnc-enc-zywrle.h
@@ -8,7 +8,7 @@
  *                                                                  *
  * THE 'ZYWRLE' VNC CODEC SOURCE CODE IS (C) COPYRIGHT 2006         *
  * BY Hitachi Systems & Services, Ltd.                              *
- * (Noriaki Yamazaki, Research & Developement Center)               *
+ * (Noriaki Yamazaki, Research & Development Center)               *
  *                                                                  *
  *                                                                  *
  ********************************************************************
-- 
1.7.2.5


