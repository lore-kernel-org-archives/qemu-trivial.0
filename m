Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WLEPk-0007Fr-6H
	for mharc-qemu-trivial@gnu.org; Wed, 05 Mar 2014 11:11:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53029)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1WLEPc-0006xU-Sg
	for qemu-trivial@nongnu.org; Wed, 05 Mar 2014 11:11:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1WLEPX-0001Qs-Vq
	for qemu-trivial@nongnu.org; Wed, 05 Mar 2014 11:11:16 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51118)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1WLEPK-0001Nl-Rj; Wed, 05 Mar 2014 11:10:59 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s25GAs86028244
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 5 Mar 2014 11:10:55 -0500
Received: from dell-pet610-01.lab.eng.brq.redhat.com
	(dell-pet610-01.lab.eng.brq.redhat.com [10.34.42.20])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s25GAgBu013206; Wed, 5 Mar 2014 11:10:50 -0500
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  5 Mar 2014 17:10:40 +0100
Message-Id: <1394035840-1584-3-git-send-email-imammedo@redhat.com>
In-Reply-To: <1394035840-1584-1-git-send-email-imammedo@redhat.com>
References: <1394035840-1584-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	s25GAs86028244
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: kwolf@redhat.com, stefanha@redhat.com, qemu-trivial@nongnu.org,
	eblake@redhat.com, coreyb@linux.vnet.ibm.com, mjt@tls.msk.ru,
	mreitz@redhat.com, aliguori@amazon.com, pbonzini@redhat.com,
	lcapitulino@redhat.com, imammedo@redhat.com, lersek@redhat.com,
	afaerber@suse.de
Subject: [Qemu-trivial] [PATCH v3 2/2] vl: convert -m to QemuOpts
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
X-List-Received-Date: Wed, 05 Mar 2014 16:11:22 -0000

Adds option to -m
 "size" - startup memory amount

For compatibility with legacy CLI if suffix-less number is passed,
it assumes amount in Mb.

Otherwise user is free to use suffixed number using suffixes b,k/K,M,G

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
v2:
 - suggested by Andreas F=C3=A4rber <afaerber@suse.de>
    * s/fprintf/error_report/
    * rename 'mem' option to 'size'
 - fix conflict with missing numa QemuOpts
---
 qemu-options.hx |    9 ++++--
 vl.c            |   71 ++++++++++++++++++++++++++++++++++++++++++++-----=
------
 2 files changed, 63 insertions(+), 17 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 56e5fdf..5e89e0d 100644
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
index 7eb3b73..72235c5 100644
--- a/vl.c
+++ b/vl.c
@@ -475,6 +475,20 @@ static QemuOptsList qemu_msg_opts =3D {
     },
 };
=20
+static QemuOptsList qemu_mem_opts =3D {
+    .name =3D "memory",
+    .implied_opt_name =3D "mem",
+    .head =3D QTAILQ_HEAD_INITIALIZER(qemu_mem_opts.head),
+    .merge_lists =3D true,
+    .desc =3D {
+        {
+            .name =3D "mem",
+            .type =3D QEMU_OPT_SIZE,
+        },
+        { /* end of list */ }
+    },
+};
+
 /**
  * Get machine options
  *
@@ -2835,6 +2849,8 @@ int main(int argc, char **argv, char **envp)
     };
     const char *trace_events =3D NULL;
     const char *trace_file =3D NULL;
+    const ram_addr_t default_ram_size =3D (ram_addr_t)DEFAULT_RAM_SIZE *
+                                        1024 * 1024;
=20
     atexit(qemu_run_exit_notifiers);
     error_set_progname(argv[0]);
@@ -2866,6 +2882,7 @@ int main(int argc, char **argv, char **envp)
     qemu_add_opts(&qemu_trace_opts);
     qemu_add_opts(&qemu_option_rom_opts);
     qemu_add_opts(&qemu_machine_opts);
+    qemu_add_opts(&qemu_mem_opts);
     qemu_add_opts(&qemu_smp_opts);
     qemu_add_opts(&qemu_boot_opts);
     qemu_add_opts(&qemu_sandbox_opts);
@@ -2889,7 +2906,7 @@ int main(int argc, char **argv, char **envp)
     module_call_init(MODULE_INIT_MACHINE);
     machine =3D find_default_machine();
     cpu_model =3D NULL;
-    ram_size =3D 0;
+    ram_size =3D default_ram_size;
     snapshot =3D 0;
     cyls =3D heads =3D secs =3D 0;
     translation =3D BIOS_ATA_TRANSLATION_AUTO;
@@ -3176,20 +3193,48 @@ int main(int argc, char **argv, char **envp)
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
+                mem_str =3D qemu_opt_get(opts, "mem");
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
+                sz =3D qemu_opt_get_size(opts, "mem", ram_size);
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
@@ -4034,10 +4079,8 @@ int main(int argc, char **argv, char **envp)
         exit(1);
     }
=20
-    /* init the memory */
-    if (ram_size =3D=3D 0) {
-        ram_size =3D DEFAULT_RAM_SIZE * 1024 * 1024;
-    }
+    /* store value for the future use */
+    qemu_opt_set_number(qemu_find_opts_singleton("memory"), "mem", ram_s=
ize);
=20
     if (qemu_opts_foreach(qemu_find_opts("device"), device_help_func, NU=
LL, 0)
         !=3D 0) {
--=20
1.7.1


