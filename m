Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iArwI-0005WS-C9
	for mharc-qemu-trivial@gnu.org; Thu, 19 Sep 2019 04:37:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36079)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1iArwC-0005Sq-QB
 for qemu-trivial@nongnu.org; Thu, 19 Sep 2019 04:37:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1iArwA-0000QW-T6
 for qemu-trivial@nongnu.org; Thu, 19 Sep 2019 04:37:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39822)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>)
 id 1iArw6-0000PR-Rw; Thu, 19 Sep 2019 04:37:10 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B112E81DF7;
 Thu, 19 Sep 2019 08:37:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6990A60A9F;
 Thu, 19 Sep 2019 08:37:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BB7071FCC0; Thu, 19 Sep 2019 10:37:08 +0200 (CEST)
Date: Thu, 19 Sep 2019 10:37:08 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: James Le Cuirot <chewi@gentoo.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Message-ID: <20190919083708.mwqjq6qzyemqlxpq@sirius.home.kraxel.org>
References: <20190914145155.19360-1-chewi@gentoo.org>
 <457c3a3c-d1b3-9f73-e156-24add1347e07@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <457c3a3c-d1b3-9f73-e156-24add1347e07@vivier.eu>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Thu, 19 Sep 2019 08:37:09 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] configure: Add xkbcommon configure
 options
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
X-List-Received-Date: Thu, 19 Sep 2019 08:37:18 -0000

On Mon, Sep 16, 2019 at 10:15:15AM +0200, Laurent Vivier wrote:
> Le 14/09/2019 =E0 16:51, James Le Cuirot a =E9crit=A0:
> > This dependency is currently "automagic", which is bad for distributi=
ons.
> >=20
> > Signed-off-by: James Le Cuirot <chewi@gentoo.org>
> > ---
> >  configure | 5 +++++
> >  1 file changed, 5 insertions(+)
> >=20
> > diff --git a/configure b/configure
> > index 30aad233d1..30544f52e6 100755
> > --- a/configure
> > +++ b/configure
> > @@ -1521,6 +1521,10 @@ for opt do
> >    ;;
> >    --disable-libpmem) libpmem=3Dno
> >    ;;
> > +  --enable-xkbcommon) xkbcommon=3Dyes
> > +  ;;
> > +  --disable-xkbcommon) xkbcommon=3Dno
> > +  ;;
> >    *)
> >        echo "ERROR: unknown option $opt"
> >        echo "Try '$0 --help' for more information"
> > @@ -1804,6 +1808,7 @@ disabled with --disable-FEATURE, default is ena=
bled if available:
> >    capstone        capstone disassembler support
> >    debug-mutex     mutex debugging support
> >    libpmem         libpmem support
> > +  xkbcommon       xkbcommon support
> > =20
> >  NOTE: The object files are built at the place where configure is lau=
nched
> >  EOF
> >=20
>=20
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>=20
> cc: Gerd Hoffmann <kraxel@redhat.com>

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

