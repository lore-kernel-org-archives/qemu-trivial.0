Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UYzZ4-0006Zx-Db
	for mharc-qemu-trivial@gnu.org; Sun, 05 May 2013 10:05:22 -0400
Received: from eggs.gnu.org ([208.118.235.92]:48320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UYzZ2-0006WR-4X
	for qemu-trivial@nongnu.org; Sun, 05 May 2013 10:05:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UYzZ1-0000bo-4C
	for qemu-trivial@nongnu.org; Sun, 05 May 2013 10:05:20 -0400
Received: from cantor2.suse.de ([195.135.220.15]:42466 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1UYzYy-0000bL-Sx; Sun, 05 May 2013 10:05:17 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 175C6A5230;
	Sun,  5 May 2013 16:05:16 +0200 (CEST)
Message-ID: <51866716.4040508@suse.de>
Date: Sun, 05 May 2013 16:05:10 +0200
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: =?UTF-8?B?SGVydsOpIFBvdXNzaW5lYXU=?= <hpoussin@reactos.org>,
	Gerd Hoffmann <kraxel@redhat.com>
References: <1367677057-6809-1-git-send-email-hpoussin@reactos.org>
In-Reply-To: <1367677057-6809-1-git-send-email-hpoussin@reactos.org>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-1.5] audio: update
 documentation after removing --audio-card-list option
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
X-List-Received-Date: Sun, 05 May 2013 14:05:21 -0000

Am 04.05.2013 16:17, schrieb Herv=C3=A9 Poussineau:
> Commit 98af93fde2e37b5b0c8cee9036e028fe6df6446c removed the
> --audio-card-list option in configure, and commit
> 8f3b664f6cc4153cc73941c941d54c4e499b7537 always compiled in
> the adlib, gus and cs4231a audio cards.
>=20
> Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
> ---
>  qemu-doc.texi |    4 ----
>  1 file changed, 4 deletions(-)
>=20
> diff --git a/qemu-doc.texi b/qemu-doc.texi
> index 64493eb..5fc0eae 100644
> --- a/qemu-doc.texi
> +++ b/qemu-doc.texi
> @@ -214,10 +214,6 @@ PCI UHCI USB controller and a virtual USB hub.
> =20
>  SMP is supported with up to 255 CPUs.
> =20
> -Note that adlib, gus and cs4231a are only available when QEMU was
> -configured with --audio-card-list option containing the name(s) of
> -required card(s).
> -
>  QEMU uses the PC BIOS from the Bochs project and the Plex86/Bochs LGPL
>  VGA BIOS.
> =20

Unrelated to this patch, but the last paragraph doesn't seem to be
up-to-date either: We're no longer using PC BIOS but SeaBIOS for some
time already, aren't we?

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

