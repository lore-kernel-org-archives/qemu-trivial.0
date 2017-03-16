Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1coRSO-000195-8s
	for mharc-qemu-trivial@gnu.org; Thu, 16 Mar 2017 05:12:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44634)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1coRSL-000168-JL
	for qemu-trivial@nongnu.org; Thu, 16 Mar 2017 05:12:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1coRSK-0003nl-La
	for qemu-trivial@nongnu.org; Thu, 16 Mar 2017 05:12:25 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:33638)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1coRSG-0003kT-7g; Thu, 16 Mar 2017 05:12:20 -0400
Received: by mail-pf0-x244.google.com with SMTP id v190so5124230pfb.0;
	Thu, 16 Mar 2017 02:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=FlmkTqTl4Iwq3fVuIO1fbKa9VPHbcztJh1aYTkuXQc8=;
	b=vD17yFHOvlbPb1ul6wDkq4BnW+sFN/W4IQZw9HGAjrmZZnYDObc7wRzAh/hJ23tXMo
	qXj0syAIft07cSGuUEIPg5CzA4v3QDkAwOJwqUN9zYtS1aKOUowonuQH0NXZ87VD6DPW
	k/Syt01J0codzDE5J2dJoO44n3Bpx+LIahCx8bv0TUPx2f2kgBCLKkf11GoNF/2q5Jxa
	b/RHiAvcuw0T7xLZB5QoQr2pc4zQJueqbxegXBS5VyrxwxIHxrR8gn6TmAUNbR9D1Ccv
	PbAsuufQwrEOxO8YMbK0NFrD6DmNUlpVPrcjPxhKEIcFdrzjWWyevyYsD6fJ26vOBctZ
	Wc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=FlmkTqTl4Iwq3fVuIO1fbKa9VPHbcztJh1aYTkuXQc8=;
	b=OKItxgSnxaIwUdAxTryfN5oluIb3vCrv1oFG7htl09KH2Miq5un8QvL6KEiVCsdLyg
	A1zCO11Hrj0Z9bdM+Ziz5BqumEpuBlWVlwdsTWpulstSermEaM50ZX/uE3A6bJciGHq3
	qZAaActBgSAYpWW8Mm9CcNe+yD4VlklTFD6dKX0EaMFMXBVdY3UKJsNDIhsrflOjJ4lm
	dvW4/JFnx4oDrBZEoTiviYSDOFrj33RzDUTjJizheZTNT2l6NEwbg2doSulhsvOkpAW0
	I0wfOOFDrAiZ++T7h+w7xH+89+LelfoB9UptbBvknfyK3F/4R24JJLqW8XEAJ+ebsrtX
	f/mA==
X-Gm-Message-State: AFeK/H31j2gfiz9TmZYGxLTpAnz9Yzy6A7zcnJbg+9a+kvSvcU81Q+pCOqQcPB2Dnrj43w==
X-Received: by 10.84.146.140 with SMTP id g12mr10734682pla.70.1489655538932;
	Thu, 16 Mar 2017 02:12:18 -0700 (PDT)
Received: from localhost (123203157175.ctinets.com. [123.203.157.175])
	by smtp.gmail.com with ESMTPSA id l3sm9147109pgn.10.2017.03.16.02.12.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Mar 2017 02:12:17 -0700 (PDT)
Date: Thu, 16 Mar 2017 17:12:14 +0800
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Saurav Sachidanand <sauravsachidanand@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, laurent@vivier.eu
Message-ID: <20170316091214.GC27579@stefanha-x1.localdomain>
References: <20170305025605.3824-1-sauravsachidanand@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xo44VMWPx7vlQ2+2"
Content-Disposition: inline
In-Reply-To: <20170305025605.3824-1-sauravsachidanand@gmail.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] util: Use
 g_malloc/g_free in envlist.c
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
X-List-Received-Date: Thu, 16 Mar 2017 09:12:26 -0000


--xo44VMWPx7vlQ2+2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 05, 2017 at 02:56:05AM +0000, Saurav Sachidanand wrote:
> diff --git a/util/envlist.c b/util/envlist.c
> index e86857e70a..a42eefa5fe 100644
> --- a/util/envlist.c
> +++ b/util/envlist.c
> @@ -17,16 +17,14 @@ static int envlist_parse(envlist_t *envlist,
>      const char *env, int (*)(envlist_t *, const char *));
>=20
>  /*
> - * Allocates new envlist and returns pointer to that or
> - * NULL in case of error.
> + * Allocates new envlist and returns pointer to it.
>   */
>  envlist_t *
>  envlist_create(void)
>  {
>  	envlist_t *envlist;
>=20
> -	if ((envlist =3D malloc(sizeof (*envlist))) =3D=3D NULL)
> -		return (NULL);
> +  envlist =3D g_malloc(sizeof(*envlist));

Please use tabs to indent in this file.  Normally QEMU coding style uses
4-space indentation but this file contains old code and it's easiest to
leave it undisturbed.

>=20
>  	QLIST_INIT(&envlist->el_entries);
>  	envlist->el_count =3D 0;
> @@ -49,9 +47,9 @@ envlist_free(envlist_t *envlist)
>  		QLIST_REMOVE(entry, ev_link);
>=20
>  		free((char *)entry->ev_var);
> -		free(entry);
> +    g_free(entry);
>  	}
> -	free(envlist);
> +  g_free(envlist);
>  }
>=20
>  /*
> @@ -156,15 +154,15 @@ envlist_setenv(envlist_t *envlist, const char *env)
>  	if (entry !=3D NULL) {
>  		QLIST_REMOVE(entry, ev_link);
>  		free((char *)entry->ev_var);
> -		free(entry);
> +    g_free(entry);
>  	} else {
>  		envlist->el_count++;
>  	}
>=20
> -	if ((entry =3D malloc(sizeof (*entry))) =3D=3D NULL)
> -		return (errno);
> -	if ((entry->ev_var =3D strdup(env)) =3D=3D NULL) {
> -		free(entry);
> +  entry =3D g_malloc(sizeof(*entry));
> +  entry->ev_var =3D strdup(env);

Could this be converted to g_strdup() in a separate patch?

--xo44VMWPx7vlQ2+2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJYylbuAAoJEJykq7OBq3PIYIMH/jFZM+oBZ0rbwFn1jWUrEZFT
aKCECaIUnw++7EA3k7Zsx4dY5xLR+ENA3PN/9h+63oQG0qgCxvUE/z5UiN+KGrTp
4iAf4gPv7GWPJO0hljfrjdLcMC/abQyl2z4rS7cXoIFVKqjbnxo9u0glb6ylI47x
zYrR4rWeJUJKmmb/y31d+k7b9VZP4CdpLCe9j7leZ9XlWUv5VD91UwrvMmP5B63x
6K+p5f7BOPG+t0zqt8wSO1UFJ3e4vvGrPfhCIfgXP/BJJ3pAohxuSH0ZpBE9tNmX
32z0E7HS7gGkJuGQfGYSm3JfnziSU5NwasmyADDruPlkA7an17CYbLa4hwbjf48=
=qC5H
-----END PGP SIGNATURE-----

--xo44VMWPx7vlQ2+2--

