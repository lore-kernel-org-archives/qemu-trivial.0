Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wedo9-0000FP-2q
	for mharc-qemu-trivial@gnu.org; Mon, 28 Apr 2014 01:08:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48014)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wedo2-0008Tv-Cz
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 01:08:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wednx-0000og-UV
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 01:08:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58395)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Wednm-0000m3-AK; Mon, 28 Apr 2014 01:08:26 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B68EA43036;
	Mon, 28 Apr 2014 09:08:25 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 95D022B5;
	Mon, 28 Apr 2014 09:08:25 +0400 (MSK)
Received: (nullmailer pid 19132 invoked by uid 1000);
	Mon, 28 Apr 2014 05:08:25 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 28 Apr 2014 09:07:49 +0400
Message-Id: <1398661684-19059-4-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398661684-19059-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1398661684-19059-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-trivial] [PULL 03/18] vl: convert -m to QemuOpts
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
X-List-Received-Date: Mon, 28 Apr 2014 05:08:47 -0000

From: Igor Mammedov <imammedo@redhat.com>

Adds option to -m
 "size" - startup memory amount

For compatibility with legacy CLI if suffix-less number is passed,
it assumes amount in Mb.

Otherwise user is free to use suffixed number using suffixes b,k/K,M,G

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-options.hx |    9 ++++---
 vl.c            |   71 ++++++++++++++++++++++++++++++++++++++++++++-----=
------
 2 files changed, 63 insertions(+), 17 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 6457034..926349b 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -210,10 +210,13 @@ use is discouraged as it may be removed from future=
 versions.
 ETEXI
=20
 DEF("m", HAS_ARG, QEMU_OPTION_m,
-    "-m megs         set virtual RAM size to megs MB [default=3D"
-    stringify(DEFAULT_RAM_SIZE) "]\n", QEMU_ARCH_ALL)
+    "-m [size=3D]megs\n"
+    "                configure guest RAM\n"
+    "                size: initial amount of guest memory (default: "
+    stringify(DEFAULT_RAM_SIZE) "MiB)\n",
+    QEMU_ARCH_ALL)
 STEXI
-@item -m @var{megs}
+@item -m [size=3D]@var{megs}
 @findex -m
 Set virtual RAM size to @var{megs} megabytes. Default is 128 MiB.  Optio=
nally,
 a suffix of ``M'' or ``G'' can be used to signify a value in megabytes o=
r
diff --git a/vl.c b/vl.c
index 5aad3bc..d6c5df1 100644
--- a/vl.c
+++ b/vl.c
@@ -510,6 +510,20 @@ static QemuOptsList qemu_name_opts =3D {
     },
 };
=20
+static QemuOptsList qemu_mem_opts =3D {
+    .name =3D "memory",
+    .implied_opt_name =3D "size",
+    .head =3D QTAILQ_HEAD_INITIALIZER(qemu_mem_opts.head),
+    .merge_lists =3D true,
+    .desc =3D {
+        {
+            .name =3D "size",
+            .type =3D QEMU_OPT_SIZE,
+        },
+        { /* end of list */ }
+    },
+};
+
 /**
  * Get machine options
  *
@@ -2955,6 +2969,8 @@ int main(int argc, char **argv, char **envp)
     };
     const char *trace_events =3D NULL;
     const char *trace_file =3D NULL;
+    const ram_addr_t default_ram_size =3D (ram_addr_t)DEFAULT_RAM_SIZE *
+                                        1024 * 1024;
=20
     atexit(qemu_run_exit_notifiers);
     error_set_progname(argv[0]);
@@ -2978,6 +2994,7 @@ int main(int argc, char **argv, char **envp)
     qemu_add_opts(&qemu_trace_opts);
     qemu_add_opts(&qemu_option_rom_opts);
     qemu_add_opts(&qemu_machine_opts);
+    qemu_add_opts(&qemu_mem_opts);
     qemu_add_opts(&qemu_smp_opts);
     qemu_add_opts(&qemu_boot_opts);
     qemu_add_opts(&qemu_sandbox_opts);
@@ -3002,7 +3019,7 @@ int main(int argc, char **argv, char **envp)
     module_call_init(MODULE_INIT_MACHINE);
     machine_class =3D find_default_machine();
     cpu_model =3D NULL;
-    ram_size =3D 0;
+    ram_size =3D default_ram_size;
     snapshot =3D 0;
     cyls =3D heads =3D secs =3D 0;
     translation =3D BIOS_ATA_TRANSLATION_AUTO;
@@ -3289,20 +3306,48 @@ int main(int argc, char **argv, char **envp)
                 exit(0);
                 break;
             case QEMU_OPTION_m: {
-                int64_t value;
                 uint64_t sz;
-                char *end;
+                const char *mem_str;
=20
-                value =3D strtosz(optarg, &end);
-                if (value < 0 || *end) {
-                    fprintf(stderr, "qemu: invalid ram size: %s\n", opta=
rg);
-                    exit(1);
+                opts =3D qemu_opts_parse(qemu_find_opts("memory"),
+                                       optarg, 1);
+                if (!opts) {
+                    exit(EXIT_FAILURE);
+                }
+
+                mem_str =3D qemu_opt_get(opts, "size");
+                if (!mem_str) {
+                    error_report("invalid -m option, missing 'size' opti=
on");
+                    exit(EXIT_FAILURE);
+                }
+                if (!*mem_str) {
+                    error_report("missing 'size' option value");
+                    exit(EXIT_FAILURE);
+                }
+
+                sz =3D qemu_opt_get_size(opts, "size", ram_size);
+
+                /* Fix up legacy suffix-less format */
+                if (g_ascii_isdigit(mem_str[strlen(mem_str) - 1])) {
+                    uint64_t overflow_check =3D sz;
+
+                    sz <<=3D 20;
+                    if ((sz >> 20) !=3D overflow_check) {
+                        error_report("too large 'size' option value");
+                        exit(EXIT_FAILURE);
+                    }
+                }
+
+                /* backward compatibility behaviour for case "-m 0" */
+                if (sz =3D=3D 0) {
+                    sz =3D default_ram_size;
                 }
-                sz =3D QEMU_ALIGN_UP((uint64_t)value, 8192);
+
+                sz =3D QEMU_ALIGN_UP(sz, 8192);
                 ram_size =3D sz;
                 if (ram_size !=3D sz) {
-                    fprintf(stderr, "qemu: ram size too large\n");
-                    exit(1);
+                    error_report("ram size too large");
+                    exit(EXIT_FAILURE);
                 }
                 break;
             }
@@ -4145,10 +4190,8 @@ int main(int argc, char **argv, char **envp)
         exit(1);
     }
=20
-    /* init the memory */
-    if (ram_size =3D=3D 0) {
-        ram_size =3D DEFAULT_RAM_SIZE * 1024 * 1024;
-    }
+    /* store value for the future use */
+    qemu_opt_set_number(qemu_find_opts_singleton("memory"), "size", ram_=
size);
=20
     if (qemu_opts_foreach(qemu_find_opts("device"), device_help_func, NU=
LL, 0)
         !=3D 0) {
--=20
1.7.10.4


