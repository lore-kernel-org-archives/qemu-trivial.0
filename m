Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wizjd-0003Kg-Mn
	for mharc-qemu-trivial@gnu.org; Sat, 10 May 2014 01:22:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37722)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>) id 1WiuaY-0003PX-2f
	for qemu-trivial@nongnu.org; Fri, 09 May 2014 19:52:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>) id 1WiuaP-0001O7-1H
	for qemu-trivial@nongnu.org; Fri, 09 May 2014 19:52:26 -0400
Received: from mail-pd0-x236.google.com ([2607:f8b0:400e:c02::236]:34429)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>)
	id 1Wiua6-0001H1-8S; Fri, 09 May 2014 19:51:58 -0400
Received: by mail-pd0-f182.google.com with SMTP id v10so4305332pde.27
	for <multiple recipients>; Fri, 09 May 2014 16:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=diOKjzDlSPiV7YboocUPCjtzAf9bdAHovRZop+MEdrU=;
	b=wRyLEqqLlCHfeLqgLkUs2f+weFvx21Wzh3ZKDlmayf3dsD60WyrmXxOkoENVYA2xC+
	QKldPJWEzvzCg9FwYDftnCGke+KLeLJJUrPrvOgG3nd2zawGlb6a7SUkFuwMQoqiYkCQ
	UlsDW91zZ0oWQbh2ZOOw/43zYVqv03BGEKNfNSTuv83eYx4sQI1tvZMBThK1b87ldtCQ
	svECuiX/VucNsqMjgLpYABu7KkCANdb9jzNDerxitamoWjqFIpeX8Ck7gmFD12BnQZ+b
	T3DkFajtUT5AgTLKDtEsYWOwopNNRgnCO6wPY5xS+AdoniGNFAhmzqzDVSpemdl5nQay
	W/6Q==
X-Received: by 10.66.141.144 with SMTP id ro16mr25524371pab.131.1399679517039; 
	Fri, 09 May 2014 16:51:57 -0700 (PDT)
Received: from localhost.localdomain ([162.105.146.101])
	by mx.google.com with ESMTPSA id op3sm9623456pbc.40.2014.05.09.16.51.54
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 09 May 2014 16:51:56 -0700 (PDT)
From: Le Tan <tamlokveer@gmail.com>
To: qemu-devel@nongnu.org
Date: Sat, 10 May 2014 07:55:22 +0800
Message-Id: <1d899df865235022831f0733c874dae9f0ba21ed.1399641611.git.tamlokveer@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1399641611.git.tamlokveer@gmail.com>
References: <y>
 <cover.1399641611.git.tamlokveer@gmail.com>
In-Reply-To: <cover.1399641611.git.tamlokveer@gmail.com>
References: <cover.1399641611.git.tamlokveer@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::236
X-Mailman-Approved-At: Sat, 10 May 2014 01:22:08 -0400
Cc: qemu-trivial@nongnu.org, jan.kiszka@web.de, afaerber@suse.de,
	Le Tan <tamlokveer@gmail.com>
Subject: [Qemu-trivial] [PATCH 4/4] bsd-user: replace fprintf(stderr,
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
X-List-Received-Date: Fri, 09 May 2014 23:52:35 -0000

Replace fprintf(stderr,...) with error_report() in files bsd-user/*.
The trailing "\n"s of the @fmt argument have been removed
because @fmt of error_report() should not contain newline.

Signed-off-by: Le Tan <tamlokveer@gmail.com>
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
index f81ba55..3825e76 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -378,8 +378,8 @@ void cpu_loop(CPUX86State *env)
 #endif
         default:
             pc = env->segs[R_CS].base + env->eip;
-            fprintf(stderr, "qemu: 0x%08lx: unhandled CPU exception 0x%x - aborting\n",
-                    (long)pc, trapnr);
+            error_report("qemu: 0x%08lx: unhandled CPU exception 0x%x - aborting",
+                         (long)pc, trapnr);
             abort();
         }
         process_pending_signals(env);
@@ -752,7 +752,7 @@ int main(int argc, char **argv)
     module_call_init(MODULE_INIT_QOM);
 
     if ((envlist = envlist_create()) == NULL) {
-        (void) fprintf(stderr, "Unable to allocate envlist\n");
+        (void) error_report("Unable to allocate envlist");
         exit(1);
     }
 
@@ -794,7 +794,7 @@ int main(int argc, char **argv)
         } else if (!strcmp(r, "ignore-environment")) {
             envlist_free(envlist);
             if ((envlist = envlist_create()) == NULL) {
-                (void) fprintf(stderr, "Unable to allocate envlist\n");
+                (void) error_report("Unable to allocate envlist");
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
@@ -1014,7 +1014,7 @@ int main(int argc, char **argv)
 #ifndef TARGET_ABI32
     /* enable 64 bit mode if possible */
     if (!(env->features[FEAT_8000_0001_EDX] & CPUID_EXT2_LM)) {
-        fprintf(stderr, "The selected x86 CPU does not support 64 bit mode\n");
+        error_report("The selected x86 CPU does not support 64 bit mode");
         exit(1);
     }
     env->cr[4] |= CR4_PAE_MASK;
-- 
1.7.9.5


