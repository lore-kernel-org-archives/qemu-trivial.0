Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bHv5y-0000PQ-FF
	for mharc-qemu-trivial@gnu.org; Tue, 28 Jun 2016 11:38:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51484)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bHv5v-0000Mk-Vi
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 11:38:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bHv5v-0001Qi-17
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 11:38:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35555)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1bHv5p-0001LH-Nw; Tue, 28 Jun 2016 11:38:29 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4BB6A3B3F9;
	Tue, 28 Jun 2016 15:38:29 +0000 (UTC)
Received: from [10.3.116.72] (ovpn-116-72.phx2.redhat.com [10.3.116.72])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5SFcS2D027999; Tue, 28 Jun 2016 11:38:29 -0400
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1467125451-16700-1-git-send-email-peter.maydell@linaro.org>
	<1467125451-16700-5-git-send-email-peter.maydell@linaro.org>
Cc: patches@linaro.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <577299F4.9080106@redhat.com>
Date: Tue, 28 Jun 2016 09:38:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1467125451-16700-5-git-send-email-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="NUUCHVNcCtAapkV2fFv2Rx1KO4p2uaJfh"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 28 Jun 2016 15:38:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 4/6] bswap.h: Remove unused
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
X-List-Received-Date: Tue, 28 Jun 2016 15:38:37 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--NUUCHVNcCtAapkV2fFv2Rx1KO4p2uaJfh
Content-Type: multipart/mixed; boundary="VnRC6Ht1s1OAtVFAHeRRfmJgmNxfLWALC"
From: Eric Blake <eblake@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: patches@linaro.org
Message-ID: <577299F4.9080106@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 4/6] bswap.h: Remove unused cpu_to_*w() and
 *_to_cpup()
References: <1467125451-16700-1-git-send-email-peter.maydell@linaro.org>
 <1467125451-16700-5-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1467125451-16700-5-git-send-email-peter.maydell@linaro.org>

--VnRC6Ht1s1OAtVFAHeRRfmJgmNxfLWALC
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 06/28/2016 08:50 AM, Peter Maydell wrote:
> Now that all uses of cpu_to_*w() and *_to_cpup() have been replaced
> with either ld*_p()/st*_p() or by doing direct dereferences and
> using the cpu_to_*()/*_to_cpu() byteswap functions, we can remove
> the unused implementations.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/qemu/bswap.h | 10 ----------
>  1 file changed, 10 deletions(-)
>=20

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--VnRC6Ht1s1OAtVFAHeRRfmJgmNxfLWALC--

--NUUCHVNcCtAapkV2fFv2Rx1KO4p2uaJfh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXcpn0AAoJEKeha0olJ0NqPKsH/3mYG+f3VEUlP/ck2y/7sbmq
GEjxPMNqcNKQYmWjtBPKxOZLlK+g3yAsdIpTI4j5t4mH1gm4LyQmY85t9KMCimJA
ms8IjxTPcLw1vBj3CrvSeNZyGhZe8ZuzAv/D0q8X3TdfWQOfMriCOja+RCepNJwA
3WSJVSARrV/M4dfXnnKJFI/WLjd8ToY+AS9OkKkz1xuVAYUbjvzlY24qLSzhNcTB
e8zoO/uDElTRBtUgIRE3QoSGdm873GKWk8c33lmYwjpwjFrLJSnmI5XQC9CjOZst
4bu0xkICGJ7sqchIZBS6Uf4Fg0X5RtfhZoYQitB3nZiSQE4NzvAmPKOgTMWJ7N4=
=cjrx
-----END PGP SIGNATURE-----

--NUUCHVNcCtAapkV2fFv2Rx1KO4p2uaJfh--

