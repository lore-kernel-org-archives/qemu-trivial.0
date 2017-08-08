Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dfBOk-0005k2-To
	for mharc-qemu-trivial@gnu.org; Tue, 08 Aug 2017 16:46:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dfBOf-0005h3-Pj
	for qemu-trivial@nongnu.org; Tue, 08 Aug 2017 16:46:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dfBOe-0005cW-KZ
	for qemu-trivial@nongnu.org; Tue, 08 Aug 2017 16:46:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39924)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dfBOV-0005WI-F9; Tue, 08 Aug 2017 16:46:27 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 21C7B356EC;
	Tue,  8 Aug 2017 20:46:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 21C7B356EC
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eblake@redhat.com
Received: from [10.10.120.43] (ovpn-120-43.rdu2.redhat.com [10.10.120.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A88BF6046A;
	Tue,  8 Aug 2017 20:46:21 +0000 (UTC)
To: Kevin Wolf <kwolf@redhat.com>
References: <20170703180950.9895-1-eblake@redhat.com>
	<20170808135407.GK4850@dhcp-200-186.str.redhat.com>
	<b3458a2d-3643-d69e-611f-3832ad8f24b4@redhat.com>
	<20170808144800.GL4850@dhcp-200-186.str.redhat.com>
Cc: qemu-devel@nongnu.org, edgar.iglesias@xilinx.com, stefanha@redhat.com,
	mreitz@redhat.com, qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	Jiri Pirko <jiri@resnulli.us>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <7aa6c259-ccfe-a393-d89e-5727b8c12e90@redhat.com>
Date: Tue, 8 Aug 2017 15:46:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170808144800.GL4850@dhcp-200-186.str.redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="b2DUwPMX0U3eMMdj8JTVKDHXT0sXq9THE"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 08 Aug 2017 20:46:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v4] tests: Avoid non-portable 'echo -ARG'
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
X-List-Received-Date: Tue, 08 Aug 2017 20:46:42 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--b2DUwPMX0U3eMMdj8JTVKDHXT0sXq9THE
Content-Type: multipart/mixed; boundary="t7UW8fVFHTjRGtxcAUkO7vouSAMkxaQ1e";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, edgar.iglesias@xilinx.com, stefanha@redhat.com,
 mreitz@redhat.com, qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Jiri Pirko <jiri@resnulli.us>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Message-ID: <7aa6c259-ccfe-a393-d89e-5727b8c12e90@redhat.com>
Subject: Re: [PATCH v4] tests: Avoid non-portable 'echo -ARG'
References: <20170703180950.9895-1-eblake@redhat.com>
 <20170808135407.GK4850@dhcp-200-186.str.redhat.com>
 <b3458a2d-3643-d69e-611f-3832ad8f24b4@redhat.com>
 <20170808144800.GL4850@dhcp-200-186.str.redhat.com>
In-Reply-To: <20170808144800.GL4850@dhcp-200-186.str.redhat.com>

--t7UW8fVFHTjRGtxcAUkO7vouSAMkxaQ1e
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 08/08/2017 09:48 AM, Kevin Wolf wrote:

>>> Not completely sure why, but this broke the test with whitespace chan=
ges
>>> like this:
>>>
>>> -=3D=3D=3D Running test case: mmap.elf -m 1.1M =3D=3D=3D
>>> +=3D=3D=3D Running test case: mmap.elf -m1.1M =3D=3D=3D
>>
>> I guess that means I'm not regularly running tests/multiboot?  Is it n=
ot
>> part of 'make check' or qemu-iotests?
>=20
> The problem is that it needs an i386 compiler to build the test kernels=

> (and qemu-system-i386 or qemu-system-x86_64 binaries to execute them).
>=20
> I guess we could check these conditions, though, and skip the test if w=
e
> can't produce i386 binaries.

And when you CAN run the test, it litters 'git status' of an in-tree
build with:

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	tests/multiboot/mmap.elf
	tests/multiboot/modules.elf
	tests/multiboot/test.out

which ought to be fixed.

>=20
>> Ah, I see the problem, and it's insidious.  We're using "...$@...", bu=
t
>> want to be using "...$*...".  $@ causes multiple arguments to be passe=
d,
>> but printf %b is not concatenating those arguments; while $* uses only=
 a
>> single argument.  We didn't notice it with echo -e, because echo inser=
ts
>> a space between multiple arguments, just as you'd get a space with $*.=

>=20
> The thing that completely confused me here is that printf doesn't just
> ignore additional arguments as I would have expected, but just starts
> over with the format string, so that it does kind of work with multiple=

> arguments and fails only subtly.

Both echo and printf accept more than one argument, but only echo
injects an automatic space between those arguments in the output.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--t7UW8fVFHTjRGtxcAUkO7vouSAMkxaQ1e--

--b2DUwPMX0U3eMMdj8JTVKDHXT0sXq9THE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlmKIxwACgkQp6FrSiUn
Q2pLKQgAkPY8K4M03/RS1JCBwgeXtkYHMSjSVeEYr9X7fFf2O1ewZ85Yf1zKvu7s
s1+DUV/wPTc/feJDM8F+qTWsiRk4Nx8BGwQHckMQIvCbkpHMXnZTdRcMbIZK7nSZ
7FMBcbterPhvxjICENjDNG7snMpgQ89L81cbsUxB4r74QxsCkCsTL1uj8sqnvzd4
pUKwyRWOAEnYaROqfJooGyNzrFJHlcGAfXo31cDGdgVaouBYy9AxizXVDINfCkw3
il0HlXbFI8zuaEcOwU1NoTsSDE2GPWtzWc/tvPjjb1knLBvNvsdGCme/Oj5BG2Kp
Cb4XksDe3QtUntwkyHWPmVyzFKtNfQ==
=OvTz
-----END PGP SIGNATURE-----

--b2DUwPMX0U3eMMdj8JTVKDHXT0sXq9THE--

