Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bn3jY-0001Xk-GM
	for mharc-qemu-trivial@gnu.org; Thu, 22 Sep 2016 09:08:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38699)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bn3jR-0001Rf-V6
	for qemu-trivial@nongnu.org; Thu, 22 Sep 2016 09:08:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bn3jN-00050H-6l
	for qemu-trivial@nongnu.org; Thu, 22 Sep 2016 09:08:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52558)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1bn3jC-0004vH-D0; Thu, 22 Sep 2016 09:07:50 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BF5679F724;
	Thu, 22 Sep 2016 13:07:49 +0000 (UTC)
Received: from [10.3.116.58] (ovpn-116-58.phx2.redhat.com [10.3.116.58])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8MD7mCp020712; Thu, 22 Sep 2016 09:07:48 -0400
To: David Anderson <dave@natulte.net>, qemu-devel@nongnu.org
References: <20160922040019.19165-1-dave@natulte.net>
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <dcfeabcb-bfb5-b184-0842-b3413889eb56@redhat.com>
Date: Thu, 22 Sep 2016 08:07:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <20160922040019.19165-1-dave@natulte.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="b0FE21wRnEf1ipANqJpDHIjBa2Fx1JpKc"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 22 Sep 2016 13:07:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qapi: make the json schema
 files more regular.
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
X-List-Received-Date: Thu, 22 Sep 2016 13:08:10 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--b0FE21wRnEf1ipANqJpDHIjBa2Fx1JpKc
Content-Type: multipart/mixed; boundary="nl3q4aSG2gkAQWug4PAGQsndwLqMQXVAm";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: David Anderson <dave@natulte.net>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Message-ID: <dcfeabcb-bfb5-b184-0842-b3413889eb56@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] qapi: make the json schema files more
 regular.
References: <20160922040019.19165-1-dave@natulte.net>
In-Reply-To: <20160922040019.19165-1-dave@natulte.net>

--nl3q4aSG2gkAQWug4PAGQsndwLqMQXVAm
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 09/21/2016 11:00 PM, David Anderson wrote:
> This makes it easier to parse the schema file for tool generation:
> each paragraph is either a non-docstring comment, or a docstring
> immediately followed by a Python dict describing an API item.
>=20
> Signed-off-by: David Anderson <dave@natulte.net>
> ---
>  qapi-schema.json     | 3 +--
>  qapi/block-core.json | 5 -----
>  2 files changed, 1 insertion(+), 7 deletions(-)

Related to the work Marc-Andre is already doing, but fine to take now.

Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
> diff --git a/qapi-schema.json b/qapi-schema.json
> index e507061..edd803f 100644
> --- a/qapi-schema.json
> +++ b/qapi-schema.json
> @@ -752,6 +752,7 @@
>              'cpu-throttle-increment': 'int',
>              'tls-creds': 'str',
>              'tls-hostname': 'str'} }
> +
>  ##
>  # @query-migrate-parameters
>  #
> @@ -4115,7 +4116,6 @@
>  #
>  # Since 1.6
>  ##
> -
>  { 'struct': 'RxFilterInfo',
>    'data': {
>      'name':               'str',
> @@ -4335,7 +4335,6 @@
>  #
>  # Since: 2.1
>  ##
> -
>  { 'struct': 'Memdev',
>    'data': {
>      'size':       'size',
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 24223fd..e12fbd3 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -25,7 +25,6 @@
>  # Since: 1.3
>  #
>  ##
> -
>  { 'struct': 'SnapshotInfo',
>    'data': { 'id': 'str', 'name': 'str', 'vm-state-size': 'int',
>              'date-sec': 'int', 'date-nsec': 'int',
> @@ -81,7 +80,6 @@
>  #
>  # Since: 1.7
>  ##
> -
>  { 'union': 'ImageInfoSpecific',
>    'data': {
>        'qcow2': 'ImageInfoSpecificQCow2',
> @@ -129,7 +127,6 @@
>  # Since: 1.3
>  #
>  ##
> -
>  { 'struct': 'ImageInfo',
>    'data': {'filename': 'str', 'format': 'str', '*dirty-flag': 'bool',
>             '*actual-size': 'int', 'virtual-size': 'int',
> @@ -181,7 +178,6 @@
>  # Since: 1.4
>  #
>  ##
> -
>  { 'struct': 'ImageCheck',
>    'data': {'filename': 'str', 'format': 'str', 'check-errors': 'int',
>             '*image-end-offset': 'int', '*corruptions': 'int', '*leaks'=
: 'int',
> @@ -518,7 +514,6 @@
>  #
>  # Since: 2.5
>  ##
> -
>  { 'struct': 'BlockDeviceTimedStats',
>    'data': { 'interval_length': 'int', 'min_rd_latency_ns': 'int',
>              'max_rd_latency_ns': 'int', 'avg_rd_latency_ns': 'int',
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--nl3q4aSG2gkAQWug4PAGQsndwLqMQXVAm--

--b0FE21wRnEf1ipANqJpDHIjBa2Fx1JpKc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJX49ekAAoJEKeha0olJ0NqdUIH/i0Os25+/P0SN8XhJklIKGqW
xDu0/KIVQcwDk6WPZUJ0qvQXk3bmn7m+qJ2PfKfMxztMhYvdo3OO2SeF4ZzHXCjf
OvLZIEhlwjH8gKpFCPEDaBnAYaoQ42mIvifJ0EIStnSRFcPW4MbGXCbiVcnuUEwn
SoAntbZP+obU1TwgXku64yZwNRPYo2l8fEiRFcVKRgs8axVL1txDmG2aRubQ8wab
W1lRgEVrwxDbEtpF8n9Ge0ALH6dqJVpKtIQSblOAMnjIXqVnljP5Qb7+NomOyQMZ
KY3SEfyieSTBisKPgNohjqyvR3YpjxPsUCeSBc336KmKc3fYYSbySqUKjaEwBS8=
=19FL
-----END PGP SIGNATURE-----

--b0FE21wRnEf1ipANqJpDHIjBa2Fx1JpKc--

