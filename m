Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZuO6q-00018o-Gh
	for mharc-qemu-trivial@gnu.org; Thu, 05 Nov 2015 12:14:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1ZuO6l-00011i-Ah
	for qemu-trivial@nongnu.org; Thu, 05 Nov 2015 12:13:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1ZuO6h-0002q6-Gj
	for qemu-trivial@nongnu.org; Thu, 05 Nov 2015 12:13:55 -0500
Received: from mx2.suse.de ([195.135.220.15]:52306)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1ZuO6b-0002oj-A0; Thu, 05 Nov 2015 12:13:45 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 6E093AC61;
	Thu,  5 Nov 2015 17:13:26 +0000 (UTC)
To: Wei Huang <wei@redhat.com>, qemu-arm@nongnu.org
References: <1446743477-21579-1-git-send-email-wei@redhat.com>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Linux GmbH
Message-ID: <563B8E48.8020407@suse.de>
Date: Thu, 5 Nov 2015 18:13:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1446743477-21579-1-git-send-email-wei@redhat.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH Trivial] hw/intc/arm_gic: Remove the
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
X-List-Received-Date: Thu, 05 Nov 2015 17:13:58 -0000

Am 05.11.2015 um 18:11 schrieb Wei Huang:
> arm_gic.c retrieves CPU number using either NUM_CPU(s) or s->num_cpu.
> Such mixed-uses make source code inconsistent. This patch removes
> NUM_CPU(s), which was defined for MPCore tweak long ago, and instead
> favors s->num_cpu. The source is more consistent after this tweak.
>=20
> Signed-off-by: Wei Huang <wei@redhat.com>
> ---
>  hw/intc/arm_gic.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)

I don't mind either way, and it'll go through Peter's queue I guess,

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Cheers,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer, Jane Smithard, Graham Norton; HRB 21284 (AG N=FC=
rnberg)

