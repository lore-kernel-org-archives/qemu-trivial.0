Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNcuT-0005eF-1V
	for mharc-qemu-trivial@gnu.org; Tue, 29 May 2018 07:35:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48734)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fNcuL-0005c6-OY
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 07:35:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fNcuG-00011x-AR
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 07:35:17 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:39080 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fNcuA-0000wF-8X; Tue, 29 May 2018 07:35:06 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9C244BB40A;
	Tue, 29 May 2018 11:35:05 +0000 (UTC)
Received: from [10.36.116.97] (ovpn-116-97.ams2.redhat.com [10.36.116.97])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FCF72166BC7;
	Tue, 29 May 2018 11:35:03 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: "open list:IDE" <qemu-block@nongnu.org>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	John Snow <jsnow@redhat.com>
References: <20180528232719.4721-1-f4bug@amsat.org>
	<20180528232719.4721-21-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <54a3e4cc-86d8-47b4-26ff-290fbd76da41@redhat.com>
Date: Tue, 29 May 2018 13:35:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180528232719.4721-21-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 29 May 2018 11:35:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 29 May 2018 11:35:05 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4 20/21] hw/ide: Remove
 unused include
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
X-List-Received-Date: Tue, 29 May 2018 11:35:24 -0000

On 29.05.2018 01:27, Philippe Mathieu-Daud=C3=A9 wrote:
> There is no need to include pci.h in this file.
> (Continue f23c81073a cleanup).
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/ide/core.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/hw/ide/core.c b/hw/ide/core.c
> index 866c659498..cc9ca28c33 100644
> --- a/hw/ide/core.c
> +++ b/hw/ide/core.c
> @@ -25,7 +25,6 @@
> =20
>  #include "qemu/osdep.h"
>  #include "hw/hw.h"
> -#include "hw/pci/pci.h"
>  #include "hw/isa/isa.h"
>  #include "qemu/error-report.h"
>  #include "qemu/timer.h"
>=20

Reviewed-by: Thomas Huth <thuth@redhat.com>

