Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e1ULF-00012J-42
	for mharc-qemu-trivial@gnu.org; Mon, 09 Oct 2017 05:27:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59914)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1e1ULD-00011D-9w
	for qemu-trivial@nongnu.org; Mon, 09 Oct 2017 05:27:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1e1ULC-00051u-7s
	for qemu-trivial@nongnu.org; Mon, 09 Oct 2017 05:27:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37690)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1e1UL7-00050F-SF; Mon, 09 Oct 2017 05:27:10 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CF5125275A;
	Mon,  9 Oct 2017 09:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CF5125275A
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=berrange@redhat.com
Received: from redhat.com (unknown [10.42.22.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD85361523;
	Mon,  9 Oct 2017 09:27:06 +0000 (UTC)
Date: Mon, 9 Oct 2017 10:27:04 +0100
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20171009092704.GC2954@redhat.com>
Reply-To: "Daniel P. Berrange" <berrange@redhat.com>
References: <20171007145609.16722-1-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20171007145609.16722-1-sw@weilnetz.de>
User-Agent: Mutt/1.9.0 (2017-09-02)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 09 Oct 2017 09:27:08 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] io: Add missing GCC_FMT_ATTR (fix
 -Werror=suggest-attribute=format)
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
X-List-Received-Date: Mon, 09 Oct 2017 09:27:16 -0000

On Sat, Oct 07, 2017 at 04:56:09PM +0200, Stefan Weil wrote:
> This fixes a compiler warning:
>=20
> /qemu/io/channel-websock.c:163:5: error:
>  function might be possible candidate for =E2=80=98gnu_printf=E2=80=99 =
format attribute
>  [-Werror=3Dsuggest-attribute=3Dformat]
>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  io/channel-websock.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Acked-by: Daniel P. Berrange <berrange@redhat.com>


>=20
> diff --git a/io/channel-websock.c b/io/channel-websock.c
> index d1d471f86e..7bf1340958 100644
> --- a/io/channel-websock.c
> +++ b/io/channel-websock.c
> @@ -151,9 +151,10 @@ enum {
>      QIO_CHANNEL_WEBSOCK_OPCODE_PONG =3D 0xA
>  };
> =20
> -static void qio_channel_websock_handshake_send_res(QIOChannelWebsock *=
ioc,
> -                                                   const char *resmsg,
> -                                                   ...)
> +static void GCC_FMT_ATTR(2, 3)
> +qio_channel_websock_handshake_send_res(QIOChannelWebsock *ioc,
> +                                       const char *resmsg,
> +                                       ...)
>  {
>      va_list vargs;
>      char *response;

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

