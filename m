Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dayZd-0004EU-H2
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 02:16:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dayZa-0004Bu-SI
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 02:16:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dayZa-000818-1W
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 02:16:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49927)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1dayZT-0007xl-M5; Fri, 28 Jul 2017 02:16:23 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A1411350ACE;
	Fri, 28 Jul 2017 06:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A1411350ACE
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=famz@redhat.com
Received: from localhost (ovpn-12-54.pek2.redhat.com [10.72.12.54])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 09EBF5E240;
	Fri, 28 Jul 2017 06:16:21 +0000 (UTC)
Date: Fri, 28 Jul 2017 14:16:20 +0800
From: Fam Zheng <famz@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, qemu-block@nongnu.org
Message-ID: <20170728061620.GO5117@lemon.lan>
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-39-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20170728053610.15770-39-f4bug@amsat.org>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 28 Jul 2017 06:16:22 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 38/47] MAINTAINERS: update docs/interop/
 entries
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
X-List-Received-Date: Fri, 28 Jul 2017 06:16:31 -0000

On Fri, 07/28 02:36, Philippe Mathieu-Daud=E9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 23de632424..54e35fdab9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1283,7 +1283,7 @@ F: block/dirty-bitmap.c
>  F: include/qemu/hbitmap.h
>  F: include/block/dirty-bitmap.h
>  F: tests/test-hbitmap.c
> -F: docs/bitmaps.md
> +F: docs/interop/bitmaps.rst
>  T: git git://github.com/famz/qemu.git bitmaps
>  T: git git://github.com/jnsnow/qemu.git bitmaps
> =20
> @@ -1852,7 +1852,7 @@ M: Denis V. Lunev <den@openvz.org>
>  L: qemu-block@nongnu.org
>  S: Supported
>  F: block/parallels.c
> -F: docs/specs/parallels.txt
> +F: docs/interop/parallels.txt
> =20
>  qed
>  M: Stefan Hajnoczi <stefanha@redhat.com>
> --=20
> 2.13.3
>=20

Acked-by: Fam Zheng <famz@redhat.com>

