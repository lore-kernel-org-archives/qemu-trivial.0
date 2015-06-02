Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yzf2G-00059N-Ic
	for mharc-qemu-trivial@gnu.org; Tue, 02 Jun 2015 01:46:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41085)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yzf2D-000537-Rl
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 01:46:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yzf2D-0004Dk-1j
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 01:46:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59165)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Yzf28-0004Cl-Pm; Tue, 02 Jun 2015 01:46:40 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id BF83140423;
	Tue,  2 Jun 2015 08:46:39 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id AE8B693A;
	Tue,  2 Jun 2015 08:46:39 +0300 (MSK)
Received: (nullmailer pid 26767 invoked by uid 1000);
	Tue, 02 Jun 2015 05:46:39 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue,  2 Jun 2015 08:46:35 +0300
Message-Id: <1433223995-26725-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>,
	Miroslav Rezanina <mrezanin@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PATCH v2] slirp: use less predictable directory
	name in /tmp for smb config (CVE-2015-4037)
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
X-List-Received-Date: Tue, 02 Jun 2015 05:46:47 -0000

In this version I used mkdtemp(3) which is:

        _BSD_SOURCE
        || /* Since glibc 2.10: */
            (_POSIX_C_SOURCE >= 200809L || _XOPEN_SOURCE >= 700)

(POSIX.1-2008), so should be available on systems we care about.

While at it, reset the resulting directory name within smb structure
on error so cleanup function wont try to remove directory which we
failed to create.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
v2:
Add resetting of the dirname on failure so that cleanup function
does not try to remove directory which we failed to create.

Use snprintf() as was in the original code, not strcpy(): while
in this very case it does not matter at all since both strings
are of known size, some people dislike strcpy() in principle.

 net/slirp.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/net/slirp.c b/net/slirp.c
index 0e15cf6..3533837 100644
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
@@ -505,10 +504,10 @@ static int slirp_smb(SlirpState* s, const char *exported_dir,
         return -1;
     }
 
-    snprintf(s->smb_dir, sizeof(s->smb_dir), "/tmp/qemu-smb.%ld-%d",
-             (long)getpid(), instance++);
-    if (mkdir(s->smb_dir, 0700) < 0) {
+    snprintf(s->smb_dir, sizeof(s->smb_dir), "/tmp/qemu-smb.XXXXXX");
+    if (!mkdtemp(s->smb_dir)) {
         error_report("could not create samba server dir '%s'", s->smb_dir);
+        s->smb_dir[0] = 0;
         return -1;
     }
     snprintf(smb_conf, sizeof(smb_conf), "%s/%s", s->smb_dir, "smb.conf");
-- 
2.1.4


