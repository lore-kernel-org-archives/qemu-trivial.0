Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xktwi-00060h-Jb
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 07:07:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52855)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xktwd-0005qe-5q
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 07:07:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XktwY-0004h3-Py
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 07:07:43 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46716)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XktwK-0004e3-Vd; Sun, 02 Nov 2014 07:07:25 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id EA1E8402BD;
	Sun,  2 Nov 2014 15:07:23 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id F2FC3711;
	Sun,  2 Nov 2014 14:58:48 +0300 (MSK)
Received: (nullmailer pid 14968 invoked by uid 1000);
	Sun, 02 Nov 2014 11:58:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sun,  2 Nov 2014 14:57:21 +0300
Message-Id: <44d8d2b2ddbaa3ee4125ec6cb2e8691e6348b01e.1414929285.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 09/23] net/slirp: specify logbase for smbd
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
X-List-Received-Date: Sun, 02 Nov 2014 12:07:44 -0000

It looks like smbd always logs to /var/log/samba/log.$progname
even if config file specifies different logfile -- when it needs
to log something before completing reading the config file.  But
if it can't open it for writing, it fails and exits.  Tell smbd
to use our temp dir as logbase (-l option) to avoid that.

The same option is used by samba3 and samba4, so there should
be no incompatible changes.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Jan Kiszka <jan.kiszka@siemens.com>
Tested-by: Jan Kiszka <jan.kiszka@siemens.com>
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


