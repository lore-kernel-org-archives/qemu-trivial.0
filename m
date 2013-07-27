Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V2z1T-0003rX-Ki
	for mharc-qemu-trivial@gnu.org; Sat, 27 Jul 2013 03:34:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40538)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V2z1Q-0003mt-R5
	for qemu-trivial@nongnu.org; Sat, 27 Jul 2013 03:34:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V2z1P-0006A5-3U
	for qemu-trivial@nongnu.org; Sat, 27 Jul 2013 03:34:36 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47882)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V2z1M-00068t-FO; Sat, 27 Jul 2013 03:34:32 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id CD2D642FBD;
	Sat, 27 Jul 2013 11:34:31 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 41098202886; Sat, 27 Jul 2013 11:33:28 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: anthony@codemonkey.ws
Date: Sat, 27 Jul 2013 11:33:20 +0400
Message-Id: <1374910406-15273-6-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1374910406-15273-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1374910406-15273-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL trivial 05/11] watchdog: Remove break after
	exit
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
X-List-Received-Date: Sat, 27 Jul 2013 07:34:38 -0000

From: Stefan Weil <sw@weilnetz.de>

This was dead code.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/watchdog/watchdog.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/watchdog/watchdog.c b/hw/watchdog/watchdog.c
index cb4e1f9..387962e 100644
--- a/hw/watchdog/watchdog.c
+++ b/hw/watchdog/watchdog.c
@@ -128,7 +128,6 @@ void watchdog_perform_action(void)
     case WDT_POWEROFF:          /* same as 'quit' command in monitor */
         watchdog_mon_event("poweroff");
         exit(0);
-        break;
=20
     case WDT_PAUSE:             /* same as 'stop' command in monitor */
         watchdog_mon_event("pause");
--=20
1.7.10.4


