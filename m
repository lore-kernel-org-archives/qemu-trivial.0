Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePlGI-0004uO-VU
	for mharc-qemu-trivial@gnu.org; Fri, 15 Dec 2017 03:22:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38176)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ePlGH-0004to-4j
	for qemu-trivial@nongnu.org; Fri, 15 Dec 2017 03:22:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ePlGG-0007NJ-8f
	for qemu-trivial@nongnu.org; Fri, 15 Dec 2017 03:22:29 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50032)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1ePlGB-0007F7-P2; Fri, 15 Dec 2017 03:22:23 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1FB91883D1;
	Fri, 15 Dec 2017 08:22:22 +0000 (UTC)
Received: from [10.36.117.40] (ovpn-117-40.ams2.redhat.com [10.36.117.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BA7E60C8A;
	Fri, 15 Dec 2017 08:22:16 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>, 
	qemu-trivial@nongnu.org
References: <20171215034356.4449-1-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9670cc80-9de2-9838-a011-c9b2656e20fb@redhat.com>
Date: Fri, 15 Dec 2017 09:22:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20171215034356.4449-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 15 Dec 2017 08:22:22 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v5 0/2] remove i386/pc dependency from
 non-PC world (part 1) fix
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
X-List-Received-Date: Fri, 15 Dec 2017 08:22:30 -0000

On 15/12/2017 04:43, Philippe Mathieu-Daud=C3=A9 wrote:
> Fix patch 42 from previous series (v4) so patchew can build, and if a m=
aintainer
> is willing to take the previous series with the last 2 patches, I don't=
 need to
> respam a v6.
>=20
> Regards,
>=20
> Phil.

I tweaked a bit patch 1 to use LOG_UNIMP instead, and queued these two
patches.

Paolo

> Based-on: 20171215033015.738-42-f4bug@amsat.org
>           (remove i386/pc dependency from non-PC world v4)
>=20
> Philippe Mathieu-Daud=C3=A9 (2):
>   hw/i386/vmport: replace fprintf() by trace events
>   misc: drop old i386 dependency
>=20
>  hw/char/debugcon.c      | 1 -
>  hw/i386/vmport.c        | 8 +++-----
>  hw/intc/lm32_pic.c      | 1 -
>  hw/moxie/moxiesim.c     | 1 -
>  hw/sparc/sun4m.c        | 1 -
>  hw/watchdog/wdt_ib700.c | 1 -
>  hw/i386/trace-events    | 4 ++++
>  7 files changed, 7 insertions(+), 10 deletions(-)
>=20


