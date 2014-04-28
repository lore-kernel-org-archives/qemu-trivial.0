Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WeduJ-0000Ni-2L
	for mharc-qemu-trivial@gnu.org; Mon, 28 Apr 2014 01:15:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48960)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WeduA-0008WP-UG
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 01:15:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wedu6-0002NO-G8
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 01:15:02 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43939)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Wedtp-0002Ks-BO; Mon, 28 Apr 2014 01:14:41 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 71D0D43037;
	Mon, 28 Apr 2014 09:14:40 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 5F3D86AE;
	Mon, 28 Apr 2014 09:08:28 +0400 (MSK)
Received: (nullmailer pid 19169 invoked by uid 1000);
	Mon, 28 Apr 2014 05:08:26 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 28 Apr 2014 09:08:04 +0400
Message-Id: <1398661684-19059-19-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398661684-19059-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1398661684-19059-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Jan Kiszka <jan.kiszka@web.de>, Michael Buesch <m@bues.ch>
Subject: [Qemu-trivial] [PULL 18/18] slirp/smb: Move ncalrpc directory to tmp
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
X-List-Received-Date: Mon, 28 Apr 2014 05:15:07 -0000

From: Michael Buesch <m@bues.ch>

The smbd forked by qemu still uses the default ncalrpc directory
in /var/run/samba. This may lead to problems, if /var/run/samba
does not exist (for example if /var/run is a tmpfs and the host
smbd was not started).

This leads to the following error message from samba
and an unworkable smbd:
	Failed to create pipe directory /var/run/samba/ncalrpc - No such file or directory

Fix this by pointing smbd to /tmp/qemu-smb.%d.%d/ncalrpc as ncalrpc directory.
Smbd will create the actual ncalrpc subdirectory on its own.

Signed-off-by: Michael Buesch <m@bues.ch>
Cc: Jan Kiszka <jan.kiszka@web.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
(Applying this to -trivial because it _is_ rather trivial
 and because Jan does not reply for months)
---
 net/slirp.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/slirp.c b/net/slirp.c
index cce026b..8fddc03 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -527,6 +527,7 @@ static int slirp_smb(SlirpState* s, const char *exported_dir,
             "pid directory=%s\n"
             "lock directory=%s\n"
             "state directory=%s\n"
+            "ncalrpc dir=%s/ncalrpc\n"
             "log file=%s/log.smbd\n"
             "smb passwd file=%s/smbpasswd\n"
             "security = user\n"
@@ -542,6 +543,7 @@ static int slirp_smb(SlirpState* s, const char *exported_dir,
             s->smb_dir,
             s->smb_dir,
             s->smb_dir,
+            s->smb_dir,
             exported_dir,
             passwd->pw_name
             );
-- 
1.7.10.4


