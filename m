Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gj5V7-0001MS-9o
	for mharc-qemu-trivial@gnu.org; Mon, 14 Jan 2019 11:54:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39630)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gj5V4-0001Jr-Rz
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2019 11:54:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gj5V2-0003Tp-M0
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2019 11:54:10 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53042)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gj5V2-0003TQ-9p
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2019 11:54:08 -0500
Received: by mail-wm1-f67.google.com with SMTP id m1so283669wml.2
	for <qemu-trivial@nongnu.org>; Mon, 14 Jan 2019 08:54:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to;
	bh=yfR55FLXfu/q1LqESx9f2BEvlj78vsY0a5gCuGQNeME=;
	b=mdPhMp3PzIN67n491fuG4sky/niGHuQEeYCnlKctiX7WTSWJAp91HNuw3gml5KaVgv
	dPTrYCe5XEpEYlAPH6vPFptTbn1gF1e0TqWGKIdRAZfCHhHKonxBnqg6TEcgRxuEJDnp
	9/5gzxUNhkT0WsD094fZGZEtkgXtxHbBSPxVe2Ivs1LWmGpqEw8i9++c9mBMNQcB9lyv
	mZhd3fJN3dURejoW0m4FvgelzVEBn3bVOc0c5aZqSHpJztvTfJ0G4ooqyIa5jaRa/hKX
	lgoR+mnu+DksQ7/cJe/rTHc4JifdThGXsGd6zga5KptxdzBvdI5DY9MXURNhhuxMT/mt
	Ppvg==
X-Gm-Message-State: AJcUukdGLsLMJDXVxKEgYr0gFkkMkYv7QC/OBa5ObsBwBVG16CUhSNu4
	pGdYxig9DgFXmJKg3DnLMFRB6g==
X-Google-Smtp-Source: ALg8bN6OUYC2drzsG6EWn84xt01eKKGhYbvGQpFCseywGjl3urNNUIXPq9N8rCeLJVfqVKJXJz5hQA==
X-Received: by 2002:a1c:6707:: with SMTP id b7mr45196wmc.138.1547484847142;
	Mon, 14 Jan 2019 08:54:07 -0800 (PST)
Received: from [192.168.1.33] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	z7sm68434867wrw.22.2019.01.14.08.54.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 08:54:06 -0800 (PST)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
	Cleber Rosa <crosa@redhat.com>
References: <20190111201330.14473-1-eblake@redhat.com>
	<05f29d1e-11f0-62e0-af82-02a989e1c7b7@redhat.com>
	<aae54881-da9b-f49f-24e3-86378adbf71f@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <a46d8da7-afbe-d68f-4ca7-ddf00dbff4e5@redhat.com>
Date: Mon, 14 Jan 2019 17:54:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <aae54881-da9b-f49f-24e3-86378adbf71f@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="2ih3T7SVXqaw9pzPFe7IEBGpCsDIQwyaj"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu.py: Fix error message
 when qemu dies from signal
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
X-List-Received-Date: Mon, 14 Jan 2019 16:54:11 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2ih3T7SVXqaw9pzPFe7IEBGpCsDIQwyaj
Content-Type: multipart/mixed; boundary="PtnbVfU92474KxTTlzqtauzsbQpE6eVWv";
 protected-headers="v1"
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Message-ID: <a46d8da7-afbe-d68f-4ca7-ddf00dbff4e5@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] qemu.py: Fix error message when qemu dies
 from signal
References: <20190111201330.14473-1-eblake@redhat.com>
 <05f29d1e-11f0-62e0-af82-02a989e1c7b7@redhat.com>
 <aae54881-da9b-f49f-24e3-86378adbf71f@redhat.com>
In-Reply-To: <aae54881-da9b-f49f-24e3-86378adbf71f@redhat.com>

--PtnbVfU92474KxTTlzqtauzsbQpE6eVWv
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 1/14/19 4:36 PM, Eric Blake wrote:
> On 1/14/19 5:04 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>> Hi Eric,
>>
>> On 1/11/19 9:13 PM, Eric Blake wrote:
>>> When qemu dies from a signal, the python code gets a negative
>>> value for exitcode; but signal numbers are positive.  Copy the
>>> pattern used in qemu-iotests/iotests.py for reporting a positive
>>> value.
>>>
>>> CC: qemu-trivial@nongnu.org
>>> Signed-off-by: Eric Blake <eblake@redhat.com>
>>> ---
>>>  scripts/qemu.py | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/scripts/qemu.py b/scripts/qemu.py
>>> index 6e3b0e67719..0a5e02eb56e 100644
>>> --- a/scripts/qemu.py
>>> +++ b/scripts/qemu.py
>>> @@ -351,7 +351,7 @@ class QEMUMachine(object):
>>>                  command =3D ' '.join(self._qemu_full_args)
>>>              else:
>>>                  command =3D ''
>>> -            LOG.warn(msg, exitcode, command)
>>> +            LOG.warn(msg, -exitcode, command)
>>
>> What about displaying signal name directly?
>=20
> If you want to do that, it should be a separate patch, and fix
> iotests.py at the same time.

Fair enough :)


--PtnbVfU92474KxTTlzqtauzsbQpE6eVWv--

--2ih3T7SVXqaw9pzPFe7IEBGpCsDIQwyaj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEicHnj2Ae6GyGdJXLoqP9bt6twN4FAlw8vq0ACgkQoqP9bt6t
wN536g/+Pyrzp3WsjqqairKzUNp7qeye90tTSeiHvhu+3UuaDnffQ0mSou34ktzv
4UDg8kOXKq1fIQjL3MLDy0je2PmUalBQDv9qLNhyqmlNprjOOj5pfzxJuXjkY5Fj
VUK4CERRO7rsxyWeSb9GVGsOo88Lz8q+X/exvkQBxZROIUuDchKisE2r6EZF1ERj
YC8G0kj+V3zOa/fkbYHX5zPBWu9Of/OniejVqif8Ic2XePIpte8x1SRb6Fnz4tu/
XVJ2HxO0WjmmBP6+xNplfQU7DZrQppEKpE0dbcRJhW3PlJcR+Wto8P0ku0I9Wj0/
pCTDn1LsnVHHNxYJ9vgTicSGPMWdvNPbA0G5MIJBq1p2RS0CPt3oqxL0FWvTegDb
4xtMt42bCdnh1aYK7JWd0SJ/d/c2rX4NAq+or/ShY5lIODE5Tyzeq2ENIUsDUU9w
MxL7IFTTXiE7BGefsTWv2LuMF1eJYoz7k/PgrC2eTh+dtU1XADvGQc7ii+M6NUFX
sugrKDXZs4xHH/9KAhGV5J/vSO2EJctnLxuDWdplCPN3MtHx9TbfoXCnuVjkYw3n
Tp3BNEYmHmQjRmVbGfUZ9F4g2f55q4YnEIZyyl4l6Ppuiaf1vj4/x6S4PDkLkjm7
I4g750U2OkaTZARjscJSWauW4Af/v+v4kTH2A0QgJOJJjFP8gHQ=
=osd6
-----END PGP SIGNATURE-----

--2ih3T7SVXqaw9pzPFe7IEBGpCsDIQwyaj--

