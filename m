Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dahq8-00073r-2p
	for mharc-qemu-trivial@gnu.org; Thu, 27 Jul 2017 08:24:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49041)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dahq5-00071m-7W
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 08:24:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dahq4-0000Cb-9V
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 08:24:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57722)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dahpz-0008VX-89; Thu, 27 Jul 2017 08:24:19 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3A17E2E4551;
	Thu, 27 Jul 2017 12:24:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 3A17E2E4551
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eblake@redhat.com
Received: from [10.10.121.48] (ovpn-121-48.rdu2.redhat.com [10.10.121.48])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4264C18222;
	Thu, 27 Jul 2017 12:24:17 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>
References: <20170727120210.6943-1-crosa@redhat.com>
	<20170727120210.6943-2-crosa@redhat.com>
	<CAFEAcA-CzG=JYjajJqMRL+pcMC2_06HTm1_xhD=ca=AReXHmTA@mail.gmail.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <e6978405-6492-1124-d6e4-4a6a5b124c48@redhat.com>
Date: Thu, 27 Jul 2017 07:24:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-CzG=JYjajJqMRL+pcMC2_06HTm1_xhD=ca=AReXHmTA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="W8TFJp0V4wfWb40vtj4a1n2MMMKuMDquC"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 27 Jul 2017 12:24:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/5] configure: remove
 duplicate single quotes on config.log header
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
X-List-Received-Date: Thu, 27 Jul 2017 12:24:26 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--W8TFJp0V4wfWb40vtj4a1n2MMMKuMDquC
Content-Type: multipart/mixed; boundary="L7mBCEU4pbuRNoQ8cPJ8O2TX1t6dgmTAQ";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Message-ID: <e6978405-6492-1124-d6e4-4a6a5b124c48@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 1/5] configure: remove duplicate single
 quotes on config.log header
References: <20170727120210.6943-1-crosa@redhat.com>
 <20170727120210.6943-2-crosa@redhat.com>
 <CAFEAcA-CzG=JYjajJqMRL+pcMC2_06HTm1_xhD=ca=AReXHmTA@mail.gmail.com>
In-Reply-To: <CAFEAcA-CzG=JYjajJqMRL+pcMC2_06HTm1_xhD=ca=AReXHmTA@mail.gmail.com>

--L7mBCEU4pbuRNoQ8cPJ8O2TX1t6dgmTAQ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/27/2017 07:15 AM, Peter Maydell wrote:
> On 27 July 2017 at 13:02, Cleber Rosa <crosa@redhat.com> wrote:
>> The generation of the informational header on config.log contains two
>> pairs of single quotes, which seems unintentional, and looks like
>> this:
>>
>>   # QEMU configure log Thu Jul 26 08:17:15 EDT 2017
>>   # Configured with: './configure' '--target-list=3Dx86_64-softmmu'
>=20
> I think this is deliberate. The idea is that the string is a
> validly shell-quoted string that you can cut and paste
> into a shell prompt if you want to.

It IS deliberate.  If you want, you could improve the code to only emit
'' around arguments that require it rather than all arguments, but that
requires more shell code (it's easier to quote everywhere, even when it
looks strange because the quotes weren't necessary).

> ...and note in particular how the '--cc=3Dccache gcc' argument
> is printed.

Yes, that's a case where the quotes are necessary.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--L7mBCEU4pbuRNoQ8cPJ8O2TX1t6dgmTAQ--

--W8TFJp0V4wfWb40vtj4a1n2MMMKuMDquC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAll523AACgkQp6FrSiUn
Q2qYSAf/ZGJilzw3J3/3i5vjW/tyY0vUqFAg8VrkWk+Du+nn3nq17tm0dskDmzci
oh9rhWa+v9Kpzcv5nL+26Rw81HPCEK6OH76SLJSPWT7e4Zn85lHuaMTbP/DTRRyP
sJAXBkPkx+3X0USB2axi9wIqGIYCN88L/p4pHM0EAnfyDElf24LoYKx1MhRZPg35
gTVSNy4cx8zL4dFiPLrLpjOCFvQGLhF2d+eWm6OQ2q9lXpGG/TQPfBE68eEGU58m
/GXRdqQ6ICvElxOz3WBj39op/2lO3ofX+66FFu9FjkJrYZAbe51cUCynMTr+pSlW
jT3SXa1vHbVkrhXoAwMbpcC6+J7PWw==
=RJRX
-----END PGP SIGNATURE-----

--W8TFJp0V4wfWb40vtj4a1n2MMMKuMDquC--

