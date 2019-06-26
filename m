Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgAtB-00070Z-DJ
	for mharc-qemu-trivial@gnu.org; Wed, 26 Jun 2019 12:35:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59149)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <groug@kaod.org>) id 1hgAt7-0006v7-VH
 for qemu-trivial@nongnu.org; Wed, 26 Jun 2019 12:35:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1hgAt5-0002ZR-R8
 for qemu-trivial@nongnu.org; Wed, 26 Jun 2019 12:35:13 -0400
Received: from 5.mo173.mail-out.ovh.net ([46.105.40.148]:41087)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1hgAt1-00027F-N3
 for qemu-trivial@nongnu.org; Wed, 26 Jun 2019 12:35:11 -0400
Received: from player792.ha.ovh.net (unknown [10.109.146.20])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id DE1ED10F65C
 for <qemu-trivial@nongnu.org>; Wed, 26 Jun 2019 18:34:56 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player792.ha.ovh.net (Postfix) with ESMTPSA id CF6DE75CB61F;
 Wed, 26 Jun 2019 16:34:48 +0000 (UTC)
Date: Wed, 26 Jun 2019 18:34:47 +0200
From: Greg Kurz <groug@kaod.org>
To: Laurent Vivier <laurent@vivier.eu>
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony Perard
 <anthony.perard@citrix.com>, QEMU Trivial <qemu-trivial@nongnu.org>, Paul
 Durrant <Paul.Durrant@citrix.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Message-ID: <20190626183447.1c4cb4c3@bahia.lan>
In-Reply-To: <ca73d533-644b-a366-2927-4163f9aa2ce9@vivier.eu>
References: <155912548463.2019004.3515830305299809902.stgit@bahia.lan>
 <20190529125926.GD2126@perard.uk.xensource.com>
 <20190605121056.0e784daf@bahia.lab.toulouse-stg.fr.ibm.com>
 <c85d973ca2d444678e8fdc86a4cd6f4f@AMSPEX02CL03.citrite.net>
 <20190614101621.098742e2@bahia.lan>
 <c2c63dd46c684b1bb0f2e342a085d93d@AMSPEX02CL03.citrite.net>
 <alpine.DEB.2.21.1906140844150.2072@sstabellini-ThinkPad-T480s>
 <20190614185054.6f12ab30@bahia.lan>
 <b40f16eb-5ae5-4b36-e0a8-02b10c3b7769@redhat.com>
 <ca73d533-644b-a366-2927-4163f9aa2ce9@vivier.eu>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 11434639454646016472
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudeigddutdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.40.148
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] MAINTAINERS: Change
 maintership of Xen code under hw/9pfs
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Jun 2019 16:35:16 -0000

On Wed, 26 Jun 2019 18:30:47 +0200
Laurent Vivier <laurent@vivier.eu> wrote:

> Le 15/06/2019 =C3=A0 07:43, Philippe Mathieu-Daud=C3=A9 a =C3=A9crit=C2=
=A0:
> > Cc'ing qemu-trivial@
> >=20
> > On 6/14/19 6:50 PM, Greg Kurz wrote:
> > [...] =20
> >> Markus, Xen maintainers,
> >>
> >> All needed Acked-by have been provided. I don't plan to send a 9pfs PR
> >> anytime soon. Can this go through someone else's tree please ?
> >>
> >> Cheers,
> >>
> >> --
> >> Greg
> >> =20
> >  =20
>=20
> Applied to my trivial-patches branch.
>=20
> Thanks,
> Laurent

Merci Laurent ! :)

Cheers,

--
Greg

