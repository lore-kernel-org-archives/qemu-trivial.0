Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vnrdq-0001in-Uv
	for mharc-qemu-trivial@gnu.org; Tue, 03 Dec 2013 10:12:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42507)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1Vnr2p-0006TM-PJ
	for qemu-trivial@nongnu.org; Tue, 03 Dec 2013 09:33:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1Vnr2k-0003Tb-TT
	for qemu-trivial@nongnu.org; Tue, 03 Dec 2013 09:33:47 -0500
Received: from mx1.redhat.com ([209.132.183.28]:21624)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1Vnr2k-0003TV-LE; Tue, 03 Dec 2013 09:33:42 -0500
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rB3EXd5g013470
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 3 Dec 2013 09:33:40 -0500
Received: from localhost ([10.3.113.9])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id rB3EXcVp020289; Tue, 3 Dec 2013 09:33:39 -0500
Date: Tue, 3 Dec 2013 12:33:38 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20131203143338.GK22837@otherpad.lan.raisama.net>
References: <1385350750-21468-1-git-send-email-aik@ozlabs.ru>
	<529CBE15.8010206@msgid.tls.msk.ru> <529D0533.7090402@suse.de>
	<20131203114419.15146cff@nial.usersys.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20131203114419.15146cff@nial.usersys.redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	rB3EXd5g013470
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Tue, 03 Dec 2013 10:12:00 -0500
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, qemu-devel@nongnu.org
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
X-List-Received-Date: Tue, 03 Dec 2013 14:33:52 -0000

On Tue, Dec 03, 2013 at 11:44:19AM +0100, Igor Mammedov wrote:
> On Mon, 02 Dec 2013 23:09:55 +0100
> Andreas F=E4rber <afaerber@suse.de> wrote:
>=20
> > Am 02.12.2013 18:06, schrieb Michael Tokarev:
> > > 25.11.2013 07:39, Alexey Kardashevskiy wrote:
> > >> Since modern POWER7/POWER8 chips can have more that 256 CPU thread=
s
> > >> (>2000 actually), remove this check from smp_parse.
> > >>
> > >> The CPUs number is still checked against machine->max_cpus and thi=
s check
> > >> should be enough not to break other archs.
> >=20
> > "should be" is not exactly the highest level of confidence for a
> > "trivial" patch... :/
> >=20
> > > []
> > >> -    if (max_cpus > 255) {
> > >> -        fprintf(stderr, "Unsupported number of maxcpus\n");
> > >> -        exit(1);
> > >> -    }
> >=20
> > I believe Eduardo touched that code last for NUMA, so let's CC him.
> >=20
> > > I don't know whenever this is actually safe.  Do we have any static=
 arrays
> > > of size 255 somewhere, which will be overflowed without this check?=
 :)
> >=20
> > s390 has the ipi_states[] array, but not fixed to that size.
> >=20
> > x86 APIC IDs I think have or had a limitation to 255 rather than 16-b=
it?
> > Igor?
> it's still fixed size array:
> hw/intc/apic.c: static APICCommonState *local_apics[MAX_APICS + 1];
> with: #define MAX_APICS 255
>=20
> >=20
> > Alexey, did you actually check that, e.g., x86 machines don't break w=
ith
> > 256 or 257 CPUs now?
> patch shouldn't hurt x86 machines since
> there is check later=20
> vl.c:
>     if (smp_cpus > machine->max_cpus) {
>            fprintf(stderr, "Number of SMP cpus requested (%d), exceeds =
max cpus "
>                 "supported by machine `%s' (%d)\n", smp_cpus,  machine-=
>name,
>                 machine->max_cpus);
>         exit(1);
>     }
>       =20
> and both piix4/q35 machines have machine->max_cpus initialized to 255 o=
r lower(isa/xen).

This ensures smp_cpus <=3D machine->max_cpus, but doesn't ensure
max_cpus <=3D machine->max_cpus. We need to check max_cpus against
machine->max_cpus, too, then we can eliminate the hardcoded
max_cpus > 255 check.

>=20
> >=20
> > Adding a qtest would be one way to prove that at least the QEMU code =
of
> > all other architectures doesn't break with the ppc change.
> >=20
> > Regards,
> > Andreas
> >=20
>=20

--=20
Eduardo

