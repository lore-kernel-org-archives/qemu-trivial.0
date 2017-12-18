Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eQjV4-0008Dq-LL
	for mharc-qemu-trivial@gnu.org; Sun, 17 Dec 2017 19:41:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43629)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eQjV1-0008C9-Pc
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 19:41:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eQjV0-0002Oq-Rr
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 19:41:43 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:47060)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eQjUu-00028d-O3; Sun, 17 Dec 2017 19:41:36 -0500
Received: by mail-qk0-x242.google.com with SMTP id c85so2356828qkh.13;
	Sun, 17 Dec 2017 16:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=njhv9Mm61wFF+AEf2/l8IJ18bsbeFkAGMe9lgrbOEaU=;
	b=rfbFd3Rnmhqk3AgNQNcjQrl4pZvXqs23+RM+LSxowCWWutuiTGajQWC9iC2ziI9wJD
	emK9kR7DNBaYc3Q240abWhxK1QJ/bxaTOWST9I+wytKJbLHrbonoqnsprF6DF0CxS/EF
	KHWJOq54vE5Qv2SkWcAEuF4U7aUN51/eyDJxA4HarkqIVhACBzStLPBxaUPrsh4h/Oni
	2NGiyzPmuJn7psjuVu9/PDE19KMO4VW/951OcWJOU7RRN6NoPAnwmn6BkHKZPQzj9Wt+
	zmWTGy8SJhY5XVaeZdiiB52eTpghS0+IwkIxUacSVDSss2t9eBH0xs1ojrqPUNQRofvB
	kskw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=njhv9Mm61wFF+AEf2/l8IJ18bsbeFkAGMe9lgrbOEaU=;
	b=AqaHS2Q6Eq0tZq5WDRjw3uRkIeS+fIyURYm3W/h4Z7r65BOoC7Q6vCK4r2tYOJbJvC
	ehkP2gjYSlLrY84dtGI1GAo2++jv0ElR5XUD4I5ElsoRvRxyo6lJD6ciLX8Fhdl0kiOt
	oXbEWlkHnKl7rzqu3xqKrIKUyThNmgRdxn7jEVvNO4dOlxBv3zitAdtQ00YIRKWGZSeY
	4UTyYCWSaPsBUuVj+UrSlcL7L1/SVUWaYEHiT+pDsXEwQw0CNiA4F18GZvK8Igdhfdnc
	8YRWEm4cPim0dwiMDtDGp62Wpag1axiZInjBIBvSXb2HEg4B2zCwli3HpdXpq/c5cwhI
	oicg==
X-Gm-Message-State: AKGB3mIQidcyH6wFo8kMnB6GIHmURSs55pufeh2oHzXE0tecChzC//iL
	sG0ICBvG6gnkKxQBJv7minX4hpTE
X-Google-Smtp-Source: ACJfBos7hJ41ylHQthe0klDZOgWHiHjMIynAHHlQMnLbH4rYcAIvdYcdsRTtAI11RvSHAznCZrhlLA==
X-Received: by 10.55.221.20 with SMTP id n20mr4734684qki.181.1513557695859;
	Sun, 17 Dec 2017 16:41:35 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.211])
	by smtp.gmail.com with ESMTPSA id
	m124sm7387610qke.9.2017.12.17.16.41.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Dec 2017 16:41:34 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev
	<mjt@tls.msk.ru>, Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
	<cover.1513548172.git.mjt@msgid.tls.msk.ru>
	<CAFEAcA9qOtMtct6hND=uOiP_Nv9vaiuR=0NkSvrQQdz0v3FmfA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <26d87055-4c23-6aa1-e55a-fb6a95ece7fd@amsat.org>
Date: Sun, 17 Dec 2017 21:41:24 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9qOtMtct6hND=uOiP_Nv9vaiuR=0NkSvrQQdz0v3FmfA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="cMXAmX5kw5WGtRURVwINp7W7P7lYhBTw9"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL v2 00/61] Trivial patches for
 2017-12-18
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
X-List-Received-Date: Mon, 18 Dec 2017 00:41:45 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--cMXAmX5kw5WGtRURVwINp7W7P7lYhBTw9
Content-Type: multipart/mixed; boundary="QdeAEnNpLS2tfPkZ73AS7x1LafM7TIQQ4";
 protected-headers="v1"
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev
 <mjt@tls.msk.ru>, Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Message-ID: <26d87055-4c23-6aa1-e55a-fb6a95ece7fd@amsat.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL v2 00/61] Trivial patches for
 2017-12-18
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
 <cover.1513548172.git.mjt@msgid.tls.msk.ru>
 <CAFEAcA9qOtMtct6hND=uOiP_Nv9vaiuR=0NkSvrQQdz0v3FmfA@mail.gmail.com>
In-Reply-To: <CAFEAcA9qOtMtct6hND=uOiP_Nv9vaiuR=0NkSvrQQdz0v3FmfA@mail.gmail.com>

--QdeAEnNpLS2tfPkZ73AS7x1LafM7TIQQ4
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On 12/17/2017 08:14 PM, Peter Maydell wrote:
> On 17 December 2017 at 22:07, Michael Tokarev <mjt@tls.msk.ru> wrote:
>>> Here's a large pull request for trivial-patches queue.
>>> It's been quite a whie since the last request, and many
>>> changes has been accumulated.
>>>
>>> Also there's a large patchset by Philippe Mathieu-Daud=C3=A9
>>> named "remove i386/pc dependency from non-PC world (part 1)"
>>> consisting of 42 patches which makes good portion of this
>>> pull request.
>>
>> I forgot to add my S-o-b lines to the large series by
>> Philippe Mathieu-Daud=C3=A9. So here's a re-send of just the
>> cover letter (not all the other patches). The only difference
>> is the addition of 42 of my "S-o-b" line.
>=20
> I'm afraid this fails 'make check'. (I only tested the
> first pullreq but if you only changed signoffs then
> it'll still be the same):
>=20
> TEST: tests/qom-test... (pid=3D12208)
>   /alpha/qom/clipper:
> Broken pipe
> FAIL
> GTester: last random seed: R02S26a31a16d967b2664ad714c1c7f8e7f1
> (pid=3D12214)

Oops

>   /alpha/qom/none:                                                     =
OK
> FAIL: tests/qom-test
> TEST: tests/test-hmp... (pid=3D12219)
>   /alpha/hmp/clipper:
> Broken pipe
> FAIL
> GTester: last random seed: R02S0c5a0f7de3fc6e9885b740c77c86eef2
> (pid=3D12225)
>   /alpha/hmp/none:                                                     =
OK
>   /alpha/hmp/none+2MB:                                                 =
OK
> FAIL: tests/test-hmp
>=20
> This is because qemu-system-alpha segfaults on startup:

My bad...

eede06dd70f72da489b8f968abbb7cb5445ef834 is the first bad commit
Author: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

    hw/alpha/typhoon: simplify using the "unimplemented" sysbus device

I'm pretty sure I run the qtests, but this was 2 months ago...
I'll have a look.

[...]
> There was also a minor merge conflict with the tpm pullreq
> (both pulls change the #includes in hw/tpm/tpm_tis.c) which
> you might fix when you respin.

Yes, I rebased the 42 patches on /master yesterday but I see you merged
the TPM tree in your /staging, so I'll rebase there and resend the
offending patches fixed to Michael.

Regards,

Phil.


--QdeAEnNpLS2tfPkZ73AS7x1LafM7TIQQ4--

--cMXAmX5kw5WGtRURVwINp7W7P7lYhBTw9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE+qvnXhKRciHc/Wuy4+MsLN6twN4FAlo3DrgACgkQ4+MsLN6t
wN4srg/7BQ89mrRlBdY0jNO3f377WQARmSo8FUcCfsGDURVMDbjDF1CpHMrBOjxi
BR/ehKG2fljtKnjcQ5HstUef9XsddH67kQs3K5/PkKvXLdtvXUwy0qRwQRpYxqpB
yt9NXxFgHp9DCjVZLV6ULnsYkBXEzOlTHNx0B+L/E8PMYnvyAt70gVywROTKQBX0
UUELG9/o9lKAMtB9MCIm6y52Tm1GqLTMoJ0r874OMNhaEH7xGdzH9YGotErTBuqw
2lBYOTUN0W9Fd5MD8SKViHibowOWbVEGkFeyCzShN3Ibg6nN+T5OfqSpZYs2xpfh
PHFyTMyc9AqylznKlp4T/gf2w2RduJhFvfEIQrBFqjS6rB+VLksyfzxVyHXzR/tz
9xnH1wN0XGM58SO2x7JEBoKp60b8mR03hzoXRG3HUa4xgZzslhMtjnOf09n4Z/Pa
tJhg1RYZyBQlct+3env3tIwDrtICi68Ebjhp7/EyzsOTeLSLc2IaXEA3w5PskOCb
PwKOzTrXRX9yJpAfX158fmFwzPMZJcSTXQG2XaetHm/fpba1WsHOlkh2GfXL+CQr
i1iH+O06PDXJEo7XndnagpVnAMgacZow1pJtjxuMH9d9BujKpUn5sPEtxGOtQrfT
xSpybjvWTudTanKKt3i22gXijmYEDybGELAOK/zipH1wkFnksPI=
=trym
-----END PGP SIGNATURE-----

--cMXAmX5kw5WGtRURVwINp7W7P7lYhBTw9--

