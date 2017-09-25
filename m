Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwM8P-0000HW-Da
	for mharc-qemu-trivial@gnu.org; Mon, 25 Sep 2017 01:40:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45110)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dwM8N-0000GR-8U
	for qemu-trivial@nongnu.org; Mon, 25 Sep 2017 01:40:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dwM8M-000756-LG
	for qemu-trivial@nongnu.org; Mon, 25 Sep 2017 01:40:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46124)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dwM8H-00073I-9i; Mon, 25 Sep 2017 01:40:41 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F1BB1C057FA7;
	Mon, 25 Sep 2017 05:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com F1BB1C057FA7
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.76] (ovpn-116-76.ams2.redhat.com [10.36.116.76])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFE216016F;
	Mon, 25 Sep 2017 05:40:36 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
	<pbonzini@redhat.com>, Anton Nefedov <anton.nefedov@virtuozzo.com>,
	Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Kirill Batuzov <batuzovk@ispras.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922160111.31885-12-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <27718a16-6d55-ed2e-3c65-1dbab106bd11@redhat.com>
Date: Mon, 25 Sep 2017 07:40:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170922160111.31885-12-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 25 Sep 2017 05:40:40 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 34/34] misc: drop old i386 dependency
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
X-List-Received-Date: Mon, 25 Sep 2017 05:40:48 -0000

On 22.09.2017 18:01, Philippe Mathieu-Daud=C3=A9 wrote:
> while here, add an entry for wdt_ib700 in MAINTAINERS
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/char/debugcon.c      | 1 -
>  hw/intc/lm32_pic.c      | 1 -
>  hw/moxie/moxiesim.c     | 1 -
>  hw/sparc/sun4m.c        | 1 -
>  hw/watchdog/wdt_ib700.c | 1 -
>  MAINTAINERS             | 1 +
>  6 files changed, 1 insertion(+), 5 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>



