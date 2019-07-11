Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hlbsG-00088Q-SU
	for mharc-qemu-trivial@gnu.org; Thu, 11 Jul 2019 12:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42257)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hlbsE-00085S-Ai
 for qemu-trivial@nongnu.org; Thu, 11 Jul 2019 12:24:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hlbsA-0003O6-F0
 for qemu-trivial@nongnu.org; Thu, 11 Jul 2019 12:24:44 -0400
Received: from mail-wm1-f53.google.com ([209.85.128.53]:36082)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hlbs7-0003Bt-Pl
 for qemu-trivial@nongnu.org; Thu, 11 Jul 2019 12:24:40 -0400
Received: by mail-wm1-f53.google.com with SMTP id g67so2177627wme.1
 for <qemu-trivial@nongnu.org>; Thu, 11 Jul 2019 09:24:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to;
 bh=62h3UzjmmZyPzvzlMTS4Ekjtl0bCsg/7Pg0zmtw2H8c=;
 b=lZ1+rr7UcAeedszpxERHLqmmlOlViMzUJz51o26POV97YphJQMftbEdcFk0gCo5Fal
 172ld2l7IN0usE+MDouBwEj7lUXt3vkpou4MJBYVFKA/BWBp3QWFSv5P/LkM1H4cgxBH
 bvomYPEnTccxi6PCj2xIjNC2M7LH8hBiRPS/k5yxosADZa5cQJAGWjvzgkX6beR83yRR
 ugjwJT1x4s3DixRjGAO9q937Xb0sm+L3Am06kWi5O2L20WFeUB0tyNsb9A1FsmJ22MgN
 qjIhjuJyfKVC5L8RjQEpDNCAtFwzidNm9E7eGhpnGPEJncRJtl+7fQevT2UNc1DsLQf2
 7dxg==
X-Gm-Message-State: APjAAAX08rLe2V5GO29E97wPDM+Aer4T7uWMWr+jZ7E+/JqY9UQviPZP
 MmUNPa7g9BFW64G6K7rrN5OAYjoMuhc=
X-Google-Smtp-Source: APXvYqzVSVVClFItG1XPpyZwaWKDFdnPgJzfzK+0/rAP7LDazGncwx/o3iQ/Laj7Rt8JaQ709SzqXg==
X-Received: by 2002:a1c:be19:: with SMTP id o25mr4787475wmf.54.1562862255691; 
 Thu, 11 Jul 2019 09:24:15 -0700 (PDT)
Received: from [192.168.1.103] (62.red-83-42-61.dynamicip.rima-tde.net.
 [83.42.61.62])
 by smtp.gmail.com with ESMTPSA id p3sm5575103wmg.15.2019.07.11.09.24.14
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Jul 2019 09:24:15 -0700 (PDT)
To: Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Guenter Roeck <linux@roeck-us.net>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <1533076661-8030-1-git-send-email-linux@roeck-us.net>
 <CAAdtpL6dAKVj3bBLRS_6x4B3Pmed9hodd6-kh2imBbs81txV8g@mail.gmail.com>
 <20181115151433.GA19418@stefanha-x1.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <609c3832-d8c8-1fe2-8d29-5f6df1a80c2f@redhat.com>
Date: Thu, 11 Jul 2019 18:24:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20181115151433.GA19418@stefanha-x1.localdomain>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ESKYxz0OlMfHzHQu7WMDcjSNY5xiuC5uS"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.53
Subject: Re: [Qemu-trivial] [PATCH-for-4.2] hw/sd: Mark sd-card as storage
 device
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Jul 2019 16:24:47 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ESKYxz0OlMfHzHQu7WMDcjSNY5xiuC5uS
Content-Type: multipart/mixed; boundary="ifgU7yOsrOCFsr4ZhDVXWLS0C6LNQZk4F";
 protected-headers="v1"
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Guenter Roeck <linux@roeck-us.net>, QEMU Trivial <qemu-trivial@nongnu.org>
Message-ID: <609c3832-d8c8-1fe2-8d29-5f6df1a80c2f@redhat.com>
Subject: Re: [PATCH-for-4.2] hw/sd: Mark sd-card as storage device
References: <1533076661-8030-1-git-send-email-linux@roeck-us.net>
 <CAAdtpL6dAKVj3bBLRS_6x4B3Pmed9hodd6-kh2imBbs81txV8g@mail.gmail.com>
 <20181115151433.GA19418@stefanha-x1.localdomain>
In-Reply-To: <20181115151433.GA19418@stefanha-x1.localdomain>

--ifgU7yOsrOCFsr4ZhDVXWLS0C6LNQZk4F
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

On 11/15/18 4:14 PM, Stefan Hajnoczi wrote:
> On Thu, Nov 15, 2018 at 03:24:25PM +0100, Philippe Mathieu-Daud=E9 wrot=
e:
>> On Wed, Aug 1, 2018 at 12:37 AM Guenter Roeck <linux@roeck-us.net> wro=
te:
>>>
>>> sd-card is currently listed as uncategorized device.
>>> Mark it as storage device.
>>>
>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>
>> Reviewed-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>=20
> Do you send pull requests for the SD card subsystem or who will pick up=

> this patch?

Usually SD patches go via the ARM tree, this one could go via the
Trivial tree too (Cc'ing them).


--ifgU7yOsrOCFsr4ZhDVXWLS0C6LNQZk4F--

--ESKYxz0OlMfHzHQu7WMDcjSNY5xiuC5uS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEicHnj2Ae6GyGdJXLoqP9bt6twN4FAl0nYq4ACgkQoqP9bt6t
wN7P1Q//clVJ3B9AkVNhat6JefxaJWqLGuV3Bj1pxcsZbLsvbcxDi9Qs/nJfLkMd
BHNRGMCUy7GHxIhj/Ymd66HWdJygXP47YcnO/uDBg7sLSsIVjdfOTBxP1vhNt78D
1NW2tsyXNrII+cM3VqpzOsagphFNoZ2eFJi6sN+DDBNmGJNWm2t2OrNjXggDP4Ge
1gtjm7gKaCfaaezJUqGEgWDQX5AdVMN9kEHEb+I6QV3hvSjSd8ss3ErjelxbVTUW
v0kRqQlAkoJ5qucZaLDz59xG7PerMEOPMKDXdJpZ2w1aGIY7UjIg7C4H3N0G0B1r
wafWlfI1kOm5mh3KhDXNz+ixRXFGNU7DETZzCH12TQuLT0DywCVwXJA/T2QOn7vA
D8EJKS7hOnWGDVvmJ19/NlJboeattQfiS3x/bce8rAMRzmEG0umYzfun7wAbcdKR
VSkVsKhV4dkOnCOga/E73WPWX6bLgtFDF5EODI50PDz9VOICxPAOslYgFcfw6+9G
cEBvbG7JcG61kxfXcVZ32+h3U3D3D/83MJHl8ucSPfpuhpEetCJUdJ+aOglt/m4F
ZTrniVJ+q1pF3fO6mmPWw7ccGT0nRmGRyKG3IxFacdATVeIa9jEsWlsa77iBZIXC
nNLGj4aLHloqMrr7TMbyXJjyw5NG1ktD9s0tVuFkvFqocwNgFxM=
=xUOY
-----END PGP SIGNATURE-----

--ESKYxz0OlMfHzHQu7WMDcjSNY5xiuC5uS--

