Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yxvn4-00063N-Ln
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 07:15:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40702)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yxvmy-0005yG-Bi
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 07:15:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yxvmx-0002uN-5L
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 07:15:52 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54924)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Yxvms-0002oM-2l; Thu, 28 May 2015 07:15:46 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id DC04C42715;
	Thu, 28 May 2015 14:15:44 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id C606193A;
	Thu, 28 May 2015 14:15:44 +0300 (MSK)
Received: (nullmailer pid 2509 invoked by uid 1000);
	Thu, 28 May 2015 11:15:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 28 May 2015 14:15:43 +0300
Message-Id: <1432811743-2423-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PATCH] slirp: use less predictable directory name
	in /tmp for smb config (CVE-2015-4037)
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
X-List-Received-Date: Thu, 28 May 2015 11:15:56 -0000

In this version I used mkdtemp(3) which is:

        _BSD_SOURCE
        || /* Since glibc 2.10: */
            (_POSIX_C_SOURCE >= 200809L || _XOPEN_SOURCE >= 700)

so should be available on systems we care about.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 net/slirp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/net/slirp.c b/net/slirp.c
index 9bbed74..0ad32ad 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -481,7 +481,6 @@ static void slirp_smb_cleanup(SlirpState *s)
 static int slirp_smb(SlirpState* s, const char *exported_dir,
                      struct in_addr vserver_addr)
 {
-    static int instance;
     char smb_conf[128];
     char smb_cmdline[128];
     struct passwd *passwd;
@@ -505,9 +504,8 @@ static int slirp_smb(SlirpState* s, const char *exported_dir,
         return -1;
     }
 
-    snprintf(s->smb_dir, sizeof(s->smb_dir), "/tmp/qemu-smb.%ld-%d",
-             (long)getpid(), instance++);
-    if (mkdir(s->smb_dir, 0700) < 0) {
+    strcpy(s->smb_dir, "/tmp/qemu-smb.XXXXXX");
+    if (!mkdtemp(s->smb_dir)) {
         error_report("could not create samba server dir '%s'", s->smb_dir);
         return -1;
     }
-- 
2.1.4


