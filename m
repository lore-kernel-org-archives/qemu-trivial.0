Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ezbWH-0005aP-GF
	for mharc-qemu-trivial@gnu.org; Sat, 24 Mar 2018 01:15:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45419)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1ezbWF-0005YI-Jr
	for qemu-trivial@nongnu.org; Sat, 24 Mar 2018 01:15:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1ezbWE-00068S-OJ
	for qemu-trivial@nongnu.org; Sat, 24 Mar 2018 01:15:07 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54468 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mprivozn@redhat.com>)
	id 1ezbW7-00061J-3I; Sat, 24 Mar 2018 01:14:59 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BDAE88151D49;
	Sat, 24 Mar 2018 05:14:58 +0000 (UTC)
Received: from localhost.localdomain (ovpn-204-18.brq.redhat.com
	[10.40.204.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6BC7F1DB24;
	Sat, 24 Mar 2018 05:14:55 +0000 (UTC)
From: Michal Privoznik <mprivozn@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, famz@redhat.com,
	qemu-block@nongnu.org
Date: Sat, 24 Mar 2018 06:14:49 +0100
Message-Id: <6f10cd53d361a395aa0e85a9311ec4e9a8fc11e5.1521868451.git.mprivozn@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Sat, 24 Mar 2018 05:14:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Sat, 24 Mar 2018 05:14:58 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mprivozn@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH] qemu-pr-helper: Actually allow users to
 specify pidfile
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
X-List-Received-Date: Sat, 24 Mar 2018 05:15:08 -0000

Due to wrong specification of arguments to getopt_long() any
attempt to set pidfile resulted in:

1) the default to be leaked
2) the @pidfile variable to be set to NULL (because optarg is
NULL without this patch).

Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
---
 scsi/qemu-pr-helper.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
index 3facbba170..21e1b8ea60 100644
--- a/scsi/qemu-pr-helper.c
+++ b/scsi/qemu-pr-helper.c
@@ -903,12 +903,12 @@ static int drop_privileges(void)
 
 int main(int argc, char **argv)
 {
-    const char *sopt = "hVk:fdT:u:g:vq";
+    const char *sopt = "hVk:f:dT:u:g:vq";
     struct option lopt[] = {
         { "help", no_argument, NULL, 'h' },
         { "version", no_argument, NULL, 'V' },
         { "socket", required_argument, NULL, 'k' },
-        { "pidfile", no_argument, NULL, 'f' },
+        { "pidfile", required_argument, NULL, 'f' },
         { "daemon", no_argument, NULL, 'd' },
         { "trace", required_argument, NULL, 'T' },
         { "user", required_argument, NULL, 'u' },
@@ -952,7 +952,8 @@ int main(int argc, char **argv)
             }
             break;
         case 'f':
-            pidfile = optarg;
+            g_free(pidfile);
+            pidfile = g_strdup(optarg);
             break;
 #ifdef CONFIG_LIBCAP
         case 'u': {
-- 
2.16.1


