Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhFKz-0002NF-Nl
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2014 05:37:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55768)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WhFKs-0002Eu-23
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 05:37:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WhFKm-0004LU-KZ
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 05:37:21 -0400
Received: from cantor2.suse.de ([195.135.220.15]:33863 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1WhFKb-0004If-Dn; Mon, 05 May 2014 05:37:05 -0400
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 96514AD11;
	Mon,  5 May 2014 09:37:04 +0000 (UTC)
Message-ID: <53675BBF.5000207@suse.de>
Date: Mon, 05 May 2014 11:37:03 +0200
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Hani Benhabiles <kroosec@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>
References: <1398725186-8202-1-git-send-email-kroosec@gmail.com>
In-Reply-To: <1398725186-8202-1-git-send-email-kroosec@gmail.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qmp: Report path ambiguity
	error.
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
X-List-Received-Date: Mon, 05 May 2014 09:37:28 -0000

Am 29.04.2014 00:46, schrieb Hani Benhabiles:
> Signed-off-by: Hani Benhabiles <hani@linux.com>
> Suggested-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---
>  qmp.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/qmp.c b/qmp.c
> index 74107be..0d49abf 100644
> --- a/qmp.c
> +++ b/qmp.c
> @@ -199,7 +199,10 @@ ObjectPropertyInfoList *qmp_qom_list(const char *p=
ath, Error **errp)
>      ObjectProperty *prop;
> =20
>      obj =3D object_resolve_path(path, &ambiguous);
> -    if (obj =3D=3D NULL) {
> +    if (ambiguous) {
> +        error_setg(errp, "Path '%s' is ambiguous", path);
> +        return NULL;
> +    } else if (obj =3D=3D NULL) {
>          error_set(errp, QERR_DEVICE_NOT_FOUND, path);
>          return NULL;
>      }

This is not quite what I suggested, but assuming bool ambiguous gets
initialized to false, this variant should work too.

Hani, please note that your Signed-off-by should be the last line in the
commit message. No need to resend just for that. I'll try to dig out the
code for a proper Rb later.

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

