Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h1THt-0006OF-ON
	for mharc-qemu-trivial@gnu.org; Wed, 06 Mar 2019 04:56:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48025)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1h1THq-0006Jr-Bz
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 04:56:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1h1THp-0002zG-J0
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 04:56:30 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:55376)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1h1THl-0002sh-FJ; Wed, 06 Mar 2019 04:56:25 -0500
Received: by mail-wm1-x343.google.com with SMTP id q187so5290739wme.5;
	Wed, 06 Mar 2019 01:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=PGdGGDFMfxYw0bILnH5rAYYplo12gMnBsBRFlV5JJ38=;
	b=cUOEVgMGRGtz4AlWCvPi6+IXjITcsPz+PxKRubVODQIBhxuQVQhlDTueqWVSMjG6ie
	KlSj2uGwamiXRVGV/ecDggWuPGsAlLjzgnRsQiIEXx1oDwlWBYzt/tN18WN0Oa6rO3qN
	SvFR/yWTtt6OiBWcXd1vLuf3aQ++WW+DAKt149mweEW8uRH0Cs8InK/35XAf2XkS0aWS
	09EOR8osFWMIFRR8A4Toi9NgHDK0zufwLHP8neCv6I+37kYLwVTrcumhzWtvIRbl33ju
	pPGuu/1Qaik0/h/F4wkWTghAY8A305rPhuuEYMGYLXRY5RD9Qn36QsjruhkTsy+8jidp
	w/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=PGdGGDFMfxYw0bILnH5rAYYplo12gMnBsBRFlV5JJ38=;
	b=FCI5Kr89nCMk8cQSQOaZNHQqnYCDDoSvCJw59yk2oYQrQ5D35FpTnINuhETb051J+k
	XOxCoxnOl/XYg0nsFXmAjfBsdMx54VVSH4O49Gl2LLarGdiGP/V+jKpvtQmZzpY6xzgh
	BVmIbwkbWwbLHZflcsh63OUCJhbX1yPQ7z7E22y7i6/QfETr6OMj+JTZHVwV14tls6oX
	TnVpzTdsSHbJpQRG35N+BHAtohGkaCe56lfA+kVQgV31RFcXykFWyDur3J2Pwv2jmo/f
	Tij78C2eNu0Mv8jw60tzaTiYHm3HPQ9w9y4KRNOn4er7juXF3UeImTvV731iBEec2gnA
	3UcA==
X-Gm-Message-State: APjAAAU7QbFSpnfPqMKNogYZ3BOuefPwJfOCZ2iyUgA12V4pujt8bkg1
	ArCgORB1O9x2AP4rzyyEaIE=
X-Google-Smtp-Source: APXvYqyHGJjPQt383qVOJUlJVAkZok418g/8U2qpyphNVEUIcqZcDkVNMCAj/Tmq0Q12Rtob1PyI7A==
X-Received: by 2002:a1c:b40b:: with SMTP id d11mr1934191wmf.80.1551866177744; 
	Wed, 06 Mar 2019 01:56:17 -0800 (PST)
Received: from localhost ([51.15.41.238])
	by smtp.gmail.com with ESMTPSA id b8sm676171wmj.35.2019.03.06.01.56.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 06 Mar 2019 01:56:16 -0800 (PST)
Date: Wed, 6 Mar 2019 09:56:15 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Riku Voipio <riku.voipio@iki.fi>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Julia Suvorova <jusual@mail.ru>, Peter Maydell <peter.maydell@linaro.org>,
	Aarushi Mehta <mehta.aaru20@gmail.com>
Message-ID: <20190306095615.GG22159@stefanha-x1.localdomain>
References: <5310bd5d152fa36c1828a7cbd19fc893739d1609.camel@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nqkreNcslJAfgyzk"
Content-Disposition: inline
In-Reply-To: <5310bd5d152fa36c1828a7cbd19fc893739d1609.camel@gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: Re: [Qemu-trivial] [PATCH v4] thunk: fix of malloc to g_new
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
X-List-Received-Date: Wed, 06 Mar 2019 09:56:32 -0000


--nqkreNcslJAfgyzk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 02, 2019 at 01:22:29AM +0530, Aarushi Mehta wrote:
> From 3c1cba63dc5070ab559a126e206557f27fbaea59 Mon Sep 17 00:00:00 2001
> From: Aarushi Mehta <mehta.aaru20@gmail.com>
> Date: Sat, 2 Mar 2019 01:11:42 +0530
> Subject: [PATCH v4] thunk: fix of malloc to g_new
>=20
> Note that since thunking occurs throughout the lifetime of the QEMU
> instance, there is no matching 'free' to correct.
>=20
> Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  thunk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Riku: Will you send a pull request?  Otherwise Peter might be willing to
merge this patch through his tree.

> diff --git a/thunk.c b/thunk.c
> index d5d8645cd4..17f3d320bb 100644
> --- a/thunk.c
> +++ b/thunk.c
> @@ -89,7 +89,7 @@ void thunk_register_struct(int id, const char *name, co=
nst argtype *types)
>      for(i =3D 0;i < 2; i++) {
>          offset =3D 0;
>          max_align =3D 1;
> -        se->field_offsets[i] =3D malloc(nb_fields * sizeof(int));
> +        se->field_offsets[i] =3D g_new(int, nb_fields);
>          type_ptr =3D se->field_types;
>          for(j =3D 0;j < nb_fields; j++) {
>              size =3D thunk_type_size(type_ptr, i);
> --=20
> 2.17.1
>=20
>=20

--nqkreNcslJAfgyzk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJcf5k/AAoJEJykq7OBq3PIIQgIAJ/fDj7VduzmgJ0GQy8mUTuN
4RiInNRekzR1TcaR2xwhajma2Wy9homjS0/GQCeNi+hCFk2eXAp/Rpd1RJBre8Km
a2QUxl1SFntz/PMF74HOp4KOa1ZF5J267Y2TRw7dtBKVXod2AqWiIgBkKVwiokwN
oogQifwL+TLUmentvQNiH526iPauUDAPV3m8zJB2N3LnmY8oKm5yDocRe2KukEy0
EC/0AUQKbtOTo3T1t4gnfb+Z4ghVnFsDnEIxvd+W5t/D06hON7357Ju4u1W7UBbN
veKPrbyG/244+jrbUE9FxM48yBxx4f3QAXb04erRyQ8FwdbJsEhMdH+CmUIBvgc=
=TX9f
-----END PGP SIGNATURE-----

--nqkreNcslJAfgyzk--

