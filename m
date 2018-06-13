Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSxyU-0005Lt-Ae
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jun 2018 01:05:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fSxyR-0005JG-A8
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 01:05:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fSxyP-0002DN-8z
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 01:05:34 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58880 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fSxyJ-000292-QW; Wed, 13 Jun 2018 01:05:28 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 589538A3B6;
	Wed, 13 Jun 2018 05:05:27 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-24.ams2.redhat.com [10.36.116.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 442142157F45;
	Wed, 13 Jun 2018 05:05:25 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
	zhang.zhanghailiang@huawei.com, Markus Armbruster <armbru@redhat.com>,
	qemu-trivial@nongnu.org
Date: Wed, 13 Jun 2018 07:05:18 +0200
Message-Id: <1528866321-23886-2-git-send-email-thuth@redhat.com>
In-Reply-To: <1528866321-23886-1-git-send-email-thuth@redhat.com>
References: <1528866321-23886-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Wed, 13 Jun 2018 05:05:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Wed, 13 Jun 2018 05:05:27 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH 1/4] Replace '-machine accel=xyz' with
 '-accel xyz'
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
X-List-Received-Date: Wed, 13 Jun 2018 05:05:37 -0000

We've got a separate option to configure the accelerator nowadays.
Use it in the source and examples to demonstrate that this is the
preferred way of setting this option now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qemu-doc.texi                       | 3 +--
 qemu-options.hx                     | 2 +-
 scripts/qtest.py                    | 2 +-
 tests/bios-tables-test.c            | 2 +-
 tests/boot-serial-test.c            | 2 +-
 tests/libqtest.c                    | 2 +-
 tests/migration-test.c              | 8 ++++----
 tests/migration/guestperf/engine.py | 2 +-
 tests/pnv-xscom-test.c              | 2 +-
 tests/prom-env-test.c               | 2 +-
 tests/pxe-test.c                    | 2 +-
 tests/qemu-iotests/172              | 2 +-
 tests/qemu-iotests/check            | 2 +-
 tests/vmgenid-test.c                | 2 +-
 14 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index cd05760..1c47e7c 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -2793,8 +2793,7 @@ which is the default.
 
 @subsection -no-kvm (since 1.3.0)
 
-The ``-no-kvm'' argument is now a synonym for setting
-``-machine accel=tcg''.
+The ``-no-kvm'' argument is now a synonym for setting ``-accel tcg''.
 
 @subsection -vnc tls (since 2.5.0)
 
diff --git a/qemu-options.hx b/qemu-options.hx
index c0d3951..451f7a6 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3922,7 +3922,7 @@ STEXI
 Enable FIPS 140-2 compliance mode.
 ETEXI
 
-HXCOMM Deprecated by -machine accel=tcg property
+HXCOMM Deprecated by -accel tcg
 DEF("no-kvm", 0, QEMU_OPTION_no_kvm, "", QEMU_ARCH_I386)
 
 DEF("msg", HAS_ARG, QEMU_OPTION_msg,
diff --git a/scripts/qtest.py b/scripts/qtest.py
index df0daf2..8c074a6 100644
--- a/scripts/qtest.py
+++ b/scripts/qtest.py
@@ -89,7 +89,7 @@ class QEMUQtestMachine(qemu.QEMUMachine):
     def _base_args(self):
         args = super(QEMUQtestMachine, self)._base_args()
         args.extend(['-qtest', 'unix:path=' + self._qtest_path,
-                     '-machine', 'accel=qtest'])
+                     '-accel', 'qtest'])
         return args
 
     def _pre_launch(self):
diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
index 4e24930..f41ec39 100644
--- a/tests/bios-tables-test.c
+++ b/tests/bios-tables-test.c
@@ -613,7 +613,7 @@ static void test_acpi_one(const char *params, test_data *data)
     char *args;
 
     /* Disable kernel irqchip to be able to override apic irq0. */
-    args = g_strdup_printf("-machine %s,accel=%s,kernel-irqchip=off "
+    args = g_strdup_printf("-machine %s,kernel-irqchip=off -accel %s "
                            "-net none -display none %s "
                            "-drive id=hd0,if=none,file=%s,format=raw "
                            "-device ide-hd,drive=hd0 ",
diff --git a/tests/boot-serial-test.c b/tests/boot-serial-test.c
index 4d6815c..84a2aa9 100644
--- a/tests/boot-serial-test.c
+++ b/tests/boot-serial-test.c
@@ -175,7 +175,7 @@ static void test_machine(const void *data)
      * Make sure that this test uses tcg if available: It is used as a
      * fast-enough smoketest for that.
      */
-    global_qtest = qtest_startf("%s %s -M %s,accel=tcg:kvm "
+    global_qtest = qtest_startf("%s %s -M %s -accel tcg:kvm "
                                 "-chardev file,id=serial0,path=%s "
                                 "-no-shutdown -serial chardev:serial0 %s",
                                 codeparam, code ? codetmp : "",
diff --git a/tests/libqtest.c b/tests/libqtest.c
index 098af6a..51481b0 100644
--- a/tests/libqtest.c
+++ b/tests/libqtest.c
@@ -209,7 +209,7 @@ QTestState *qtest_init_without_qmp_handshake(bool use_oob,
                                   "-qtest-log %s "
                                   "-chardev socket,path=%s,nowait,id=char0 "
                                   "-mon chardev=char0,mode=control%s "
-                                  "-machine accel=qtest "
+                                  "-accel qtest "
                                   "-display none "
                                   "%s", qemu_binary, socket_path,
                                   getenv("QTEST_LOG") ? "/dev/fd/2" : "/dev/null",
diff --git a/tests/migration-test.c b/tests/migration-test.c
index 3a85446..2b96ff0 100644
--- a/tests/migration-test.c
+++ b/tests/migration-test.c
@@ -372,12 +372,12 @@ static void test_migrate_start(QTestState **from, QTestState **to,
 
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
         init_bootfile_x86(bootpath);
-        cmd_src = g_strdup_printf("-machine accel=%s -m 150M"
+        cmd_src = g_strdup_printf("-accel %s -m 150M"
                                   " -name source,debug-threads=on"
                                   " -serial file:%s/src_serial"
                                   " -drive file=%s,format=raw",
                                   accel, tmpfs, bootpath);
-        cmd_dst = g_strdup_printf("-machine accel=%s -m 150M"
+        cmd_dst = g_strdup_printf("-accel %s -m 150M"
                                   " -name target,debug-threads=on"
                                   " -serial file:%s/dest_serial"
                                   " -drive file=%s,format=raw"
@@ -389,7 +389,7 @@ static void test_migrate_start(QTestState **from, QTestState **to,
         if (access("/sys/module/kvm_hv", F_OK)) {
             accel = "tcg";
         }
-        cmd_src = g_strdup_printf("-machine accel=%s -m 256M"
+        cmd_src = g_strdup_printf("-accel %s -m 256M"
                                   " -name source,debug-threads=on"
                                   " -serial file:%s/src_serial"
                                   " -prom-env '"
@@ -397,7 +397,7 @@ static void test_migrate_start(QTestState **from, QTestState **to,
                                   "do i c@ 1 + i c! 1000 +loop .\" B\" 0 "
                                   "until'",  accel, tmpfs, end_address,
                                   start_address);
-        cmd_dst = g_strdup_printf("-machine accel=%s -m 256M"
+        cmd_dst = g_strdup_printf("-accel %s -m 256M"
                                   " -name target,debug-threads=on"
                                   " -serial file:%s/dest_serial"
                                   " -incoming %s",
diff --git a/tests/migration/guestperf/engine.py b/tests/migration/guestperf/engine.py
index 398e3f2..cf3d7c8 100644
--- a/tests/migration/guestperf/engine.py
+++ b/tests/migration/guestperf/engine.py
@@ -286,7 +286,7 @@ class Engine(object):
             cmdline = "'" + cmdline + "'"
 
         argv = [
-            "-machine", "accel=kvm",
+            "-accel", "kvm",
             "-cpu", "host",
             "-kernel", self._kernel,
             "-initrd", self._initrd,
diff --git a/tests/pnv-xscom-test.c b/tests/pnv-xscom-test.c
index efb7c83..4f6686c 100644
--- a/tests/pnv-xscom-test.c
+++ b/tests/pnv-xscom-test.c
@@ -79,7 +79,7 @@ static void test_cfam_id(const void *data)
 {
     const PnvChip *chip = data;
 
-    global_qtest = qtest_startf("-M powernv,accel=tcg -cpu %s",
+    global_qtest = qtest_startf("-M powernv -accel tcg -cpu %s",
                                 chip->cpu_model);
     test_xscom_cfam_id(chip);
     qtest_quit(global_qtest);
diff --git a/tests/prom-env-test.c b/tests/prom-env-test.c
index 8c867e6..e066269 100644
--- a/tests/prom-env-test.c
+++ b/tests/prom-env-test.c
@@ -49,7 +49,7 @@ static void test_machine(const void *machine)
     /* The pseries firmware boots much faster without the default devices */
     extra_args = strcmp(machine, "pseries") == 0 ? "-nodefaults" : "";
 
-    global_qtest = qtest_startf("-M %s,accel=tcg %s "
+    global_qtest = qtest_startf("-M %s -accel tcg %s "
                                 "-prom-env 'use-nvramrc?=true' "
                                 "-prom-env 'nvramrc=%x %x l!' ",
                                 (const char *)machine, extra_args,
diff --git a/tests/pxe-test.c b/tests/pxe-test.c
index 6e36796..a8c4daa 100644
--- a/tests/pxe-test.c
+++ b/tests/pxe-test.c
@@ -64,7 +64,7 @@ static void test_pxe_one(const testdef_t *test, bool ipv6)
     char *args;
 
     args = g_strdup_printf(
-        "-machine %s,accel=kvm:tcg -nodefaults -boot order=n "
+        "-machine %s -accel kvm:tcg -nodefaults -boot order=n "
         "-netdev user,id=" NETNAME ",tftp=./,bootfile=%s,ipv4=%s,ipv6=%s "
         "-device %s,bootindex=1,netdev=" NETNAME,
         test->machine, disk, ipv6 ? "off" : "on", ipv6 ? "on" : "off",
diff --git a/tests/qemu-iotests/172 b/tests/qemu-iotests/172
index 02c5f79..93742a7 100755
--- a/tests/qemu-iotests/172
+++ b/tests/qemu-iotests/172
@@ -56,7 +56,7 @@ function do_run_qemu()
             done
         fi
         echo quit
-    ) | $QEMU -machine accel=qtest -nographic -monitor stdio -serial none "$@"
+    ) | $QEMU -accel qtest -nographic -monitor stdio -serial none "$@"
     echo
 }
 
diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index aa94c6c..5ffbf5d 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -129,7 +129,7 @@ export CACHEMODE="writeback"
 export QEMU_IO_OPTIONS=""
 export QEMU_IO_OPTIONS_NO_FMT=""
 export CACHEMODE_IS_DEFAULT=true
-export QEMU_OPTIONS="-nodefaults -machine accel=qtest"
+export QEMU_OPTIONS="-nodefaults -accel qtest"
 export VALGRIND_QEMU=
 export IMGKEYSECRET=
 export IMGOPTSSYNTAX=false
diff --git a/tests/vmgenid-test.c b/tests/vmgenid-test.c
index 8d915c6..4324034 100644
--- a/tests/vmgenid-test.c
+++ b/tests/vmgenid-test.c
@@ -131,7 +131,7 @@ static void read_guid_from_monitor(QemuUUID *guid)
 static char disk[] = "tests/vmgenid-test-disk-XXXXXX";
 
 #define GUID_CMD(guid)                          \
-    "-machine accel=kvm:tcg "                   \
+    "-accel kvm:tcg "                           \
     "-device vmgenid,id=testvgid,guid=%s "      \
     "-drive id=hd0,if=none,file=%s,format=raw " \
     "-device ide-hd,drive=hd0 ", guid, disk
-- 
1.8.3.1


