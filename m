Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dK2AH-0002E7-9p
	for mharc-qemu-trivial@gnu.org; Sun, 11 Jun 2017 08:40:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57657)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1dK2AF-0002Cd-E6
	for qemu-trivial@nongnu.org; Sun, 11 Jun 2017 08:40:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1dK2AE-0008F7-Mh
	for qemu-trivial@nongnu.org; Sun, 11 Jun 2017 08:40:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47370)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1dK2A8-0008Cf-CK; Sun, 11 Jun 2017 08:40:12 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4FAC24E02E;
	Sun, 11 Jun 2017 12:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 4FAC24E02E
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=mreitz@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 4FAC24E02E
Received: from dresden.str.redhat.com (ovpn-204-29.brq.redhat.com
	[10.40.204.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 49BB281408;
	Sun, 11 Jun 2017 12:40:06 +0000 (UTC)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: armbru@redhat.com, marcandre.lureau@redhat.com, qemu-trivial@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>,
	"open list:Block layer core" <qemu-block@nongnu.org>
References: <20170609152017.7286-1-eblake@redhat.com>
	<20170609152017.7286-3-eblake@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <e70e065e-cd44-8ba4-d3d4-e3424bf55d5c@redhat.com>
Date: Sun, 11 Jun 2017 14:40:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170609152017.7286-3-eblake@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="R5ohwfxQExukK9Sshh6t8MWwqdlfpvpE8"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Sun, 11 Jun 2017 12:40:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 2/2] qobject: Catch another straggler for
 use of qdict_put_str()
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
X-List-Received-Date: Sun, 11 Jun 2017 12:40:20 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--R5ohwfxQExukK9Sshh6t8MWwqdlfpvpE8
Content-Type: multipart/mixed; boundary="8EnQWAiUvdsc7fi5qdh0UPEWsHMMdAhrh";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: armbru@redhat.com, marcandre.lureau@redhat.com, qemu-trivial@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Message-ID: <e70e065e-cd44-8ba4-d3d4-e3424bf55d5c@redhat.com>
Subject: Re: [PATCH 2/2] qobject: Catch another straggler for use of
 qdict_put_str()
References: <20170609152017.7286-1-eblake@redhat.com>
 <20170609152017.7286-3-eblake@redhat.com>
In-Reply-To: <20170609152017.7286-3-eblake@redhat.com>

--8EnQWAiUvdsc7fi5qdh0UPEWsHMMdAhrh
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2017-06-09 17:20, Eric Blake wrote:
> Dan's addition of key-secret improvements in commit 29cf9336 was
> developed prior to the addition of QDict scalar insertion macros,
> but merged after the general cleanup in commit 46f5ac20.
> Patch created mechanically by rerunning:
>   spatch --sp-file scripts/coccinelle/qobject.cocci \
>          --macro-file scripts/cocci-macro-file.h --dir . --in-place
>=20
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  qemu-img.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


--8EnQWAiUvdsc7fi5qdh0UPEWsHMMdAhrh--

--R5ohwfxQExukK9Sshh6t8MWwqdlfpvpE8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEvBAEBCAAZBQJZPTolEhxtcmVpdHpAcmVkaGF0LmNvbQAKCRD0B9sAYdXPQGbj
B/97WnEnmhZDvhj4S/8+nYnjUrTdqHlu6RazuXknrwwUkMmkP+o3DoxRvEbFd+OZ
CHC2kszL7xGK7sdIKnJrACvJCsg/uc7E1NSeJLEyz0clv3nzljG7Gj8uMoE8j2f9
7bsYVaHSC2SpFVB+G5JefRiwYE7YLuf20gNa+Yn1icetaTUlm9oUiPW00QR7UM6w
zIU6fNTp217UVBXgRuPkLaWJw7Y3aXl5usi4ndZMdwuDXcvvpfqU67ukcv84Jkgl
+XAVcNDRlo5OzIq26vvCblXiOKAN3Jq0zq58Rf6j7/AljyZUba7Z9n8ROiwAttB6
4HoSOxDzjKzHrRBhDkiuLgdz
=3mjw
-----END PGP SIGNATURE-----

--R5ohwfxQExukK9Sshh6t8MWwqdlfpvpE8--

