Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bmri8-0007L2-Ic
	for mharc-qemu-trivial@gnu.org; Wed, 21 Sep 2016 20:17:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42884)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bmri6-0007I7-Na
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2016 20:17:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bmri4-0002ik-I2
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2016 20:17:53 -0400
Received: from ozlabs.org ([103.22.144.67]:59299)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1bmrhv-0002cV-31; Wed, 21 Sep 2016 20:17:43 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3sfcWn6PH2z9sf6; Thu, 22 Sep 2016 10:17:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1474503461;
	bh=h3yxqHDu+5eBHbSroTcfqBcqTotbFSlZf4+NC9+1NGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c06vfqBfKNdC/eNTWiDJMpMUYG0Wr9P3wZYxibVw7VlWvJ+060qQLeufVH+tRbQQu
	NBxzh29/HfQfEgFdHaCaqNoxZpvlKhN1R2RQDy6ZQiqbgCnzq/EZIRXODaDLYz11DA
	0XPy63OgJfuijUiyCMAP2wzRE04OYC6lqXIMsZEo=
Date: Thu, 22 Sep 2016 10:17:12 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	lcapitulino@redhat.com, armbru@redhat.com, imammedo@redhat.com,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Message-ID: <20160922001712.GL1809@umbus.fritz.box>
References: <1474435766-9727-1-git-send-email-david@gibson.dropbear.id.au>
	<20160921121402.GI3233@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="S6vg04ofUPzW4qJg"
Content-Disposition: inline
In-Reply-To: <20160921121402.GI3233@thinpad.lan.raisama.net>
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
X-List-Received-Date: Thu, 22 Sep 2016 00:17:56 -0000


--S6vg04ofUPzW4qJg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 21, 2016 at 09:14:02AM -0300, Eduardo Habkost wrote:
> On Wed, Sep 21, 2016 at 03:29:26PM +1000, David Gibson wrote:
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
>=20
> So, we are replacing the "CPU 0 always exists" assumption with a
> "first_cpu is always non-NULL" assumption.

Well, we're replacing "CPU 0 is always present" assumption with "At
least one CPU is always present", which is a strictly weaker
constraint.

> But considering that the first_cpu assumption already exists
> elsewhere and those cases can be found easily using grep, I think
> this is OK. So:
>=20
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>=20
> BTW, it is also possible to crash QEMU by unplugging the current
> monitor CPU;

Ah... good point.

>   (qemu) device_add qemu64-x86_64-cpu,socket-id=3D2,core-id=3D0,thread-id=
=3D0,id=3Dmycpu
>   (qemu) cpu 2
>   (qemu) device_del mycpu
>   (qemu) info registers
>   qemu:qemu_cpu_kick_thread: No such process
>   $=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--S6vg04ofUPzW4qJg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX4yMIAAoJEGw4ysog2bOSDRgQAOBi5CBCZ7+qvjzA1Dcn8Itw
tt+jMiFZkCRSXC6s4ydXtO2yhkCyJ99XeOooysAXjDElTjTo+zjGh58sDRQKExCO
sEcuVVRtPTxMdZDm2iP0YDht8Cy4axJLGcsqez33rk1A1WmO83krZcoNQA96hmii
egO384ZT9aMtm2CPxJ0ll5hCmwspuAb9N9RlDrHEJfJUUBcveyj25y79PZPxSgMt
7QkqRqMoq9h6yGVZR7QnAkTR/woRFaKa+XE5tQg/QxcunOnzhmfcftAYyhA+MXB+
zdNX6aEOua4Y6RFVRxGVpwTurFTTeK3Z+FG7aTU4MUUnYWpv3VimOGh/MMgOBRao
wTAHPlM9xLurDAdQRQDKVnHCPhKMRh9O8+3mpOVlqraYynSoiMska2vejVKK3hIf
B5PvvMgLG9lx0+3B0vuEyQDz4KJexu76k+F0KOBfMeA73jM7EOZDH6wkU37q9Auw
MuENKMo4c0X5o9DNDcN1h9TNKe9yIisobjLaI6syz/3jeJBDA3oVFaYwjD2NEFS7
/EYSf2cOrQewKfgPuvSPwKQyi88KBjYtTAmMjSvSVgqS7mZwhRBxGoANrF4GFIOA
Gd4QGrRMu2RaAgOdMqLObhZXEqX8z/6kL6R+lEJ4thOfsmuLFqkSX6DIWpd8ugeI
/oGyv03HByJFVe+zKNHd
=6qhj
-----END PGP SIGNATURE-----

--S6vg04ofUPzW4qJg--

