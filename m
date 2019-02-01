Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gpPPd-0001Dn-TY
	for mharc-qemu-trivial@gnu.org; Thu, 31 Jan 2019 22:22:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44171)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gpPPb-000192-Ui
	for qemu-trivial@nongnu.org; Thu, 31 Jan 2019 22:22:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gpPIr-0000l4-ER
	for qemu-trivial@nongnu.org; Thu, 31 Jan 2019 22:15:42 -0500
Received: from ozlabs.org ([203.11.71.1]:35415)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1gpPIn-0000Ur-T4; Thu, 31 Jan 2019 22:15:39 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
	id 43rMg23phkz9s9G; Fri,  1 Feb 2019 14:15:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1548990926;
	bh=EQ4lgrrv5wbGrDLFTRfCyTRSxJPxeBH6WKCOpDKnZYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q98yGFO1K7n7SkoBMkoGLnijoWj0wT6kHmEY3oxQNGpN4U6ke7C+9X/IlFE9/ulg3
	S1SjDOCbyNxuJx6GtfPI1taqrm4TgV1hFHAsxQH3xlL5EylPhCQOfkjXkYqGaB1La6
	5GL4kymbVcC926cXSAQm2GS0huk26EhIRASBxQuA=
Date: Fri, 1 Feb 2019 12:04:53 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Thomas Huth <thuth@redhat.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	qemu-ppc@nongnu.org, qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Message-ID: <20190201010453.GC26425@umbus.fritz.box>
References: <1548866382-14488-1-git-send-email-thuth@redhat.com>
	<4e8dcc26-7e62-c79d-c354-8ade5db33f26@redhat.com>
	<3c30472b-bc7f-d3cc-cf1f-1e5127205984@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IrhDeMKUP4DT/M7F"
Content-Disposition: inline
In-Reply-To: <3c30472b-bc7f-d3cc-cf1f-1e5127205984@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-trivial] [Qemu-ppc] [Qemu-devel] [PATCH] hw/ppc: Don't
 include m48t59.h if it is not necessary
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
X-List-Received-Date: Fri, 01 Feb 2019 03:22:40 -0000


--IrhDeMKUP4DT/M7F
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 31, 2019 at 03:12:48PM +0100, Thomas Huth wrote:
> On 2019-01-30 18:21, Philippe Mathieu-Daud=E9 wrote:
> > On 1/30/19 5:39 PM, Thomas Huth wrote:
> >> These files don't use anything from m48t59.h, so no need to include
> >> this header here.
> >>
> >> Signed-off-by: Thomas Huth <thuth@redhat.com>
> >> ---
> >>  hw/ppc/mac_newworld.c | 1 -
> >>  hw/ppc/mac_oldworld.c | 1 -
> >>  hw/ppc/ppc.c          | 2 --
> >>  hw/ppc/ppc_booke.c    | 1 -
> >>  4 files changed, 5 deletions(-)
> >>
> >> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> >> index bb19eab..f1c8400 100644
> >> --- a/hw/ppc/mac_newworld.c
> >> +++ b/hw/ppc/mac_newworld.c
> >> @@ -53,7 +53,6 @@
> >>  #include "hw/ppc/mac.h"
> >>  #include "hw/input/adb.h"
> >>  #include "hw/ppc/mac_dbdma.h"
> >> -#include "hw/timer/m48t59.h"
> >>  #include "hw/pci/pci.h"
> >>  #include "net/net.h"
> >>  #include "sysemu/sysemu.h"
> >> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> >> index 817f70e..98d531d 100644
> >> --- a/hw/ppc/mac_oldworld.c
> >> +++ b/hw/ppc/mac_oldworld.c
> >> @@ -30,7 +30,6 @@
> >>  #include "hw/ppc/ppc.h"
> >>  #include "mac.h"
> >>  #include "hw/input/adb.h"
> >> -#include "hw/timer/m48t59.h"
> >>  #include "sysemu/sysemu.h"
> >>  #include "net/net.h"
> >>  #include "hw/isa/isa.h"
> >> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> >> index 98b409f..cffdc39 100644
> >> --- a/hw/ppc/ppc.c
> >> +++ b/hw/ppc/ppc.c
> >> @@ -30,10 +30,8 @@
> >>  #include "qemu/timer.h"
> >>  #include "sysemu/sysemu.h"
> >>  #include "sysemu/cpus.h"
> >> -#include "hw/timer/m48t59.h"
> >>  #include "qemu/log.h"
> >>  #include "qemu/error-report.h"
> >> -#include "hw/loader.h"
> >=20
> > I supposed the "hw/loader.h" change slipped in by mistake.
>=20
> I should have mentioned it in the patch description, I guess. ppc.c also
> compiles without this line, so it can be removed, too.

Fair enough, applied to ppc-for-4.0.

>=20
>  Thomas
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--IrhDeMKUP4DT/M7F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlxTmzUACgkQbDjKyiDZ
s5JzKg//QbZZtlG+qJ5iaImi6MxCDgn5sXPN/AKoJlZIgrG+YRZlWN18LZdkw+i7
oKutmggFO+oMse4JT3doFxk/e2E0ItPX5QAV6HG+VGgnBoMQjIUSDwAP37F3aW6c
1A+WLzmJApZlCI8qxn5AGYxn+m7/mwMVj+hKQVNtLcCPPVZ+WXH02Vi7982AcRaN
QKDp8Ef4aLwNMzg0fwyu6dhnTQggojSO2GLdh39OrBKAeo6s1aOH4T7ZHchDgmbs
lYP2327fPshYyzC+lMq9oysXnzt5ows9Lg5hKTk8U17vMOvfeC4aXR9KHAocNGYQ
i3ouyIYycnWkAq4bLv/FhIgwDRoa7tW02xKi2U1PiOZ1X2bi8WODXcBAXGwxxlhf
Fe/Ro8PcX0dmwrAEnYd3oMg1zd+O+K7/2aYoSgQ6ly3mxHf/usrDqvoboJGvM9DZ
c7IuHs60LhbKnrvKC33pTELTAttMyhvO1lRetPzgYLwrOJ75iqK3uXpPCvE87jn2
8zC+TlT3qZUizoOJvIZ/6ebW6Re7anjqvCfOKRyuiQQVwx75FXptuQf2cx1zUL2w
nrBizo52Cf4AxLgEJxEIO6peT14HVP3Tk8HevbOXicF56PrRJCB9Sme5nctzD5kT
MYyp8Xb/53PSNaXeFVtsdlneqdYn3WBeuEfTXEltenGXcOG143c=
=QQ6+
-----END PGP SIGNATURE-----

--IrhDeMKUP4DT/M7F--

