Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gfVQa-0002A7-Ar
	for mharc-qemu-trivial@gnu.org; Fri, 04 Jan 2019 14:46:44 -0500
Received: from eggs.gnu.org ([208.118.235.92]:54142)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gfVQX-00028I-D5
	for qemu-trivial@nongnu.org; Fri, 04 Jan 2019 14:46:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gfVQS-0008Tm-MN
	for qemu-trivial@nongnu.org; Fri, 04 Jan 2019 14:46:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59006)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gfVQD-0008Aa-JJ; Fri, 04 Jan 2019 14:46:23 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 68DB837E79;
	Fri,  4 Jan 2019 19:46:12 +0000 (UTC)
Received: from [10.3.116.216] (ovpn-116-216.phx2.redhat.com [10.3.116.216])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB0E3100194A;
	Fri,  4 Jan 2019 19:45:59 +0000 (UTC)
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
	<20190104181208.7809-2-philmd@redhat.com>
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
Message-ID: <8227c1e9-4a27-d01d-b9e4-fd52560b51b3@redhat.com>
Date: Fri, 4 Jan 2019 13:45:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20190104181208.7809-2-philmd@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="6VHf3FOFsqmXTuVguluWI6monROqnxeoL"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 04 Jan 2019 19:46:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 1/3] util/cutils: Move
 size_to_str() from "qemu-common.h" to "cutils.h"
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
X-List-Received-Date: Fri, 04 Jan 2019 19:46:43 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6VHf3FOFsqmXTuVguluWI6monROqnxeoL
Content-Type: multipart/mixed; boundary="om0yBsSQJ2L1PJttN0HtyEoSi0P7Z0DdL";
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
Message-ID: <8227c1e9-4a27-d01d-b9e4-fd52560b51b3@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v2 1/3] util/cutils: Move size_to_str() from
 "qemu-common.h" to "cutils.h"
References: <20190104181208.7809-1-philmd@redhat.com>
 <20190104181208.7809-2-philmd@redhat.com>
In-Reply-To: <20190104181208.7809-2-philmd@redhat.com>

--om0yBsSQJ2L1PJttN0HtyEoSi0P7Z0DdL
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 1/4/19 12:12 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> The size_to_str() function doesn't need to be in a generic header.
>=20
> It makes also sens to find this function in the same header than

s/sens/sense/ s/than/as/

> the opposite string to size functions: qemu_strtosz*().
> Note than this function is already implemented in util/cutils.c.

s/than/that/

>=20
> Since we introduce a new function in a header, we document it,
> using the previous comment from the source file.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--om0yBsSQJ2L1PJttN0HtyEoSi0P7Z0DdL--

--6VHf3FOFsqmXTuVguluWI6monROqnxeoL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEY3OaSlgimHGqKqRv3g5py3orov0FAlwvt/cACgkQ3g5py3or
ov3EVgf/TXmVsEb/9wAm7M/SxJRe7BjiEDY/q8GAQ0ST3pV78xqkwf1kZhhC3ScT
dCFvSyFDmpLrSb1V1dkGZDS9WhCLCS327FVvIy346lUmYH5eegEMEDxxVlg2xHQj
LofuIJmWoisr5d8Ff9S37vg4JeN54YAhmXmVwY/EXlPF3lTqRWm4AKnIbQ6m4buu
hW9FkgdYyFefGsmpNcSRYiq0Ous/GJqM/PCN8CMK20k5Xahs2cN6P16g1sEtwMEb
6CaylRw2DdOM0Unw1+ClNt5H8U46rKM4IMhB53mr3pKqAYh5gR5FCtri3eIyhNzp
+WRzkJhGrcdTqbSSnRSA4Xn9jmgQ3A==
=45Vt
-----END PGP SIGNATURE-----

--6VHf3FOFsqmXTuVguluWI6monROqnxeoL--

