Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VQyQi-0005km-3s
	for mharc-qemu-trivial@gnu.org; Tue, 01 Oct 2013 07:47:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57091)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1VQyQb-0005aV-6T
	for qemu-trivial@nongnu.org; Tue, 01 Oct 2013 07:47:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1VQyQV-0000sV-7e
	for qemu-trivial@nongnu.org; Tue, 01 Oct 2013 07:47:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51877)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1VQyQI-0000lH-T3; Tue, 01 Oct 2013 07:47:27 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r91BlPK8025137
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 1 Oct 2013 07:47:25 -0400
Received: from blackfin.pond.sub.org (ovpn-116-37.ams2.redhat.com
	[10.36.116.37])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r91BlN89011432
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 1 Oct 2013 07:47:24 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A01A0200BF; Tue,  1 Oct 2013 13:47:22 +0200 (CEST)
From: armbru@redhat.com
To: qemu-devel@nongnu.org
Date: Tue,  1 Oct 2013 13:47:22 +0200
Message-Id: <1380628042-24309-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, anthony@codemonkey.ws
Subject: [Qemu-trivial] [PATCH] vl: Clean up unnecessary boot_order
	complications
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
X-List-Received-Date: Tue, 01 Oct 2013 11:47:51 -0000

From: Markus Armbruster <armbru@redhat.com>

Messed up in commit 8281abd.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 vl.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/vl.c b/vl.c
index 983cdc6..7e1f408 100644
--- a/vl.c
+++ b/vl.c
@@ -2825,7 +2825,7 @@ int main(int argc, char **argv, char **envp)
     const char *icount_option = NULL;
     const char *initrd_filename;
     const char *kernel_filename, *kernel_cmdline;
-    const char *boot_order = NULL;
+    const char *boot_order;
     DisplayState *ds;
     int cyls, heads, secs, translation;
     QemuOpts *hda_opts = NULL, *opts, *machine_opts;
@@ -4050,9 +4050,7 @@ int main(int argc, char **argv, char **envp)
     initrd_filename = qemu_opt_get(machine_opts, "initrd");
     kernel_cmdline = qemu_opt_get(machine_opts, "append");
 
-    if (!boot_order) {
-        boot_order = machine->default_boot_order;
-    }
+    boot_order = machine->default_boot_order;
     opts = qemu_opts_find(qemu_find_opts("boot-opts"), NULL);
     if (opts) {
         char *normal_boot_order;
-- 
1.8.1.4


