Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wugs6-0003Fv-Mf
	for mharc-qemu-trivial@gnu.org; Wed, 11 Jun 2014 07:39:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <benoit.canet@irqsave.net>) id 1Wugrz-000361-Gt
	for qemu-trivial@nongnu.org; Wed, 11 Jun 2014 07:39:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <benoit.canet@irqsave.net>) id 1Wugru-0000q7-Ph
	for qemu-trivial@nongnu.org; Wed, 11 Jun 2014 07:39:07 -0400
Received: from lputeaux-656-01-25-125.w80-12.abo.wanadoo.fr
	([80.12.84.125]:46568 helo=paradis.irqsave.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <benoit.canet@irqsave.net>)
	id 1Wugrm-0000Zw-5B; Wed, 11 Jun 2014 07:38:54 -0400
Received: from irqsave.net (unknown [192.168.77.254])
	by paradis.irqsave.net (Postfix) with ESMTP id 630DFAA120;
	Wed, 11 Jun 2014 13:38:51 +0200 (CEST)
Date: Wed, 11 Jun 2014 13:38:51 +0200
From: =?iso-8859-1?Q?Beno=EEt?= Canet <benoit.canet@irqsave.net>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20140611113851.GA12946@irqsave.net>
References: <1402415924-1964-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1402415924-1964-1-git-send-email-mjt@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 80.12.84.125
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] virtio.c: fix error message
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
X-List-Received-Date: Wed, 11 Jun 2014 11:39:12 -0000

The Tuesday 10 Jun 2014 =E0 19:58:44 (+0400), Michael Tokarev wrote :
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  hw/virtio/virtio.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 3557c17..a07ae8a 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -440,7 +440,7 @@ void virtqueue_map_sg(struct iovec *sg, hwaddr *add=
r,
>          len =3D sg[i].iov_len;
>          sg[i].iov_base =3D cpu_physical_memory_map(addr[i], &len, is_w=
rite);
>          if (sg[i].iov_base =3D=3D NULL || len !=3D sg[i].iov_len) {
> -            error_report("virtio: trying to map MMIO memory");
> +            error_report("virtio: error trying to map MMIO memory");
>              exit(1);
>          }
>      }
> --=20
> 1.7.10.4
>=20
>=20
Reviewed-by: Benoit Canet <benoit@irqsave.net>

