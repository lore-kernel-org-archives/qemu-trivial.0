Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fYsN6-0007Vf-JD
	for mharc-qemu-trivial@gnu.org; Fri, 29 Jun 2018 08:19:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51014)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fYsN3-0007RJ-N2
	for qemu-trivial@nongnu.org; Fri, 29 Jun 2018 08:19:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fYsN2-0006iC-Id
	for qemu-trivial@nongnu.org; Fri, 29 Jun 2018 08:19:25 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:47970 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1fYsMx-0006b0-07; Fri, 29 Jun 2018 08:19:19 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E9C3D401CE88;
	Fri, 29 Jun 2018 12:19:17 +0000 (UTC)
Received: from [10.10.121.132] (ovpn-121-132.rdu2.redhat.com [10.10.121.132])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D2B27111AF1A;
	Fri, 29 Jun 2018 12:19:16 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Richard Henderson <richard.henderson@linaro.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-2-f4bug@amsat.org>
	<20180627132747.76773eb9@redhat.com>
	<3dd9341a-f4e6-c107-2f1f-0745d039f03e@redhat.com>
	<15aad1db-2f4c-ea49-9966-a969f0c769f5@amsat.org>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-trivial@nongnu.org,
	Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <c1939f7b-76e2-eca9-2819-d0b4d9a134b1@redhat.com>
Date: Fri, 29 Jun 2018 07:19:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <15aad1db-2f4c-ea49-9966-a969f0c769f5@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Fri, 29 Jun 2018 12:19:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Fri, 29 Jun 2018 12:19:17 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
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
X-List-Received-Date: Fri, 29 Jun 2018 12:19:27 -0000

On 06/28/2018 05:53 PM, Philippe Mathieu-Daud=C3=A9 wrote:

>>>> +#ifndef QEMU_UNITS_H
>>>> +#define QEMU_UNITS_H
>>>> +
>>>> +#define KiB=C2=A0=C2=A0=C2=A0=C2=A0 (INT64_C(1) << 10)
>>>> +#define MiB=C2=A0=C2=A0=C2=A0=C2=A0 (INT64_C(1) << 20)
>>>> +#define GiB=C2=A0=C2=A0=C2=A0=C2=A0 (INT64_C(1) << 30)
>>>> +#define TiB=C2=A0=C2=A0=C2=A0=C2=A0 (INT64_C(1) << 40)
>>>> +#define PiB=C2=A0=C2=A0=C2=A0=C2=A0 (INT64_C(1) << 50)
>>>> +#define EiB=C2=A0=C2=A0=C2=A0=C2=A0 (INT64_C(1) << 60)
>>> Shouldn't above use UINT64_C()
>>
>> Since the decision of signed vs. unsigned was intentional based on
>> review on earlier versions, it may be worth a comment in this file tha=
t
>> these constants are intentionally signed (in usage patterns, these ten=
d
>> to be multiplied by another value; and while it is easy to go to
>> unsigned by doing '1U * KiB', you can't go in the opposite direction i=
f
>> you want a signed number for '1 * KiB' unless KiB is signed).
>=20
> OK.

Actually, '1U * KiB' still ends up signed.  Why? Because as written, KiB=20
is a 64-bit quantity, but 1U is 32-bit; type promotion says that since a=20
64-bit int can represent all 32-bit unsigned values, the result of the=20
expression is still signed 64-bit.

To get unsigned KiB, you either have to use '1ULL * KiB', or KiB should=20
be changed to be (INT32_C(1) << 10) (a 32-bit constant, rather than a=20
64-bit one).

>=20
> I'll also change this tests using your suggestion:
>=20
> diff --git a/tests/test-qemu-opts.c b/tests/test-qemu-opts.c
> @@ -709,8 +709,7 @@ static void test_opts_parse_size(void)
>                              false, &error_abort);
> -    g_assert_cmphex(qemu_opt_get_size(opts, "size2", 0),
> -                     =3D=3D, 16777215 * T_BYTE);
> +    g_assert_cmphex(qemu_opt_get_size(opts, "size2", 0), =3D=3D, 16777=
215U
> * TiB);
>=20
> to avoid this error on 32-bit archs:
>=20
> source/qemu/tests/test-qemu-opts.c: In function 'test_opts_parse_size':
> source/qemu/tests/test-qemu-opts.c:713:71: error: integer overflow in
> expression [-Werror=3Doverflow]
>    g_assert_cmphex(qemu_opt_get_size(opts, "size2", 0), =3D=3D, 1677721=
5 * TiB);
>                                                                        =
 ^

And this compile error is proof of the confusion when we have a signed=20
integer overflow (why it only happens on 32-bit arch and not also on=20
64-bit arch is subtle - it's because TiB is 'long long' on 32-bit, but=20
merely 'long' on 64-bit, which results in a different type after type=20
promotion - although I still find it odd that the 64-bit compiler isn't=20
warning).

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

