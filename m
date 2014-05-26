Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WopJm-0003zN-QA
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2014 03:27:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45488)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WopJg-0003lg-3M
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:27:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WopJb-0000qi-4v
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:27:28 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48637)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WopJO-0000nO-MJ; Mon, 26 May 2014 03:27:11 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9832942FA6;
	Mon, 26 May 2014 11:27:09 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id D99366B9;
	Mon, 26 May 2014 11:20:15 +0400 (MSK)
Received: (nullmailer pid 23035 invoked by uid 1000);
	Mon, 26 May 2014 07:20:14 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 26 May 2014 11:20:09 +0400
Message-Id: <1401088811-22923-22-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Le Tan <tamlokveer@gmail.com>
Subject: [Qemu-trivial] [PULL 21/23] bsd-user: replace fprintf(stderr,
	...) with error_report()
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
X-List-Received-Date: Mon, 26 May 2014 07:27:33 -0000

From: Le Tan <tamlokveer@gmail.com>

Replace fprintf(stderr,...) with error_report() in files bsd-user/*.
The trailing "\n"s of the @fmt argument have been removed
because @fmt of error_report() should not contain newline.

Signed-off-by: Le Tan <tamlokveer@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 bsd-user/bsdload.c |    2 +-
 bsd-user/elfload.c |    2 +-
 bsd-user/main.c    |   14 +++++++-------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/bsd-user/bsdload.c b/bsd-user/bsdload.c
index 2abc713..6b52e08 100644
--- a/bsd-user/bsdload.c
+++ b/bsd-user/bsdload.c
@@ -183,7 +183,7 @@ int loader_exec(const char * filename, char ** argv, char ** envp,
                 && bprm.buf[3] == 'F') {
             retval = load_elf_binary(&bprm,regs,infop);
         } else {
-            fprintf(stderr, "Unknown binary format\n");
+            error_report("Unknown binary format");
             return -1;
         }
     }
diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index 93fd9e4..95652b1 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -628,7 +628,7 @@ static abi_ulong copy_elf_strings(int argc,char ** argv, void **page,
     while (argc-- > 0) {
         tmp = argv[argc];
         if (!tmp) {
-            fprintf(stderr, "VFS: argc is wrong");
+            error_report("VFS: argc is wrong");
             exit(-1);
         }
         tmp1 = tmp;
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 4ba61da..de74d17 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -378,8 +378,8 @@ void cpu_loop(CPUX86State *env)
 #endif
         default:
             pc = env->segs[R_CS].base + env->eip;
-            fprintf(stderr, "qemu: 0x%08lx: unhandled CPU exception 0x%x - aborting\n",
-                    (long)pc, trapnr);
+            error_report("qemu: 0x%08lx: unhandled CPU exception 0x%x"
+                         " - aborting", (long)pc, trapnr);
             abort();
         }
         process_pending_signals(env);
@@ -752,7 +752,7 @@ int main(int argc, char **argv)
     module_call_init(MODULE_INIT_QOM);
 
     if ((envlist = envlist_create()) == NULL) {
-        (void) fprintf(stderr, "Unable to allocate envlist\n");
+        error_report("Unable to allocate envlist");
         exit(1);
     }
 
@@ -794,7 +794,7 @@ int main(int argc, char **argv)
         } else if (!strcmp(r, "ignore-environment")) {
             envlist_free(envlist);
             if ((envlist = envlist_create()) == NULL) {
-                (void) fprintf(stderr, "Unable to allocate envlist\n");
+                error_report("Unable to allocate envlist");
                 exit(1);
             }
         } else if (!strcmp(r, "U")) {
@@ -816,7 +816,7 @@ int main(int argc, char **argv)
             qemu_host_page_size = atoi(argv[optind++]);
             if (qemu_host_page_size == 0 ||
                 (qemu_host_page_size & (qemu_host_page_size - 1)) != 0) {
-                fprintf(stderr, "page size must be a power of two\n");
+                error_report("page size must be a power of two");
                 exit(1);
             }
         } else if (!strcmp(r, "g")) {
@@ -910,7 +910,7 @@ int main(int argc, char **argv)
        qemu_host_page_size */
     env = cpu_init(cpu_model);
     if (!env) {
-        fprintf(stderr, "Unable to find CPU definition\n");
+        error_report("Unable to find CPU definition");
         exit(1);
     }
     cpu = ENV_GET_CPU(env);
@@ -1012,7 +1012,7 @@ int main(int argc, char **argv)
 #ifndef TARGET_ABI32
     /* enable 64 bit mode if possible */
     if (!(env->features[FEAT_8000_0001_EDX] & CPUID_EXT2_LM)) {
-        fprintf(stderr, "The selected x86 CPU does not support 64 bit mode\n");
+        error_report("The selected x86 CPU does not support 64 bit mode");
         exit(1);
     }
     env->cr[4] |= CR4_PAE_MASK;
-- 
1.7.10.4


