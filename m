Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f2m4c-00037z-8Z
	for mharc-qemu-trivial@gnu.org; Sun, 01 Apr 2018 19:07:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36870)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f2m4Z-000364-Kz
	for qemu-trivial@nongnu.org; Sun, 01 Apr 2018 19:07:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f2m4Y-0004fY-G5
	for qemu-trivial@nongnu.org; Sun, 01 Apr 2018 19:07:39 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:34846)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f2m4R-0004Xg-JX; Sun, 01 Apr 2018 19:07:31 -0400
Received: by mail-qt0-x242.google.com with SMTP id s2so14059347qti.2;
	Sun, 01 Apr 2018 16:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=9jbb4R5mDu4dplLlwXp0BFPzARqrvFTutIzsXeF3Cw4=;
	b=Ylp0OShijBw244wF+8g7JWlDcBRDtHUeCnD+V+FH+x7cvLIvIqmA69AwUM100sqa3Z
	is2ImlrT8WwVX0R6yn4aRr/DFSKd3rWmje7udA8U/STC/+TSG9HQr940I82AwGgfbm68
	Aw1lJQ2GswbaJhkUUmioPvtsmZDKE5FNbvcRpGUtfwxrpR1yg9umq5Oi+33dq88OTsEa
	C3R5+IfLoaEQ1OxcMqeoDOKFcI4T6Q/d/tsNlK+jQA6buIfdEdzJbmvwva83e3y2vFzB
	tul2xMl4ll1bR9LINKG19RpoyqoysK4WLWHXyLn+dP3MSazqszUMopQYu/74IsHhG2WE
	exJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=9jbb4R5mDu4dplLlwXp0BFPzARqrvFTutIzsXeF3Cw4=;
	b=dyS6+bblkT760Mxu9WRz33E2ORuJkgGQfYuVqubMDBS7toNrtsUcep2qpdgeNIjvOt
	qwZEOFOPQcCdD+lCDGoc9dwQRErqmmXqhLhSKUwu66pYKbI7ChvMl9DkloHDu5iU3xpg
	83W2rcscXZqmAGTI0kQX7p3f2glF/3Y8SXJX2qx/RYmQnd2U5ZsJYy/2qkr9BFgOWvRe
	9xhh1VJHKlr2sBREs1g2hPMBWnBcCBgSU30Iwg0sBvjyKuMUWn9y32ahkDfNtuySkmKt
	rqv8Bkay1S9L9aeU26BJOBhK0Jm9JYsqUDpx5J/sXaNajASU7LVUipy+uQHvflt5Mdqe
	ecxw==
X-Gm-Message-State: ALQs6tCGsRdAx0XahY58mpar4OqO8UqyRJe2wmc4XdvcNmJcWXGkH3eq
	1OV7RL9Dlxk1hi8/JOk2/rn+3qCC
X-Google-Smtp-Source: AIpwx4/UNunxPFUUnfR6oBQC7edglOA2WWZiE0QQInEvOs9/qejFHMLlcA1zrXvJIZsxFIRE+X6cXw==
X-Received: by 10.200.112.214 with SMTP id g22mr11094029qtp.95.1522624050807; 
	Sun, 01 Apr 2018 16:07:30 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id f13sm9637650qtj.6.2018.04.01.16.07.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 01 Apr 2018 16:07:29 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Jan Kiszka <jan.kiszka@web.de>, qemu-trivial <qemu-trivial@nongnu.org>
Cc: qemu-devel <qemu-devel@nongnu.org>
References: <0dd4c8f5-d60e-e564-652f-cd0101f6ee68@web.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <bf67848e-d6ea-1c23-0350-ba16e9674905@amsat.org>
Date: Sun, 1 Apr 2018 20:07:21 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <0dd4c8f5-d60e-e564-652f-cd0101f6ee68@web.de>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="Ibp6JaQbChb3lSPiKgTt6iRuLsFRmFOkm"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] build: Silence dtc
 directory creation
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
X-List-Received-Date: Sun, 01 Apr 2018 23:07:40 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Ibp6JaQbChb3lSPiKgTt6iRuLsFRmFOkm
Content-Type: multipart/mixed; boundary="0TqnPxc3FasZQV0YzRObHDTF6fi2jL0vq";
 protected-headers="v1"
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Jan Kiszka <jan.kiszka@web.de>, qemu-trivial <qemu-trivial@nongnu.org>
Cc: qemu-devel <qemu-devel@nongnu.org>
Message-ID: <bf67848e-d6ea-1c23-0350-ba16e9674905@amsat.org>
Subject: Re: [Qemu-devel] [PATCH] build: Silence dtc directory creation
References: <0dd4c8f5-d60e-e564-652f-cd0101f6ee68@web.de>
In-Reply-To: <0dd4c8f5-d60e-e564-652f-cd0101f6ee68@web.de>

--0TqnPxc3FasZQV0YzRObHDTF6fi2jL0vq
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 04/01/2018 08:23 AM, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
>=20
> Align with other mkdir calls.
>=20
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Makefile b/Makefile
> index 727ef118f3..fc6f21001f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -485,7 +485,7 @@ subdir-dtc: .git-submodule-status dtc/libfdt dtc/te=
sts
>  	$(call quiet-command,$(MAKE) $(DTC_MAKE_ARGS) CPPFLAGS=3D"$(DTC_CPPFL=
AGS)" CFLAGS=3D"$(DTC_CFLAGS)" LDFLAGS=3D"$(LDFLAGS)" ARFLAGS=3D"$(ARFLAG=
S)" CC=3D"$(CC)" AR=3D"$(AR)" LD=3D"$(LD)" $(SUBDIR_MAKEFLAGS) libfdt/lib=
fdt.a,)
> =20
>  dtc/%: .git-submodule-status
> -	mkdir -p $@
> +	@mkdir -p $@
> =20
>  # Overriding CFLAGS causes us to lose defines added in the sub-makefil=
e.
>  # Not overriding CFLAGS leads to mis-matches between compilation modes=
=2E
>=20


--0TqnPxc3FasZQV0YzRObHDTF6fi2jL0vq--

--Ibp6JaQbChb3lSPiKgTt6iRuLsFRmFOkm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE+qvnXhKRciHc/Wuy4+MsLN6twN4FAlrBZi0ACgkQ4+MsLN6t
wN5NRw/7BL+zqobas2+aA4X5OQOT3A6p23YS0LnJjBy63I63Rhyr1QwRaGaepai/
ji24OYdGhP2nkASW270AjMWAN6XbI/0BVCOIaPBC4hQFBWFn09/sRhiFEtk7l4Gu
RZ7DmBSpzM8F0BjnB3xr7RnUmdzOwmzVMHz/VEKZo58yf+PjiZrrsBfTm7sbBqYu
XcAG8foLYVVZRrFs7OlIN8MF/qYuQ4oNh5SqSFDA6vVdt7shVBFkXiUvscDWU9Zv
AVOBr77//NOoRhWvstenfeG1ZKMFMZJ8WoNea8TZFGX281qOUWwau31+B2ceSgtP
RMiK5kgOFEDVk++GMbLMo4mfBBUMQBftFpDW8OobIBNQ2+DOiSCwr35Eu1/X3vRW
aAS8mEfM4Ldj+KsGU0HRZodtZ1XWMoIk7NmHO9E68tAK6ZNg7Ao6LEHxl5XQLN6j
BvchYY4S6dT8OsmlSnip8AvrCO3/v3s5ebyRl4XW4MTvNT4FzIgQpwqmUsS/KT8j
NlGpX5xzl/xwHOI4GIMVZ+Wj4LZLVnyyOMMdZfscaYoeXpWAJMoOF5FpHUSdQsAx
HTreE7CKL+ml/y2Blt+OZB8Lz+VJdMQEonn67PibS/Ur2GMwD1VRk9kQ5sVgPraz
vSGSV4vfIG8lHSvudAM4kc9QfTok+CBipnJ8iZDPszz19dClRfs=
=RzaJ
-----END PGP SIGNATURE-----

--Ibp6JaQbChb3lSPiKgTt6iRuLsFRmFOkm--

