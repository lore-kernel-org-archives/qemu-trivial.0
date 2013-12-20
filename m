Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vu73M-0005mk-Qy
	for mharc-qemu-trivial@gnu.org; Fri, 20 Dec 2013 15:52:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47692)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <inguin@gmx.de>) id 1Vu0Oj-0008ND-GC
	for qemu-trivial@nongnu.org; Fri, 20 Dec 2013 08:45:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <inguin@gmx.de>) id 1Vu0Od-0004CW-MI
	for qemu-trivial@nongnu.org; Fri, 20 Dec 2013 08:45:49 -0500
Received: from mout.gmx.net ([212.227.15.15]:58064)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <inguin@gmx.de>) id 1Vu0Od-0004CL-9d
	for qemu-trivial@nongnu.org; Fri, 20 Dec 2013 08:45:43 -0500
Received: from zaphod.peppercon.de ([212.80.250.50]) by mail.gmx.com
	(mrgmx102) with ESMTPSA (Nemesis) id 0MRSeC-1W4xiP0OfQ-00ShyQ for
	<qemu-trivial@nongnu.org>; Fri, 20 Dec 2013 14:45:41 +0100
From: Ingo van Lil <inguin@gmx.de>
To: qemu-devel@nongnu.org
Date: Fri, 20 Dec 2013 14:44:53 +0100
Message-Id: <1387547093-14591-1-git-send-email-inguin@gmx.de>
X-Mailer: git-send-email 1.8.3.1
X-Provags-ID: V03:K0:PFiSwgiiHZ8B52KCSPRnZgpY31yJ66NAHCVfWpuJPGhru19/mYM
	UV5/R9P6qL2zl1DEF71DQ1Rb+WpATWCRNhYdzAuy1bgLUJoGmQfQYh3aYurUMT60B5Xjy7h
	fIKI57+ZfdSpGuJeAEJJSgX+VWzD+OU1R/pvRrwWKgfuZGbmX23kmoXzxS9KI45jn44asnE
	y6sKPfZQu6c4ZuSWllywQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 212.227.15.15
X-Mailman-Approved-At: Fri, 20 Dec 2013 15:52:12 -0500
Cc: qemu-trivial@nongnu.org, Ingo van Lil <inguin@gmx.de>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Anthony Liguori <anthony@codemonkey.ws>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PATCH] doc: Mention chardev:id in available devices
	for -serial
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
X-List-Received-Date: Fri, 20 Dec 2013 13:45:55 -0000

It is possible to pre-define a character device with the -chardev option
and reference its id as serial device. The man page does not mention this
feature.

Use case: Use stdio as serial, but do not terminate VM on Ctrl-C
          -chardev stdio,id=mystdio,signal=off -serial chardev:mystdio

Signed-off-by: Ingo van Lil <inguin@gmx.de>
---
 qemu-options.hx | 2 ++
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
1.8.3.1


