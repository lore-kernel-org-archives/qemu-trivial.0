Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmMsq-0007Lz-04
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jun 2013 07:37:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53987)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UmMsm-0007Hz-Ow
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 07:37:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UmMsl-0002R4-FD
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 07:37:00 -0400
Received: from cantor2.suse.de ([195.135.220.15]:42908 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1UmMsi-0002Qa-1a; Tue, 11 Jun 2013 07:36:56 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 45C22A4EB7;
	Tue, 11 Jun 2013 13:36:55 +0200 (CEST)
Message-ID: <51B70BD6.3090501@suse.de>
Date: Tue, 11 Jun 2013 13:36:54 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: liguang <lig.fnst@cn.fujitsu.com>
References: <1370927720-4348-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<1370927720-4348-2-git-send-email-lig.fnst@cn.fujitsu.com>
In-Reply-To: <1370927720-4348-2-git-send-email-lig.fnst@cn.fujitsu.com>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Tim Hardeck <thardeck@suse.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/5] vnc: pass bool
	parameter for vnc_listen_read
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
X-List-Received-Date: Tue, 11 Jun 2013 11:37:02 -0000

Am 11.06.2013 07:15, schrieb liguang:
> Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

CC'ing Tim.

Andreas

> ---
>  ui/vnc.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/ui/vnc.c b/ui/vnc.c
> index 7d22660..1a8b940 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -2889,13 +2889,13 @@ static void vnc_listen_read(void *opaque, bool =
websocket)
> =20
>  static void vnc_listen_regular_read(void *opaque)
>  {
> -    vnc_listen_read(opaque, 0);
> +    vnc_listen_read(opaque, false);
>  }
> =20
>  #ifdef CONFIG_VNC_WS
>  static void vnc_listen_websocket_read(void *opaque)
>  {
> -    vnc_listen_read(opaque, 1);
> +    vnc_listen_read(opaque, true);
>  }
>  #endif /* CONFIG_VNC_WS */
> =20
>=20


--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

