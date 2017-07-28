Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dayaV-0004q2-7C
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 02:17:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41242)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dayaT-0004nv-66
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 02:17:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dayaS-0008SG-EP
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 02:17:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52061)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1dayaK-0008Nj-S8; Fri, 28 Jul 2017 02:17:16 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D1B345ECDB;
	Fri, 28 Jul 2017 06:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D1B345ECDB
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=famz@redhat.com
Received: from localhost (ovpn-12-54.pek2.redhat.com [10.72.12.54])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 73F715C88A;
	Fri, 28 Jul 2017 06:17:11 +0000 (UTC)
Date: Fri, 28 Jul 2017 14:17:10 +0800
From: Fam Zheng <famz@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, qemu-block@nongnu.org
Message-ID: <20170728061710.GP5117@lemon.lan>
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-41-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20170728053610.15770-41-f4bug@amsat.org>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 28 Jul 2017 06:17:16 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 40/47] MAINTAINERS: add missing entry for
 AIO
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
X-List-Received-Date: Fri, 28 Jul 2017 06:17:26 -0000

On Fri, 07/28 02:36, Philippe Mathieu-Daud=E9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 83597fca4e..fb6a82c1ad 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1253,6 +1253,7 @@ F: util/aio-*.c
>  F: block/io.c
>  F: migration/block*
>  F: include/block/aio.h
> +F: scripts/qemugdb/aio.py
>  T: git git://github.com/stefanha/qemu.git block
> =20
>  Block Jobs
> --=20
> 2.13.3
>=20

Acked-by: Fam Zheng <famz@redhat.com>

