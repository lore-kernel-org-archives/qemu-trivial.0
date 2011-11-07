Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RNNBF-0007PP-Fd
	for mharc-qemu-trivial@gnu.org; Mon, 07 Nov 2011 06:15:57 -0500
Received: from eggs.gnu.org ([140.186.70.92]:45171)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1RNNB9-00074Q-NY
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 06:15:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1RNNB8-0006zR-G4
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 06:15:51 -0500
Received: from cantor2.suse.de ([195.135.220.15]:57919 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1RNNAs-0006wP-Gy; Mon, 07 Nov 2011 06:15:34 -0500
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.221.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 063448A908;
	Mon,  7 Nov 2011 12:15:30 +0100 (CET)
Message-ID: <4EB7BDC9.6050305@suse.de>
Date: Mon, 07 Nov 2011 12:15:21 +0100
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: =?UTF-8?B?SGVydsOpIFBvdXNzaW5lYXU=?= <hpoussin@reactos.org>
References: <1320616132-21864-1-git-send-email-hpoussin@reactos.org>
In-Reply-To: <1320616132-21864-1-git-send-email-hpoussin@reactos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/3] sonic: fix typo
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
X-List-Received-Date: Mon, 07 Nov 2011 11:15:55 -0000

Would be nice to add description:

Remove a doubled semicolon.

Am 06.11.2011 22:48, schrieb Herv=C3=A9 Poussineau:
>=20
> Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>

Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>

Andreas

> ---
>  hw/dp8393x.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/hw/dp8393x.c b/hw/dp8393x.c
> index f66844b..cfec4cb 100644
> --- a/hw/dp8393x.c
> +++ b/hw/dp8393x.c
> @@ -515,7 +515,7 @@ static void write_register(dp8393xState *s, int reg=
, uint16_t val)
>      switch (reg) {
>          /* Command register */
>          case SONIC_CR:
> -            do_command(s, val);;
> +            do_command(s, val);
>              break;
>          /* Prevent write to read-only registers */
>          case SONIC_CAP2:


--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

