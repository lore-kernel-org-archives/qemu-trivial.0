Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1arYFL-00015t-Bg
	for mharc-qemu-trivial@gnu.org; Sat, 16 Apr 2016 17:59:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37020)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1arYFI-0000zy-GK
	for qemu-trivial@nongnu.org; Sat, 16 Apr 2016 17:59:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1arYFH-0001hX-Qk
	for qemu-trivial@nongnu.org; Sat, 16 Apr 2016 17:59:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45463)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>)
	id 1arYFD-0001h5-L0; Sat, 16 Apr 2016 17:59:11 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E9158C057EC6;
	Sat, 16 Apr 2016 21:59:09 +0000 (UTC)
Received: from [10.36.116.46] (ovpn-116-46.ams2.redhat.com [10.36.116.46])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3GLx772024365
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 16 Apr 2016 17:59:08 -0400
To: Changlong Xie <xiecl.fnst@cn.fujitsu.com>,
	qemu devel <qemu-devel@nongnu.org>,
	qemu trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>
References: <1460699173-31401-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
	<1460699173-31401-2-git-send-email-xiecl.fnst@cn.fujitsu.com>
Cc: Wen Congyang <wency@cn.fujitsu.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <5712B5AA.8000707@redhat.com>
Date: Sat, 16 Apr 2016 23:59:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <1460699173-31401-2-git-send-email-xiecl.fnst@cn.fujitsu.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="lEijE8T1bfDQEmDQituU3xMB2dD4T46pv"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v1 1/2] block: fix description of @stats
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Apr 2016 21:59:17 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lEijE8T1bfDQEmDQituU3xMB2dD4T46pv
Content-Type: multipart/mixed; boundary="uOOoT0lCgVBo2CdwCoj12vb6qUgEXoX6S"
From: Max Reitz <mreitz@redhat.com>
To: Changlong Xie <xiecl.fnst@cn.fujitsu.com>,
 qemu devel <qemu-devel@nongnu.org>, qemu trivial <qemu-trivial@nongnu.org>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Cc: Wen Congyang <wency@cn.fujitsu.com>
Message-ID: <5712B5AA.8000707@redhat.com>
Subject: Re: [PATCH v1 1/2] block: fix description of @stats
References: <1460699173-31401-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
 <1460699173-31401-2-git-send-email-xiecl.fnst@cn.fujitsu.com>
In-Reply-To: <1460699173-31401-2-git-send-email-xiecl.fnst@cn.fujitsu.com>

--uOOoT0lCgVBo2CdwCoj12vb6qUgEXoX6S
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable

On 15.04.2016 07:46, Changlong Xie wrote:
> Qemu does not support "info blockstats" now.

It doesn't? Mine is more than happy to accept that command:

$ x86_64-softmmu/qemu-system-x86_64 -nodefaults \
    -drive if=3Dnone,id=3Ddrv0,driver=3Dnull-co \
    -monitor stdio
QEMU 2.5.90 monitor - type 'help' for more information
(qemu) info blockstats
drv0: rd_bytes=3D0 wr_bytes=3D0 rd_operations=3D0 wr_operations=3D0
flush_operations=3D0 wr_total_time_ns=3D0 rd_total_time_ns=3D0
flush_total_time_ns=3D0 rd_merged=3D0 wr_merged=3D0 idle_time_ns=3D0

Max

> Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
> ---
>  block/block-backend.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/block/block-backend.c b/block/block-backend.c
> index d74f670..05d5d09 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -49,7 +49,7 @@ struct BlockBackend {
> =20
>      bool enable_write_cache;
> =20
> -    /* I/O stats (display with "info blockstats"). */
> +    /* I/O stats (display with { "execute": "query-blockstats" }). */
>      BlockAcctStats stats;
> =20
>      BlockdevOnError on_read_error, on_write_error;
>=20



--uOOoT0lCgVBo2CdwCoj12vb6qUgEXoX6S--

--lEijE8T1bfDQEmDQituU3xMB2dD4T46pv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXErWrAAoJEDuxQgLoOKytO1AH/0Q5Kfb41ZCUAzc4J6/BzuXk
8JF/4P5xZnhbsKS9CQh4z/LDbGtAv/dnQd9XBLVawlxKt2DWSM9HveFSvrtCvi/l
DbIVqgWKMCvDGREwbBAeMvvXRjw6rDACYtiSzdNIDnIj7UqomH9+77iwqcqn8uQk
0/ABSPjOrwP4fzcKiML35n97JI1wpzh78UG3D3JjKnwr7CPJpRibks2Tsaj5QD5W
79iwz2lGZU7By59GK5HiihwzAYjhCprj7IpSVSfQ3nZn9rFIZ3IvC38FPnuzA894
JJJy6bcZ5SP+El1ql25pVhhxbgAXCzlQZS2989fQ22S1XHItdTRRYR6DoTWER2s=
=lGow
-----END PGP SIGNATURE-----

--lEijE8T1bfDQEmDQituU3xMB2dD4T46pv--

