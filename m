Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bHuhU-0000cy-MY
	for mharc-qemu-trivial@gnu.org; Tue, 28 Jun 2016 11:13:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43673)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bHuhT-0000au-17
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 11:13:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bHuhS-0003LN-1A
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 11:13:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47084)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1bHuhM-0003DK-Fv; Tue, 28 Jun 2016 11:13:12 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 294727267C;
	Tue, 28 Jun 2016 15:13:12 +0000 (UTC)
Received: from [10.3.116.72] (ovpn-116-72.phx2.redhat.com [10.3.116.72])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5SFDBDJ030727; Tue, 28 Jun 2016 11:13:11 -0400
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1467125451-16700-1-git-send-email-peter.maydell@linaro.org>
	<1467125451-16700-3-git-send-email-peter.maydell@linaro.org>
Cc: patches@linaro.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <57729407.8010802@redhat.com>
Date: Tue, 28 Jun 2016 09:13:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1467125451-16700-3-git-send-email-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="li7XJwhvmQSBT4XjLH1rs0JrDNjFaBEDR"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 28 Jun 2016 15:13:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/6] block/qcow2: Don't use
 cpu_to_*w()
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
X-List-Received-Date: Tue, 28 Jun 2016 15:13:20 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--li7XJwhvmQSBT4XjLH1rs0JrDNjFaBEDR
Content-Type: multipart/mixed; boundary="f4HFloeXwRsFpj5sdHjhN93Lij2Jo3T45"
From: Eric Blake <eblake@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: patches@linaro.org
Message-ID: <57729407.8010802@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 2/6] block/qcow2: Don't use cpu_to_*w()
References: <1467125451-16700-1-git-send-email-peter.maydell@linaro.org>
 <1467125451-16700-3-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1467125451-16700-3-git-send-email-peter.maydell@linaro.org>

--f4HFloeXwRsFpj5sdHjhN93Lij2Jo3T45
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 06/28/2016 08:50 AM, Peter Maydell wrote:
> Don't use the cpu_to_*w() functions, which we are trying to deprecate.
> Instead either just use cpu_to_*() to do the byteswap, or use
> st*_be_p() if we need to do the store somewhere other than to a
> variable that's already the correct type.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  block/qcow2-cluster.c  |  2 +-
>  block/qcow2-refcount.c | 11 +++++------
>  block/qcow2.c          |  6 +++---
>  3 files changed, 9 insertions(+), 10 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--f4HFloeXwRsFpj5sdHjhN93Lij2Jo3T45--

--li7XJwhvmQSBT4XjLH1rs0JrDNjFaBEDR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXcpQHAAoJEKeha0olJ0NqOhsH/RvjH1ZA9E4tgzFyjVxQ+qKu
vNhf8zED5ZCsKsRwNr1js0Nt6ftdfichtzi245PN6d1V6DIZ1y2pdKypWudsfQBB
ozFKi4ztZF4w49fXJkr+CGq5ZgsAx61Ya3EvwlG97KbPfyRITi+Vc1tOihuic8wv
ODQpplLCj1wG8jkaaPvZW4Olpv7iMChcbBobY0Lz8Fkuazs2LiwT4ZVpo+TfO+WM
W1orNtwjnm+hW1HWOg6mYDIK4zEd06YTiFPPqa92SmGC80pGGV2Z2duWkzMI/cH8
yyNmS7qsiCMifFuJDNtZzKneVWHDgjwKEe5EByuQyJLtEvZ580tO+BY7doQ8bqA=
=dSQf
-----END PGP SIGNATURE-----

--li7XJwhvmQSBT4XjLH1rs0JrDNjFaBEDR--

