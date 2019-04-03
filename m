Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hBeb1-0006pC-Lt
	for mharc-qemu-trivial@gnu.org; Wed, 03 Apr 2019 08:02:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60360)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1hBeaz-0006n1-0s
	for qemu-trivial@nongnu.org; Wed, 03 Apr 2019 08:02:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1hBeat-00024e-DH
	for qemu-trivial@nongnu.org; Wed, 03 Apr 2019 08:02:20 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:36966)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1hBeao-0001Mf-S7; Wed, 03 Apr 2019 08:02:12 -0400
Received: by mail-wr1-x443.google.com with SMTP id w10so20947489wrm.4;
	Wed, 03 Apr 2019 05:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Bz4q9pf2g3UY92azWQumNYC0/UFpbWukePte53FFC6k=;
	b=r19o1WJHhdVcB87ng+kmbPUMKbVt1Tz2YaUcpyx7+KrfvNqFvJunc0ImnMPaaSSehL
	mqfFCmJfw4tfmQGoUphD3hgfYTUZwnKUeaXf9n8N5GGEAzuJjzzoMxEbMUVw7pnA0Doq
	jYVdYMv56hlEuKyb2WbzQd6fSVrRqqT3ZmuHYMDneoZN3vQWWTX/hvNu6LrtG5LNzOOx
	oXG3LjT8TW713ohrH4Fpv0VA7PJ3R403ZSIKQ4COR1FQVesMBHsOG4qqDlwM8Utaz838
	5RHjHIYR122xN0pGU+vyODmONTclGtRKVoXZrH3zWzHN666yIuATNva9LhkqPwySt/vM
	GeFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Bz4q9pf2g3UY92azWQumNYC0/UFpbWukePte53FFC6k=;
	b=kkuXX00p5H6G1CCp/nmSD95ph0TOkaTKSzN+wwkRA35WmHAP3F5gU2NVPceU7mckuB
	kQ9vE8vrzRoRM/Ht/er5UliFs7kQsrmYgU4R5KuXsjhercEHGMuEepR4CSXBDEoAsuc+
	i/Ga/mbBy+HYjGKTEcQLi2sfAwpi4RVq4xDdfZQFKIDNqCPS9jWcuxZj3XQQyI97X7Bd
	BM3V1/0rLtT9Zpg2ubJHGLGslYmDTkuJLVaOI8m0DxbZWKV1VR5xMR0kht0yWSLhyZ+0
	zHZA7zlQfCGdVBVCA02TouHlv2f6YvHP841yfFfLcthrqO3lksQ+DCkgUiEPeL8UuoKz
	47Qg==
X-Gm-Message-State: APjAAAUfnRBlQ+JJj51Y1XLeLFg8F2fXSqvEiPylU2zH50B9cC1DtTeI
	IBaILlMZNP9Y4Si4I6qG36U=
X-Google-Smtp-Source: APXvYqymmXpn+uawjUcmyjQ/14u87/RQdoMC15C6zC73sSswxZLXczS4+KRcn4/W8ySiMhcnbm4X8w==
X-Received: by 2002:adf:dd0f:: with SMTP id a15mr50099056wrm.221.1554292921745;
	Wed, 03 Apr 2019 05:02:01 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	c189sm22052375wme.32.2019.04.03.05.02.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 03 Apr 2019 05:02:00 -0700 (PDT)
Date: Wed, 3 Apr 2019 13:01:59 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jules Irenge <jbi.octave@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20190403120159.GB32425@stefanha-x1.localdomain>
References: <20190401024406.10819-1-jbi.octave@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Yylu36WmvOXNoKYn"
Content-Disposition: inline
In-Reply-To: <20190401024406.10819-1-jbi.octave@gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 0/2] util/readline:
 errors clean-ups
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
X-List-Received-Date: Wed, 03 Apr 2019 12:02:22 -0000


--Yylu36WmvOXNoKYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 01, 2019 at 03:44:04AM +0100, Jules Irenge wrote:
> This v2 version combines two fix of errors into one  and replace tab
> indent by four spaces
>=20
> Jules Irenge (2):
>   util/readline: add a space to fix errors by checkpatch tool
>   util: readline: replace tab indent by four spaces to fix checkpatch
>     errors
>=20
>  util/readline.c | 132 ++++++++++++++++++++++++------------------------
>  1 file changed, 66 insertions(+), 66 deletions(-)

This file is unmaintained, I'll take this patch through my tree.

Thanks, applied to my block-next tree:
https://github.com/stefanha/qemu/commits/block-next

Stefan

--Yylu36WmvOXNoKYn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJcpKC3AAoJEJykq7OBq3PIo2cIALmRVg5tmU0DZSQZMsihVOSn
Imxgo03Z6rOZYtqbugKvV0HgOupBs4KSQULoj9z+leMcqv5GqdGAXr2iuiuIA1GM
JUO8WzD1l4Xi3SlYTLVkxLphKKy68h2VSz03lY0Xp+NX59UUD7s9zLLLs+O/9S7e
n4CAIHKp5uttlPFRU2dVFx3JVG2kxdeR79Xf5KsugJ+I2TCt6Nf8jLhjhF2K2oUJ
weLOeDwfq/Ay55IU2EEswgvIPoItOuaXC2E/GRsQTwcRaKZOEtvr6y7vV2ISbAoT
5tXywxrYa4fQxVp1t//+jXoCoo4M39Equ1DzIsj/3sK/VQHJukarGaGpn+BBen4=
=nG44
-----END PGP SIGNATURE-----

--Yylu36WmvOXNoKYn--

