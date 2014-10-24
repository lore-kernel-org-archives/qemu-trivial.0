Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XhlcR-0003OL-K4
	for mharc-qemu-trivial@gnu.org; Fri, 24 Oct 2014 16:37:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60276)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XhlcK-0003Fi-PE
	for qemu-trivial@nongnu.org; Fri, 24 Oct 2014 16:37:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XhlcF-0004g6-Po
	for qemu-trivial@nongnu.org; Fri, 24 Oct 2014 16:37:48 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49576)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xhlc5-0004ds-Ek; Fri, 24 Oct 2014 16:37:33 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CC51F46043;
	Sat, 25 Oct 2014 00:37:30 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 67129204;
	Sat, 25 Oct 2014 00:37:30 +0400 (MSK)
Received: (nullmailer pid 14777 invoked by uid 1000);
	Fri, 24 Oct 2014 20:37:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: Jan Kiszka <jan.kiszka@siemens.com>
Date: Sat, 25 Oct 2014 00:37:25 +0400
Message-Id: <1414183045-14741-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] net/slirp: specify logbase for smbd
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
X-List-Received-Date: Fri, 24 Oct 2014 20:37:53 -0000

It looks like smbd always logs to /var/log/samba/log.$progname
even if config file specifies different logfile -- when it needs
to log something before completing reading the config file.  But
if it can't open it for writing, it fails and exits.  Tell smbd
to use our temp dir as logbase (-l option) to avoid that.

The same option is used by samba3 and samba4, so there should
be no incompatible changes.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 net/slirp.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/slirp.c b/net/slirp.c
index c171119..920af30 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -549,8 +549,8 @@ static int slirp_smb(SlirpState* s, const char *exported_dir,
             );
     fclose(f);
 
-    snprintf(smb_cmdline, sizeof(smb_cmdline), "%s -s %s",
-             CONFIG_SMBD_COMMAND, smb_conf);
+    snprintf(smb_cmdline, sizeof(smb_cmdline), "%s -l %s -s %s",
+             CONFIG_SMBD_COMMAND, s->smb_dir, smb_conf);
 
     if (slirp_add_exec(s->slirp, 0, smb_cmdline, &vserver_addr, 139) < 0 ||
         slirp_add_exec(s->slirp, 0, smb_cmdline, &vserver_addr, 445) < 0) {
-- 
1.7.10.4


