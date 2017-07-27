Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1db5Lh-0004gF-To
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 09:30:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56762)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1db5Le-0004eR-PT
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 09:30:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1db5Ld-0005SR-PU
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 09:30:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44370)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <crosa@redhat.com>)
	id 1db5LZ-0005Mv-Bw; Fri, 28 Jul 2017 09:30:29 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2B445E4C14;
	Fri, 28 Jul 2017 13:30:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 2B445E4C14
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=crosa@redhat.com
Received: from localhost.localdomain (ovpn-125-15.rdu2.redhat.com
	[10.10.125.15])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B45D77CBB;
	Fri, 28 Jul 2017 13:30:25 +0000 (UTC)
To: Eric Blake <eblake@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
References: <20170727120210.6943-1-crosa@redhat.com>
	<20170727120210.6943-2-crosa@redhat.com>
	<CAFEAcA-CzG=JYjajJqMRL+pcMC2_06HTm1_xhD=ca=AReXHmTA@mail.gmail.com>
	<e6978405-6492-1124-d6e4-4a6a5b124c48@redhat.com>
From: Cleber Rosa <crosa@redhat.com>
Message-ID: <3367822b-da85-7032-f7c0-c488153a6e07@redhat.com>
Date: Thu, 27 Jul 2017 09:47:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <e6978405-6492-1124-d6e4-4a6a5b124c48@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="6KVaNAhSlT2DIIDCsX26UTIaQuxdrSg6i"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 28 Jul 2017 13:30:26 +0000 (UTC)
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
X-List-Received-Date: Fri, 28 Jul 2017 13:30:36 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6KVaNAhSlT2DIIDCsX26UTIaQuxdrSg6i
Content-Type: multipart/mixed; boundary="dMlqFb8eJparFBUej4PlIIcLKDrAjcctG";
 protected-headers="v1"
From: Cleber Rosa <crosa@redhat.com>
To: Eric Blake <eblake@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Message-ID: <3367822b-da85-7032-f7c0-c488153a6e07@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 1/5] configure: remove duplicate single
 quotes on config.log header
References: <20170727120210.6943-1-crosa@redhat.com>
 <20170727120210.6943-2-crosa@redhat.com>
 <CAFEAcA-CzG=JYjajJqMRL+pcMC2_06HTm1_xhD=ca=AReXHmTA@mail.gmail.com>
 <e6978405-6492-1124-d6e4-4a6a5b124c48@redhat.com>
In-Reply-To: <e6978405-6492-1124-d6e4-4a6a5b124c48@redhat.com>

--dMlqFb8eJparFBUej4PlIIcLKDrAjcctG
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 07/27/2017 08:24 AM, Eric Blake wrote:
> On 07/27/2017 07:15 AM, Peter Maydell wrote:
>> On 27 July 2017 at 13:02, Cleber Rosa <crosa@redhat.com> wrote:
>>> The generation of the informational header on config.log contains two=

>>> pairs of single quotes, which seems unintentional, and looks like
>>> this:
>>>
>>>   # QEMU configure log Thu Jul 26 08:17:15 EDT 2017
>>>   # Configured with: './configure' '--target-list=3Dx86_64-softmmu'
>>
>> I think this is deliberate. The idea is that the string is a
>> validly shell-quoted string that you can cut and paste
>> into a shell prompt if you want to.
>=20
> It IS deliberate.  If you want, you could improve the code to only emit=

> '' around arguments that require it rather than all arguments, but that=

> requires more shell code (it's easier to quote everywhere, even when it=

> looks strange because the quotes weren't necessary).
>=20
>> ...and note in particular how the '--cc=3Dccache gcc' argument
>> is printed.
>=20
> Yes, that's a case where the quotes are necessary.
>=20

Right, now I can see why.  Thanks for the review!

--=20
Cleber Rosa
[ Sr Software Engineer - Virtualization Team - Red Hat ]
[ Avocado Test Framework - avocado-framework.github.io ]
[  7ABB 96EB 8B46 B94D 5E0F  E9BB 657E 8D33 A5F2 09F3  ]


--dMlqFb8eJparFBUej4PlIIcLKDrAjcctG--

--6KVaNAhSlT2DIIDCsX26UTIaQuxdrSg6i
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZee7iAAoJEGV+jTOl8gnz/84P/A5BOim4htHWgCTenPoQkvfE
3Nqw258/JOCFQBWZUiynid4PvkBORz7KS0wECIkW1BYpGZ4cA6xKoZVK6UFcOMhg
PzdtKo4SmvmuUQT2CUSz+UWHJsWCequFzrooKZon1scItBTaxo3CExidVBqmSFts
nmt2cDo/N7hqsot3Bj9cc1vzp29lex1nadlADbaBr9Xy6/E5qPbCnLcdzxJrUem4
9dbzl0sK04RV3PghA756FcAhN+mV7ZPvIcz8pcorgauYIMHSYzowBiK8bvu8SlyK
YraEflIWFmdQMwa70AkgdYm8wgjYkDuAlAKhoInvYrDmJ7ywOQ9K3QOp/JKZ6GHy
zb5DDtip8KbMwoVMl0FxUBNZyE6f70aRQ3L3zBeirgElPauNdwPUD0fSgfoUCugf
W8eKlM7ZtcqcPtfpCKNh4wLBIMVO5iyBFk2LJnum0TwUGwc+1P0Hcu3FsJWyeAhF
eQ1D7cz2NOtbgXeEsOwkjqBlRMZzzpeRHExjv0s/d5aLg5nFv8X6IOIsd1XTbUc9
XSXbkEu1ee697OuaCaFkXxmCmGpfizJNYxBLhe/HRRl4RKyAJ3OhR3k5GQEj0Fgv
s4xG6nbK6kprLwzNE/LnaMDAyvad5iYOvvFTVx7RP8n0q+kVWMaOznxQeyFPZGls
9uoOd39w7ezlnYKkP+6N
=WWRg
-----END PGP SIGNATURE-----

--6KVaNAhSlT2DIIDCsX26UTIaQuxdrSg6i--

