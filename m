Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZucA9-00010w-KC
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2015 03:14:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60054)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZucA7-0000xa-Bj
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 03:14:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZucA5-00039N-Qv
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 03:14:18 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:55774)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Zuc9y-000367-Mk; Fri, 06 Nov 2015 03:14:10 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id E466F40B3A;
	Fri,  6 Nov 2015 11:14:09 +0300 (MSK)
Message-ID: <563C6151.9070800@msgid.tls.msk.ru>
Date: Fri, 06 Nov 2015 11:14:09 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Wei Huang <wei@redhat.com>, qemu-arm@nongnu.org
References: <1446744293-32365-1-git-send-email-wei@redhat.com>
In-Reply-To: <1446744293-32365-1-git-send-email-wei@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, afaerber@suse.de,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH Trivial V2] hw/intc/arm_gic: Remove the
 definition of NUM_CPU
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Nov 2015 08:14:20 -0000

05.11.2015 20:24, Wei Huang wrote:
> arm_gic.c retrieves CPU number using either NUM_CPU(s) or s->num_cpu.
> Such mixed-uses make source code inconsistent. This patch removes
> NUM_CPU(s), which was defined for MPCore tweak long ago, and instead
> favors s->num_cpu. The source is more consistent after this small tweak=
.
>=20
> Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
> Signed-off-by: Wei Huang <wei@redhat.com>

Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>

I'm not applying this to -trivial per previous comments.

Thanks,

/mjt

