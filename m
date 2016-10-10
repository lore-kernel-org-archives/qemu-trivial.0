Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1btdOO-0002ji-B7
	for mharc-qemu-trivial@gnu.org; Mon, 10 Oct 2016 12:25:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50435)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1btdOM-0002ha-1o
	for qemu-trivial@nongnu.org; Mon, 10 Oct 2016 12:25:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1btdOK-0001Hy-1I
	for qemu-trivial@nongnu.org; Mon, 10 Oct 2016 12:25:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40820)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1btdOD-0001EN-9d; Mon, 10 Oct 2016 12:25:21 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8BA654A54D;
	Mon, 10 Oct 2016 16:25:20 +0000 (UTC)
Received: from [10.3.116.193] (ovpn-116-193.phx2.redhat.com [10.3.116.193])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9AGPJci008847; Mon, 10 Oct 2016 12:25:20 -0400
To: Anand J <anand.indukala@gmail.com>
References: <1475829975-17413-1-git-send-email-anand.indukala@gmail.com>
	<290de67f-8505-fbd7-c2fa-6fbe7ca604eb@redhat.com>
	<CANDALvkty9Q+TR9S=U0jsy1PqEgfwt=vrq7HVE-JA+ymPcXRBw@mail.gmail.com>
	<45036bfe-789a-3f56-4b24-a507b9e9140a@redhat.com>
	<CANDALvmjgU4JERC1e7DaUzzw8C1LonikfpZrwo9DpbiEBdaOxg@mail.gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <84deb988-1a31-c82f-a4d3-5ef8ebfb8dbb@redhat.com>
Date: Mon, 10 Oct 2016 11:25:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CANDALvmjgU4JERC1e7DaUzzw8C1LonikfpZrwo9DpbiEBdaOxg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="k2PPie6nFOXx3BDlKm4JbxCsS6q8VTHsJ"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 10 Oct 2016 16:25:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] clean-up: removed duplicate
 #includes
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
X-List-Received-Date: Mon, 10 Oct 2016 16:25:31 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--k2PPie6nFOXx3BDlKm4JbxCsS6q8VTHsJ
Content-Type: multipart/mixed; boundary="DNSPoM24rCF7jphMJV0Movdog7UciBCif";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Anand J <anand.indukala@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <84deb988-1a31-c82f-a4d3-5ef8ebfb8dbb@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] clean-up: removed duplicate #includes
References: <1475829975-17413-1-git-send-email-anand.indukala@gmail.com>
 <290de67f-8505-fbd7-c2fa-6fbe7ca604eb@redhat.com>
 <CANDALvkty9Q+TR9S=U0jsy1PqEgfwt=vrq7HVE-JA+ymPcXRBw@mail.gmail.com>
 <45036bfe-789a-3f56-4b24-a507b9e9140a@redhat.com>
 <CANDALvmjgU4JERC1e7DaUzzw8C1LonikfpZrwo9DpbiEBdaOxg@mail.gmail.com>
In-Reply-To: <CANDALvmjgU4JERC1e7DaUzzw8C1LonikfpZrwo9DpbiEBdaOxg@mail.gmail.com>

--DNSPoM24rCF7jphMJV0Movdog7UciBCif
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10/09/2016 04:33 AM, Anand J wrote:

>>> grep -r --exclude-dir=3Dbin/ "#include" | sort | uniq -c | awk '{if (=
$1 >
>> 1)
>>> print $2}'
>>
>> Seems simple enough that we ought to make it part of the
>> scripts/clean-includes, rather than remembering to manually run it.
>>
>=20
> scripts/clean-includes does an in place modification of the duplicate
> entries in the files.
> There is no guarantee that my script with return all genuine duplicate
> entries. Some can be false positive as well.

If you don't trust an in-place modification, then maybe it is simple
enough to just make scripts/clean-includes fail with non-zero status and
flag that the files need manual attention, then rerunning the script.
But still, having the script be able to flag the problems, whether or
not it can fix them, is better than making it a comment where no one
remembers to manually run the comment.


--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--DNSPoM24rCF7jphMJV0Movdog7UciBCif--

--k2PPie6nFOXx3BDlKm4JbxCsS6q8VTHsJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJX+8DvAAoJEKeha0olJ0NqPJwH/0s+OQzLMnD6/5VosRZmluKQ
nY6PWB6D+/PtL01C3BIpaeGyCWLNEGhF7saScCKSUJmctPe6GOC2HhPHB904mope
Agp/v9pMWNqtTVYSwH8kpIHmVcGrYsMWwBRx8+fvh+qSaZoUhsehAWxrQkAruN+I
XpSyDJDW68lmOBSm4sETomWhaYBlEzWMqyMBmxF+gdsKe1AuVSAQk+wwQ3sybgW8
lOnwYKJBevb7cRHpbTfSuvROFdVa1bXHB7PMGOphQ8vqVWiUsqQV59wxa0aThze9
8LJ93Zz4k8E2dCcmrjuW9zwwGMuP245mXSKWvRR4w1CJLNCSRlafhYjztpzx398=
=aGLG
-----END PGP SIGNATURE-----

--k2PPie6nFOXx3BDlKm4JbxCsS6q8VTHsJ--

