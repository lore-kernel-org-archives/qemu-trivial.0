Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePTtZ-0007xk-8K
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 08:49:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44083)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePTtW-0007vh-16
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 08:49:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePTtV-00020F-43
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 08:49:50 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:45821)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePTtP-0001uo-RT; Thu, 14 Dec 2017 08:49:43 -0500
Received: by mail-qk0-x241.google.com with SMTP id d141so6262646qkc.12;
	Thu, 14 Dec 2017 05:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=2Pv2LCrriCpcd5y8n5gByyfdUB9NeWjQwY4svUc1D2Q=;
	b=IrbXVSmuWINhD+lPtXULvSCwEkFaqFQDbcFYo05Jl+OudpjCtQ7iddY2P3Xi60ebj7
	QU4cc0UGDUB4D82cWiMhkHdawNJd4aBMwEKKO6zvflwt1Y6XWl3Ctdwdi8vjmceLYbhR
	nH0gR40MQHOm0KYuE3sWT1nkTwbbh3cxVOTXYellgtxmbxXCPDnxiKoHIePTO4bQUMtg
	YylnXODMcfZks0f/6rc/TEZjMjE3F0bwkXIvAfIBFYGYQ4/gL//UZxK9eZ2x9wGh8L6m
	cdnCqX5KC3bKfZM5qHAuqpv21JENAIexT+aj72YL8LvTDqoByf1bVpy0V6aBF4ZjjnzL
	ovmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=2Pv2LCrriCpcd5y8n5gByyfdUB9NeWjQwY4svUc1D2Q=;
	b=YJnlI8OlHSYRQEgDWNa5bVXXLqysPUrDypfB7ZtwKHV/IjqwTJnQ359XpZ/ekdlwDY
	ET81wVmdOfzcVQ6V6zPbDUZ+gqKOZm9yur7Zh+BvhqiBDCMCXe399/QdcvGe7f6gd0nH
	fgxtWfdpWFwNO0xN3T1bgPyoMslQqpgc1IGW8vVFYQ323I4+cyUgXwxg4zeCys5lKthr
	lfhk2pon4dMaEKVskKZSlFGDqao8qgD+B6VEn/2F2Ez0bvyOPjzo8t5/MGXh65jxnmw1
	Q36nUyxt447/HC90rjiAziDbKCTShbRcitzP0Lmrf2gC1FH3ndcmDGaZhaMK0FHun3l9
	MJGw==
X-Gm-Message-State: AKGB3mIUMj8ZoogBif1xf+NUxpZKraJKBLX0OTUZF/HAIekY3zsPLtIj
	ltxJrX80YS1BQLAicM0NROGlVccBepU=
X-Google-Smtp-Source: ACJfBou2VHa0i3JIj4e4frUGmr+SQ8+LkOIFkNwNmnIV1nsapBpZZQ3Qe9yvjTWJqOj+UD4l7EOsAw==
X-Received: by 10.55.197.202 with SMTP id k71mr15761449qkl.270.1513259383028; 
	Thu, 14 Dec 2017 05:49:43 -0800 (PST)
Received: from [192.168.1.11] ([181.91.222.165])
	by smtp.gmail.com with ESMTPSA id
	a132sm2519070qkg.43.2017.12.14.05.49.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 05:49:42 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: francisco iglesias <frasse.iglesias@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>, Fam Zheng
	<famz@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, qemu-trivial@nongnu.org, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <20171213051736.17755-1-f4bug@amsat.org>
	<20171213051736.17755-4-f4bug@amsat.org>
	<CAAYMZQuQv-yQA2keiq=9p95jQCSz3c=Dzjaygh=co=Q25ZKdxw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <6568e8bf-0d20-0a4d-f799-684a2b89fc6d@amsat.org>
Date: Thu, 14 Dec 2017 10:49:35 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAAYMZQuQv-yQA2keiq=9p95jQCSz3c=Dzjaygh=co=Q25ZKdxw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="lv9aTc2WDMkDP0hdIaqG5MTxWjlnNb0rw"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 3/4] hw/registerfields: add
 64-bit extract/deposit macros
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
X-List-Received-Date: Thu, 14 Dec 2017 13:49:51 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lv9aTc2WDMkDP0hdIaqG5MTxWjlnNb0rw
Content-Type: multipart/mixed; boundary="L91iUHJ2nQwxNxeiweUQFJbUMXQOi8gbK";
 protected-headers="v1"
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: francisco iglesias <frasse.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, Fam Zheng
 <famz@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Alistair Francis <alistair.francis@xilinx.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, qemu-trivial@nongnu.org,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Message-ID: <6568e8bf-0d20-0a4d-f799-684a2b89fc6d@amsat.org>
Subject: Re: [Qemu-devel] [PATCH 3/4] hw/registerfields: add 64-bit
 extract/deposit macros
References: <20171213051736.17755-1-f4bug@amsat.org>
 <20171213051736.17755-4-f4bug@amsat.org>
 <CAAYMZQuQv-yQA2keiq=9p95jQCSz3c=Dzjaygh=co=Q25ZKdxw@mail.gmail.com>
In-Reply-To: <CAAYMZQuQv-yQA2keiq=9p95jQCSz3c=Dzjaygh=co=Q25ZKdxw@mail.gmail.com>

--L91iUHJ2nQwxNxeiweUQFJbUMXQOi8gbK
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Francisco,

On 12/13/2017 06:37 PM, francisco iglesias wrote:
> On 13 December 2017 at 06:17, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org>
> wrote:
[...]
>>  /* Extract a field from an array of registers */
[...]
>> +#define FIELD_DP64(storage, reg, field, val) ({
>>  \
>> +    struct {
>> \
>> +        unsigned int v:R_ ## reg ## _ ## field ## _LENGTH;
>> \
>>
>=20
> I'm just wondering if 'v' above maybe should be uint64_t? The size of
> unsigned int seems to be 'implementation defined' but I would guess 32 =
bits
> is not unsual. Basically wouldn't a field length > 32 above be problema=
tic?

Good remark...

As per the standard bitfields access must be per 'unsigned'.
So with a LP64 data model we have sizeof(unsigned) =3D 32-bit, I wonder
how the compiler behaves.

I added the debian-win32 docker image to tests this kind of regressions,
but it seems the current toolchain used (mingw-w64) is now only a LLP64
model (I still need to verify).

I remember I somewhere have a Linux/X32 docker suite to test this
series. I'll give it a try (I doubt before this week-end).

Regards,

Phil.

>> +    } v =3D { .v =3D val };
>>  \
>> +    uint64_t d;
>>  \
>> +    d =3D deposit64((storage), R_ ## reg ## _ ## field ## _SHIFT,
>>  \
>> +                  R_ ## reg ## _ ## field ## _LENGTH, v.v);
>>  \
>> +    d; })
>>
>>  /* Deposit a field to array of registers.  */
>>  #define ARRAY_FIELD_DP32(regs, reg, field, val)
>>  \
>> --
>> 2.15.1



--L91iUHJ2nQwxNxeiweUQFJbUMXQOi8gbK--

--lv9aTc2WDMkDP0hdIaqG5MTxWjlnNb0rw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE+qvnXhKRciHc/Wuy4+MsLN6twN4FAloygW8ACgkQ4+MsLN6t
wN4RQA//c339XM18QWIYerM/VwC9ckmYmqkSVSA66+U0fzjYziJw86G2QcCOw38T
wU7Re9iu8bFVVaJQhLWj9XYRlcdPAT1r+TTrw4suJpWjJ2eSP2vaRDkTGnSj5sWc
6D2LDnfLKPWWE7KjAqP89LomrFsmL7XhzuOx06Oh7faizRvhKimqkkwmlWSlHIWV
HLMlgOnSGZT6wh218TDD7kunE0062cqPpn+CO9AdVRqBVl1xujp+vEUXIOuw3clO
5ILw1/7wDz97MXZIfHI7XGB64BBi/xeu8hqYy4OCNFCs3AHSPTrh1ukXujdARu3p
Fw5ZMjxl3I74K/9ELx18lklxeydaC+A6m/yp4YOj52U+fcI8Vw8YBZPzTgF+3tUg
flK6Bh4I1hjK/hp7PZHXs1pda+DbmACfKrcIhmohIJOZ28R3T1x7CyS7ywjqsrzn
qQ3KpnqQj2nsOZWqzi5vsrz79fM/eXkNUvzTbUZqOdOdz5kfbQuaTspyHsUrOgjt
zY0s75VZvBeuRZUZ7RIoZmAeKT0vzF65l9Yb+zrASvLq4aahKZRmQFTAgUSJ8rML
XpdDsGXi5Jx9wzpNqKNegUTOQVPR+WUWGGa87MSYI9cjAZiRAII0m3vV371gWhFJ
X0H5f8Gv3344K+vxh0cb8RHtpxU7VCb4SKf4xl/XuuHsA2UD0vY=
=o6T4
-----END PGP SIGNATURE-----

--lv9aTc2WDMkDP0hdIaqG5MTxWjlnNb0rw--

