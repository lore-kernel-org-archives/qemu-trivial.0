Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b5Egs-00036c-9S
	for mharc-qemu-trivial@gnu.org; Tue, 24 May 2016 11:56:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49239)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b5Ego-000337-Nh
	for qemu-trivial@nongnu.org; Tue, 24 May 2016 11:56:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b5Egm-00047i-Ny
	for qemu-trivial@nongnu.org; Tue, 24 May 2016 11:56:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57575)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1b5Egg-00046h-8q; Tue, 24 May 2016 11:56:06 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 22E19C04D30D;
	Tue, 24 May 2016 15:56:05 +0000 (UTC)
Received: from [10.3.116.141] (ovpn-116-141.phx2.redhat.com [10.3.116.141])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4OFu4rM030997; Tue, 24 May 2016 11:56:04 -0400
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1464103558-27051-1-git-send-email-peter.maydell@linaro.org>
Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, patches@linaro.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <57447994.1000802@redhat.com>
Date: Tue, 24 May 2016 09:56:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1464103558-27051-1-git-send-email-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="TjhcUTtcSi7JE7O169FIE0Rx3G2JDfBLL"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 24 May 2016 15:56:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] replay: Clean up includes
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
X-List-Received-Date: Tue, 24 May 2016 15:56:15 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TjhcUTtcSi7JE7O169FIE0Rx3G2JDfBLL
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05/24/2016 09:25 AM, Peter Maydell wrote:
> Clean up includes so that osdep.h is included first and headers
> which it implies are not included manually.
>=20
> This commit was created with scripts/clean-includes.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  replay/replay-char.c | 4 ----
>  1 file changed, 4 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--TjhcUTtcSi7JE7O169FIE0Rx3G2JDfBLL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXRHmUAAoJEKeha0olJ0NqAZ8IAJxxwFTNwcW8uEe8Ti29FGf6
KngPL/UhRI1yHl7fMtZLW9q9+Np3wMf19hH+qKAGNiYaMglSB6WjvUOtcwiKnBLw
QeU7agg7+HS4JwtnFc5dZ0/xdEkUViHgg6U2Zl6aWzWFRAP2g92ZoepRaT/12Vu1
E3BPtH9RylaLRBmZ2GSIhPdgzQERz9MydohlkoTIXqUePQccKGRd+8FjAiIOMRg8
6fteqenRDY+rJ9u25szDzGb0jt1z23MKPS7lgogUXbeEDP5mElmqWl+iMSJZOF+P
DRyso2GBDG9PbW0GMuBhPzP3CJC83wnoQg0hKvWyzFLM+nrzzoOrgCveImlIYTI=
=udhU
-----END PGP SIGNATURE-----

--TjhcUTtcSi7JE7O169FIE0Rx3G2JDfBLL--

