Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dYGAB-0002fD-MD
	for mharc-qemu-trivial@gnu.org; Thu, 20 Jul 2017 14:27:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46172)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dYGA8-0002ch-Gz
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 14:27:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dYGA7-0002gH-Ht
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 14:27:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56358)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dYGA1-0002cP-T8; Thu, 20 Jul 2017 14:26:54 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CDFDEC056861;
	Thu, 20 Jul 2017 18:26:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CDFDEC056861
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com CDFDEC056861
Received: from [10.10.120.37] (ovpn-120-37.rdu2.redhat.com [10.10.120.37])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C9D5E1711A;
	Thu, 20 Jul 2017 18:26:51 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1500568341-8389-1-git-send-email-peter.maydell@linaro.org>
Cc: Kamil Rytarowski <kamil@netbsd.org>, patches@linaro.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <eec67af4-3f8e-bb85-0854-61f4d450f627@redhat.com>
Date: Thu, 20 Jul 2017 13:26:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1500568341-8389-1-git-send-email-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="DmOfBJXUroEnWpasoiLm51H24CH73FxB5"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 20 Jul 2017 18:26:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.10]
 util/oslib-posix.c: Avoid warning on NetBSD
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
X-List-Received-Date: Thu, 20 Jul 2017 18:27:02 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DmOfBJXUroEnWpasoiLm51H24CH73FxB5
Content-Type: multipart/mixed; boundary="PqrP0Eam4QNnqMCEM54ek1WeaJBodfupW";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: Kamil Rytarowski <kamil@netbsd.org>, patches@linaro.org
Message-ID: <eec67af4-3f8e-bb85-0854-61f4d450f627@redhat.com>
Subject: Re: [Qemu-devel] [PATCH for-2.10] util/oslib-posix.c: Avoid warning
 on NetBSD
References: <1500568341-8389-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1500568341-8389-1-git-send-email-peter.maydell@linaro.org>

--PqrP0Eam4QNnqMCEM54ek1WeaJBodfupW
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/20/2017 11:32 AM, Peter Maydell wrote:
> On NetBSD the compiler warns:
> util/oslib-posix.c: In function 'sigaction_invoke':
> util/oslib-posix.c:589:5: warning: missing braces around initializer [-=
Wmissing-braces]
>      siginfo_t si =3D { 0 };
>      ^

Uggh. That is a broken compiler.  C99 declares that 'anything =3D {0}' is=

supposed to be a valid way to zero-initialize anything.

> util/oslib-posix.c:589:5: warning: (near initialization for 'si.si_pad'=
) [-Wmissing-braces]
>=20
> because on this platform siginfo_t is defined as
>   typedef union siginfo {
>           char    si_pad[128];    /* Total size; for future expansion *=
/
>           struct _ksiginfo _info;
>   } siginfo_t;
>=20
> Avoid this warning by initializing the struct with {} instead;
> this is a GCC extension but we use it all over the codebase already.

Well, I'm glad that works to shut up the broken compiler.

>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  util/oslib-posix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index b2dea48..cacf0ef 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -586,7 +586,7 @@ void qemu_free_stack(void *stack, size_t sz)
>  void sigaction_invoke(struct sigaction *action,
>                        struct qemu_signalfd_siginfo *info)
>  {
> -    siginfo_t si =3D { 0 };
> +    siginfo_t si =3D {};
>      si.si_signo =3D info->ssi_signo;
>      si.si_errno =3D info->ssi_errno;
>      si.si_code =3D info->ssi_code;
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--PqrP0Eam4QNnqMCEM54ek1WeaJBodfupW--

--DmOfBJXUroEnWpasoiLm51H24CH73FxB5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAllw9eoACgkQp6FrSiUn
Q2ow2gf/dgjVCePlP+22F40D9ETGGN7p+QTV9g5RWo1d7mjiFyYZIa+uX2PHC4ij
DqIPR030viKYPxXzvfM+iZ95i0DI2cKfkmad1sdHNMdVTm3KRXr1TeBlnBVplC3e
KfdCvze6SqrQpf5v01Aa4pX50avMS1uQ8KCfAs230ixzOF7YRyCZxBS1RNePH74Y
iUvqGGAFN3lvIkiWjtAcpjwiBmf2IUPqX6jPD8p3q6maNcSZBwd/iHfrEXz81bA4
f8UlTRlhmHz70+Yk+Wt70q0U19iszu25P1MvF5BQbC+fc5tjTfTXoKimvI+qIvHY
8ra6tdN4jNEgEJMK/0DyXIsTt8qqqw==
=C3S1
-----END PGP SIGNATURE-----

--DmOfBJXUroEnWpasoiLm51H24CH73FxB5--

