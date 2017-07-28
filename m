Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1db43X-0001xb-T1
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 08:07:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52135)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1db43W-0001vP-5H
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 08:07:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1db43T-0001Le-D7
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 08:07:46 -0400
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a]:35225)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1db43T-0001LE-5c; Fri, 28 Jul 2017 08:07:43 -0400
Received: by mail-wm0-x22a.google.com with SMTP id m85so20177311wma.0;
	Fri, 28 Jul 2017 05:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=TMzRy4D2n/So4KVkjySHUnVX6pFtsKgIDb7KPvrNKfE=;
	b=KahBZ1oFOl+xwjW7eOADyxkU4z9KPSMpivQnSAyjxIqB9emFXM7BBRrMMlqM8SjZp2
	xnxGoG2gXia4etNiarjFz1yZGrBdEKRg7WjL11ZhpONuYiRH8roL0DSq9WP0o5FsPUum
	xm0Y+mrff57y58K3EoQhFrruNe9bY9GG/OIN24GF5HS6uTDLYu6qjuo4pGEFNIsaNu+/
	ImGr7fgJXu7hqO2NycplzpptuhbhXLSzR8bOgpo2Hili1HQZPYv+hBV1Xao3RjxBvDMp
	pvm+Gl9PyQwu5g4STKnsDGcLBiXPCmPx6ek1pzoaScEnE2SOADgVJIg0gn6QfMUyL8Er
	ZUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=TMzRy4D2n/So4KVkjySHUnVX6pFtsKgIDb7KPvrNKfE=;
	b=BFkpqKvTkVVsiuqulom8KZjdlezMQsnhPmpKdX28dJ0K1YXWC+y6K6iipvRqU8voI/
	ghdH9CPYEMo4xFxxXcjk0uuNxNl3o0Ill8TX6iKpDeHpIqFVUEPakGIe6MQ46fmCk6b2
	pm+USOWOb36Z66x9vC8UgteK1N8IVAou08ESxwPCAplEApBZ/mxnAD/1001DXIXdE+mY
	R5mWWNOozXv3yVMWLNn9gOUsh2USs1cTiJ5/oAyQd4IB7chwHP+vMOoGrQTZKIohxYmT
	Tqletf5ATaa3PL6R1d6lpSVC0bpJcVSvWCGS44zLmyZxulan2hzNr8BbvZqHUPgI9Y0S
	uMBQ==
X-Gm-Message-State: AIVw113eU4PimevvBjnhG672OE+5VgtPpfvyErhV8R7X3njuEqU8iGFB
	jIZzoZnTZM9ijg==
X-Received: by 10.80.194.66 with SMTP id t2mr6370203edf.86.1501243662123;
	Fri, 28 Jul 2017 05:07:42 -0700 (PDT)
Received: from localhost ([51.15.41.238])
	by smtp.gmail.com with ESMTPSA id u10sm583250eda.93.2017.07.28.05.07.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 28 Jul 2017 05:07:41 -0700 (PDT)
Date: Fri, 28 Jul 2017 13:07:39 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: Alberto Garcia <berto@igalia.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Message-ID: <20170728120739.GC12364@stefanha-x1.localdomain>
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-36-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="B4IIlcmfBL/1gGOG"
Content-Disposition: inline
In-Reply-To: <20170728053610.15770-36-f4bug@amsat.org>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22a
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 35/47] MAINTAINERS: add
 missing entries for throttling infra
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
X-List-Received-Date: Fri, 28 Jul 2017 12:07:47 -0000


--B4IIlcmfBL/1gGOG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2017 at 02:35:58AM -0300, Philippe Mathieu-Daud=E9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  MAINTAINERS | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--B4IIlcmfBL/1gGOG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJZeykLAAoJEJykq7OBq3PIjzsH/jQn+PV+Tke2dQL8nXoPPIZh
am3x+4FlPItGckX5NpKJ0GvvTU4bepbZPj4//Cl5WAqTVdpU6nGsurRcXtfEGSkQ
mkzfi0BY6cLMXC4jZrVEyTTJZ6W6g1nJvQyd4Nd7UQAXdh8F9qMt3GITlfTdy1Qc
wCI7+1JPDkT7kRj8+RCdkwh3NjHl4bX0o4tefCZ9L9sA17EC4BRRT19Myu+Wondk
opa0KClqoafRTn1BF7Lze9HIHHT8NIxqIyUA7qyTvngwggt/Ax+mKSQZXoAFL+rl
ZiLGdp2UAnvBF6bUiL4Xq2dTLP5W5p4CDifikdjYfPjMllZwwhHAOOMav0AY82I=
=OeZh
-----END PGP SIGNATURE-----

--B4IIlcmfBL/1gGOG--

