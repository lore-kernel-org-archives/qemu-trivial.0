Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VoBt4-0007wX-HC
	for mharc-qemu-trivial@gnu.org; Wed, 04 Dec 2013 07:49:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1VoBsz-0007sw-LW
	for qemu-trivial@nongnu.org; Wed, 04 Dec 2013 07:49:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1VoBsv-0001kT-0p
	for qemu-trivial@nongnu.org; Wed, 04 Dec 2013 07:49:01 -0500
Received: from mx1.redhat.com ([209.132.183.28]:22978)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1VoBsu-0001kN-P2; Wed, 04 Dec 2013 07:48:56 -0500
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rB4CmnEG025761
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 4 Dec 2013 07:48:50 -0500
Received: from localhost (ovpn-113-108.phx2.redhat.com [10.3.113.108])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id rB4Cmlkv010930; Wed, 4 Dec 2013 07:48:48 -0500
Date: Wed, 4 Dec 2013 10:48:47 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <20131204124847.GK2340@otherpad.lan.raisama.net>
References: <1385350750-21468-1-git-send-email-aik@ozlabs.ru>
	<529CBE15.8010206@msgid.tls.msk.ru> <529D0533.7090402@suse.de>
	<529D11C5.2080505@ozlabs.ru> <529DDD08.4030206@suse.de>
	<20131203144740.GL22837@otherpad.lan.raisama.net>
	<529EC2C3.3050703@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <529EC2C3.3050703@ozlabs.ru>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	rB4CmnEG025761
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Wanlong Gao <gaowanlong@cn.fujitsu.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vl: remove (max_cpus > 255)
 check from smp_parse
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
X-List-Received-Date: Wed, 04 Dec 2013 12:49:06 -0000

On Wed, Dec 04, 2013 at 04:50:59PM +1100, Alexey Kardashevskiy wrote:
> On 12/04/2013 01:47 AM, Eduardo Habkost wrote:
> > On Tue, Dec 03, 2013 at 02:30:48PM +0100, Andreas F=E4rber wrote:
> >> Am 03.12.2013 00:03, schrieb Alexey Kardashevskiy:
> >>> On 12/03/2013 09:09 AM, Andreas F=E4rber wrote:
> >>>> Am 02.12.2013 18:06, schrieb Michael Tokarev:
> >>>>> 25.11.2013 07:39, Alexey Kardashevskiy wrote:
> >>>>>> Since modern POWER7/POWER8 chips can have more that 256 CPU thre=
ads
> >>>>>> (>2000 actually), remove this check from smp_parse.
> >>>>>>
> >>>>>> The CPUs number is still checked against machine->max_cpus and t=
his check
> >>>>>> should be enough not to break other archs.
> >>>>
> >>>> "should be" is not exactly the highest level of confidence for a
> >>>> "trivial" patch... :/
> >> [...]
> >>>> Alexey, did you actually check that, e.g., x86 machines don't brea=
k with
> >>>> 256 or 257 CPUs now?
> >>>
> >>> PC_DEFAULT_MACHINE_OPTIONS sets it to 255. And I cannot find any ma=
chine
> >>> which would not define max_cpus, have I missed any?
> >>
> >> If you've actually *checked* the other machines' code then fine with=
 me,
> >> just say so in the commit message. :)
> >=20
> > I just grepped for "max_cpus" and checked every match. The largest
> > values I found were:
> >=20
> > hw/ppc/spapr.c: 256
> > s390: 255
> > pc: 255
> >=20
> > All the rest had values <=3D 32.
> >=20
> > Machines with missing max_cpus value shouldn't be a problem, as
> > max_cpus=3D=3D0 is interpreted as 1 by the vl.c code.
> >=20
> > But we still need to add a check for max_cpus > machine->max_cpus to
> > vl.c, before we eliminate the smp_parse() check.
>=20
>=20
> Since smp_parse() checks if (max_cpus >=3D smp_cpus), this should just =
work:
>=20
> diff --git a/vl.c b/vl.c
> index e6ed260..544165a 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -3882,9 +3882,9 @@ int main(int argc, char **argv, char **envp)
>      smp_parse(qemu_opts_find(qemu_find_opts("smp-opts"), NULL));
>=20
>      machine->max_cpus =3D machine->max_cpus ?: 1; /* Default to UP */
> -    if (smp_cpus > machine->max_cpus) {
> +    if (max_cpus > machine->max_cpus) {
>          fprintf(stderr, "Number of SMP cpus requested (%d), exceeds ma=
x cpus "
> -                "supported by machine `%s' (%d)\n", smp_cpus,  machine=
->name,
> +                "supported by machine `%s' (%d)\n", max_cpus,  machine=
->name,
>                  machine->max_cpus);
>          exit(1);
>      }
>=20
>=20
> > There's also this, at main():
> >=20
> >         if (i =3D=3D nb_numa_nodes) {
> >             for (i =3D 0; i < max_cpus; i++) {
> >                 set_bit(i, node_cpumask[i % nb_numa_nodes]);
> >             }
> >         }
> >=20
> > node_cpumask[] is initialized using bitmap_new(MAX_CPUMASK_BITS), and
> > MAX_CPUMASK_BITS is 255. To fix this, we can initialize node_cpumask[=
] using
> > max_cpus instead, if we initialize it after smp_parse().
>=20
>=20
> Nope. At the moment when we parse -numa in vl.c, we may not know yet wh=
at
> machine is going to be used and machines can have different max_cpus.

This will be changed by:

  Subject: [PATCH V17 04/11] NUMA: convert -numa option to use OptsVisito=
r
  Message-Id: <1386143939-19142-5-git-send-email-gaowanlong@cn.fujitsu.co=
m>
  http://article.gmane.org/gmane.comp.emulators.qemu/244826

>=20
> For now, I would simply change MAX_CPUMASK_BITS to something crazy, lik=
e
> 16384 (2KB per numa node), I hope QEMU can survive such a memory waste =
:)
>=20
> Ok?

I'm OK with that as long the code has proper checks in case max_cpus
gets set to a crazily large value (larger than MAX_CPUMASK_BITS) in the
far future, or if we prevent max_cpus from being larger than
MAX_CPUMASK_BITS.

--=20
Eduardo

