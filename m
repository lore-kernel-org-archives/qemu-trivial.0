Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TynmG-0002k0-Uv
	for mharc-qemu-trivial@gnu.org; Fri, 25 Jan 2013 13:13:24 -0500
Received: from eggs.gnu.org ([208.118.235.92]:55970)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1TynmA-0002hb-Uy
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2013 13:13:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Tynm5-0005OW-3F
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2013 13:13:18 -0500
Received: from mx1.redhat.com ([209.132.183.28]:4828)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1Tynm4-0005O2-Qb; Fri, 25 Jan 2013 13:13:13 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0PIDB7J022095
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 25 Jan 2013 13:13:11 -0500
Received: from [10.3.113.27] (ovpn-113-27.phx2.redhat.com [10.3.113.27])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r0PIDA4n026826; Fri, 25 Jan 2013 13:13:11 -0500
Message-ID: <5102CB36.30204@redhat.com>
Date: Fri, 25 Jan 2013 11:13:10 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Vishvananda Ishaya <vishvananda@gmail.com>
References: <1359050440-52511-1-git-send-email-vishvananda@gmail.com>
	<51024DE2.907@redhat.com>
	<DAF889AE-060E-4C05-BC98-FC4AF47CAAAF@gmail.com>
In-Reply-To: <DAF889AE-060E-4C05-BC98-FC4AF47CAAAF@gmail.com>
X-Enigmail-Version: 1.5.0
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="----enig2AAAAHFJMAOGKMXJKKKHB"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block: Create proper size
 file for disk mirror
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
X-List-Received-Date: Fri, 25 Jan 2013 18:13:24 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2AAAAHFJMAOGKMXJKKKHB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 01/25/2013 11:10 AM, Vishvananda Ishaya wrote:
>=20
> On Jan 25, 2013, at 1:18 AM, Kevin Wolf <kwolf@redhat.com> wrote:
>=20
>> Am 24.01.2013 19:00, schrieb Vishvananda Ishaya:
>>> The qmp monitor command to mirror a disk was passing -1 for size
>>> along with the disk's backing file. This size of the resulting disk
>>> is the size of the backing file, which is incorrect if the disk
>>> has been resized. Therefore we should always pass in the size of
>>> the current disk.
>>>
>>> Signed-off-by: Vishvananda Ishaya <vishvananda@gmail.com>
>>
>> Thanks, applied to the block branch.
>>
>> Can you send a qemu-iotests test case that tests this condition?
>> (Probably best as an extension to case 041)
>=20
> I have a test for this. Would you like it as a separate patch or
> should i respin the original?

Since the original has already been applied to the block branch, you are
best off sending a separate patch for the test addition.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


------enig2AAAAHFJMAOGKMXJKKKHB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJRAss2AAoJEKeha0olJ0NqaVwH/1q9A2X4Febh1GPgbeIDg1N/
dT7WPGRzk8W2YdekbiJPJziFkpto7xOQcJFCpAL6kX/qEpCgCxp4uuehZhcEq9aw
w6PHN2pTaAvfGT3RINkoNYxGZUrq8QfnKH9imiXwwNHj5HioSyqdUhPTxkK0b8pc
hzxgWl8+nEn5HWAmf5necNgvY7V2uqp+J01BTYh/rP9/fvfj0lWk3E1niqAczF1a
SP2PVAwvs3aaImQEzWXXJPNVr6879Yhzlli6PARCCjM/dOLh8LW7mILRPCfH3N1c
oORFwIDHx1Avt7Sib4x6dEmG1+Xh+R0MbI0eG7BWLBW8ti8vbxKwRMeQcI3X/gs=
=wTZ+
-----END PGP SIGNATURE-----

------enig2AAAAHFJMAOGKMXJKKKHB--

