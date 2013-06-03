Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjSak-0004RI-6m
	for mharc-qemu-trivial@gnu.org; Mon, 03 Jun 2013 07:06:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58172)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Thomas_Schwinge@mentor.com>) id 1UjSad-0004Iy-9r
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 07:06:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Thomas_Schwinge@mentor.com>) id 1UjSaX-0001nm-QZ
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 07:06:15 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:54511)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Thomas_Schwinge@mentor.com>)
	id 1UjSaX-0001nV-KS; Mon, 03 Jun 2013 07:06:09 -0400
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1UjSaP-00078P-Gg from Thomas_Schwinge@mentor.com ;
	Mon, 03 Jun 2013 04:06:01 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 3 Jun 2013 04:06:01 -0700
Received: from feldtkeller.schwinge.homeip.net (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.2.247.3; Mon, 3 Jun 2013 12:05:59 +0100
From: Thomas Schwinge <thomas@codesourcery.com>
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA86uj7Er+1QadznCfTTEmDGK0NqVrWmvE365zNV1=j=3w@mail.gmail.com>
References: <1369993154-17690-1-git-send-email-thomas@codesourcery.com>
	<51A89273.8010400@msgid.tls.msk.ru>
	<CAFEAcA9LomV1rkJPPctUgxG0aJzCHiGr6VYSsSmaGytvQv9hUQ@mail.gmail.com>
	<87ppw7fgmh.fsf@schwinge.name>
	<CAFEAcA86uj7Er+1QadznCfTTEmDGK0NqVrWmvE365zNV1=j=3w@mail.gmail.com>
User-Agent: Notmuch/0.9-101-g81dad07 (http://notmuchmail.org) Emacs/23.4.1
	(x86_64-pc-linux-gnu)
Date: Mon, 3 Jun 2013 13:05:50 +0200
Message-ID: <87k3mbfo8h.fsf@schwinge.name>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg=pgp-sha1;
	protocol="application/pgp-signature"
X-OriginalArrivalTime: 03 Jun 2013 11:06:01.0418 (UTC)
	FILETIME=[553C3AA0:01CE604A]
X-detected-operating-system: by eggs.gnu.org: Windows NT kernel [generic]
	[fuzzy]
X-Received-From: 192.94.38.131
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] fpu: Simplify
	floatx80ToCommonNaN function.
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
X-List-Received-Date: Mon, 03 Jun 2013 11:06:19 -0000

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi!

On Fri, 31 May 2013 15:45:55 +0100, Peter Maydell <peter.maydell@linaro.org=
> wrote:
> On 31 May 2013 14:01, Thomas Schwinge <thomas@codesourcery.com> wrote:
> > On Fri, 31 May 2013 13:34:12 +0100, Peter Maydell <peter.maydell@linaro=
.org> wrote:
> >> That said, I think any new patches to fpu/ need to
> >> come with an explicit statement that they can be
> >> licensed under the softfloat-2a license or GPLv2
> >> or BSD (etc etc) so they aren't an obstacle to
> >> the softfloat-2a-to-2b conversion that is in the works.
> >> [cc'd Anthony so he can correct me if I'm wrong.]
> >
> > I hereby place this one contribution (which I think wouldn't constitute=
 a
> > copyrightable change anyway) into the Public Domain, allowing any kind =
of
> > usage.
>=20
> I think we'd generally suggest creative commons CC0 as being
> in less of a legally grey area internationally than "public
> domain", if you're happy with that.

Using Creative Commons' CC0 is likewise fine.

> Either way,
>=20
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Thanks.


Oh, and as I saw you wondering in the QEMU IRC channel, why I had
bothered with this change anyway, the reason is that I have some further
SoftFloat changes forthcoming, and in the course of these stumbled over
that oddity in the floatx80ToCommonNaN function, and already submitted
that one separately asnot related to my other changes.


Gr=C3=BC=C3=9Fe,
 Thomas

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJRrHiOAAoJENuKOtuXzphJKzAH+gOFy1MU8U6CIBDh2guwGtms
5YQoj1RD3+AOPwQKbmg74bS8suXI3eUBJLMxjiQfJ9xfWKhrk+SBIZ694i122z81
6SqkzzUn3PRFra5jwvfx2WR6anpaqR/9g414QBBLOkO2uvchFOcHItRHxhVP1LUV
PhDshVEs0CWOTIWu7JU/1c3SXsaq6supl3XZzGM1+wfN/zIkpoSnT5tS/YNbMsWS
FvzPvfsviCwHnaiTX3Zyll/q6upiM5Q6YHqOf9Wvz4vjr24HBpQ7NfNr/olJxg8G
pfiTNpQPKAbnPKZYqz/F0s2m3Xz3GyzQv+LeoEghuUBiNByiHBWRMfPZSfvb6bM=
=Aa+a
-----END PGP SIGNATURE-----
--=-=-=--

