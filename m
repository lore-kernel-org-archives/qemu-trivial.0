Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V06ry-0005Q7-6C
	for mharc-qemu-trivial@gnu.org; Fri, 19 Jul 2013 05:20:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58507)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V06rs-0005O2-NH
	for qemu-trivial@nongnu.org; Fri, 19 Jul 2013 05:20:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V06rr-0005mq-4N
	for qemu-trivial@nongnu.org; Fri, 19 Jul 2013 05:20:52 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40724)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V06rl-0005kX-7J; Fri, 19 Jul 2013 05:20:45 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id D9A1E41D88;
	Fri, 19 Jul 2013 13:11:18 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 50EBF1D8; Fri, 19 Jul 2013 13:11:17 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 19 Jul 2013 13:11:13 +0400
Message-Id: <1374225073-12959-6-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1374225073-12959-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1374225073-12959-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL trivial 5/5] doc: monitor multiplexing
	rewording
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
X-List-Received-Date: Fri, 19 Jul 2013 09:20:55 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-options.hx |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 4e98b4f..2dbfd42 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2493,8 +2493,8 @@ listening on port 4444 would be:
 @table @code
 @item -serial mon:telnet::4444,server,nowait
 @end table
-When monitor is multiplexed to stdio this way, Ctrl+C will not terminate
-QEMU anymore but will be passed to the guest instead.
+When the monitor is multiplexed to stdio in this way, Ctrl+C will not terminate
+QEMU any more but will be passed to the guest instead.
 
 @item braille
 Braille device.  This will use BrlAPI to display the braille output on a real
-- 
1.7.10.4


