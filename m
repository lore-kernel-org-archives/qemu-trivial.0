Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwM66-0007bl-3l
	for mharc-qemu-trivial@gnu.org; Mon, 25 Sep 2017 01:38:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44737)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dwM63-0007ZA-UV
	for qemu-trivial@nongnu.org; Mon, 25 Sep 2017 01:38:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dwM63-0005sP-3k
	for qemu-trivial@nongnu.org; Mon, 25 Sep 2017 01:38:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41952)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dwM60-0005qg-CI; Mon, 25 Sep 2017 01:38:20 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6A654356DB;
	Mon, 25 Sep 2017 05:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6A654356DB
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.76] (ovpn-116-76.ams2.redhat.com [10.36.116.76])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EADE317F3B;
	Mon, 25 Sep 2017 05:38:17 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
	<pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922160111.31885-11-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <f5f9272f-e425-6a09-8571-a4454977100e@redhat.com>
Date: Mon, 25 Sep 2017 07:38:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170922160111.31885-11-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 25 Sep 2017 05:38:19 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 33/34] hw/alpha: remove old i386
 dependency
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
X-List-Received-Date: Mon, 25 Sep 2017 05:38:24 -0000

On 22.09.2017 18:01, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/alpha/alpha_sys.h | 2 --
>  hw/alpha/pci.c       | 2 ++
>  hw/alpha/typhoon.c   | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/alpha/alpha_sys.h b/hw/alpha/alpha_sys.h
> index b6d8369ed7..ac685c1c46 100644
> --- a/hw/alpha/alpha_sys.h
> +++ b/hw/alpha/alpha_sys.h
> @@ -5,8 +5,6 @@
> =20
>  #include "target/alpha/cpu-qom.h"
>  #include "hw/pci/pci.h"
> -#include "hw/pci/pci_host.h"
> -#include "hw/ide.h"
>  #include "hw/i386/pc.h"

Didn't you want to remove that pc.h line according to the patch descripti=
on?

 Thomas



