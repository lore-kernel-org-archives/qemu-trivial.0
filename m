Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dazV2-0003s1-Sx
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 03:15:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43476)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1dazV0-0003qa-Ta
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 03:15:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1dazV0-0001GL-51
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 03:15:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60602)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1dazUv-0001A7-Bo; Fri, 28 Jul 2017 03:15:45 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 66ABB69ED7;
	Fri, 28 Jul 2017 07:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 66ABB69ED7
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=cohuck@redhat.com
Received: from gondolin (dhcp-192-215.str.redhat.com [10.33.192.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 954EF7766B;
	Fri, 28 Jul 2017 07:15:43 +0000 (UTC)
Date: Fri, 28 Jul 2017 09:15:41 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Message-ID: <20170728091541.3d2c1e3b@gondolin>
In-Reply-To: <20170728053610.15770-12-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-12-f4bug@amsat.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 28 Jul 2017 07:15:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 11/47] MAINTAINERS: add missing entry for
 virtio/ccw
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
X-List-Received-Date: Fri, 28 Jul 2017 07:15:51 -0000

On Fri, 28 Jul 2017 02:35:34 -0300
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2958dd2479..bfdb2f8928 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1075,6 +1075,7 @@ M: Cornelia Huck <cohuck@redhat.com>
>  M: Christian Borntraeger <borntraeger@de.ibm.com>
>  S: Supported
>  F: hw/s390x/virtio-ccw.[hc]
> +F: include/standard-headers/asm-s390/virtio-ccw.h
>  T: git git://github.com/cohuck/qemu.git s390-next
>  T: git git://github.com/borntraeger/qemu.git s390-next
> =20

This one is also a linux header and should not be added to MAINTAINERS.

