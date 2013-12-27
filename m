Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VwfhH-0001Du-HC
	for mharc-qemu-trivial@gnu.org; Fri, 27 Dec 2013 17:15:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33217)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VwfhA-0000zO-LW
	for qemu-trivial@nongnu.org; Fri, 27 Dec 2013 17:15:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vwfh5-0005rp-Py
	for qemu-trivial@nongnu.org; Fri, 27 Dec 2013 17:15:52 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:35332)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vwfgq-0005nt-IW; Fri, 27 Dec 2013 17:15:32 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id AADDF438A0;
	Sat, 28 Dec 2013 02:15:32 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B7DD0615;
	Sat, 28 Dec 2013 02:07:36 +0400 (MSK)
Received: (nullmailer pid 10344 invoked by uid 1000);
	Fri, 27 Dec 2013 22:07:34 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Sat, 28 Dec 2013 02:07:22 +0400
Message-Id: <1388182050-10270-10-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1388182050-10270-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1388182050-10270-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 09/17] fix -boot strict regressed in commit
	6ef4716
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
X-List-Received-Date: Fri, 27 Dec 2013 22:15:57 -0000

From: Amos Kong <akong@redhat.com>

Commit 6ef4716 cleaned up parsing of -boot option argument, but
accidentally dropped parameter strict.  It should have been updated
exactly like parameter menu. Do that.

Signed-off-by: Amos Kong <akong@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 vl.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/vl.c b/vl.c
index ed8debb..e755aea 100644
--- a/vl.c
+++ b/vl.c
@@ -461,7 +461,7 @@ static QemuOptsList qemu_boot_opts = {
             .type = QEMU_OPT_STRING,
         }, {
             .name = "strict",
-            .type = QEMU_OPT_STRING,
+            .type = QEMU_OPT_BOOL,
         },
         { /*End of list */ }
     },
@@ -4081,6 +4081,7 @@ int main(int argc, char **argv, char **envp)
         }
 
         boot_menu = qemu_opt_get_bool(opts, "menu", boot_menu);
+        boot_strict = qemu_opt_get_bool(opts, "strict", false);
     }
 
     if (!kernel_cmdline) {
-- 
1.7.10.4


