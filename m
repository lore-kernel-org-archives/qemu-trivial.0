Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZZIU5-0000zy-Vq
	for mharc-qemu-trivial@gnu.org; Tue, 08 Sep 2015 08:58:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36684)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZZITu-0000t6-PU
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 08:58:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZZITr-0008MN-JB
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 08:58:38 -0400
Received: from mx4-phx2.redhat.com ([209.132.183.25]:55584)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1ZZITr-0008MB-Cz; Tue, 08 Sep 2015 08:58:35 -0400
Received: from zmail13.collab.prod.int.phx2.redhat.com
	(zmail13.collab.prod.int.phx2.redhat.com [10.5.83.15])
	by mx4-phx2.redhat.com (8.13.8/8.13.8) with ESMTP id t88CwYs4030840;
	Tue, 8 Sep 2015 08:58:34 -0400
Date: Tue, 8 Sep 2015 08:58:34 -0400 (EDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <1602970168.27375747.1441717114271.JavaMail.zimbra@redhat.com>
In-Reply-To: <55EEDABD.5090305@redhat.com>
References: <1440703987-29012-1-git-send-email-lvivier@redhat.com>
	<1440703987-29012-8-git-send-email-lvivier@redhat.com>
	<55EEDABD.5090305@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.4.164.1, 10.5.101.130]
X-Mailer: Zimbra 8.0.6_GA_5922 (ZimbraWebClient - FF39 (Win)/8.0.6_GA_5922)
Thread-Topic: hpet: remove muldiv64()
Thread-Index: UTvqk9ikmd70LPYiLxGYGjKgWC1xeQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 209.132.183.25
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 7/9] hpet: remove
	muldiv64()
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
X-List-Received-Date: Tue, 08 Sep 2015 12:58:46 -0000



----- Messaggio originale -----
> Da: "Laurent Vivier" <lvivier@redhat.com>
> A: qemu-devel@nongnu.org, "Stefan Hajnoczi" <stefanha@redhat.com>, "Paolo=
 Bonzini" <pbonzini@redhat.com>,
> qemu-trivial@nongnu.org
> Inviato: Marted=C3=AC, 8 settembre 2015 14:55:25
> Oggetto: Re: [Qemu-devel] [PATCH v3 7/9] hpet: remove muldiv64()
>=20
> ping ?
>=20
> On 27/08/2015 21:33, Laurent Vivier wrote:
> > hpet defines a clock period in femtoseconds but
> > then converts it to nanoseconds to use the internal
> > timers.
> >=20
> > We can define the period in nanoseconds and use it
> > directly, this allows to remove muldiv64().
> >=20
> > We only need to convert the period to femtoseconds
> > to put it in internal hpet capability register.
> >=20
> > Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> > ---
> >  hw/timer/hpet.c         | 6 +++---
> >  include/hw/timer/hpet.h | 4 ++--
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
> > index 2bb6221..3037bef 100644
> > --- a/hw/timer/hpet.c
> > +++ b/hw/timer/hpet.c
> > @@ -126,12 +126,12 @@ static uint32_t hpet_time_after64(uint64_t a,
> > uint64_t b)
> > =20
> >  static uint64_t ticks_to_ns(uint64_t value)
> >  {
> > -    return (muldiv64(value, HPET_CLK_PERIOD, FS_PER_NS));
> > +    return value * HPET_CLK_PERIOD;
> >  }
> > =20
> >  static uint64_t ns_to_ticks(uint64_t value)
> >  {
> > -    return (muldiv64(value, FS_PER_NS, HPET_CLK_PERIOD));
> > +    return value / HPET_CLK_PERIOD;
> >  }
> > =20
> >  static uint64_t hpet_fixup_reg(uint64_t new, uint64_t old, uint64_t ma=
sk)
> > @@ -758,7 +758,7 @@ static void hpet_realize(DeviceState *dev, Error
> > **errp)
> >      /* 64-bit main counter; LegacyReplacementRoute. */
> >      s->capability =3D 0x8086a001ULL;
> >      s->capability |=3D (s->num_timers - 1) << HPET_ID_NUM_TIM_SHIFT;
> > -    s->capability |=3D ((HPET_CLK_PERIOD) << 32);
> > +    s->capability |=3D ((uint64_t)(HPET_CLK_PERIOD * FS_PER_NS) << 32)=
;
> > =20
> >      qdev_init_gpio_in(dev, hpet_handle_legacy_irq, 2);
> >      qdev_init_gpio_out(dev, &s->pit_enabled, 1);
> > diff --git a/include/hw/timer/hpet.h b/include/hw/timer/hpet.h
> > index 773953b..d872909 100644
> > --- a/include/hw/timer/hpet.h
> > +++ b/include/hw/timer/hpet.h
> > @@ -16,9 +16,9 @@
> >  #include "qom/object.h"
> > =20
> >  #define HPET_BASE               0xfed00000
> > -#define HPET_CLK_PERIOD         10000000ULL /* 10000000 femtoseconds =
=3D=3D
> > 10ns*/
> > +#define HPET_CLK_PERIOD         10 /* 10 ns*/
> > =20
> > -#define FS_PER_NS 1000000
> > +#define FS_PER_NS 1000000       /* 1000000 femtoseconds =3D=3D 1 ns */
> >  #define HPET_MIN_TIMERS         3
> >  #define HPET_MAX_TIMERS         32
> > =20
> >=20

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

