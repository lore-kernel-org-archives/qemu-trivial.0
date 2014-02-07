Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WBfVk-0003gh-3M
	for mharc-qemu-trivial@gnu.org; Fri, 07 Feb 2014 02:06:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60259)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WBfVd-0003Yf-Tw
	for qemu-trivial@nongnu.org; Fri, 07 Feb 2014 02:06:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WBfVY-0003eI-Sh
	for qemu-trivial@nongnu.org; Fri, 07 Feb 2014 02:05:57 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:42137)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WBfVO-0003co-La; Fri, 07 Feb 2014 02:05:42 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 85AD340B49;
	Fri,  7 Feb 2014 11:05:41 +0400 (MSK)
Message-ID: <52F485C5.1020107@msgid.tls.msk.ru>
Date: Fri, 07 Feb 2014 11:05:41 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Alexander Graf <agraf@suse.de>
References: <1391700611-32893-1-git-send-email-agraf@suse.de>
In-Reply-To: <1391700611-32893-1-git-send-email-agraf@suse.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Dmitry Fleytman <dmitry@daynix.com>, qemu-trivial <qemu-trivial@nongnu.org>,
	qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] net: Include iov.h in
	checksum.h
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
X-List-Received-Date: Fri, 07 Feb 2014 07:06:02 -0000

06.02.2014 19:30, Alexander Graf wrote:
> The checksum calculation header exports a function that refers to struc=
t
> iov which is defined in iov.h. Include the header so that the compiler
> knows what this struct is about.

Alternatively (and I sometimes prefer it this way), one can just
declare `struct iovec;' instead of including whole header, because
we don't actually use any definitions from there, and users of
checksum.h wont be including extra dependencies which they don't
use...  Like this:

--- cut ---
Subject: net: declare struct iovec in checksum.h to fix compiler warning
From: Michael Tokarev <mjt@tls.msk.ru>

The checksum calculation header exports a function that refers to
struct iov defined in iov.h.  Without including the former, build
fails like this:

  In file included from hw/net/fsl_etsec/rings.c:24:0:
  include/net/checksum.h:51:31: error: =E2=80=98struct iovec=E2=80=99 dec=
lared inside parameter list [-Werror]
  include/net/checksum.h:51:31: error: its scope is only this definition =
or declaration, which is probably not what you want [-Werror]

Mention struct iovec there.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

diff --git a/include/net/checksum.h b/include/net/checksum.h
index 80203fb..2d7a363 100644
--- a/include/net/checksum.h
+++ b/include/net/checksum.h
@@ -19,6 +19,7 @@
 #define QEMU_NET_CHECKSUM_H

 #include <stdint.h>
+struct iovec;

 uint32_t net_checksum_add_cont(int len, uint8_t *buf, int seq);
 uint16_t net_checksum_finish(uint32_t sum);
--- cut ---
BTW, this is a -trivial matherial ;)

/mjt

