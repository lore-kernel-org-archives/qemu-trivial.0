Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T9HtW-0004ZX-W8
	for mharc-qemu-trivial@gnu.org; Wed, 05 Sep 2012 11:51:59 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43139)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1T9HtO-0004AT-Lk
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 11:51:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1T9HtN-0000lJ-IK
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 11:51:50 -0400
Received: from cantor2.suse.de ([195.135.220.15]:49253 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1T9Ht7-0000iL-Go; Wed, 05 Sep 2012 11:51:33 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 10AEAA2FD7;
	Wed,  5 Sep 2012 17:51:31 +0200 (CEST)
Message-ID: <504774FF.6000501@suse.de>
Date: Wed, 05 Sep 2012 17:51:27 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120825 Thunderbird/15.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1346703803-22003-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1346703803-22003-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.4.4
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] sparc-dis: Remove redundant
	NULL check
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
X-List-Received-Date: Wed, 05 Sep 2012 15:51:57 -0000

Am 03.09.2012 22:23, schrieb Stefan Weil:
> Report from smatch:
> sparc-dis.c:2664 build_hash_table(14) info:
>  redundant null check on hash_buf calling free()
>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>=20
> Coding style was not fixed.
>=20
> - sw
>=20
>  sparc-dis.c |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/sparc-dis.c b/sparc-dis.c
> index cdd337a..ef28835 100644
> --- a/sparc-dis.c
> +++ b/sparc-dis.c
> @@ -2660,8 +2660,7 @@ build_hash_table (const sparc_opcode **opcode_tab=
le,
> =20
>    memset (hash_table, 0, HASH_SIZE * sizeof (hash_table[0]));
>    memset (hash_count, 0, HASH_SIZE * sizeof (hash_count[0]));
> -  if (hash_buf !=3D NULL)
> -    free (hash_buf);
> +  free (hash_buf);
>    hash_buf =3D malloc (sizeof (* hash_buf) * num_opcodes);
>    for (i =3D num_opcodes - 1; i >=3D 0; --i)
>      {

*-dis sounds like binutils - did upstream drop the if, too?
If not, then diverging for a non-issue does not seem necessary.

Having said that, it's amazing what fixes you come up with. Did you
describe the use of that tool in some posting or in the Wiki?

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

