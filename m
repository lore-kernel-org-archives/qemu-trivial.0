Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gfVuV-00047y-KH
	for mharc-qemu-trivial@gnu.org; Fri, 04 Jan 2019 15:17:39 -0500
Received: from eggs.gnu.org ([208.118.235.92]:34646)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gfVuP-00045V-Sg
	for qemu-trivial@nongnu.org; Fri, 04 Jan 2019 15:17:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gfVuP-0005yf-8J
	for qemu-trivial@nongnu.org; Fri, 04 Jan 2019 15:17:33 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39854)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gfVuG-0005Wl-Pj; Fri, 04 Jan 2019 15:17:25 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7BB654E90E;
	Fri,  4 Jan 2019 20:17:23 +0000 (UTC)
Received: from [10.3.116.216] (ovpn-116-216.phx2.redhat.com [10.3.116.216])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C5095C1A1;
	Fri,  4 Jan 2019 20:17:15 +0000 (UTC)
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
	<20190104181208.7809-4-philmd@redhat.com>
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
Message-ID: <349cd87b-0526-30b8-d9cd-0eee537ab5a4@redhat.com>
Date: Fri, 4 Jan 2019 14:17:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20190104181208.7809-4-philmd@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="ovPHYZvWjj0WMrppWv1Y6vY58dY7WfNiU"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 04 Jan 2019 20:17:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 3/3] util/cutils: Move
 function documentations to the header
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
X-List-Received-Date: Fri, 04 Jan 2019 20:17:38 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ovPHYZvWjj0WMrppWv1Y6vY58dY7WfNiU
Content-Type: multipart/mixed; boundary="hLXyelTPJUEd7FS2v354URSGA5z0CvD0D";
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
Message-ID: <349cd87b-0526-30b8-d9cd-0eee537ab5a4@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v2 3/3] util/cutils: Move function
 documentations to the header
References: <20190104181208.7809-1-philmd@redhat.com>
 <20190104181208.7809-4-philmd@redhat.com>
In-Reply-To: <20190104181208.7809-4-philmd@redhat.com>

--hLXyelTPJUEd7FS2v354URSGA5z0CvD0D
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 1/4/19 12:12 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Many functions have documentation before the implementation in
> cutils.c. Since we expect documentation around the prototype
> declaration in headers, move the comments in cutils.h.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  include/qemu/cutils.h | 224 ++++++++++++++++++++++++++++++++++++++++++=

>  util/cutils.c         | 185 ----------------------------------
>  2 files changed, 224 insertions(+), 185 deletions(-)

I find documentation in .c files slightly easier to use (you can then
read the code right below to see if the documentation is still
accurate); but as we had an inconsistent mix, I'm also okay with your
patch consolidating all the documentation to one of the two files,
rather than the bad mix of half-and-half.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--hLXyelTPJUEd7FS2v354URSGA5z0CvD0D--

--ovPHYZvWjj0WMrppWv1Y6vY58dY7WfNiU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEY3OaSlgimHGqKqRv3g5py3orov0FAlwvv0oACgkQ3g5py3or
ov1/8gf8DOeTEAae/7Z0+naf9nIxiQr4KaMa7lEAD5J1lPumjYmcjLY8Xm5r6g2g
vVNilsHfenfdoVgk25op5eS0j03/FRu3aY++iVaVYRmERvL+sCPcjFq5zaAePg+d
GFByjBH9c9qrtrijN+nwBjKGnCj2IR7Ik18lNKSx30gzjsT7UJMQ6DLKVGTn4D4p
zDKBeGvz33NGOQ/iBFSYmLBsewyJvWAw6s6MibeJlJT6S1sxK+eLbcOw0lk6UE9M
780zYBMXtS3mtGM29GokFhI72RSzp7VlvMwF3vQtMnAVZtvS/Ac2dauVrsyskCWf
KyNN5Xwv3CDiM01nkAobDY5rpgUBjA==
=w43k
-----END PGP SIGNATURE-----

--ovPHYZvWjj0WMrppWv1Y6vY58dY7WfNiU--

