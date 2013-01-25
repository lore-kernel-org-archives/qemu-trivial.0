Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TylOl-0004kp-BI
	for mharc-qemu-trivial@gnu.org; Fri, 25 Jan 2013 10:40:59 -0500
Received: from eggs.gnu.org ([208.118.235.92]:53099)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1TylOe-0004gZ-5k
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2013 10:40:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1TylOW-00075C-HN
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2013 10:40:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:18112)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1TylOW-000751-7t; Fri, 25 Jan 2013 10:40:44 -0500
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0PFeh8m002282
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 25 Jan 2013 10:40:43 -0500
Received: from [10.3.113.27] (ovpn-113-27.phx2.redhat.com [10.3.113.27])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r0PFegZj028317; Fri, 25 Jan 2013 10:40:43 -0500
Message-ID: <5102A77A.6070508@redhat.com>
Date: Fri, 25 Jan 2013 08:40:42 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Michal Privoznik <mprivozn@redhat.com>
References: <ef9bb01f7a2cd566bcdc10f19dc0881818754c4e.1359120428.git.mprivozn@redhat.com>
	<87zjzx2wpp.fsf@blackfin.pond.sub.org> <510291AE.6@redhat.com>
In-Reply-To: <510291AE.6@redhat.com>
X-Enigmail-Version: 1.5.0
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="----enig2NCWLXCAQDGHCRRAPGWSN"
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qmp-commands.hx:
 s/tray-open/tray_open/ to match qapi schema
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jan 2013 15:40:58 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2NCWLXCAQDGHCRRAPGWSN
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 01/25/2013 07:07 AM, Michal Privoznik wrote:
> On 25.01.2013 14:55, Markus Armbruster wrote:
>> Michal Privoznik <mprivozn@redhat.com> writes:
>>
>>> Currently, we are using 'tray_open' in QMP and 'tray-open' in
>>> HMP. However, the QMP documentation was mistakenly using the
>>> HMP version.
>>
>> Could you point me to where we're using "tray_open"?
>>
>=20
> qemu.git $ git grep -npC8 tray_open qapi-schema.json
>=20

> qapi-schema.json-705-{ 'type': 'BlockInfo',
> qapi-schema.json-706-  'data': {'device': 'str', 'type': 'str', 'remova=
ble': 'bool',
> qapi-schema.json-707-           'locked': 'bool', '*inserted': 'BlockDe=
viceInfo',
> qapi-schema.json:708:           '*tray_open': 'bool', '*io-status': 'Bl=
ockDeviceIoStatus',
> qapi-schema.json-709-           '*dirty': 'BlockDirtyInfo' } }

And since existing qemu versions output tray_open, we would be breaking
API if we fixed the QMP to return tray-open (libvirt could cope with
that API break by checking both spellings, but that feels dirty).

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


------enig2NCWLXCAQDGHCRRAPGWSN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJRAqd6AAoJEKeha0olJ0NqacEH/2wP4xwLIBvodzBCYpEhPqy/
b0AjPkOqe03tQcJnL+6teG+T979XNmCk1xQqPAjRY9iecGZq9wffhdYN4SuGCoaI
XcgNPMMwUTsISBRTRgYaHwKgnhI6DwUz+HB7nOuOVcmCYHTODyKDOhw8hrNFmThz
n+uxXWt74ZZZnXy6TPyi7p7eHdwyphShUp+ZViqXP6cvFDILg0wcrWT4ymT1Mbg1
2RoYdmkEUOLCfavZXfzvfswXZ6/Vl2BUpyMLM/gQkjcddOEVoARFcZKgC4+F9UjY
4qIyAfhhxT7HVUwLeEHv/fN3bWyBAlFM/b9SBCjGref18wRhx0tbck4WUcm7opY=
=8f36
-----END PGP SIGNATURE-----

------enig2NCWLXCAQDGHCRRAPGWSN--

