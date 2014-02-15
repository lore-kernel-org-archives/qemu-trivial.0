Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WEeIT-0007AC-KA
	for mharc-qemu-trivial@gnu.org; Sat, 15 Feb 2014 07:24:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48995)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WEeIN-0006xk-A8
	for qemu-trivial@nongnu.org; Sat, 15 Feb 2014 07:24:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WEeII-0000Cd-Rx
	for qemu-trivial@nongnu.org; Sat, 15 Feb 2014 07:24:35 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:34473)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WEeI4-0000A1-Q6; Sat, 15 Feb 2014 07:24:16 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 369B241C2B;
	Sat, 15 Feb 2014 16:24:16 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B844B21D;
	Sat, 15 Feb 2014 16:18:22 +0400 (MSK)
Received: (nullmailer pid 21832 invoked by uid 1000);
	Sat, 15 Feb 2014 12:18:22 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat, 15 Feb 2014 16:18:16 +0400
Message-Id: <1392466700-21770-7-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1392466700-21770-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1392466700-21770-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 06/10] net: declare struct iovec in checksum.h
	to fix compiler warning
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
X-List-Received-Date: Sat, 15 Feb 2014 12:24:39 -0000

The checksum calculation header exports a function that refers to
struct iov defined in iov.h.  Without including the former, build
fails like this:

  In file included from hw/net/fsl_etsec/rings.c:24:0:
  include/net/checksum.h:51:31: error: =E2=80=98struct iovec=E2=80=99 dec=
lared inside parameter list [-Werror]
  include/net/checksum.h:51:31: error: its scope is only this definition =
or declaration, which is probably not what you want [-Werror]

Mention struct iovec there.

Reported-by: Alexander Graf <agraf@suse.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/net/checksum.h |    1 +
 1 file changed, 1 insertion(+)

diff --git a/include/net/checksum.h b/include/net/checksum.h
index 80203fb..2d7a363 100644
--- a/include/net/checksum.h
+++ b/include/net/checksum.h
@@ -19,6 +19,7 @@
 #define QEMU_NET_CHECKSUM_H
=20
 #include <stdint.h>
+struct iovec;
=20
 uint32_t net_checksum_add_cont(int len, uint8_t *buf, int seq);
 uint16_t net_checksum_finish(uint32_t sum);
--=20
1.7.10.4


