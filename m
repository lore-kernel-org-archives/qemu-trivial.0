Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R2qoh-0008AS-86
	for mharc-qemu-trivial@gnu.org; Sun, 11 Sep 2011 16:39:51 -0400
Received: from eggs.gnu.org ([140.186.70.92]:50088)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1R2qod-0007xL-2J
	for qemu-trivial@nongnu.org; Sun, 11 Sep 2011 16:39:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1R2qoc-0008DL-4F
	for qemu-trivial@nongnu.org; Sun, 11 Sep 2011 16:39:47 -0400
Received: from cantor2.suse.de ([195.135.220.15]:43278 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1R2qoZ-0008Cd-Gg; Sun, 11 Sep 2011 16:39:43 -0400
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.221.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id B5BFF8A95F;
	Sun, 11 Sep 2011 22:39:42 +0200 (CEST)
References: <1315688954-14621-1-git-send-email-weil@mail.berlios.de>
In-Reply-To: <1315688954-14621-1-git-send-email-weil@mail.berlios.de>
Mime-Version: 1.0 (iPhone Mail 8G4)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii
Message-Id: <68748506-3E70-4AF2-AA49-5A23141725DA@suse.de>
X-Mailer: iPhone Mail (8G4)
From: Alexander Graf <agraf@suse.de>
Date: Sun, 11 Sep 2011 22:39:33 +0200
To: Stefan Weil <weil@mail.berlios.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	=?utf-8?Q?Andreas_F=C3=A4rber?= <andreas.faerber@web.de>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-doc: Remove URL which
	is no longer available
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
X-List-Received-Date: Sun, 11 Sep 2011 20:39:48 -0000


Am 10.09.2011 um 23:09 schrieb Stefan Weil <weil@mail.berlios.de>:

> http://perso.magic.fr/l_indien/ was removed several years ago.
> There is obviously no mirror or any other replacement for it.

I would prefer to see the sources in a public git repo and to have ppc_rom.b=
in rebuilt from that. IIUC Andreas is already working on this.

Alex

>=20
> Signed-off-by: Stefan Weil <weil@mail.berlios.de>
> ---
> qemu-doc.texi |    6 +-----
> 1 files changed, 1 insertions(+), 5 deletions(-)
>=20
> diff --git a/qemu-doc.texi b/qemu-doc.texi
> index 31199f6..a1e86c1 100644
> --- a/qemu-doc.texi
> +++ b/qemu-doc.texi
> @@ -1493,8 +1493,7 @@ PREP Non Volatile RAM
> PC compatible keyboard and mouse.
> @end itemize
>=20
> -QEMU uses the Open Hack'Ware Open Firmware Compatible BIOS available at
> -@url{http://perso.magic.fr/l_indien/OpenHackWare/index.htm}.
> +QEMU uses the Open Hack'Ware Open Firmware Compatible BIOS.
>=20
> Since version 0.9.1, QEMU uses OpenBIOS @url{http://www.openbios.org/}
> for the g3beige and mac99 PowerMac machines. OpenBIOS is a free (GPL
> @@ -1528,9 +1527,6 @@ These variables are not used by Open Hack'Ware.
> @c man end
>=20
>=20
> -More information is available at
> -@url{http://perso.magic.fr/l_indien/qemu-ppc/}.
> -
> @node Sparc32 System emulator
> @section Sparc32 System emulator
> @cindex system emulation (Sparc32)
> --=20
> 1.7.2.5
>=20
>=20

