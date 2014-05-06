Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhdMD-0001F5-5g
	for mharc-qemu-trivial@gnu.org; Tue, 06 May 2014 07:16:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39589)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1WhdM6-0000zR-I3
	for qemu-trivial@nongnu.org; Tue, 06 May 2014 07:16:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1WhdM1-0001Sh-HN
	for qemu-trivial@nongnu.org; Tue, 06 May 2014 07:16:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45524)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>)
	id 1WhdLr-0001Qo-GK; Tue, 06 May 2014 07:15:59 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s46BFvcE022431
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 6 May 2014 07:15:57 -0400
Received: from dgilbert-t530.home.treblig.org (vpn1-5-31.ams2.redhat.com
	[10.36.5.31])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s46BFtX8027754; Tue, 6 May 2014 07:15:56 -0400
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  6 May 2014 12:15:55 +0100
Message-Id: <1399374955-29082-1-git-send-email-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, wdauchy@gmail.com
Subject: [Qemu-trivial] [PATCH] Fix 'name' option to work with -readconfig
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
X-List-Received-Date: Tue, 06 May 2014 11:16:19 -0000

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The 'name' option silently failed when used in config files
( http://lists.gnu.org/archive/html/qemu-devel/2014-04/msg00378.html )

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reported-by: William Dauchy <wdauchy@gmail.com>
---
 vl.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/vl.c b/vl.c
index 8411a4a..47c199a 100644
--- a/vl.c
+++ b/vl.c
@@ -965,7 +965,7 @@ static int parse_sandbox(QemuOpts *opts, void *opaque)
     return 0;
 }
 
-static void parse_name(QemuOpts *opts)
+static int parse_name(QemuOpts *opts, void *opaque)
 {
     const char *proc_name;
 
@@ -978,6 +978,8 @@ static void parse_name(QemuOpts *opts)
     if (proc_name) {
         os_set_proc_name(proc_name);
     }
+
+    return 0;
 }
 
 bool usb_enabled(bool default_usb)
@@ -3780,7 +3782,6 @@ int main(int argc, char **argv, char **envp)
                 if (!opts) {
                     exit(1);
                 }
-                parse_name(opts);
                 break;
             case QEMU_OPTION_prom_env:
                 if (nb_prom_envs >= MAX_PROM_ENVS) {
@@ -3955,6 +3956,10 @@ int main(int argc, char **argv, char **envp)
         exit(1);
     }
 
+    if (qemu_opts_foreach(qemu_find_opts("name"), parse_name, NULL, 1)) {
+        exit(1);
+    }
+
 #ifndef _WIN32
     if (qemu_opts_foreach(qemu_find_opts("add-fd"), parse_add_fd, NULL, 1)) {
         exit(1);
-- 
1.9.0


