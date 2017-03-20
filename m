Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cpyLZ-0004zQ-AB
	for mharc-qemu-trivial@gnu.org; Mon, 20 Mar 2017 10:31:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46076)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1cpyLU-0004wf-Kh
	for qemu-trivial@nongnu.org; Mon, 20 Mar 2017 10:31:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1cpyLO-00027W-RO
	for qemu-trivial@nongnu.org; Mon, 20 Mar 2017 10:31:40 -0400
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:38183)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1cpyLJ-00022h-LU; Mon, 20 Mar 2017 10:31:29 -0400
Received: by mail-wm0-x235.google.com with SMTP id t189so66118605wmt.1;
	Mon, 20 Mar 2017 07:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=i0rMQ299wDVzi2kVxVEwoh7e7TYvQVlybOkphIesxUM=;
	b=TgrWPYP+GDHKWZH5r+AAPN1o/k7Ji8jmMslLd2ThUMT4tLaTCz9tUs968PsesYCUXe
	hqFxnnuzZZKni61ZVTAkRjD5BEVc7DTeUJ3mkEoEfMGrq9AsrvcO/KA+yH/MXX7F8NJw
	WNCucF347+Efc/AciWutu46XGcvtupOU0F2nspBaHn45N5b9Tp6EBJn9zWl6us8MC5X2
	y041Oh2m9eZ1tKJjJLpGjGIsyO90apcn3fVJEDERd5vk9jujgtsy0zR7TVXzql0SxnvA
	efE8/YABBoEOr/3MMwu3Ex2gbIHCoID3npoTC0nu/8uWMeXmnWYNf1Y2TsdrZBkzUJUr
	veTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=i0rMQ299wDVzi2kVxVEwoh7e7TYvQVlybOkphIesxUM=;
	b=WjxCDVZEA50s39ZSSFJb321rfCNPeP2cazdq0m/N/u7IUOivnsod5cx304+xYb5ZB6
	6e1ivpwyktasH6+OGzezWkoptsjFO4WDT1xdYxhl505U4zSYp+9bgOoaSVQusg/1YqAK
	7dwR99MQCw6/m5bbXfnfYChOeKRlNhpeaSXt/VDo7nutGx0nyBwA8dRHXtRQA9BzPBqH
	uMN0CBGwKNNAETboaG7XjO4VjLDqb5fXzAvCPgq28rdIPXiyPZtgJ/0JWnfl3CicKCMa
	2z/dSrvQYvLr+oStkkD/nBoFQCNnnwf72ImruZG1H3HSXVIq2kKlqDT/tOj2UywqzYRY
	eMfw==
X-Gm-Message-State: AFeK/H00H8d9zUA5i6W2jRNfMAQtTimYURAjsYQBEWhpHRbFsjtCGF1PlDO1Pj9DSzgXIw==
X-Received: by 10.28.47.205 with SMTP id v196mr11242472wmv.20.1490020288469;
	Mon, 20 Mar 2017 07:31:28 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	b13sm13724239wmf.6.2017.03.20.07.31.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 20 Mar 2017 07:31:27 -0700 (PDT)
Date: Mon, 20 Mar 2017 14:31:25 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Saurav Sachidanand <sauravsachidanand@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, laurent@vivier.eu
Message-ID: <20170320143125.GB17887@stefanha-x1.localdomain>
References: <20170319162715.2260-1-sauravsachidanand@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OJWLbGElk4npXSe3"
Content-Disposition: inline
In-Reply-To: <20170319162715.2260-1-sauravsachidanand@gmail.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::235
Subject: Re: [Qemu-trivial] [PATCH v3] util: Use g_malloc/g_free in envlist.c
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
X-List-Received-Date: Mon, 20 Mar 2017 14:31:44 -0000


--OJWLbGElk4npXSe3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 19, 2017 at 04:27:15PM +0000, Saurav Sachidanand wrote:
> @@ -48,10 +46,10 @@ envlist_free(envlist_t *envlist)
>  		entry =3D envlist->el_entries.lh_first;
>  		QLIST_REMOVE(entry, ev_link);
> =20
> -		free((char *)entry->ev_var);
> +		g_free(entry->ev_var);

You need to keep the const casts to silence the compiler.  Here, ...

> @@ -155,18 +152,14 @@ envlist_setenv(envlist_t *envlist, const char *env)
> =20
>  	if (entry !=3D NULL) {
>  		QLIST_REMOVE(entry, ev_link);
> -		free((char *)entry->ev_var);
> +		g_free(entry->ev_var);

here, ...

> @@ -201,8 +194,8 @@ envlist_unsetenv(envlist_t *envlist, const char *env)
>  	}
>  	if (entry !=3D NULL) {
>  		QLIST_REMOVE(entry, ev_link);
> -		free((char *)entry->ev_var);
> +		g_free(entry->ev_var);

and here.

The problem is that const char * is not supposed to be freed.  The type
would need to be non-const.  Most of the code does treat the string as
const, so it's nice to have it except for the final free().

--OJWLbGElk4npXSe3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJYz+e9AAoJEJykq7OBq3PIqjkH+wZ8LbauT/uFs5gEgvRezIOi
WNilawJjEJW0j4GqLhZ+brL0qypAx7ZKH8u8ca2rdQWUMhpBdod++Zd+E31l3bR3
0xfdmc65Sx66vzf0HxbePPXSGcYO7/M5zGv1UqZ6kahO0JQZXIjKKW1UiMtakSKU
f/xc29YVkVDMqvVrSd6pVWO5ibqHlVXr1U0q6vrfFL695kNUUvPP7QOCronLYqQI
TEGMdVR1Mn8Jo4V3aii+0W+du59bDh1drjUBb9f4ToR73o1h49DsPTa7kzXyHQNS
wl2aa3Tl5gSm3PDcr42FSph43mtDVYbA3vxuZllChETawEL4c3lPFXSg3LTviy4=
=Exep
-----END PGP SIGNATURE-----

--OJWLbGElk4npXSe3--

