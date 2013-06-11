Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmMvS-0008FU-4P
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jun 2013 07:39:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54349)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UmMvQ-0008DI-Ia
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 07:39:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UmMvP-0003E3-09
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 07:39:44 -0400
Received: from cantor2.suse.de ([195.135.220.15]:43094 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1UmMvL-0003DW-EZ; Tue, 11 Jun 2013 07:39:39 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id E728EA50DD;
	Tue, 11 Jun 2013 13:39:38 +0200 (CEST)
Message-ID: <51B70C7A.1070102@suse.de>
Date: Tue, 11 Jun 2013 13:39:38 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: liguang <lig.fnst@cn.fujitsu.com>
References: <1370927720-4348-1-git-send-email-lig.fnst@cn.fujitsu.com>
In-Reply-To: <1370927720-4348-1-git-send-email-lig.fnst@cn.fujitsu.com>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Tim Hardeck <thardeck@suse.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/5] vnc: pass bool
	pararmeter for vnc_connect
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
X-List-Received-Date: Tue, 11 Jun 2013 11:39:45 -0000

"parameter"

Am 11.06.2013 07:15, schrieb liguang:
> type last parameter of vnc_connect if bool,

"Type of last ...", "is"

> so pass 'false' instead of '0' for it.
>=20
> Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>

Michael, can you fix those up? Then,

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Thanks,
Andreas

> ---
>  ui/vnc.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/ui/vnc.c b/ui/vnc.c
> index dfc7459..7d22660 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -3283,7 +3283,7 @@ void vnc_display_open(DisplayState *ds, const cha=
r *display, Error **errp)
>          if (csock < 0) {
>              goto fail;
>          }
> -        vnc_connect(vs, csock, 0, 0);
> +        vnc_connect(vs, csock, 0, false);
>      } else {
>          /* listen for connects */
>          char *dpy;
> @@ -3345,5 +3345,5 @@ void vnc_display_add_client(DisplayState *ds, int=
 csock, int skipauth)
>  {
>      VncDisplay *vs =3D vnc_display;
> =20
> -    vnc_connect(vs, csock, skipauth, 0);
> +    vnc_connect(vs, csock, skipauth, false);
>  }
>=20


--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

