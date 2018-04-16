Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7w93-0004em-9w
	for mharc-qemu-trivial@gnu.org; Mon, 16 Apr 2018 00:53:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51091)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1f7w91-0004dk-R3
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2018 00:53:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1f7w90-00011G-WD
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2018 00:53:35 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:36042 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1f7w8w-0000zN-LY; Mon, 16 Apr 2018 00:53:30 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D56334067EF0;
	Mon, 16 Apr 2018 04:53:26 +0000 (UTC)
Received: from [10.36.116.76] (ovpn-116-76.ams2.redhat.com [10.36.116.76])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 019CF7C5C;
	Mon, 16 Apr 2018 04:53:23 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20180415234307.28132-1-f4bug@amsat.org>
	<20180415234307.28132-2-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <a2d59a3a-0176-6065-68ae-60fee97c2332@redhat.com>
Date: Mon, 16 Apr 2018 06:53:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180415234307.28132-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 16 Apr 2018 04:53:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 16 Apr 2018 04:53:26 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH v3 01/41] hw: Clean "hw/devices.h"
 includes
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
X-List-Received-Date: Mon, 16 Apr 2018 04:53:36 -0000

On 16.04.2018 01:42, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/devices.h | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/include/hw/devices.h b/include/hw/devices.h
> index 861ddea8af..0e27feb0c2 100644
> --- a/include/hw/devices.h
> +++ b/include/hw/devices.h
> @@ -1,13 +1,10 @@
>  #ifndef QEMU_DEVICES_H
>  #define QEMU_DEVICES_H
> =20
> -#include "hw/irq.h"
> -
> -/* ??? Not all users of this file can include cpu-common.h.  */
> -struct MemoryRegion;
> -
>  /* Devices that have nowhere better to go.  */
> =20
> +#include "hw/hw.h"
> +
>  /* smc91c111.c */
>  void smc91c111_init(NICInfo *, uint32_t, qemu_irq);

IMHO we should rather get rid of devices.h (in a separate patch series)
and introduce proper small headers =C3=A0 la smc91c111.h for the single
sections in here... Just my 0.02 =E2=82=AC.

 Thomas

