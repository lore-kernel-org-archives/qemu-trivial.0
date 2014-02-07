Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WBgGc-0001ro-QW
	for mharc-qemu-trivial@gnu.org; Fri, 07 Feb 2014 02:54:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39423)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1WBgGV-0001i0-7U
	for qemu-trivial@nongnu.org; Fri, 07 Feb 2014 02:54:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1WBgGP-0008JP-6V
	for qemu-trivial@nongnu.org; Fri, 07 Feb 2014 02:54:23 -0500
Received: from cantor2.suse.de ([195.135.220.15]:50293 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1WBgGD-0008Hg-0i; Fri, 07 Feb 2014 02:54:05 -0500
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 29458AAD0;
	Fri,  7 Feb 2014 07:54:04 +0000 (UTC)
Content-Type: text/plain;
	charset=cp932
Mime-Version: 1.0 (1.0)
From: Alexander Graf <agraf@suse.de>
X-Mailer: iPhone Mail (11B554a)
In-Reply-To: <52F485C5.1020107@msgid.tls.msk.ru>
Date: Fri, 7 Feb 2014 08:54:00 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <0C8B4C82-8DB7-4B5E-81F0-0C321856BB70@suse.de>
References: <1391700611-32893-1-git-send-email-agraf@suse.de>
	<52F485C5.1020107@msgid.tls.msk.ru>
To: Michael Tokarev <mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.135.220.15
Cc: Dmitry Fleytman <dmitry@daynix.com>, qemu-trivial <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
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
X-List-Received-Date: Fri, 07 Feb 2014 07:54:29 -0000



> Am 07.02.2014 um 08:05 schrieb Michael Tokarev <mjt@tls.msk.ru>:
>=20
> 06.02.2014 19:30, Alexander Graf wrote:
>> The checksum calculation header exports a function that refers to struct
>> iov which is defined in iov.h. Include the header so that the compiler
>> knows what this struct is about.
>=20
> Alternatively (and I sometimes prefer it this way), one can just
> declare `struct iovec;' instead of including whole header, because
> we don't actually use any definitions from there, and users of
> checksum.h wont be including extra dependencies which they don't
> use...  Like this:

Either way works for me :)

Alex

>=20
> --- cut ---
> Subject: net: declare struct iovec in checksum.h to fix compiler warning
> From: Michael Tokarev <mjt@tls.msk.ru>
>=20
> The checksum calculation header exports a function that refers to
> struct iov defined in iov.h.  Without including the former, build
> fails like this:
>=20
>  In file included from hw/net/fsl_etsec/rings.c:24:0:
>  include/net/checksum.h:51:31: error: =81estruct iovec=81f declared inside=
 parameter list [-Werror]
>  include/net/checksum.h:51:31: error: its scope is only this definition or=
 declaration, which is probably not what you want [-Werror]
>=20
> Mention struct iovec there.
>=20
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>=20
> diff --git a/include/net/checksum.h b/include/net/checksum.h
> index 80203fb..2d7a363 100644
> --- a/include/net/checksum.h
> +++ b/include/net/checksum.h
> @@ -19,6 +19,7 @@
> #define QEMU_NET_CHECKSUM_H
>=20
> #include <stdint.h>
> +struct iovec;
>=20
> uint32_t net_checksum_add_cont(int len, uint8_t *buf, int seq);
> uint16_t net_checksum_finish(uint32_t sum);
> --- cut ---
> BTW, this is a -trivial matherial ;)
>=20
> /mjt

