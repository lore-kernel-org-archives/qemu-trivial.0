Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eQkd6-00081E-A3
	for mharc-qemu-trivial@gnu.org; Sun, 17 Dec 2017 20:54:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51033)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eQkd3-0007zy-Ek
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 20:54:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eQkd2-0004iP-KN
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 20:54:05 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:43806)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eQkcw-0004ad-9T; Sun, 17 Dec 2017 20:53:58 -0500
Received: by mail-qt0-x242.google.com with SMTP id w10so18281124qtb.10;
	Sun, 17 Dec 2017 17:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:from:to:cc:references:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=BR0hlbfPxmi3oAcPFToJamN6AJ1Hf4RYpOIGbCQMDoo=;
	b=UKJIrgKyfpy4pKtLgwb53HkwuTnfYjneHnh9Xw3DC23lIWU+a2sPHBtQ0YF7Ud9Qgc
	/Xziih8WbX+kuWql2TGWBjO4RjaKE1LLgXNqtSsGIU1QcwcQnvglGqaFgJkakpgijxT7
	Y8SBgg9WpbgXtKNyEovcmEtbvY1Wo1PkCXy+57lOVELFYZ8NrU9tP5JBqhPkzGUdUmnI
	iFz40TH9V3Zoot6CrKycE9nmbT+dcw5HO6SUcZhVI2dNm8/ydNYVlrs6Mkt2+t8QvWRz
	ROA2DmSU8e+jvvdyapPbFI9OhVtiwk7wEGdLnJ/65tJR4ZeBcIRsBAl4fVCx1Evt0ul9
	U7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:from:to:cc:references:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=BR0hlbfPxmi3oAcPFToJamN6AJ1Hf4RYpOIGbCQMDoo=;
	b=Ivtdaz+tE9TpP0Y5HrQYKny3XzZDp75qIig+SP9x4QV4qyj/0rmoy3KP3mZzDZZE7U
	uG40ds0oodoOOPYSsoaADlycQ8JyURIxaPVktL8moTnHvDQHx7/oN+bIQCpx+ssuqc/z
	AQqIwhpGzwuuWN78GrG+WM0XEte5Mw67ib/7ZStgyqTUw6ekhAkGumP78DVOrl+mxROY
	3AkrHtDlVHhbA20j4Uvr2Z3JVak09gYaoNstq3VTAyElE/t8qOOVFy6RKRia77yOGjaQ
	OU1cKLBvocdG/5uafpXZs/oDsu35kVGvjsN6Lf1sX6casMMKZGy/lDrZjTBQhGX1hQ0X
	ueuQ==
X-Gm-Message-State: AKGB3mJuc3su5HIS5ymzpgxdx+GmRfiB96LDgqyOpVqocfH3cVLr8Csy
	GHACTvB9cZ8oQUugkjuabhlW9W2J
X-Google-Smtp-Source: ACJfBovZQjzivNjnMHrVQHWGcsCD31WIS7lYq1O3DOtZelD6EmDJPLR/93pqX1UclH/rFFKSemJ94A==
X-Received: by 10.200.8.11 with SMTP id u11mr35158767qth.315.1513562037275;
	Sun, 17 Dec 2017 17:53:57 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.211])
	by smtp.gmail.com with ESMTPSA id
	i42sm7835267qtf.61.2017.12.17.17.53.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Dec 2017 17:53:56 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev
	<mjt@tls.msk.ru>, Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
	<cover.1513548172.git.mjt@msgid.tls.msk.ru>
	<CAFEAcA9qOtMtct6hND=uOiP_Nv9vaiuR=0NkSvrQQdz0v3FmfA@mail.gmail.com>
	<26d87055-4c23-6aa1-e55a-fb6a95ece7fd@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <232ba76b-c42c-ddec-2f90-6eb403a8fee8@amsat.org>
Date: Sun, 17 Dec 2017 22:53:50 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <26d87055-4c23-6aa1-e55a-fb6a95ece7fd@amsat.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="1gl1SoQBId3d3iLWe6mOMr0Bdje47MrXR"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
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
X-List-Received-Date: Mon, 18 Dec 2017 01:54:06 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1gl1SoQBId3d3iLWe6mOMr0Bdje47MrXR
Content-Type: multipart/mixed; boundary="IIr8j2TMxwQvx0BJeHRMNogrDViNlWFQe";
 protected-headers="v1"
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev
 <mjt@tls.msk.ru>, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Message-ID: <232ba76b-c42c-ddec-2f90-6eb403a8fee8@amsat.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL v2 00/61] Trivial patches for
 2017-12-18
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
 <cover.1513548172.git.mjt@msgid.tls.msk.ru>
 <CAFEAcA9qOtMtct6hND=uOiP_Nv9vaiuR=0NkSvrQQdz0v3FmfA@mail.gmail.com>
 <26d87055-4c23-6aa1-e55a-fb6a95ece7fd@amsat.org>
In-Reply-To: <26d87055-4c23-6aa1-e55a-fb6a95ece7fd@amsat.org>

--IIr8j2TMxwQvx0BJeHRMNogrDViNlWFQe
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

>> I'm afraid this fails 'make check'. (I only tested the
>> first pullreq but if you only changed signoffs then
>> it'll still be the same):
>>
>> TEST: tests/qom-test... (pid=3D12208)
>>   /alpha/qom/clipper:
>> Broken pipe
>> FAIL
>> GTester: last random seed: R02S26a31a16d967b2664ad714c1c7f8e7f1
>> (pid=3D12214)
>=20
> Oops
>=20
>>   /alpha/qom/none:                                                    =
 OK
>> FAIL: tests/qom-test
>> TEST: tests/test-hmp... (pid=3D12219)
>>   /alpha/hmp/clipper:
>> Broken pipe
>> FAIL
>> GTester: last random seed: R02S0c5a0f7de3fc6e9885b740c77c86eef2
>> (pid=3D12225)
>>   /alpha/hmp/none:                                                    =
 OK
>>   /alpha/hmp/none+2MB:                                                =
 OK
>> FAIL: tests/test-hmp
>>
>> This is because qemu-system-alpha segfaults on startup:
>=20
> My bad...
>=20
> eede06dd70f72da489b8f968abbb7cb5445ef834 is the first bad commit
> Author: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>=20
>     hw/alpha/typhoon: simplify using the "unimplemented" sysbus device
>=20
> I'm pretty sure I run the qtests, but this was 2 months ago...
> I'll have a look.

This patch is not _trivial_ :| Let's drop it from this tree, I'll have
to rework it.

> [...]
>> There was also a minor merge conflict with the tpm pullreq
>> (both pulls change the #includes in hw/tpm/tpm_tis.c) which
>> you might fix when you respin.
>=20
> Yes, I rebased the 42 patches on /master yesterday but I see you merged=

> the TPM tree in your /staging, so I'll rebase there and resend the
> offending patches fixed to Michael.

Michael, I removed the "hw/alpha/typhoon" patch, and updated the
"hw/tpm: remove old i386 dependency" one: no need to modify
hw/tpm/tpm_tis.c, Marc-Andr=C3=A9 Lureau already cleaned it, I did howeve=
r
clean the newly added hw/tpm/tpm_emulator.c file.

The fixed tree is now available signed in the Git repository at:

  github.com:philmd/qemu.git tags/trivial-patches-2017-12-18

If this is OK to you I'll only resend the "hw/tpm: remove old i386
dependency" on the list, but if you/Peter prefer I can still resend the
whole enchilada (which is unchanged except this unique patch).

Regards,

Phil.


--IIr8j2TMxwQvx0BJeHRMNogrDViNlWFQe--

--1gl1SoQBId3d3iLWe6mOMr0Bdje47MrXR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE+qvnXhKRciHc/Wuy4+MsLN6twN4FAlo3H64ACgkQ4+MsLN6t
wN6j8Q//S2m3jBqPC/Lu9MyDzuce0MJRmYHeX/PUKC8H4nkYl3KqLFmTpJeKiL8/
9zNzii/M4tBk0HLUJ+IuINJCOFx5W4lXFsfil9LXpWli44eiesGHWL1QkiMfPS9V
jraFoJsXMAqim6dtF6HWKinG2sf9E6BKrAXsT9DMaKFp9B6Vxeo98zxu21pwVVSC
kzZ5JFLp6SHw5uv4jzvD55OEF2k88Fc4h03aa0R3gpUYyw4KkPKpl3DzESOnVpaL
JMQoIA9lGytEVqxNKVSd8JxM/E73lJbOk6DVrct2pi1ti52t7s7ZzpDgcblynQzD
Pq/zq7NJZCki9/9KMgr+MM5y33sZdvCeLbsXXiIxqlZnKEjYaGi5F6jeUutzbyzS
K3tO/RNSmap15EwqMQs0VaeCOIFY0N2k3H47vC/aipTcKUHVquMU+oUqhyNtXKnu
s/FRD8JGGlCFjPj5UgZzTBs7seUDq22sfVPXd5rmdrQOCLKduuZVwQFGYoFDhPhc
1/i3B8JGAPonVjBCmCe7qBunrOpXl9dQY0H8rbXFl1+/5XQU1GNs636WtQqexbDB
liff7f3FOdqeX3dHNVwZAg1iIPmkA9V0ZJ8NN5i61+dBozxa3hG7nYaQYbgUXt7g
8C/BTr2ZCCBSWOXa+Tw94k+/FzefaPnNLD70CRYAhIQyFVSKwc4=
=Ewwb
-----END PGP SIGNATURE-----

--1gl1SoQBId3d3iLWe6mOMr0Bdje47MrXR--

