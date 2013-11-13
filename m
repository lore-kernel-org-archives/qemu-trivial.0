Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VgaE9-0002H7-KF
	for mharc-qemu-trivial@gnu.org; Wed, 13 Nov 2013 08:11:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56263)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VgaE1-0001z4-1b
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 08:11:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VgaDw-0001nP-AS
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 08:11:16 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:43094)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VgaDf-0001jr-Ei; Wed, 13 Nov 2013 08:10:55 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CA8BE41757;
	Wed, 13 Nov 2013 17:10:52 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 55A34529;
	Wed, 13 Nov 2013 17:01:25 +0400 (MSK)
Received: (nullmailer pid 16043 invoked by uid 1000);
	Wed, 13 Nov 2013 13:01:24 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@amazon.com>
Date: Wed, 13 Nov 2013 17:01:10 +0400
Message-Id: <1384347680-15976-7-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1384347680-15976-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1384347680-15976-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Antony Pavlov <antonynpavlov@gmail.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 06/16] vl: fix build when configured with no
	graphic support
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
X-List-Received-Date: Wed, 13 Nov 2013 13:11:21 -0000

From: Antony Pavlov <antonynpavlov@gmail.com>

The following error occurs when building with no graphic output support:

  vl.c: In function =E2=80=98main=E2=80=99:
  vl.c:2829:19: error: variable =E2=80=98ds=E2=80=99 set but not used [-W=
error=3Dunused-but-set-variable]
       DisplayState *ds;
                     ^
  cc1: all warnings being treated as errors

To reproduce this issue, just run:

  $ ./configure \
      --disable-curses \
      --disable-sdl \
      --disable-cocoa \
      --disable-gtk \
      --disable-vnc \
      --enable-werror
  $ make vl.o

Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 vl.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/vl.c b/vl.c
index 4ad15b8..b5ec266 100644
--- a/vl.c
+++ b/vl.c
@@ -4267,6 +4267,7 @@ int main(int argc, char **argv, char **envp)
     /* init local displays */
     switch (display_type) {
     case DT_NOGRAPHIC:
+        (void)ds;	/* avoid warning if no display is configured */
         break;
 #if defined(CONFIG_CURSES)
     case DT_CURSES:
--=20
1.7.10.4


