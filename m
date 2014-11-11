Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XoCpN-0000nR-0V
	for mharc-qemu-trivial@gnu.org; Tue, 11 Nov 2014 09:53:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34557)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XoCpH-0000cg-Bh
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 09:53:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XoCpC-00029X-Vm
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 09:53:47 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:34650)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XoCp0-00026l-Eq; Tue, 11 Nov 2014 09:53:30 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 58EBA41DF7;
	Tue, 11 Nov 2014 17:53:29 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id D2274713;
	Tue, 11 Nov 2014 17:46:35 +0300 (MSK)
Received: (nullmailer pid 14563 invoked by uid 1000);
	Tue, 11 Nov 2014 14:46:34 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 11 Nov 2014 17:46:25 +0300
Message-Id: <7912d04be6322b16cfece6b698361ae6ed036ba9.1415716845.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1415716845.git.mjt@msgid.tls.msk.ru>
References: <cover.1415716845.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Peter Wu <peter@lekensteyn.nl>
Subject: [Qemu-trivial] [PULL 03/11] slirp/smbd: modify/set several
	parameters in generated smbd.conf
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
X-List-Received-Date: Tue, 11 Nov 2014 14:53:51 -0000

From: Peter Wu <peter@lekensteyn.nl>

The file sharing module should not handle printers, so disable it.
The options 'load printers' and 'printing' have been available since the
beginning (May 1996, commit 0e8fd3398771da2f016d72830179507f3edda51b).
Option 'disable spoolss' is available since Samba 2.0.4, commit
de5f42c9d9172592779fa2504d44544e3b6b1c0d).

Next, "socket address" was reported as deprecated, use a combination of
"interfaces" and "bind interfaces only" instead (available since October
1997, commit 79f4fb52c1ed56fd843f81b4eb0cdd2991d4d0f4).

Override cache directory to avoid writing to a global directory. Option
available since Samba 3.4.0, Jan 2009, commit
19a05bf2f485023b11b41dfae3f6459847d55ef7.

Set "usershare max shared=0" to prevent a global directory from being
used. Option available since Samba 3.0.23, February 2006, commit
5831715049f2d460ce42299963a5defdc160891b.

The last option was introduced with Samba 3.4.0, but previously
"state directory" was already added which exists in Samba 3.4.0. As
unknown parameters are ignored (while printing a warning), it should be
safe to add another option.

Signed-off-by: Peter Wu <peter@lekensteyn.nl>
Cc: Jan Kiszka <jan.kiszka@siemens.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 net/slirp.c |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/net/slirp.c b/net/slirp.c
index 920af30..dc89e6b 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -523,15 +523,21 @@ static int slirp_smb(SlirpState* s, const char *exported_dir,
     fprintf(f,
             "[global]\n"
             "private dir=%s\n"
-            "socket address=127.0.0.1\n"
+            "interfaces=127.0.0.1\n"
+            "bind interfaces only=yes\n"
             "pid directory=%s\n"
             "lock directory=%s\n"
             "state directory=%s\n"
+            "cache directory=%s\n"
             "ncalrpc dir=%s/ncalrpc\n"
             "log file=%s/log.smbd\n"
             "smb passwd file=%s/smbpasswd\n"
             "security = user\n"
             "map to guest = Bad User\n"
+            "load printers = no\n"
+            "printing = bsd\n"
+            "disable spoolss = yes\n"
+            "usershare max shares = 0\n"
             "[qemu]\n"
             "path=%s\n"
             "read only=no\n"
@@ -544,6 +550,7 @@ static int slirp_smb(SlirpState* s, const char *exported_dir,
             s->smb_dir,
             s->smb_dir,
             s->smb_dir,
+            s->smb_dir,
             exported_dir,
             passwd->pw_name
             );
-- 
1.7.10.4


