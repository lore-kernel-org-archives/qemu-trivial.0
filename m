Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZHuZ0-0001if-Sf
	for mharc-qemu-trivial@gnu.org; Wed, 22 Jul 2015 10:00:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZHuYy-0001fP-JH
	for qemu-trivial@nongnu.org; Wed, 22 Jul 2015 10:00:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZHuYx-0000js-RH
	for qemu-trivial@nongnu.org; Wed, 22 Jul 2015 10:00:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50351)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1ZHuYs-0000i3-Nx; Wed, 22 Jul 2015 09:59:54 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 37655ADAE5;
	Wed, 22 Jul 2015 13:59:54 +0000 (UTC)
Received: from thh440s.redhat.com (vpn1-4-243.ams2.redhat.com [10.36.4.243])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t6MDxpdQ016909; Wed, 22 Jul 2015 09:59:52 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 22 Jul 2015 15:59:50 +0200
Message-Id: <1437573590-2801-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Subject: [Qemu-trivial] [PATCH] Add another sanity check to smp_parse()
	function
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
X-List-Received-Date: Wed, 22 Jul 2015 14:00:01 -0000

The code in smp_parse already checks the topology information for
sockets * cores * threads < cpus and bails out with an error in
that case. However, it is still possible to supply a bad configuration
the other way round, e.g. with:

 qemu-system-xxx -smp 4,sockets=1,cores=4,threads=2

QEMU then still starts the guest, with topology configuration that
is rather incomprehensible and likely not what the user wanted.
So let's add another check to refuse such wrong configurations.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 vl.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/vl.c b/vl.c
index 5856396..c8d24b1 100644
--- a/vl.c
+++ b/vl.c
@@ -1224,7 +1224,13 @@ static void smp_parse(QemuOpts *opts)
             exit(1);
         }
 
-        max_cpus = qemu_opt_get_number(opts, "maxcpus", 0);
+        max_cpus = qemu_opt_get_number(opts, "maxcpus", cpus);
+        if (sockets * cores * threads > max_cpus) {
+            fprintf(stderr, "cpu topology: error: "
+                    "sockets (%u) * cores (%u) * threads (%u) > maxcpus (%u)\n",
+                    sockets, cores, threads, max_cpus);
+            exit(1);
+        }
 
         smp_cpus = cpus;
         smp_cores = cores > 0 ? cores : 1;
-- 
1.8.3.1


