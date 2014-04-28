Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wee3s-0002Sj-06
	for mharc-qemu-trivial@gnu.org; Mon, 28 Apr 2014 01:25:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50434)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wee3l-0002DE-BX
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 01:25:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wee3g-0005IU-4j
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 01:24:57 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48694)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Wee3V-0005Fs-GH; Mon, 28 Apr 2014 01:24:41 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E10984303E;
	Mon, 28 Apr 2014 09:24:40 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 676EB2B8;
	Mon, 28 Apr 2014 09:08:27 +0400 (MSK)
Received: (nullmailer pid 19144 invoked by uid 1000);
	Mon, 28 Apr 2014 05:08:25 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 28 Apr 2014 09:07:54 +0400
Message-Id: <1398661684-19059-9-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398661684-19059-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1398661684-19059-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Chen Gang <gang.chen.5i5j@gmail.com>
Subject: [Qemu-trivial] [PULL 08/18] vl: Remove useless 'continue'
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
X-List-Received-Date: Mon, 28 Apr 2014 05:25:02 -0000

From: Chen Gang <gang.chen.5i5j@gmail.com>

"This if else has no code between it and the end of the enclosing
while loop. This makes this continue redundant."

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 vl.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/vl.c b/vl.c
index d6c5df1..0b08a02 100644
--- a/vl.c
+++ b/vl.c
@@ -3042,7 +3042,6 @@ int main(int argc, char **argv, char **envp)
         if (argv[optind][0] != '-') {
             /* disk image */
             optind++;
-            continue;
         } else {
             const QEMUOption *popt;
 
-- 
1.7.10.4


