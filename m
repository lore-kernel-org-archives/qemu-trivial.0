Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VFngk-0005H5-1b
	for mharc-qemu-trivial@gnu.org; Sat, 31 Aug 2013 12:06:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39782)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <benoit.canet@irqsave.net>) id 1VFV5d-0003LC-Sg
	for qemu-trivial@nongnu.org; Fri, 30 Aug 2013 16:14:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <benoit.canet@irqsave.net>) id 1VFV5X-0006Ve-TF
	for qemu-trivial@nongnu.org; Fri, 30 Aug 2013 16:14:41 -0400
Received: from nodalink.pck.nerim.net ([62.212.105.220]:58061
	helo=paradis.irqsave.net) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <benoit.canet@irqsave.net>)
	id 1VFV5K-0006T1-Lj; Fri, 30 Aug 2013 16:14:22 -0400
Received: by paradis.irqsave.net (Postfix, from userid 1002)
	id 56EBD8746C1; Fri, 30 Aug 2013 22:14:20 +0200 (CEST)
Received: from irqsave.net (unknown [192.168.77.1])
	by paradis.irqsave.net (Postfix) with ESMTP id 694C88746C4;
	Fri, 30 Aug 2013 22:12:53 +0200 (CEST)
Date: Fri, 30 Aug 2013 22:14:57 +0200
From: =?iso-8859-1?Q?Beno=EEt?= Canet <benoit.canet@irqsave.net>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20130830201457.GB5170@irqsave.net>
References: <1377891353-10682-1-git-send-email-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1377891353-10682-1-git-send-email-eblake@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 62.212.105.220
X-Mailman-Approved-At: Sat, 31 Aug 2013 12:06:11 -0400
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] qmp: fix integer usage in examples
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
X-List-Received-Date: Fri, 30 Aug 2013 20:14:48 -0000

Le Friday 30 Aug 2013 =E0 13:35:53 (-0600), Eric Blake a =E9crit :
> * qmp-commands.hx (block_set_io_throttle): Use correct type.
>=20
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>=20
> Noticed while reviewing Beno=EEt's series of "Continuous Leaky Bucket
> Throttling" - depending on whose patch goes in first, the other
> will have to rebase...
>=20
>  qmp-commands.hx | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/qmp-commands.hx b/qmp-commands.hx
> index bb09e72..87cfdce 100644
> --- a/qmp-commands.hx
> +++ b/qmp-commands.hx
> @@ -1412,12 +1412,12 @@ Arguments:
>  Example:
>=20
>  -> { "execute": "block_set_io_throttle", "arguments": { "device": "vir=
tio0",
> -                                               "bps": "1000000",
> -                                               "bps_rd": "0",
> -                                               "bps_wr": "0",
> -                                               "iops": "0",
> -                                               "iops_rd": "0",
> -                                               "iops_wr": "0" } }
> +                                               "bps": 1000000,
> +                                               "bps_rd": 0,
> +                                               "bps_wr": 0,
> +                                               "iops": 0,
> +                                               "iops_rd": 0,
> +                                               "iops_wr": 0 } }
>  <- { "return": {} }
>=20
>  EQMP
> --=20
> 1.8.3.1
>=20

I rebased my series on top of Eric patch.

Best regards

Beno=EEt

