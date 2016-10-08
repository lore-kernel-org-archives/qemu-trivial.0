Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bszGo-0006wf-TC
	for mharc-qemu-trivial@gnu.org; Sat, 08 Oct 2016 17:35:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34887)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bszGl-0006vC-P8
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 17:35:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bszGk-00013i-Hs
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 17:34:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33724)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1bszGc-0000wz-Uo; Sat, 08 Oct 2016 17:34:51 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8EE197D0E1;
	Sat,  8 Oct 2016 21:34:48 +0000 (UTC)
Received: from [10.3.116.21] (ovpn-116-21.phx2.redhat.com [10.3.116.21])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u98LYleX009797; Sat, 8 Oct 2016 17:34:48 -0400
To: Anand J <anand.indukala@gmail.com>
References: <1475829975-17413-1-git-send-email-anand.indukala@gmail.com>
	<290de67f-8505-fbd7-c2fa-6fbe7ca604eb@redhat.com>
	<CANDALvkty9Q+TR9S=U0jsy1PqEgfwt=vrq7HVE-JA+ymPcXRBw@mail.gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <45036bfe-789a-3f56-4b24-a507b9e9140a@redhat.com>
Date: Sat, 8 Oct 2016 16:34:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CANDALvkty9Q+TR9S=U0jsy1PqEgfwt=vrq7HVE-JA+ymPcXRBw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="WAE5GoRI3KJB8hhXUBu4cbIsT21JaervJ"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Sat, 08 Oct 2016 21:34:48 +0000 (UTC)
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
X-List-Received-Date: Sat, 08 Oct 2016 21:35:01 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WAE5GoRI3KJB8hhXUBu4cbIsT21JaervJ
Content-Type: multipart/mixed; boundary="U1icsqI6upuq12TCHdDlGSoiliNW0SRGO";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Anand J <anand.indukala@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <45036bfe-789a-3f56-4b24-a507b9e9140a@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] clean-up: removed duplicate #includes
References: <1475829975-17413-1-git-send-email-anand.indukala@gmail.com>
 <290de67f-8505-fbd7-c2fa-6fbe7ca604eb@redhat.com>
 <CANDALvkty9Q+TR9S=U0jsy1PqEgfwt=vrq7HVE-JA+ymPcXRBw@mail.gmail.com>
In-Reply-To: <CANDALvkty9Q+TR9S=U0jsy1PqEgfwt=vrq7HVE-JA+ymPcXRBw@mail.gmail.com>

--U1icsqI6upuq12TCHdDlGSoiliNW0SRGO
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10/08/2016 06:32 AM, Anand J wrote:
> I have replied for the questions inline. Also I'll make changes to the
> patch as per the review and send the updated one.
>=20
> Thanks,
> Anand
>=20
> On Fri, Oct 7, 2016 at 8:01 PM, Eric Blake <eblake@redhat.com> wrote:
>=20
>> On 10/07/2016 03:46 AM, Anand J wrote:
>>> Some files contain multiple #includes of the same header file.
>>> Removed most of those unnecessary duplicate entries.
>>
>> How did you find these? Is it a repeatable formula for rerunning a yea=
r
>> from now to find new culprits?  If so, listing it in the commit messag=
e
>> would be worthwhile.  Is it something we should add to
>> scripts/clean-includes?
>>
> I executed the following bash script to get multiple occurrences of
> #includes and manually checked each and every file from the output.
>=20
> grep -r --exclude-dir=3Dbin/ "#include" | sort | uniq -c | awk '{if ($1=
 > 1)
> print $2}'

Seems simple enough that we ought to make it part of the
scripts/clean-includes, rather than remembering to manually run it.

>=20
> But there are lot of noise in the output of this command. Most of the
> multiple #includes were not genuine issue. @Eric Do you want me to add =
this
> in the comment?

Yes - whatever we end up with (whether a manual script or a run of
scripts/clean-includes), documenting the process used makes it easier to
verify that you didn't miss anything, and for someone else to repeat the
process in another year when some mistakes have crept back in during the
meantime.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--U1icsqI6upuq12TCHdDlGSoiliNW0SRGO--

--WAE5GoRI3KJB8hhXUBu4cbIsT21JaervJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJX+WZ3AAoJEKeha0olJ0Nqmq4H/3ujTRwfwckw8pgezCuHY4l3
faXGDltpPrgA7zGlNvNAddfqg1TQrBP0v5Atf/Ez+AY/AI1JLCO9p6yjT6zVjaRE
XRl2TOavn0uM+IXVozQ7e/vM1wYv8xQLiRkOXgplKfZiEZ6OXF8EnXOwz/hkrblm
xMZ3xjcr6MDHYHXX7S0EwBL1BQQt3c/xPcKWb93+WKLM8TxLg/aTaYUMrY36iQde
EYLhCCP8bZ3zMVEJsVwzhFYUYK2G/pgN9y70aY+v2nQDlpObd53aBDkRwvufCf5v
UTzBmwWvlN4Fq8sUBuoHh3iCAb9Skm817MP2JosbPolpOzo7PCD7tzDVBTQ2AyI=
=BYqt
-----END PGP SIGNATURE-----

--WAE5GoRI3KJB8hhXUBu4cbIsT21JaervJ--

