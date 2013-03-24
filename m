Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UJor4-000467-D8
	for mharc-qemu-trivial@gnu.org; Sun, 24 Mar 2013 13:37:14 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54967)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <computers57@hotmail.com>) id 1UJor1-00041E-HQ
	for qemu-trivial@nongnu.org; Sun, 24 Mar 2013 13:37:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <computers57@hotmail.com>) id 1UJor0-0003n3-Gi
	for qemu-trivial@nongnu.org; Sun, 24 Mar 2013 13:37:11 -0400
Received: from blu0-omc1-s6.blu0.hotmail.com ([65.55.116.17]:22256)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <computers57@hotmail.com>) id 1UJor0-0003ms-D3
	for qemu-trivial@nongnu.org; Sun, 24 Mar 2013 13:37:10 -0400
Received: from BLU0-SMTP437 ([65.55.116.9]) by blu0-omc1-s6.blu0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Sun, 24 Mar 2013 10:37:09 -0700
X-EIP: [LFsUEj/amzzeuz7CaWl5mO7+LUZ1b4N2]
X-Originating-Email: [computers57@hotmail.com]
Message-ID: <BLU0-SMTP437073301907B1D6255834FB9D60@phx.gbl>
Received: from [192.168.2.4] ([66.29.191.18]) by BLU0-SMTP437.phx.gbl over TLS
	secured channel with Microsoft SMTPSVC(6.0.3790.4675); 
	Sun, 24 Mar 2013 10:37:08 -0700
From: "C.W. Betts" <computers57@hotmail.com>
Content-Type: multipart/mixed;
	boundary="Apple-Mail=_31435836-81CD-4A9B-A42C-2227A0710D7D"
Date: Sun, 24 Mar 2013 11:37:05 -0600
To: qemu-trivial@nongnu.org
MIME-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
X-Mailer: Apple Mail (2.1503)
X-OriginalArrivalTime: 24 Mar 2013 17:37:08.0305 (UTC)
	FILETIME=[3542C410:01CE28B6]
X-detected-operating-system: by eggs.gnu.org: Windows XP
X-Received-From: 65.55.116.17
Subject: [Qemu-trivial] Make the GTK UI build on OS X
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
X-List-Received-Date: Sun, 24 Mar 2013 17:37:12 -0000

--Apple-Mail=_31435836-81CD-4A9B-A42C-2227A0710D7D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

This patch makes the GTK front-end build and run on OS X (and most =
likely Darwin in general). This patch makes it so that the right headers =
are included.  As I am unaware if the headers included to make it run on =
OS X work on Linux and other OSes, they are around a preprocessor check.

--Apple-Mail=_31435836-81CD-4A9B-A42C-2227A0710D7D
Content-Disposition: attachment;
	filename="0001-Make-the-GTK-UI-build-on-OS-X.patch"
Content-Type: application/octet-stream;
	name="0001-Make-the-GTK-UI-build-on-OS-X.patch"
Content-Transfer-Encoding: quoted-printable

=46rom=20b5cc84343f479d4870961c82fc7b384637e9616c=20Mon=20Sep=2017=20=
00:00:00=202001=0AFrom:=20"C.W.=20Betts"=20<computers57@hotmail.com>=0A=
Date:=20Sun,=2024=20Mar=202013=2011:24:05=20-0600=0ASubject:=20[PATCH]=20=
Make=20the=20GTK=20UI=20build=20on=20OS=20X.=0A=0A---=0A=20ui/gtk.c=20|=20=
5=20+++++=0A=201=20file=20changed,=205=20insertions(+)=0A=0Adiff=20--git=20=
a/ui/gtk.c=20b/ui/gtk.c=0Aindex=20305940d..e2948d7=20100644=0A---=20=
a/ui/gtk.c=0A+++=20b/ui/gtk.c=0A@@=20-54,7=20+54,12=20@@=0A=20#include=20=
<sys/socket.h>=0A=20#include=20<sys/un.h>=0A=20#include=20<sys/wait.h>=0A=
+#ifdef=20__APPLE__=0A+#include=20<termios.h>=0A+#include=20<util.h>=0A=
+#else=0A=20#include=20<pty.h>=0A+#endif=0A=20#include=20<math.h>=0A=20=0A=
=20#include=20"ui/console.h"=0A--=20=0A1.8.2=0A=0A=

--Apple-Mail=_31435836-81CD-4A9B-A42C-2227A0710D7D--

