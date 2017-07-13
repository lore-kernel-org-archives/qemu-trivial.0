Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVhf7-0005Hj-DF
	for mharc-qemu-trivial@gnu.org; Thu, 13 Jul 2017 13:12:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55464)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1dVhf5-0005GL-JK
	for qemu-trivial@nongnu.org; Thu, 13 Jul 2017 13:12:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1dVhf4-0002xu-Jn
	for qemu-trivial@nongnu.org; Thu, 13 Jul 2017 13:12:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58506)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1dVhf0-0002vO-72; Thu, 13 Jul 2017 13:12:18 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7E878C04B321;
	Thu, 13 Jul 2017 17:12:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7E878C04B321
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=dgilbert@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 7E878C04B321
Received: from work-vm (ovpn-117-102.ams2.redhat.com [10.36.117.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D6D760613;
	Thu, 13 Jul 2017 17:12:05 +0000 (UTC)
Date: Thu, 13 Jul 2017 18:12:03 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	peter.maydell@linaro.org, Markus Armbruster <armbru@redhat.com>
Message-ID: <20170713171203.GH2121@work-vm>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-16-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20170713163219.9024-16-marcandre.lureau@redhat.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 13 Jul 2017 17:12:16 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2 15/29] monitor: use DIV_ROUND_UP
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
X-List-Received-Date: Thu, 13 Jul 2017 17:12:24 -0000

* Marc-Andr=E9 Lureau (marcandre.lureau@redhat.com) wrote:
> I used the clang-tidy qemu-round check to generate the fix:
> https://github.com/elmarco/clang-tools-extra
>=20
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>

Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  monitor.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/monitor.c b/monitor.c
> index fa3e3ac251..bcbf307b45 100644
> --- a/monitor.c
> +++ b/monitor.c
> @@ -1348,7 +1348,7 @@ static void memory_dump(Monitor *mon, int count, =
int format, int wsize,
> =20
>      switch(format) {
>      case 'o':
> -        max_digits =3D (wsize * 8 + 2) / 3;
> +        max_digits =3D DIV_ROUND_UP(wsize * 8, 3);
>          break;
>      default:
>      case 'x':
> @@ -1356,7 +1356,7 @@ static void memory_dump(Monitor *mon, int count, =
int format, int wsize,
>          break;
>      case 'u':
>      case 'd':
> -        max_digits =3D (wsize * 8 * 10 + 32) / 33;
> +        max_digits =3D DIV_ROUND_UP(wsize * 8 * 10, 33);
>          break;
>      case 'c':
>          wsize =3D 1;
> --=20
> 2.13.1.395.gf7b71de06
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

