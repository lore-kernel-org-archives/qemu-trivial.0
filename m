Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gfVtA-00030c-FU
	for mharc-qemu-trivial@gnu.org; Fri, 04 Jan 2019 15:16:16 -0500
Received: from eggs.gnu.org ([208.118.235.92]:34180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gfVt6-0002v3-33
	for qemu-trivial@nongnu.org; Fri, 04 Jan 2019 15:16:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gfVt5-0004UV-8b
	for qemu-trivial@nongnu.org; Fri, 04 Jan 2019 15:16:12 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36002)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gfVsw-0004PA-NI; Fri, 04 Jan 2019 15:16:02 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F089EC058CA9;
	Fri,  4 Jan 2019 20:16:00 +0000 (UTC)
Received: from [10.3.116.216] (ovpn-116-216.phx2.redhat.com [10.3.116.216])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE414600D6;
	Fri,  4 Jan 2019 20:15:50 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
	David Hildenbrand <david@redhat.com>, qemu-trivial@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>, 
	Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org, 
	qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella
	<sgarzare@redhat.com>, Richard Henderson <rth@twiddle.net>
References: <20190104181208.7809-1-philmd@redhat.com>
	<20190104181208.7809-3-philmd@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=eblake@redhat.com; keydata=
	xsBNBFwju6wBCACdvc9zV75/DAB3FB2Md6oQEz2EtWwVBr+M2wF2gp3Z3jrKeixTNnlM34Ja
	5I2kcXRuxiuTcSBnkEpCZAjOwPyKD5HM1TSMgjgMCLejs/Pk06Tk6qTZr6Gk+lP9iTK5gkoE
	MT2uBk3Za9zWaFUjwnWrRuLtkn9t3pMukkzm4JBsUb8+fK+ExO6inhm8FjoK5qldb8OV4RIV
	3jH/d3aDnXpZTqKZI/RCB5WeE0q7hNEnZite2FZ/k3KBaNUr6wrsrElegZecavvRqa+07Y21
	O2q7RH+muvZ41SkD98Mv1JNoMFKFBqAp+0+f7TRtIwCrliRzG8DZsPiV32hzVraq9dNfABEB
	AAHNHkVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPsLAlAQTAQgAPhYhBGNzmkpYIphx
	qiqkb94Oact6K6L9BQJcI7vJAhsDBQkB4TOABQsJCAcDBRUKCQgLBRYCAwEAAh4BAheAAAoJ
	EN4Oact6K6L9Hz0IAJEcgZZ9+BhVz0+Y3nmXAAbpziCC05+UzOG+HsJTnEL/u1pMDdl28ANa
	oQ4r/GC0YTZOgHioppdBhHm6wGpF818HieSwSSpytPVnJqusAmh9kIQgmbkjSymFkZrdQYVg
	JA0fp7hgpb2RDWjD6UsVDusf+45ZYM0bZXDQF4cX1GWmnHtyW9mpFgctIDwCFZp5QlFr9Ifp
	Yki5QHnFNrQUPOEucqPv3SN8L0tPXnsVGYfBpb/fuDNhFz5C6IaBjwLHDThSDjz/xhirVgpE
	bFxY41t4ZWy3r8JU8CIhS02YF9Ud09a+6VydRXW0xCVQna6dCesVRreOS8GZlt84V/rcK3XO
	wE0EXCO7yQEIAKt1DabiGlGLeVSXN0qsqgaq5xc1UoEVVhOKYs7itm2bju7eJp2387U20voh
	8tlqBD50fL/m7wtgtTCNm6oL8wxyWRdqGQLfL5mvJJloMb7hdU8SMrMFI/QxetxsgBgvtljt
	Fy/DfoC3QgxT/aGT+cJnqwi+2MnjHBSLXrIKhghVC2Yo4ONWj5W/7rVa8QdAJJGPH/Xmi8Wz
	CpGAGs5f/07E+ILetaqwHevLOblxVTxPy9KItUeqS9RnICFqonUmSZn2CthEx6nMGGRYOxkm
	QoSXn7upezPYTBMQln5dyORwf3eJHJaNHm+q1bA3DrNtK1otwh1pX6aFYC6VeTIspG0AEQEA
	AcLAfAQYAQgAJhYhBGNzmkpYIphxqiqkb94Oact6K6L9BQJcI7vJAhsMBQkB4TOAAAoJEN4O
	act6K6L9A2YH/AmcA/aCZZcLzpPlXK1Su33r3eIllVxxPxcQVm1TXapSzyIvFf/vw9rsqacQ
	ZVhyvcRr8LUlgTbu2idI7yZ9lCtp8lFlTp8t5SPqKlC3JTDkILTz3LrKwzyythydzFAF6RIx
	58N6taius+7Xow0E8eQVvj7spc4tSAgHDLbB5aqAw2YiaE0ccTos35Yam/mf6391KGXAp3rr
	CTV4mvrOQjWqQwd+qdUGHRQTl+JmAKT3EWZkqLpmvGknsYSN+qtwOwBJQx1xMrDaLMJjRhur
	yDNGgb1fUeXFoaCmi+Xb/jO1/5oo1cfeiCorcAEhQppR1B8RFRNVDUYGHIHRfB7lpOU=
Organization: Red Hat, Inc.
Message-ID: <791f6b8e-c488-7d72-956f-91e9748c74b8@redhat.com>
Date: Fri, 4 Jan 2019 14:15:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20190104181208.7809-3-philmd@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="U6mMksGBEI6Y1Yf8MkJsA8179rEGiP5wO"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 04 Jan 2019 20:16:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 2/3] util/cutils: Move
 ctype macros to "cutils.h"
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
X-List-Received-Date: Fri, 04 Jan 2019 20:16:15 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--U6mMksGBEI6Y1Yf8MkJsA8179rEGiP5wO
Content-Type: multipart/mixed; boundary="hEhYHS9yuPJ042oxmMfnYYkTWfbKzFujC";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-trivial@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella
 <sgarzare@redhat.com>, Richard Henderson <rth@twiddle.net>
Message-ID: <791f6b8e-c488-7d72-956f-91e9748c74b8@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/3] util/cutils: Move ctype macros to
 "cutils.h"
References: <20190104181208.7809-1-philmd@redhat.com>
 <20190104181208.7809-3-philmd@redhat.com>
In-Reply-To: <20190104181208.7809-3-philmd@redhat.com>

--hEhYHS9yuPJ042oxmMfnYYkTWfbKzFujC
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 1/4/19 12:12 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Introduced in cd390083ad1, these macros don't need to be in
> a generic header.
> Add documentation to justify their use.
>=20
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---

> +++ b/include/qemu/cutils.h
> @@ -3,6 +3,31 @@
> =20
>  #include "qemu/fprintf-fn.h"
> =20
> +/**
> + * unsigned ctype macros:
> + *
> + * The standards require that the argument for these functions
> + * is either EOF or a value that is representable in the type
> + * unsigned char. If the argument is of type char, it must be
> + * cast to unsigned char. This is what these macros do,
> + * avoiding 'signed to unsigned' conversion warnings.

I would also mention that these macros are ONLY intended for use with
char arguments (as they CANNOT handle EOF); if you are doing int c =3D
getchar() or similar, you still want to call the original ctype macro.

Otherwise, the move and added comments makes sense to me.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--hEhYHS9yuPJ042oxmMfnYYkTWfbKzFujC--

--U6mMksGBEI6Y1Yf8MkJsA8179rEGiP5wO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEY3OaSlgimHGqKqRv3g5py3orov0FAlwvvvYACgkQ3g5py3or
ov2lOAf+PRxOQGnw4rAIKrcvzydUFWGyTLA1OaZtrGLjtgMQdDviQK4sP35+Or0i
TKS5PUHLmWtOY2TP+ABlaF8elTfL7p5XX8QAMPrPhQvp3uk+SLCC1GMdfKhNKJc4
s2l8zZh+y6qMCJWzQlsYavle1BdLvGcZWLLC+hQJfwghPODxnQgk/bkzJKvYjQr4
NVQ1kSigVcy4j3yOOF4aE2W14ikvbr8nDRVeSrfrD4/p34tYutBlKV2YLCMO9PN2
zS2P1JRYcnQVWpgAqSbkaJOplG+G0u+4av0Bf50reNpOoYyIghJ8qE4TftODBq9j
J3AB1gyTMf/cqTp/DLkLW6VAdkHhhw==
=vrPr
-----END PGP SIGNATURE-----

--U6mMksGBEI6Y1Yf8MkJsA8179rEGiP5wO--

