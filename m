Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fYuvF-0006km-6F
	for mharc-qemu-trivial@gnu.org; Fri, 29 Jun 2018 11:02:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36567)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1fYuvC-0006i3-I2
	for qemu-trivial@nongnu.org; Fri, 29 Jun 2018 11:02:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1fYuvB-0001lh-Iq
	for qemu-trivial@nongnu.org; Fri, 29 Jun 2018 11:02:50 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35360 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1fYuv4-0001bW-3V; Fri, 29 Jun 2018 11:02:42 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9246D406EA4F;
	Fri, 29 Jun 2018 15:02:41 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BBBF21565E1;
	Fri, 29 Jun 2018 15:02:39 +0000 (UTC)
Date: Fri, 29 Jun 2018 16:02:36 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Eric Blake <eblake@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-trivial@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Stefan Weil <sw@weilnetz.de>
Message-ID: <20180629150236.GV27016@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-2-f4bug@amsat.org>
	<20180627132747.76773eb9@redhat.com>
	<3dd9341a-f4e6-c107-2f1f-0745d039f03e@redhat.com>
	<15aad1db-2f4c-ea49-9966-a969f0c769f5@amsat.org>
	<c1939f7b-76e2-eca9-2819-d0b4d9a134b1@redhat.com>
	<0822da0f-1da2-bff3-e465-57654aad7c16@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0822da0f-1da2-bff3-e465-57654aad7c16@amsat.org>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Fri, 29 Jun 2018 15:02:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Fri, 29 Jun 2018 15:02:41 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 01/46] include: Add IEC
 binary prefixes in "qemu/units.h"
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
X-List-Received-Date: Fri, 29 Jun 2018 15:02:52 -0000

On Fri, Jun 29, 2018 at 11:49:51AM -0300, Philippe Mathieu-Daud=C3=A9 wro=
te:
> Hi Eric,
>=20
> On 06/29/2018 09:19 AM, Eric Blake wrote:
> > On 06/28/2018 05:53 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> >=20
> >>>>> +#ifndef QEMU_UNITS_H
> >>>>> +#define QEMU_UNITS_H
> >>>>> +
> >>>>> +#define KiB=C2=A0=C2=A0=C2=A0=C2=A0 (INT64_C(1) << 10)
> >>>>> +#define MiB=C2=A0=C2=A0=C2=A0=C2=A0 (INT64_C(1) << 20)
> >>>>> +#define GiB=C2=A0=C2=A0=C2=A0=C2=A0 (INT64_C(1) << 30)
> >>>>> +#define TiB=C2=A0=C2=A0=C2=A0=C2=A0 (INT64_C(1) << 40)
> >>>>> +#define PiB=C2=A0=C2=A0=C2=A0=C2=A0 (INT64_C(1) << 50)
> >>>>> +#define EiB=C2=A0=C2=A0=C2=A0=C2=A0 (INT64_C(1) << 60)
> >>>> Shouldn't above use UINT64_C()
> >>>
> >>> Since the decision of signed vs. unsigned was intentional based on
> >>> review on earlier versions, it may be worth a comment in this file =
that
> >>> these constants are intentionally signed (in usage patterns, these =
tend
> >>> to be multiplied by another value; and while it is easy to go to
> >>> unsigned by doing '1U * KiB', you can't go in the opposite directio=
n if
> >>> you want a signed number for '1 * KiB' unless KiB is signed).
> >>
> >> OK.
> >=20
> > Actually, '1U * KiB' still ends up signed.=C2=A0 Why? Because as writ=
ten, KiB
> > is a 64-bit quantity, but 1U is 32-bit; type promotion says that sinc=
e a
> > 64-bit int can represent all 32-bit unsigned values, the result of th=
e
> > expression is still signed 64-bit.
>=20
> Are you suggesting this?
>=20
> #define KiB     (INT32_C(1) << 10)
> #define MiB     (INT32_C(1) << 20)
> #define GiB     (INT32_C(1) << 30)
>=20
> #define TiB     (INT64_C(1) << 40)
> #define PiB     (INT64_C(1) << 50)
> #define EiB     (INT64_C(1) << 60)

This feels dangerous to me as now the calculation may or may not be 32-bi=
t
or 64-bit depending on which constant you happen to pick. I think this
inconsistency is going to be surprising to both devs and reviewers leadin=
g
to bugs.

Did you consider just adding unsigned versions  ?  eg UKiB, UMiB, UGiB. I=
t
is a bit ugly but is has the benefit of being obvious whether you're inte=
nding
the calculation  to be signed vs unsigned.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

