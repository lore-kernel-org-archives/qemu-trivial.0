Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ynh0C-0000r5-A9
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 01:27:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49357)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ynh05-0000e2-HA
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:27:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ynh04-0000da-ON
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:27:05 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50762)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Yngzx-0000bK-BB; Thu, 30 Apr 2015 01:26:57 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 96E2642B8D;
	Thu, 30 Apr 2015 08:26:56 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B574695E;
	Thu, 30 Apr 2015 08:08:59 +0300 (MSK)
Received: (nullmailer pid 4319 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:26 +0300
Message-Id: <c39eeba66031247f2b26033204a164a86fbb80a4.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 13/42] qemu-options: trivial spelling fix
	(messsage)
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
X-List-Received-Date: Thu, 30 Apr 2015 05:27:06 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 319d971..ec356f6 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3106,7 +3106,7 @@ executed often has little or no correlation with actual performance.
 to synchronise the host clock and the virtual clock. The goal is to
 have a guest running at the real frequency imposed by the shift option.
 Whenever the guest clock is behind the host clock and if
-@option{align=on} is specified then we print a messsage to the user
+@option{align=on} is specified then we print a message to the user
 to inform about the delay.
 Currently this option does not work when @option{shift} is @code{auto}.
 Note: The sync algorithm will work for those shift values for which
-- 
2.1.4


