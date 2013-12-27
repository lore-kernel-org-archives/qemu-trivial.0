Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vwfqw-0000RY-Ng
	for mharc-qemu-trivial@gnu.org; Fri, 27 Dec 2013 17:25:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35431)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vwfqp-0000AJ-CJ
	for qemu-trivial@nongnu.org; Fri, 27 Dec 2013 17:25:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vwfqk-0000O7-V0
	for qemu-trivial@nongnu.org; Fri, 27 Dec 2013 17:25:51 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:60973)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VwfqW-0000LJ-Kt; Fri, 27 Dec 2013 17:25:32 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 988AB438AA;
	Sat, 28 Dec 2013 02:25:32 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E4AC6616;
	Sat, 28 Dec 2013 02:07:36 +0400 (MSK)
Received: (nullmailer pid 10354 invoked by uid 1000);
	Fri, 27 Dec 2013 22:07:35 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Sat, 28 Dec 2013 02:07:26 +0400
Message-Id: <1388182050-10270-14-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1388182050-10270-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1388182050-10270-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, Ingo van Lil <inguin@gmx.de>
Subject: [Qemu-trivial] [PULL 13/17] doc: Mention chardev:id in available
	devices for -serial
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
X-List-Received-Date: Fri, 27 Dec 2013 22:25:56 -0000

From: Ingo van Lil <inguin@gmx.de>

It is possible to pre-define a character device with the -chardev option
and reference its id as serial device. The man page does not mention this
feature.

Use case: Use stdio as serial, but do not terminate VM on Ctrl-C
          -chardev stdio,id=mystdio,signal=off -serial chardev:mystdio

Signed-off-by: Ingo van Lil <inguin@gmx.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-options.hx |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/qemu-options.hx b/qemu-options.hx
index bcfe9ea..56e5fdf 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2419,6 +2419,8 @@ vc:80Cx24C
 No device is allocated.
 @item null
 void device
+@item chardev:@var{id}
+Use a named character device defined with the @code{-chardev} option.
 @item /dev/XXX
 [Linux only] Use host tty, e.g. @file{/dev/ttyS0}. The host serial port
 parameters are set according to the emulated ones.
-- 
1.7.10.4


