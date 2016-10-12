Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1buMPy-0004TB-Oe
	for mharc-qemu-trivial@gnu.org; Wed, 12 Oct 2016 12:30:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42703)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <th.huth@gmail.com>) id 1buMPw-0004Qh-ND
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 12:30:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <th.huth@gmail.com>) id 1buMPs-00029b-GO
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 12:30:07 -0400
Received: from mail-lf0-f67.google.com ([209.85.215.67]:34020)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <th.huth@gmail.com>)
	id 1buMPs-00029T-95; Wed, 12 Oct 2016 12:30:04 -0400
Received: by mail-lf0-f67.google.com with SMTP id x23so2213162lfi.1;
	Wed, 12 Oct 2016 09:30:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=kdixO9rPHCfAmT8tN3+NLMOLiZENLRquYWAREvPINk0=;
	b=BEDYtMhKi6aA10Div8WYKMFbcOV3K5nkrpmgbE6H1xtZAY8br/5gXUREqldOH4o8lN
	LxSlGocbh3GxEZyF++MQqFGWgM8WFuDOjGsuw/xy49erBs6t7r6a7ztrUjGP757ovPgo
	8RxHdOl4+0PtSwQEu7y+BjIsGgieVIfITkht6t6sn+FigoU+vMtM5HHJI2Wfnv/AYRAE
	ANiK0mB+QCkAtOsSM0bXFY7usig14hQElpaS+14cQagq4AnYZK+fdI1LbwnNDQYL4ElU
	b521wtYNhFNTfp/AUsB7RUdHogaDKLpRlE2lN+C/FhBaeehBOuwL8pG+gNuxGzQf5Dzu
	63Hw==
X-Gm-Message-State: AA6/9RlvD6ncwUQ8KCOfIqycqm/RVqbsyD09WiKXef2KMSaeWGpraxhmAm2U+KAuJ5F6bA==
X-Received: by 10.25.19.158 with SMTP id 30mr2322156lft.180.1476289803048;
	Wed, 12 Oct 2016 09:30:03 -0700 (PDT)
Received: from [192.168.2.48] (p54828555.dip0.t-ipconnect.de. [84.130.133.85])
	by smtp.gmail.com with ESMTPSA id
	102sm2459929lft.33.2016.10.12.09.30.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Oct 2016 09:30:02 -0700 (PDT)
To: Michael Walle <michael@walle.cc>, qemu-devel@nongnu.org
References: <1476289396-10780-1-git-send-email-michael@walle.cc>
Cc: qemu-trivial@nongnu.org, Thomas Huth <huth@tuxfamily.org>
From: Thomas Huth <huth@tuxfamily.org>
Message-ID: <e1b3c273-b06f-7f6a-53ff-820089bea48c@tuxfamily.org>
Date: Wed, 12 Oct 2016 18:29:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1476289396-10780-1-git-send-email-michael@walle.cc>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="SONlPL59bhmCRUd36tnBrdOWoJBHrLxMq"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.67
Subject: Re: [Qemu-trivial] [PATCH] target-lm32: fix style issue
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
X-List-Received-Date: Wed, 12 Oct 2016 16:30:09 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--SONlPL59bhmCRUd36tnBrdOWoJBHrLxMq
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12.10.2016 18:23, Michael Walle wrote:
> Both branches of the ternary operator have the same expressions. Drop t=
he
> operator.
>=20
> This fixes: https://bugs.launchpad.net/qemu/+bug/1414293
>=20
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  target-lm32/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/target-lm32/translate.c b/target-lm32/translate.c
> index 2d8caeb..534c17c 100644
> --- a/target-lm32/translate.c
> +++ b/target-lm32/translate.c
> @@ -343,7 +343,7 @@ static void dec_calli(DisasContext *dc)
>  static inline void gen_compare(DisasContext *dc, int cond)
>  {
>      int rX =3D (dc->format =3D=3D OP_FMT_RR) ? dc->r2 : dc->r1;
> -    int rY =3D (dc->format =3D=3D OP_FMT_RR) ? dc->r0 : dc->r0;
> +    int rY =3D dc->r0;
>      int rZ =3D (dc->format =3D=3D OP_FMT_RR) ? dc->r1 : -1;
>      int i;

Reviewed-by: Thomas Huth <huth@tuxfamily.org>




--SONlPL59bhmCRUd36tnBrdOWoJBHrLxMq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJX/mUIAAoJEC7Z13T+cC21feoP/iS6L5LMdJr5XLx4yezBSMfJ
wbZtav7PBNe6EMqWO8vFifGYw2bMiFu7h5cZ0bqQt9+c85XYWk82WfoeyAenmjS/
qlYwEVI4hITbgr7i2C8/uU9DEFLxefG550E+6XdIvP+/BQTdn3QTRwimhgLT1P46
YWcfcYQgTNF80zN7g6JSu/R1SyaGAlF1v5OJED8vv17UEbNIC2Ym2Mx/P01Nv6dj
TIRI2/NLQZMlRJuDEaS1IZPLDdPp46VlgPLsWAuUAHqgNc6MUXrqQgmd/3ylZgm6
8OjPx/49najPw5h5j82AQ98B3b679ETQPMwNH/LAc24GK6MNe+DXxUjH5ERd5eQU
KnTRSNefJZVB4V1Gt8L1WORbkSgGV6n3G+qTCC3RKZiPb1z5mhVvOZj4w82H87wA
pX3IvLU4Q9PyakElVO37WNxgHsQP4id2TSy2/6zZTD0IegWxkkCbGd0v/uzadL9A
o7pyKOpiS4kiBidYXfZSZa6ZWjHmcm47SF+hvRW38Fr0OnRkeCsyRcOhpXSnF6v2
gcLnJSBbNgZ8r2pKCMN5yy5fO+0YJKINlrkLcK7FERaO/yXJ9uBneXD2kqZIogxm
E+MaJKKAgRo7TsUogHpXpThW50IfkS3nWpvOR1NmHytuAgbC2cw6ilsXwiZd39l9
cmtZY2VX7LkH5Mv3ZXLc
=RrGA
-----END PGP SIGNATURE-----

--SONlPL59bhmCRUd36tnBrdOWoJBHrLxMq--

