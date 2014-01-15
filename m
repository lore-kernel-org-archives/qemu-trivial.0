Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W3T7w-0001TH-31
	for mharc-qemu-trivial@gnu.org; Wed, 15 Jan 2014 11:15:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42694)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W3T7p-0001Ol-3N
	for qemu-trivial@nongnu.org; Wed, 15 Jan 2014 11:15:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W3T7i-0006Do-W9
	for qemu-trivial@nongnu.org; Wed, 15 Jan 2014 11:15:29 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:58766)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1W3T7W-0006At-PG; Wed, 15 Jan 2014 11:15:10 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 2E060413BC;
	Wed, 15 Jan 2014 20:15:10 +0400 (MSK)
Message-ID: <52D6B40D.8080009@msgid.tls.msk.ru>
Date: Wed, 15 Jan 2014 20:15:09 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: David du Colombier <0intro@gmail.com>
References: <1387981063-14880-1-git-send-email-0intro@gmail.com>
In-Reply-To: <1387981063-14880-1-git-send-email-0intro@gmail.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] ide: cmd_exec_dev_diagnostic() always
 set error register to 0x01
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
X-List-Received-Date: Wed, 15 Jan 2014 16:15:35 -0000

25.12.2013 18:17, David du Colombier wrote:
> This notably fix IDE CD probing on the Plan 9 operating system,
> which rely on the error register set by the Execute Device
> Diagnostic command to detect drive configurations.

While this is a one-liner, I'm not sure it is "trivial enough", just beca=
use
it is not at all obvious we shuold clear error here and not somewhere els=
e.
I mean, shouldn't s->error be cleared somewhere when next request is queu=
ed,
or something like that?

That's basically why I haven't applied this initially.

CC'ing qemu-devel.

Thanks,

/mjt

> Thanks to R=C3=A9mi Pommarel for reporting this issue.
>=20
> Signed-off-by: David du Colombier <0intro@gmail.com>
> ---
>  hw/ide/core.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/ide/core.c b/hw/ide/core.c
> index e1f4c33..7783d58 100644
> --- a/hw/ide/core.c
> +++ b/hw/ide/core.c
> @@ -1321,6 +1321,7 @@ static bool cmd_exec_dev_diagnostic(IDEState *s, =
uint8_t cmd)
>          s->status =3D 0; /* ATAPI spec (v6) section 9.10 defines packe=
t
>                          * devices to return a clear status register
>                          * with READY_STAT *not* set. */
> +        s->error =3D 0x01;
>      } else {
>          s->status =3D READY_STAT | SEEK_STAT;
>          /* The bits of the error register are not as usual for this co=
mmand!
>=20


