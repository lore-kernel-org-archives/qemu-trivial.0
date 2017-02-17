Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cekYQ-0003EJ-OI
	for mharc-qemu-trivial@gnu.org; Fri, 17 Feb 2017 10:34:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40066)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cekYO-0003CT-QR
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 10:34:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cekYN-00025D-PS
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 10:34:36 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60764)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1cekYH-0001xC-Ni; Fri, 17 Feb 2017 10:34:29 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E79E66AAC7;
	Fri, 17 Feb 2017 15:34:28 +0000 (UTC)
Received: from [10.10.123.249] (ovpn-123-249.rdu2.redhat.com [10.10.123.249]
	(may be forged))
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1HFYRNT032058; Fri, 17 Feb 2017 10:34:27 -0500
To: Peter Maydell <peter.maydell@linaro.org>, Fam Zheng <famz@redhat.com>
References: <CABHMSTVDnAxAvpp81+z_2fkAFO7tazLJs3cFXpuDuuGQj-Ek-A@mail.gmail.com>
	<1933406e-2576-e687-3545-a72f3b999310@redhat.com>
	<bf1410bc-bc6d-bb29-5591-55634f25d487@redhat.com>
	<CABHMSTUsZy0u4b1b84YC5CgafKvD-Zms5dCQ=31+XnQphUQxLA@mail.gmail.com>
	<20170217064327.GB21716@lemon.lan>
	<CAFEAcA8_f8SVX+rirAFBJ76ZiXaKUwh9uO0AeBFoR7G_q8pGDg@mail.gmail.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, Chad Joan <chadjoan@gmail.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <6ab86cf8-4780-ca76-f648-ac0ce211e27b@redhat.com>
Date: Fri, 17 Feb 2017 09:34:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8_f8SVX+rirAFBJ76ZiXaKUwh9uO0AeBFoR7G_q8pGDg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="3BotGn29PrBleMkKjl9uDHnGr1qtrGHWg"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 17 Feb 2017 15:34:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] Fix build break during
 configuration on musl-libc based Linux systems.
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
X-List-Received-Date: Fri, 17 Feb 2017 15:34:37 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3BotGn29PrBleMkKjl9uDHnGr1qtrGHWg
Content-Type: multipart/mixed; boundary="95efXDqM3oj9XRH9tubMGBJwG79TSiKLd";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Fam Zheng <famz@redhat.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Chad Joan <chadjoan@gmail.com>
Message-ID: <6ab86cf8-4780-ca76-f648-ac0ce211e27b@redhat.com>
Subject: Re: [Qemu-devel] Fix build break during configuration on musl-libc
 based Linux systems.
References: <CABHMSTVDnAxAvpp81+z_2fkAFO7tazLJs3cFXpuDuuGQj-Ek-A@mail.gmail.com>
 <1933406e-2576-e687-3545-a72f3b999310@redhat.com>
 <bf1410bc-bc6d-bb29-5591-55634f25d487@redhat.com>
 <CABHMSTUsZy0u4b1b84YC5CgafKvD-Zms5dCQ=31+XnQphUQxLA@mail.gmail.com>
 <20170217064327.GB21716@lemon.lan>
 <CAFEAcA8_f8SVX+rirAFBJ76ZiXaKUwh9uO0AeBFoR7G_q8pGDg@mail.gmail.com>
In-Reply-To: <CAFEAcA8_f8SVX+rirAFBJ76ZiXaKUwh9uO0AeBFoR7G_q8pGDg@mail.gmail.com>

--95efXDqM3oj9XRH9tubMGBJwG79TSiKLd
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 02/17/2017 03:28 AM, Peter Maydell wrote:
> On 17 February 2017 at 06:43, Fam Zheng <famz@redhat.com> wrote:
>> But your point is taken, we should make the first (or a one-shot)
>> contribution as easy as possible.
>=20
> Yes; we could do with providing a "This page seems very long..."
> introduction section. The absolute bare minimum requirements
> for a submitter I think are:
>  * Provide a Signed-off-by: line (this is a hard requirement
>    because it's how you say "I'm legally OK to contribute this
>    and am happy for it to go into QEMU")
>  * send patch by email
>  * read replies and act on them if you want your patch to go in
>=20
> The larger your contribution is, the more important the other
> requirements detailed on the page are; but personally I'm
> happy to manually fix up patches from a first-time submitter,
> and I think most other maintainers are too.

I've updated the wiki to put in that nice bullet list, prior to the
table of contents.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--95efXDqM3oj9XRH9tubMGBJwG79TSiKLd--

--3BotGn29PrBleMkKjl9uDHnGr1qtrGHWg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJYpxgCAAoJEKeha0olJ0NqmB8H/jCMqbqyQooSUnKW2HxKuH7X
aZM2hOZt2Vo03PM7pNNGrOab799a1UEpKhoPOMMEb6YgudwdlRt1BA5ilbRMTo+R
JLx3k7bpuWu009gMyPjLpbVLbvgba8PT/y8eC5oNyD5kQ7F6+6y2cl9F3FxtBvwa
aSzu7CkRlSWxy5uxJdQsh+claMwTYSFKbHu/mc5nA4+oFEtcHbOwqrXE9R6z3tiP
RmABvF7chO1zSxw3o9A5Av6Z8eIUh59t1/Q/TBY6C4zVqu+8X1PKlnJb/Vnstixj
GSWmAsiksVuL3MZd7GyiypqsVp3zMSasve9NILAnUiQSxhJothore653KKcdPfI=
=kDbC
-----END PGP SIGNATURE-----

--3BotGn29PrBleMkKjl9uDHnGr1qtrGHWg--

