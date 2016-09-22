Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bnBcR-0006Yt-NZ
	for mharc-qemu-trivial@gnu.org; Thu, 22 Sep 2016 17:33:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36069)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bnBcP-0006WS-JP
	for qemu-trivial@nongnu.org; Thu, 22 Sep 2016 17:33:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bnBcN-0003oo-HK
	for qemu-trivial@nongnu.org; Thu, 22 Sep 2016 17:33:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60042)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1bnBcH-0003hR-16; Thu, 22 Sep 2016 17:33:13 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6D8589F732;
	Thu, 22 Sep 2016 21:33:12 +0000 (UTC)
Received: from [10.3.116.58] (ovpn-116-58.phx2.redhat.com [10.3.116.58])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8MLXB6d027726; Thu, 22 Sep 2016 17:33:11 -0400
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Luiz Capitulino <lcapitulino@redhat.com>
References: <1474572758-763-1-git-send-email-thuth@redhat.com>
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <cb5e3090-42d7-404b-3a31-0e59fedb06b1@redhat.com>
Date: Thu, 22 Sep 2016 16:33:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1474572758-763-1-git-send-email-thuth@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="t5GbGIXCI52J3o8XW7K4RNFFaq0OUi43q"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 22 Sep 2016 21:33:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] MAINTAINERS: Add some more
 files to the HMP section
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
X-List-Received-Date: Thu, 22 Sep 2016 21:33:22 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--t5GbGIXCI52J3o8XW7K4RNFFaq0OUi43q
Content-Type: multipart/mixed; boundary="s8R5lipolejX0VeFn4oB0ucxwwiH5koO5";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Luiz Capitulino <lcapitulino@redhat.com>
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>
Message-ID: <cb5e3090-42d7-404b-3a31-0e59fedb06b1@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] MAINTAINERS: Add some more files to the HMP
 section
References: <1474572758-763-1-git-send-email-thuth@redhat.com>
In-Reply-To: <1474572758-763-1-git-send-email-thuth@redhat.com>

--s8R5lipolejX0VeFn4oB0ucxwwiH5koO5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 09/22/2016 02:32 PM, Thomas Huth wrote:
> The hmp-commands-info.hx, hmp.h and include/monitor/hmp-target.h
> files were classified as unmaintained. Let's add them to the
> HMP section.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

Is Luiz still the best maintainer here, though, given that he is not
listed as a maintainer on corresponding QMP changes?  But that's
unrelated to this patch.

>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9da3d09..3879e1c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1160,8 +1160,9 @@ Human Monitor (HMP)
>  M: Luiz Capitulino <lcapitulino@redhat.com>
>  S: Maintained
>  F: monitor.c
> -F: hmp.c
> -F: hmp-commands.hx
> +F: hmp.[ch]
> +F: hmp-commands*.hx
> +F: include/monitor/hmp-target.h
>  T: git git://repo.or.cz/qemu/qmp-unstable.git queue/qmp
> =20
>  Network device backends
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--s8R5lipolejX0VeFn4oB0ucxwwiH5koO5--

--t5GbGIXCI52J3o8XW7K4RNFFaq0OUi43q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJX5E4XAAoJEKeha0olJ0NqlB8H/266Ky59JpyKJ54/HLYo0O4k
aDo2zKsLTQSpKS+Sag3h68bHctTp16pbVO42mhcO+fNyN+PJK2RfWEiIQsUFqBWd
q458XLoWIB9GHXc+A7zSJiFSlaWqwF2HFWmvg2Ntw6TdKu7yL81uasCX0dcsvu3Z
cVcre1OkTjpssoo0tKX7mkcLSQTio6U+pDhQ1jSOnht9s/10mhzEheiDOotNJWWS
ZpSXXiFzyMboULxe6vlwvYNhmK41wOf6f2Z3GMTonugZGbLvR2karYeLn1GFhAxO
8yPhulKI9ilfUxl9mpfmD/YKa3h195RnpZ437ixbKnH1JOxQ2zSur6rT8dy/B54=
=rpsd
-----END PGP SIGNATURE-----

--t5GbGIXCI52J3o8XW7K4RNFFaq0OUi43q--

