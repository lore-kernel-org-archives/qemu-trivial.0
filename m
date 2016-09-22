Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bmrif-0007mY-Og
	for mharc-qemu-trivial@gnu.org; Wed, 21 Sep 2016 20:18:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bmria-0007gl-VP
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2016 20:18:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bmriY-0002u2-KV
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2016 20:18:23 -0400
Received: from ozlabs.org ([103.22.144.67]:52839)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1bmriP-0002r0-5p; Wed, 21 Sep 2016 20:18:13 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3sfcWn6t6Vz9sD6; Thu, 22 Sep 2016 10:17:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1474503461;
	bh=f55YFZ3Hm+TKuXaN9XpjzezKIzUQgfGkRJoxWIsxw4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XC4uhFRY3nCObEwwEA8PKOrgfCY/Atprgn9vms/u0jAQVe400E5kxw6AuVXmPXdq9
	GeqlEDu0jcsCaHk3KdiO5z3n3dhe2iyjbEC3YP4j3k3TacWGB7Mu2aGarjpZfKNzVZ
	jSxJOSLGSeaM7/j5V2XqON5J+xFYseNlJZC8VEC0=
Date: Thu, 22 Sep 2016 10:17:36 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Luiz Capitulino <lcapitulino@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	ehabkost@redhat.com, armbru@redhat.com, imammedo@redhat.com,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Message-ID: <20160922001736.GM1809@umbus.fritz.box>
References: <1474435766-9727-1-git-send-email-david@gibson.dropbear.id.au>
	<20160921105049.55ede6b1@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BHMq0+oGliEfCAkH"
Content-Disposition: inline
In-Reply-To: <20160921105049.55ede6b1@redhat.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-trivial] [PATCH] monitor: fix crash for platforms without
 a CPU 0
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
X-List-Received-Date: Thu, 22 Sep 2016 00:18:29 -0000


--BHMq0+oGliEfCAkH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 21, 2016 at 10:50:49AM -0400, Luiz Capitulino wrote:
> On Wed, 21 Sep 2016 15:29:26 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > Now that we allow CPU hot unplug on a few platforms, we can end up in a
> > situation where we don't have a CPU with index 0.  Or at least we could,
> > if we didn't have code to explicitly prohibit unplug of CPU 0.
> >=20
> > Longer term we want to allow CPU 0 unplug, this patch is an early step =
in
> > allowing this, by removing an assumption in the monitor code that CPU 0
> > always exists.
> >=20
> > Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> > [dwg: Rewrote commit message to better explain background]
> > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > ---
> >  monitor.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > Anyone want to volunteer to take this through their tree?  If not, I
> > can take it through my ppc tree.
>=20
> Please do.

Ok, merged to ppc-for-2.8.

>=20
> Reviewed-by: Luiz Capitulino <lcapitulino@redhat.com>
>=20
> >=20
> > diff --git a/monitor.c b/monitor.c
> > index 8bb8bbf..83c4edf 100644
> > --- a/monitor.c
> > +++ b/monitor.c
> > @@ -1025,7 +1025,7 @@ int monitor_set_cpu(int cpu_index)
> >  CPUState *mon_get_cpu(void)
> >  {
> >      if (!cur_mon->mon_cpu) {
> > -        monitor_set_cpu(0);
> > +        monitor_set_cpu(first_cpu->cpu_index);
> >      }
> >      cpu_synchronize_state(cur_mon->mon_cpu);
> >      return cur_mon->mon_cpu;
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--BHMq0+oGliEfCAkH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX4yMgAAoJEGw4ysog2bOSdh0QAMg6ilXmbcWg2qgNQ/uYF+BX
eNSESozILhx8g+NK7nUgCxriuetc35qWxDEoq/16M5Yi28sIrUonnX6zWFHNVE0E
jHE9T+lsZ4yAAR5C4bi7iq27LlYiPqV3/Kiqy2oF9Ui+J23GLMZ/FCuLWhLnfNkj
9+jOlnjtVHaVEptS1iQU+GT0fJkUiBgMziSpunJXDlfRdC0XWpAQS5KeNUvxOO4t
DtKa96piwDBeJ0yQUspwPCch1NvaKKrWz+gbj+T2rf3Nhff9agypEp3v+olq4MpX
dTIAUpk/zWoMMw5XcvL1jrpXA7LZ9RDy7dIkREql2MDMHNzznMP6aFgYaIQ4Rgg8
lbCg3+zZ55R+WC7SvWJdjqTkByVeWeapibE3GRX+r7yNDIgudpYZ9tVNhldkcSed
Wf/jUmtRAtA/lVzZ1bKw3xVIUjQKO3Fw2/NI+IMjUqEI7XCwhz32//2xbhIiDSyh
0B1Pl1jWMcdFEAPzFtC13tY4d4TZpCAtctKvgIsoATjq+EpGufm3pDxVSr3f0ofu
xt4w79ZDflq6r+/ncSSfiEPXtf3q2Q/b8mBMVBb+kYjrls0mG3GUlM7I9Z7Yvr6W
Ubm13ahTvwodc4bgt0lvQKZAob/ihex11CAxSY9YUHh6u+jl5fS9VVoL3udFYiPB
EVeCkYtnBxxO2wEpRhbH
=GJ9V
-----END PGP SIGNATURE-----

--BHMq0+oGliEfCAkH--

