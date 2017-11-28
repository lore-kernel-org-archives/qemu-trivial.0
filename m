Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eJdSt-0006sf-TR
	for mharc-qemu-trivial@gnu.org; Tue, 28 Nov 2017 05:50:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44226)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1eJdSg-0006jJ-RB
	for qemu-trivial@nongnu.org; Tue, 28 Nov 2017 05:50:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1eJdSg-0008HN-1R
	for qemu-trivial@nongnu.org; Tue, 28 Nov 2017 05:49:58 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59508)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1eJdSZ-0008C7-BN; Tue, 28 Nov 2017 05:49:51 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6A14B13AAA;
	Tue, 28 Nov 2017 10:49:50 +0000 (UTC)
Received: from localhost (unknown [10.36.118.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D99905C549;
	Tue, 28 Nov 2017 10:49:49 +0000 (UTC)
Date: Tue, 28 Nov 2017 10:49:48 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Doug Gale <doug16k@gmail.com>, qemu-devel <qemu-devel@nongnu.org>,
	qemu-block@nongnu.org, Keith Busch <keith.busch@intel.com>,
	pbonzini@redhat.com, Max Reitz <mreitz@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Message-ID: <20171128104948.GF17146@stefanha-x1.localdomain>
References: <20171103133753.20028-1-doug16k@gmail.com>
	<5bf942fe-bd03-7f83-9b01-8469375c98cc@amsat.org>
	<CAEfK_47jhiZAGvF=nfso4P2Pit2CAcgvMLtXHeD5As0aX2FGDQ@mail.gmail.com>
	<CAEfK_47OtZk1Ok-9Bye5MLCCKKQAKKsMQ4Cr2O9kTs+hL_ATLw@mail.gmail.com>
	<20171127115832.GC4903@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QNDPHrPUIc00TOLW"
Content-Disposition: inline
In-Reply-To: <20171127115832.GC4903@localhost.localdomain>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 28 Nov 2017 10:49:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v5] nvme: Add tracing
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
X-List-Received-Date: Tue, 28 Nov 2017 10:50:08 -0000


--QNDPHrPUIc00TOLW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2017 at 12:58:32PM +0100, Kevin Wolf wrote:
> Am 25.11.2017 um 08:08 hat Doug Gale geschrieben:
> > Ping
>=20
> Stefan, do you expect this to go through a different tree than the
> tracing one?

Yes, patches that just add/remove/modify trace events go through the
affected component's tree rather than the tracing tree.

For example, the most recent patch was commit
a2e6ffab97e57f823b6bf15371920c6901bb7cbc ("ioapic/tracing: Remove last
DPRINTFs").  It went through Paolo for the PC chipset tree.

Please take this patch via the nvme -> block tree.

One reason to do it this way is that conflicts happen frequently if
trace events changes go through the tracing tree while there are other
patches queued in your tree.

--QNDPHrPUIc00TOLW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJaHT9MAAoJEJykq7OBq3PIag4IAMgU9MLdcR1XEMy+YWsF3AHP
we/3FZOXZG2ED6tKnWJR4+5by/pOYW/f3QuPjFVYWPmtc8sp1JHi/S6i56Adgdqd
Dm6nKZfvV/JVup59hhwIhlrUYuADAPyqukHy7FbP/+sloCcJ/OOA4gs8ev6dFtCv
yF1Lnz4QOG7CKhLbGEahzn7bk8f5S42g7Jh/yu5BvenQmUVgaiB2N2yrisrxircc
QAVz9YmnKE60luWYhzpJM5gpgIR31MKiE9AB0sp8ailxKEQyGYpHXPc7ctdfs7oo
Nf965RvEHhAbnAAC5y0dmXgY8OziuxUiNokVG+7q4Y2AmoHBj0+iCkXzlBBQcoE=
=o9Xa
-----END PGP SIGNATURE-----

--QNDPHrPUIc00TOLW--

