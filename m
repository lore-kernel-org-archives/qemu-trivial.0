Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXR8z-0005JD-Da
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 07:58:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48597)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1dXR8t-0005EJ-On
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 07:58:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1dXR8s-0006Mn-Tf
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 07:58:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46872)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1dXR8o-0006Kl-G6; Tue, 18 Jul 2017 07:58:14 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 10E0F4E909;
	Tue, 18 Jul 2017 11:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 10E0F4E909
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=lvivier@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 10E0F4E909
Received: from [10.36.116.168] (ovpn-116-168.ams2.redhat.com [10.36.116.168])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7AFC777D63;
	Tue, 18 Jul 2017 11:58:06 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>
References: <20170718061005.29518-1-f4bug@amsat.org>
	<20170718061005.29518-26-f4bug@amsat.org>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <4819b5c5-7ff9-dd32-d6c7-7516e8fb75fe@redhat.com>
Date: Tue, 18 Jul 2017 13:58:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170718061005.29518-26-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 18 Jul 2017 11:58:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 25/29] libqos: use ARRAY_SIZE macro
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
X-List-Received-Date: Tue, 18 Jul 2017 11:58:23 -0000

On 18/07/2017 08:10, Philippe Mathieu-Daud=C3=A9 wrote:
> Applied using the Coccinelle semantic patch scripts/coccinelle/use_osde=
p.cocci
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>=20
> No entry in MAINTAINERS for tests/libqos/* does it deserve it's own ent=
ry?
>=20
>  tests/libqos/libqos.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/libqos/libqos.c b/tests/libqos/libqos.c
> index 6226546c28..0edb7e99ba 100644
> --- a/tests/libqos/libqos.c
> +++ b/tests/libqos/libqos.c
> @@ -258,7 +258,7 @@ void generate_pattern(void *buffer, size_t len, siz=
e_t cycle_len)
>      p =3D rand() % 256;
>      for (i =3D 0; i < len; i++) {
>          tx[i] =3D p++ % 256;
> -        if (i % cycle_len =3D=3D 0) {
> +        if (QEMU_IS_ALIGNED(i, cycle_len)) {
>              p =3D rand() % 256;
>          }
>      }
>=20

The title doesn't reflect the real change.

otherwise:

Reviewed-by: Laurent Vivier <lvivier@redhat.com>

Laurent

