Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dqIkf-0004oI-Bo
	for mharc-qemu-trivial@gnu.org; Fri, 08 Sep 2017 08:51:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51381)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1dqIkc-0004mD-Me
	for qemu-trivial@nongnu.org; Fri, 08 Sep 2017 08:51:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1dqIkb-0003Rk-SK
	for qemu-trivial@nongnu.org; Fri, 08 Sep 2017 08:51:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43376)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1dqIkV-0003K4-KT; Fri, 08 Sep 2017 08:51:07 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9AB644E4CA;
	Fri,  8 Sep 2017 12:51:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9AB644E4CA
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=mst@redhat.com
Received: from redhat.com (ovpn-120-144.rdu2.redhat.com [10.10.120.144])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1DAE0600C2;
	Fri,  8 Sep 2017 12:51:05 +0000 (UTC)
Date: Fri, 8 Sep 2017 15:51:05 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Message-ID: <20170908155042-mutt-send-email-mst@kernel.org>
References: <20170830215523.25278-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20170830215523.25278-1-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 08 Sep 2017 12:51:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 00/17] add missing
 entries in MAINTAINERS
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
X-List-Received-Date: Fri, 08 Sep 2017 12:51:15 -0000

On Wed, Aug 30, 2017 at 06:55:06PM -0300, Philippe Mathieu-Daud=E9 wrote:
> Hi,
>=20
> I tried to have a more helpful ./scripts/get_maintainer.pl output, fill=
ing
> missing entries in MAINTAINERS.

For myself

Acked-by: Michael S. Tsirkin <mst@redhat.com>

pls merge through trivial or something like this.

> Regards,
>=20
> Phil.
>=20
> v2:
> - add R-b & A-b
> - clean ARM entries (Thomas Huth)
> - moved files: comment since which commit (Eric Blake)
> - drop inconsistent patches (default-configs.mak related to hw/machine,=
 no CPU)
> - drop unhappy patches (include/standard-headers/linux/*)
> - drop unreplied patches
>=20
> Philippe Mathieu-Daud=E9 (17):
>   MAINTAINERS: add missing ARM entries
>   MAINTAINERS: add missing Versatile PB entry
>   MAINTAINERS: add missing STM32 entry
>   MAINTAINERS: add missing entry for vhost
>   MAINTAINERS: add missing VMWare entry
>   MAINTAINERS: add missing Guest Agent entries
>   MAINTAINERS: add missing qcow2 entry
>   MAINTAINERS: add missing USB entry
>   MAINTAINERS: add missing PCI entries
>   MAINTAINERS: add missing SSI entries
>   MAINTAINERS: add missing entries for throttling infra
>   MAINTAINERS: add missing megasas test entry
>   MAINTAINERS: add missing AIO entry
>   MAINTAINERS: add missing entry for Generic Loader
>   MAINTAINERS: add missing Cryptography entry
>   MAINTAINERS: update docs/devel/ entries
>   MAINTAINERS: update docs/interop/ entries
>=20
>  MAINTAINERS | 44 ++++++++++++++++++++++++++++++++++----------
>  1 file changed, 34 insertions(+), 10 deletions(-)
>=20
> --=20
> 2.14.1
>=20

