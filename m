Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bHuvS-0000WN-1k
	for mharc-qemu-trivial@gnu.org; Tue, 28 Jun 2016 11:27:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47495)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bHuvN-0000R7-0N
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 11:27:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bHuvJ-0006ig-3y
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 11:27:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41221)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1bHuvB-0006hz-Vv; Tue, 28 Jun 2016 11:27:30 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 801D7C05FBD6;
	Tue, 28 Jun 2016 15:27:29 +0000 (UTC)
Received: from [10.3.116.72] (ovpn-116-72.phx2.redhat.com [10.3.116.72])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5SFRTMm012778; Tue, 28 Jun 2016 11:27:29 -0400
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1467125451-16700-1-git-send-email-peter.maydell@linaro.org>
	<1467125451-16700-4-git-send-email-peter.maydell@linaro.org>
Cc: patches@linaro.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <57729760.6030603@redhat.com>
Date: Tue, 28 Jun 2016 09:27:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1467125451-16700-4-git-send-email-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="JJgrImbiXt6DFfG7ukVEkVeE5nCbD4BUg"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 28 Jun 2016 15:27:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 3/6] hw/bt: Don't use
 cpu_to_*w() and *_to_cpup()
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
X-List-Received-Date: Tue, 28 Jun 2016 15:27:44 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JJgrImbiXt6DFfG7ukVEkVeE5nCbD4BUg
Content-Type: multipart/mixed; boundary="G0uW1kcIeQMKCVafh7ICiRjFcBDWw9Gx6"
From: Eric Blake <eblake@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: patches@linaro.org
Message-ID: <57729760.6030603@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 3/6] hw/bt: Don't use cpu_to_*w() and
 *_to_cpup()
References: <1467125451-16700-1-git-send-email-peter.maydell@linaro.org>
 <1467125451-16700-4-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1467125451-16700-4-git-send-email-peter.maydell@linaro.org>

--G0uW1kcIeQMKCVafh7ICiRjFcBDWw9Gx6
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 06/28/2016 08:50 AM, Peter Maydell wrote:
> Don't use cpu_to_*w() and *_to_cpup() to do byte-swapped loads
> and stores; instead use ld*_p() and st*_p() which correctly handle
> misaligned accesses.
>=20
> Bring the HNDL() macro into line with how we deal with
> PARAMHANDLE(), by using cpu_to_le16() rather than an ifdef
> HOST_WORDS_BIGENDIAN.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/bt/hci.c   | 10 +++-------
>  hw/bt/l2cap.c | 12 ++++++------
>  2 files changed, 9 insertions(+), 13 deletions(-)
>=20

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--G0uW1kcIeQMKCVafh7ICiRjFcBDWw9Gx6--

--JJgrImbiXt6DFfG7ukVEkVeE5nCbD4BUg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXcpdgAAoJEKeha0olJ0NqqVcH/AgBqh9r0NAia7GYHt+LE7t/
UAbe7ipKT2clqiqzfIJXwpyUZnuulyqjmew5OasAO4MGI3esdw4RXgrqrx2VWAKq
+z7RDXv8POwaUsXqDnREUhvnXhEUVLtV8g0mVkHhGzXHIv+gEdOMlGw2z6rVDcvy
AGf7XzNH0+Cx8oBMYvweosxi79Y2QjbAlE/Ku5vnGmVtTkxpwjFvXeNAhkewknFr
w1cecoBePpHFcG3u5qM6QiC197XjmaLXfp9vWMW5ro/yjZF5Mo2DYJShZrDjn2Qe
MB3OGD4LRVWnXHwZ60S258UHOVuLYG8HyW0z8aWFIUNW6jAW6JM4HeHQCd8DrUg=
=vLKD
-----END PGP SIGNATURE-----

--JJgrImbiXt6DFfG7ukVEkVeE5nCbD4BUg--

