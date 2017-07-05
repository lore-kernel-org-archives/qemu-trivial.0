Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dSlum-0000D0-49
	for mharc-qemu-trivial@gnu.org; Wed, 05 Jul 2017 11:08:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1dSluk-0000BX-Do
	for qemu-trivial@nongnu.org; Wed, 05 Jul 2017 11:08:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1dSluj-0000ML-AS
	for qemu-trivial@nongnu.org; Wed, 05 Jul 2017 11:08:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40282)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1dSluc-0000Io-AI; Wed, 05 Jul 2017 11:08:18 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C4E557CE06;
	Wed,  5 Jul 2017 15:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C4E557CE06
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=mreitz@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com C4E557CE06
Received: from dresden.str.redhat.com (ovpn-204-111.brq.redhat.com
	[10.40.204.111])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AEEE55D968;
	Wed,  5 Jul 2017 15:08:05 +0000 (UTC)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: edgar.iglesias@xilinx.com, stefanha@redhat.com, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20170703180950.9895-1-eblake@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <104e32b9-042b-b4c9-d83e-17a3e248385f@redhat.com>
Date: Wed, 5 Jul 2017 17:08:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20170703180950.9895-1-eblake@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="T7S1nGX32kMDU2uSNhCKxpSNXfRGLGURt"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 05 Jul 2017 15:08:17 +0000 (UTC)
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
X-List-Received-Date: Wed, 05 Jul 2017 15:08:27 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--T7S1nGX32kMDU2uSNhCKxpSNXfRGLGURt
Content-Type: multipart/mixed; boundary="VQUr5dKocFPXbMnoG6lC3R1K9QxCJI2sf";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: edgar.iglesias@xilinx.com, stefanha@redhat.com, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Message-ID: <104e32b9-042b-b4c9-d83e-17a3e248385f@redhat.com>
Subject: Re: [PATCH v4] tests: Avoid non-portable 'echo -ARG'
References: <20170703180950.9895-1-eblake@redhat.com>
In-Reply-To: <20170703180950.9895-1-eblake@redhat.com>

--VQUr5dKocFPXbMnoG6lC3R1K9QxCJI2sf
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2017-07-03 20:09, Eric Blake wrote:
> POSIX says that backslashes in the arguments to 'echo', as well as
> any use of 'echo -n' and 'echo -e', are non-portable; it recommends
> people should favor 'printf' instead.  This is definitely true where
> we do not control which shell is running (such as in makefile snippets
> or in documentation examples).  But even for scripts where we
> require bash (and therefore, where echo does what we want by default),
> it is still possible to use 'shopt -s xpg_echo' to change bash's
> behavior of echo.  And setting a good example never hurts when we are
> not sure if a snippet will be copied from a bash-only script to a
> general shell script (although I don't change the use of non-portable
> \e for ESC when we know the running shell is bash).
>=20
> Replace 'echo -n "..."' with 'printf %s "..."', and 'echo -e "..."'
> with 'printf %b "...\n"', with the optimization that the %s/%b
> argument can be omitted if the string being printed is a strict
> literal with no '%', '$', or '`' (we could technically also make
> this optimization when there are $ or `` substitutions but where
> we can prove their results will not be problematic, but proving
> that such substitutions are safe makes the patch less trivial
> compared to just being consistent).
>=20
> In the qemu-iotests check script, fix unusual shell quoting
> that would result in word-splitting if 'date' outputs a space.
>=20
> In test 051, take an opportunity to shorten the line.
>=20
> In test 068, get rid of a pointless second invocation of bash.
>=20
> CC: qemu-trivial@nongnu.org
> Signed-off-by: Eric Blake <eblake@redhat.com>
>=20
> ---
> v4: even more use of %b/%s [Max]
> v3: use 'printf %s' in a few more places that substitute [Max]
> v2: be robust to potential % in substitutions
> ---
>  qemu-options.hx             |  4 ++--
>  tests/multiboot/run_test.sh | 10 +++++-----
>  tests/qemu-iotests/051      |  7 ++++---
>  tests/qemu-iotests/068      |  2 +-
>  tests/qemu-iotests/142      | 48 ++++++++++++++++++++++---------------=
--------
>  tests/qemu-iotests/171      | 14 ++++++-------
>  tests/qemu-iotests/check    | 18 ++++++++---------
>  tests/rocker/all            | 10 +++++-----
>  tests/tcg/cris/Makefile     |  8 ++++----
>  9 files changed, 61 insertions(+), 60 deletions(-)

Thanks a lot (not least for bearing my nagging)! Applied to my block bran=
ch:

https://github.com/XanClic/qemu/commits/block

(I agree it's fit for qemu-trivial now, but, well...)

Max


--VQUr5dKocFPXbMnoG6lC3R1K9QxCJI2sf--

--T7S1nGX32kMDU2uSNhCKxpSNXfRGLGURt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEvBAEBCAAZBQJZXQDUEhxtcmVpdHpAcmVkaGF0LmNvbQAKCRD0B9sAYdXPQIzY
B/45mRD5+MKj6kG6zQZBYtt+js1BTLa0SaGVw9oZmf4Ii/BTvuUh+Mx3sA90SE0r
sCzHLF2qmyHtCT3ITZq9dyVO9Km8jD7Td5Vp5rpiyRxQgOxgq6a4nTdawi/Al9F4
KlvhvUByqJ5cw5O7GJbNciHyjNUyCsTjNmWH2tir++GZ9rmp97WbvTSvMsBTJsui
dqbQgHEBmYZd3gVqYBJWwIUkL2VF+Mf664jK4aZ0H8V94ffWGzh/ICEelHdDKlO7
ISDLT9hmDN3sYo23uMPyF7u2+qd2tHSfrH6MyfCO9+smA7dSWRx2XxPq8AgUSi/i
pwatAtgRbJckWzaohO4kd+zV
=5VjX
-----END PGP SIGNATURE-----

--T7S1nGX32kMDU2uSNhCKxpSNXfRGLGURt--

