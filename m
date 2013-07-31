Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V4SQ0-0001em-1t
	for mharc-qemu-trivial@gnu.org; Wed, 31 Jul 2013 05:10:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50599)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1V4SPt-0001eH-7Y
	for qemu-trivial@nongnu.org; Wed, 31 Jul 2013 05:10:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1V4R35-0001P0-C2
	for qemu-trivial@nongnu.org; Wed, 31 Jul 2013 03:42:37 -0400
Received: from cantor2.suse.de ([195.135.220.15]:41399 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1V4R2i-0001Dh-25; Wed, 31 Jul 2013 03:41:56 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 648DFA4EB7;
	Wed, 31 Jul 2013 09:41:55 +0200 (CEST)
Message-ID: <51F8BFC0.1050306@suse.de>
Date: Wed, 31 Jul 2013 09:41:52 +0200
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1375246847-30624-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1375246847-30624-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for 1.6] hw/core: Fix wrong
 left shift (build regression)
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
X-List-Received-Date: Wed, 31 Jul 2013 09:10:02 -0000

Am 31.07.2013 07:00, schrieb Stefan Weil:
> Shifting a long int (32 bit) by 40 bit positions won't work.
> Compiler message:
>=20
> hw/core/qdev-properties.c: In function =E2=80=98print_size=E2=80=99:
> hw/core/qdev-properties.c:1180:5: warning: left shift count >=3D width =
of type
>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/core/qdev-properties.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Compare rth's patch:
http://patchwork.ozlabs.org/patch/263513/

Andreas

>=20
> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> index 8d43a8d..e82ab87 100644
> --- a/hw/core/qdev-properties.c
> +++ b/hw/core/qdev-properties.c
> @@ -1177,7 +1177,7 @@ static int print_size(DeviceState *dev, Property =
*prop, char *dest, size_t len)
>      int i =3D 0;
>      uint64_t div;
> =20
> -    for (div =3D (long int)1 << 40; !(*ptr / div) ; div >>=3D 10) {
> +    for (div =3D 1ULL << 40; !(*ptr / div); div >>=3D 10) {
>          i++;
>      }
>      return snprintf(dest, len, "%0.03f%c", (double)*ptr/div, suffixes[=
i]);
>=20


--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

