Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cg0Zz-0005T6-6C
	for mharc-qemu-trivial@gnu.org; Mon, 20 Feb 2017 21:53:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42815)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cg0Zv-0005Pv-Vh
	for qemu-trivial@nongnu.org; Mon, 20 Feb 2017 21:53:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cg0Zv-00064N-6I
	for qemu-trivial@nongnu.org; Mon, 20 Feb 2017 21:53:24 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56740)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1cg0Zp-00061H-EP; Mon, 20 Feb 2017 21:53:17 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6B06F61B8A;
	Tue, 21 Feb 2017 02:53:17 +0000 (UTC)
Received: from [10.10.123.67] (ovpn-123-67.rdu2.redhat.com [10.10.123.67] (may
	be forged))
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1L2rFZ5027421; Mon, 20 Feb 2017 21:53:16 -0500
To: Peter Maydell <peter.maydell@linaro.org>, Chad Joan <chadjoan@gmail.com>
References: <CABHMSTVDnAxAvpp81+z_2fkAFO7tazLJs3cFXpuDuuGQj-Ek-A@mail.gmail.com>
	<1933406e-2576-e687-3545-a72f3b999310@redhat.com>
	<bf1410bc-bc6d-bb29-5591-55634f25d487@redhat.com>
	<CABHMSTUsZy0u4b1b84YC5CgafKvD-Zms5dCQ=31+XnQphUQxLA@mail.gmail.com>
	<20170217064327.GB21716@lemon.lan>
	<CAFEAcA8_f8SVX+rirAFBJ76ZiXaKUwh9uO0AeBFoR7G_q8pGDg@mail.gmail.com>
	<6ab86cf8-4780-ca76-f648-ac0ce211e27b@redhat.com>
	<CABHMSTWN2KdAXDjEEbyWio6rNM2FuDk_NUj40mFW0HdyZFu68g@mail.gmail.com>
	<CAFEAcA_N1j9tpxEBROG6D1per9vDMPZeuRyM93BRzNT5ZK3q0Q@mail.gmail.com>
Cc: Fam Zheng <famz@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>, 
	QEMU Developers <qemu-devel@nongnu.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <24a2d084-e391-ae89-8b81-e910871a8edd@redhat.com>
Date: Mon, 20 Feb 2017 20:53:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_N1j9tpxEBROG6D1per9vDMPZeuRyM93BRzNT5ZK3q0Q@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="RIdWaw94ulp0T50BDtOeGWQTbsPbvh2Ea"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 21 Feb 2017 02:53:17 +0000 (UTC)
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
X-List-Received-Date: Tue, 21 Feb 2017 02:53:25 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--RIdWaw94ulp0T50BDtOeGWQTbsPbvh2Ea
Content-Type: multipart/mixed; boundary="B6evWD63btwBjNcS2IqV7oQ8RVxruhLl8";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Chad Joan <chadjoan@gmail.com>
Cc: Fam Zheng <famz@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Message-ID: <24a2d084-e391-ae89-8b81-e910871a8edd@redhat.com>
Subject: Re: [Qemu-devel] Fix build break during configuration on musl-libc
 based Linux systems.
References: <CABHMSTVDnAxAvpp81+z_2fkAFO7tazLJs3cFXpuDuuGQj-Ek-A@mail.gmail.com>
 <1933406e-2576-e687-3545-a72f3b999310@redhat.com>
 <bf1410bc-bc6d-bb29-5591-55634f25d487@redhat.com>
 <CABHMSTUsZy0u4b1b84YC5CgafKvD-Zms5dCQ=31+XnQphUQxLA@mail.gmail.com>
 <20170217064327.GB21716@lemon.lan>
 <CAFEAcA8_f8SVX+rirAFBJ76ZiXaKUwh9uO0AeBFoR7G_q8pGDg@mail.gmail.com>
 <6ab86cf8-4780-ca76-f648-ac0ce211e27b@redhat.com>
 <CABHMSTWN2KdAXDjEEbyWio6rNM2FuDk_NUj40mFW0HdyZFu68g@mail.gmail.com>
 <CAFEAcA_N1j9tpxEBROG6D1per9vDMPZeuRyM93BRzNT5ZK3q0Q@mail.gmail.com>
In-Reply-To: <CAFEAcA_N1j9tpxEBROG6D1per9vDMPZeuRyM93BRzNT5ZK3q0Q@mail.gmail.com>

--B6evWD63btwBjNcS2IqV7oQ8RVxruhLl8
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 02/17/2017 11:15 AM, Peter Maydell wrote:
> The kernel docs have a longer list of mail clients with
> notes about suitability:
> https://kernel.org/doc/html/latest/process/email-clients.html
> but the set of "just works" clients is very small.

Currently fails with 403 Forbidden

You don't have permission to access
/doc/html/latest/process/email-clients.html on this server.

Hopefully its transient?

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--B6evWD63btwBjNcS2IqV7oQ8RVxruhLl8--

--RIdWaw94ulp0T50BDtOeGWQTbsPbvh2Ea
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJYq6uaAAoJEKeha0olJ0NqcjcIAKNm59OYl5PEMNVDwCFI5Y0M
jr2QXIRwoAPXIpqnk3zy3m8409qGEoFODUfSZJkaFGbs/9PtHK+NVahAaHwpXSC4
DyJjvWd4e0w7VpApd0g68hzpy9tR4cqb11Uod9tAhbERsU80hAqYpFNoozVeUyP4
idepLG2YmwibNe/mzFESrDtI6q+RNQN4RIN4O0v+OIJD1YMe9hP4w20Q3+He45bx
o1v0/PHd5/k0+rzzQ8BbtWM/e3X2KOIX5vPI3b5ti9v86J+OHOuJbBgxHnqHA9Rf
KwxB4QyTHNQGccuazBqBeDu9wrvGoZEzm+EPqsPHVqSDLG/W5UPXiO5EkKIPnIQ=
=fFPX
-----END PGP SIGNATURE-----

--RIdWaw94ulp0T50BDtOeGWQTbsPbvh2Ea--

