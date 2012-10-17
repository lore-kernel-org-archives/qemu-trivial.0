Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TOUz3-0001hy-7Y
	for mharc-qemu-trivial@gnu.org; Wed, 17 Oct 2012 10:52:33 -0400
Received: from eggs.gnu.org ([208.118.235.92]:39046)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1TOUyw-0001N0-D2
	for qemu-trivial@nongnu.org; Wed, 17 Oct 2012 10:52:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1TOUyv-0007Sg-AV
	for qemu-trivial@nongnu.org; Wed, 17 Oct 2012 10:52:26 -0400
Received: from cantor2.suse.de ([195.135.220.15]:49668 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1TOUyj-0007RA-FU; Wed, 17 Oct 2012 10:52:13 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 9BD27A329E;
	Wed, 17 Oct 2012 16:52:12 +0200 (CEST)
Message-ID: <507EA9F8.7090209@suse.de>
Date: Wed, 17 Oct 2012 14:52:08 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121010 Thunderbird/16.0.1
MIME-Version: 1.0
To: Tim Hardeck <thardeck@suse.de>
References: <1350220128-10140-1-git-send-email-thardeck@suse.de>
	<1350220128-10140-2-git-send-email-thardeck@suse.de>
In-Reply-To: <1350220128-10140-2-git-send-email-thardeck@suse.de>
X-Enigmail-Version: 1.5a1pre
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org,
	Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] vnc: fix segfault due
	to failed handshake
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
X-List-Received-Date: Wed, 17 Oct 2012 14:52:31 -0000

Am 14.10.2012 15:08, schrieb Tim Hardeck:
> When the VNC server disconnects due to a failed handshake we don't have
> vs->bh allocated yet.
>=20
> Check for this case and don't delete it.
>=20
> Signed-off-by: Tim Hardeck <thardeck@suse.de>
> ---
>  ui/vnc.c |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/ui/vnc.c b/ui/vnc.c
> index 01b2daf..656895a 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -1055,7 +1055,9 @@ static void vnc_disconnect_finish(VncState *vs)
>      vnc_unlock_output(vs);
> =20
>      qemu_mutex_destroy(&vs->output_mutex);
> -    qemu_bh_delete(vs->bh);
> +    if (vs->bh !=3D NULL) {
> +        qemu_bh_delete(vs->bh);
> +    }
>      buffer_free(&vs->jobs_buffer);
> =20
>      for (i =3D 0; i < VNC_STAT_ROWS; ++i) {

qemu_bh_delete() is not checking for a NULL argument, therefore this fix
looks good to me,

Acked-by: Andreas F=E4rber <afaerber@suse.de>

Adding some CCs.

As a followup it might be a good idea to either assert or ignore a NULL
argument in qemu_bh_delete().

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

