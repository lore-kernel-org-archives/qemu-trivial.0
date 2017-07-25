Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZu9M-0004eT-7u
	for mharc-qemu-trivial@gnu.org; Tue, 25 Jul 2017 03:21:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39257)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1dZu9J-0004ct-Uh
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 03:20:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1dZu9I-00047a-Cg
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 03:20:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45088)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1dZu9B-000424-Sm; Tue, 25 Jul 2017 03:20:50 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D942561D11;
	Tue, 25 Jul 2017 07:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D942561D11
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=cohuck@redhat.com
Received: from gondolin (ovpn-116-214.ams2.redhat.com [10.36.116.214])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DD7CE70485;
	Tue, 25 Jul 2017 07:20:43 +0000 (UTC)
Date: Tue, 25 Jul 2017 09:20:40 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Cc: Eric Blake <eblake@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
	<marcandre.lureau@redhat.com>, Alex Williamson
	<alex.williamson@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Message-ID: <20170725092040.6406aa94@gondolin>
In-Reply-To: <20170724182751.18261-15-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-15-f4bug@amsat.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 25 Jul 2017 07:20:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH for 2.10 14/35] vfio/ccw: fix incorrect
 malloc() size
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
X-List-Received-Date: Tue, 25 Jul 2017 07:20:59 -0000

On Mon, 24 Jul 2017 15:27:30 -0300
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> Since sizeof(struct vfio_irq_info) < sizeof(struct vfio_irq_set) a heap o=
verflow
> never occured. Still, let's use the correct size.
>=20
> hw/vfio/ccw.c:170:16: warning: Cast a region whose size is not a multiple=
 of the destination type size
>     irq_info =3D g_malloc0(sizeof(*irq_set));
>                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/vfio/ccw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
> index 12d0262336..8d97b53e77 100644
> --- a/hw/vfio/ccw.c
> +++ b/hw/vfio/ccw.c
> @@ -168,7 +168,7 @@ static void vfio_ccw_register_io_notifier(VFIOCCWDevi=
ce *vcdev, Error **errp)
>          return;
>      }
> =20
> -    argsz =3D sizeof(*irq_set);
> +    argsz =3D sizeof(*irq_info);
>      irq_info =3D g_malloc0(argsz);
>      irq_info->index =3D VFIO_CCW_IO_IRQ_INDEX;
>      irq_info->argsz =3D argsz;

Thanks for the patch, but I already have "vfio/ccw: allocate irq info
with the right size" queued in my s390-next branch (for which I plan to
send a pull req today).

