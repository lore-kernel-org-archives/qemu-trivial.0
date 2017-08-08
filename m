Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1df5Wa-0006Of-FC
	for mharc-qemu-trivial@gnu.org; Tue, 08 Aug 2017 10:30:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58120)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1df5WV-0006Kg-AW
	for qemu-trivial@nongnu.org; Tue, 08 Aug 2017 10:30:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1df5WU-00075G-20
	for qemu-trivial@nongnu.org; Tue, 08 Aug 2017 10:30:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55676)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1df5WL-0006kB-3T; Tue, 08 Aug 2017 10:30:09 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D49F213A5F;
	Tue,  8 Aug 2017 14:30:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D49F213A5F
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eblake@redhat.com
Received: from [10.10.120.43] (ovpn-120-43.rdu2.redhat.com [10.10.120.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 168C980923;
	Tue,  8 Aug 2017 14:29:58 +0000 (UTC)
To: Kevin Wolf <kwolf@redhat.com>
References: <20170703180950.9895-1-eblake@redhat.com>
	<20170808135407.GK4850@dhcp-200-186.str.redhat.com>
Cc: qemu-devel@nongnu.org, edgar.iglesias@xilinx.com, stefanha@redhat.com,
	mreitz@redhat.com, qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	Jiri Pirko <jiri@resnulli.us>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <b3458a2d-3643-d69e-611f-3832ad8f24b4@redhat.com>
Date: Tue, 8 Aug 2017 09:29:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170808135407.GK4850@dhcp-200-186.str.redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="CwH42Qkpk7nkWRbR8sumhtausm9Dm2W8W"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 08 Aug 2017 14:30:08 +0000 (UTC)
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
X-List-Received-Date: Tue, 08 Aug 2017 14:30:23 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CwH42Qkpk7nkWRbR8sumhtausm9Dm2W8W
Content-Type: multipart/mixed; boundary="1d6kDH0CcFXuuXr1G2bITgeJI36wRxKHc";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, edgar.iglesias@xilinx.com, stefanha@redhat.com,
 mreitz@redhat.com, qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Jiri Pirko <jiri@resnulli.us>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Message-ID: <b3458a2d-3643-d69e-611f-3832ad8f24b4@redhat.com>
Subject: Re: [PATCH v4] tests: Avoid non-portable 'echo -ARG'
References: <20170703180950.9895-1-eblake@redhat.com>
 <20170808135407.GK4850@dhcp-200-186.str.redhat.com>
In-Reply-To: <20170808135407.GK4850@dhcp-200-186.str.redhat.com>

--1d6kDH0CcFXuuXr1G2bITgeJI36wRxKHc
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 08/08/2017 08:54 AM, Kevin Wolf wrote:
> Am 03.07.2017 um 20:09 hat Eric Blake geschrieben:
>> POSIX says that backslashes in the arguments to 'echo', as well as
>> any use of 'echo -n' and 'echo -e', are non-portable; it recommends
>> people should favor 'printf' instead.  This is definitely true where
>> we do not control which shell is running (such as in makefile snippets=

>> or in documentation examples).  But even for scripts where we
>> require bash (and therefore, where echo does what we want by default),=

>> it is still possible to use 'shopt -s xpg_echo' to change bash's
>> behavior of echo.  And setting a good example never hurts when we are
>> not sure if a snippet will be copied from a bash-only script to a
>> general shell script (although I don't change the use of non-portable
>> \e for ESC when we know the running shell is bash).
>>

>> +++ b/tests/multiboot/run_test.sh
>> @@ -26,7 +26,7 @@ run_qemu() {
>>      local kernel=3D$1
>>      shift
>>
>> -    echo -e "\n\n=3D=3D=3D Running test case: $kernel $@ =3D=3D=3D\n"=
 >> test.log
>> +    printf %b "\n\n=3D=3D=3D Running test case: $kernel $@ =3D=3D=3D\=
n\n" >> test.log
>>
>>      $QEMU \
>>          -kernel $kernel \
>=20
> Not completely sure why, but this broke the test with whitespace change=
s
> like this:
>=20
> -=3D=3D=3D Running test case: mmap.elf -m 1.1M =3D=3D=3D
> +=3D=3D=3D Running test case: mmap.elf -m1.1M =3D=3D=3D

I guess that means I'm not regularly running tests/multiboot?  Is it not
part of 'make check' or qemu-iotests?

Ah, I see the problem, and it's insidious.  We're using "...$@...", but
want to be using "...$*...".  $@ causes multiple arguments to be passed,
but printf %b is not concatenating those arguments; while $* uses only a
single argument.  We didn't notice it with echo -e, because echo inserts
a space between multiple arguments, just as you'd get a space with $*.

Fix coming up.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--1d6kDH0CcFXuuXr1G2bITgeJI36wRxKHc--

--CwH42Qkpk7nkWRbR8sumhtausm9Dm2W8W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlmJyuYACgkQp6FrSiUn
Q2qhBQf/TP2Yr/to2JogQb5ylBzDp/uxHRxDjRg01dASZeZ43TsVv6c7HEi2HwO1
+4L+dRIfpkbdh2EGa20v1wfnLsi9JtumuR6Wdnp90amz0SwGcak3IJqlNzw2uaFb
scC+x5txP6rbo1HCfCOQuU93Rp2TYN//zZmX9VzonXsEJSBS9QigcS3p+Ld7CdIO
MezNzFUAJp0qTCAb5vKHh1KN/9FYI5817My839KDPX7zvWlr247uoiJkKsRgiCqh
+r7ddH6u7DMxCZCTLXksWE+rnn9De+gUJ8byUibXqSxbvwbmTgqHOSp+JUW9EdRE
Cw9D7yDuovVimLSzXtnA1AYxa5LeWw==
=PTOa
-----END PGP SIGNATURE-----

--CwH42Qkpk7nkWRbR8sumhtausm9Dm2W8W--

