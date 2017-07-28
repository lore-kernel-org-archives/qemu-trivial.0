Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1db1K3-00005Y-II
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 05:12:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56392)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1db1K0-00005B-M2
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 05:12:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1db1Jx-0000wM-Tp
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 05:12:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48406)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1db1Jx-0000oc-NC
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 05:12:33 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 85CB21CA444;
	Fri, 28 Jul 2017 09:12:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 85CB21CA444
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=kwolf@redhat.com
Received: from localhost.localdomain (ovpn-117-155.ams2.redhat.com
	[10.36.117.155])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 278655C667;
	Fri, 28 Jul 2017 09:12:23 +0000 (UTC)
Date: Fri, 28 Jul 2017 11:12:22 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, qemu-block@nongnu.org
Message-ID: <20170728091222.GA3983@localhost.localdomain>
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-20-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20170728053610.15770-20-f4bug@amsat.org>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 28 Jul 2017 09:12:25 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 19/47] MAINTAINERS: add missing qcow2
 entry
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
X-List-Received-Date: Fri, 28 Jul 2017 09:12:37 -0000

Am 28.07.2017 um 07:35 hat Philippe Mathieu-Daud=E9 geschrieben:
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6b83dac812..2dcdda4cd5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1856,6 +1856,7 @@ M: Max Reitz <mreitz@redhat.com>
>  L: qemu-block@nongnu.org
>  S: Supported
>  F: block/qcow2*
> +F: docs/interop/qcow2.txt

Acked-by: Kevin Wolf <kwolf@redhat.com>

