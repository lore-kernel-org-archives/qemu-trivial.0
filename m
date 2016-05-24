Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b5Fif-00028s-7v
	for mharc-qemu-trivial@gnu.org; Tue, 24 May 2016 13:02:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39614)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b5FiZ-000242-50
	for qemu-trivial@nongnu.org; Tue, 24 May 2016 13:02:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b5FiY-00040G-4i
	for qemu-trivial@nongnu.org; Tue, 24 May 2016 13:02:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54948)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1b5FiQ-0003xb-0Q; Tue, 24 May 2016 13:01:58 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 51DE78E249;
	Tue, 24 May 2016 17:01:57 +0000 (UTC)
Received: from [10.3.116.141] (ovpn-116-141.phx2.redhat.com [10.3.116.141])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4OH1uXG015211; Tue, 24 May 2016 13:01:56 -0400
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1464103479-26913-1-git-send-email-peter.maydell@linaro.org>
Cc: qemu-trivial@nongnu.org, patches@linaro.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
X-Enigmail-Draft-Status: N1110
Organization: Red Hat, Inc.
Message-ID: <57448904.5070104@redhat.com>
Date: Tue, 24 May 2016 11:01:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1464103479-26913-1-git-send-email-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="TDU6Tuwd3Jj3520wJamECvWkLbM4JtWFJ"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 24 May 2016 17:01:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/4] Remove unnecessary
 glib.h includes
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
X-List-Received-Date: Tue, 24 May 2016 17:02:11 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TDU6Tuwd3Jj3520wJamECvWkLbM4JtWFJ
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05/24/2016 09:24 AM, Peter Maydell wrote:
> This patchset removes '#include <glib.h>' lines, because the
> header is already included via osdep.h.
>=20
> Patch 1 adds the check to clean-includes, and patches 2-4
> apply it (the breakup into 'tests', 'qga' and 'everything else'
> is semi-arbitrary and just to keep patch sizes down.)
>=20
> thanks
> -- PMM
>=20
>=20
> Peter Maydell (4):
>   clean-includes: Add glib.h to list of unneeded includes
>   tests: Remove unnecessary glib.h includes
>   qga: Remove unnecessary glib.h includes
>   all: Remove unnecessary glib.h includes

Series:
Reviewed-by: Eric Blake <eblake@redhat.com>
Tested-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--TDU6Tuwd3Jj3520wJamECvWkLbM4JtWFJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXRIkEAAoJEKeha0olJ0Nqi18H/jGJBpBynjCKrcKeLsBeL/ZG
Gg3xQTiBV6gzfVN9OZfP5k8FlFBTP9e+wrA3wwur85XONXlolEz1gNlbO36SfhZ+
1IgJOIAG75UnePQLyL2+IWBIABbkhTTd7peDSChZw5g8SicixVf8800OmebEj48o
WCybrxPEfVMb8dGHQwydK3Tou+A9biNdIiG9qFaRt4kFnU+QLhYj4znmUSrB8UMg
ajtO5JofyojyQD6ruQscvi8IF1tBLEo5rYlGRh9oNyCAnnkI1m4465DwW2wDOC5/
og0FMoKFr/XfrzPS2PMLfGxITgb/xDDQ6LVUlvFHlN4CgEBgTMGe6jKQv2n5hIg=
=OCPO
-----END PGP SIGNATURE-----

--TDU6Tuwd3Jj3520wJamECvWkLbM4JtWFJ--

