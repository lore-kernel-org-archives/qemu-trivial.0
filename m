Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wee3y-0002hV-Pn
	for mharc-qemu-trivial@gnu.org; Mon, 28 Apr 2014 01:25:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50474)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wee3t-0002VB-2h
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 01:25:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wee3o-0005K9-5i
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 01:25:05 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52452)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Wee3V-0005Fz-Gl; Mon, 28 Apr 2014 01:24:41 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id EFA9943041;
	Mon, 28 Apr 2014 09:24:40 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 4660A6AC;
	Mon, 28 Apr 2014 09:08:28 +0400 (MSK)
Received: (nullmailer pid 19151 invoked by uid 1000);
	Mon, 28 Apr 2014 05:08:25 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 28 Apr 2014 09:07:57 +0400
Message-Id: <1398661684-19059-12-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398661684-19059-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1398661684-19059-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Chen Gang <gang.chen.5i5j@gmail.com>
Subject: [Qemu-trivial] [PULL 11/18] vl: avoid closing stdout with
	'writeconfig'
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
X-List-Received-Date: Mon, 28 Apr 2014 05:25:10 -0000

From: Chen Gang <gang.chen.5i5j@gmail.com>

'writeconfig' supports output to stdout (with '-'); when that happens,
we must not close stdout, or further command line options that also use
stdout will be impacted. (Although 'writeconfig' was copied from
'readconfig', the latter does not have the problem because it does not
support reading from '-')

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 vl.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/vl.c b/vl.c
index 773649f..236f95e 100644
--- a/vl.c
+++ b/vl.c
@@ -3890,7 +3890,9 @@ int main(int argc, char **argv, char **envp)
                         }
                     }
                     qemu_config_write(fp);
-                    fclose(fp);
+                    if (fp != stdout) {
+                        fclose(fp);
+                    }
                     break;
                 }
             case QEMU_OPTION_qtest:
-- 
1.7.10.4


