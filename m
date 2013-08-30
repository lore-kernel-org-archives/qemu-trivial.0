Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VFngm-0005KV-I5
	for mharc-qemu-trivial@gnu.org; Sat, 31 Aug 2013 12:06:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32904)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <benoit.canet@irqsave.net>) id 1VFWVP-0001Ac-T9
	for qemu-trivial@nongnu.org; Fri, 30 Aug 2013 17:45:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <benoit.canet@irqsave.net>) id 1VFWVK-00052U-QC
	for qemu-trivial@nongnu.org; Fri, 30 Aug 2013 17:45:23 -0400
Received: from nodalink.pck.nerim.net ([62.212.105.220]:58107
	helo=paradis.irqsave.net) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <benoit.canet@irqsave.net>)
	id 1VFWV9-0004s6-35; Fri, 30 Aug 2013 17:45:07 -0400
Received: by paradis.irqsave.net (Postfix, from userid 1002)
	id 59D778746C1; Fri, 30 Aug 2013 23:45:04 +0200 (CEST)
Received: from irqsave.net (unknown [192.168.77.1])
	by paradis.irqsave.net (Postfix) with ESMTP id 30149874170;
	Fri, 30 Aug 2013 23:45:01 +0200 (CEST)
Date: Fri, 30 Aug 2013 23:47:05 +0200
From: =?iso-8859-1?Q?Beno=EEt?= Canet <benoit.canet@irqsave.net>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20130830214705.GE5170@irqsave.net>
References: <1377895451-6603-1-git-send-email-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1377895451-6603-1-git-send-email-eblake@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 62.212.105.220
X-Mailman-Approved-At: Sat, 31 Aug 2013 12:06:15 -0400
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [PATCHv2] qmp: fix integer usage in examples
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
X-List-Received-Date: Fri, 30 Aug 2013 21:45:29 -0000

Le Friday 30 Aug 2013 =E0 14:44:11 (-0600), Eric Blake a =E9crit :
> Per the qapi schema, block_set_io_throttle takes most arguments
> as ints, not strings.
>=20
> * qmp-commands.hx (block_set_io_throttle): Use correct type.  Fix
> whitespace and a copy-paste bug in the process.
>=20
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>=20
> v2: also touch up the doc comments
>=20
>  qmp-commands.hx | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>=20
> diff --git a/qmp-commands.hx b/qmp-commands.hx
> index bb09e72..8a8f342 100644
> --- a/qmp-commands.hx
> +++ b/qmp-commands.hx
> @@ -1402,22 +1402,22 @@ Change I/O throttle limits for a block drive.
>  Arguments:
>=20
>  - "device": device name (json-string)
> -- "bps":  total throughput limit in bytes per second(json-int)
> -- "bps_rd":  read throughput limit in bytes per second(json-int)
> -- "bps_wr":  read throughput limit in bytes per second(json-int)
> -- "iops":  total I/O operations per second(json-int)
> -- "iops_rd":  read I/O operations per second(json-int)
> -- "iops_wr":  write I/O operations per second(json-int)
> +- "bps": total throughput limit in bytes per second (json-int)
> +- "bps_rd": read throughput limit in bytes per second (json-int)
> +- "bps_wr": write throughput limit in bytes per second (json-int)
> +- "iops": total I/O operations per second (json-int)
> +- "iops_rd": read I/O operations per second (json-int)
> +- "iops_wr": write I/O operations per second (json-int)
>=20
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
> @@ -1791,7 +1791,7 @@ Each json-object contain the following:
>                   - "vm-state-size": size of the VM state in bytes (jso=
n-int)
>                   - "date-sec": UTC date of the snapshot in seconds (js=
on-int)
>                   - "date-nsec": fractional part in nanoseconds to be u=
sed with
> -                                date-sec(json-int)
> +                                date-sec (json-int)
>                   - "vm-clock-sec": VM clock relative to boot in second=
s
>                                     (json-int)
>                   - "vm-clock-nsec": fractional part in nanoseconds to =
be used
> --=20
> 1.8.3.1
>=20

Reviewed-by: Benoit Canet <benoit@irqsave.net>

