Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VnnT1-0001dL-TN
	for mharc-qemu-trivial@gnu.org; Tue, 03 Dec 2013 05:44:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44100)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1VnnSv-0001c7-En
	for qemu-trivial@nongnu.org; Tue, 03 Dec 2013 05:44:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1VnnSq-0002w4-2n
	for qemu-trivial@nongnu.org; Tue, 03 Dec 2013 05:44:28 -0500
Received: from mx1.redhat.com ([209.132.183.28]:17945)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1VnnSp-0002vy-Q3; Tue, 03 Dec 2013 05:44:24 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rB3AiMIA014870
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 3 Dec 2013 05:44:22 -0500
Received: from nial.usersys.redhat.com (dhcp-1-126.brq.redhat.com
	[10.34.1.126])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id rB3AiK1i011183; Tue, 3 Dec 2013 05:44:20 -0500
Date: Tue, 3 Dec 2013 11:44:19 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Andreas =?ISO-8859-1?B?RuRyYmVy?= <afaerber@suse.de>
Message-ID: <20131203114419.15146cff@nial.usersys.redhat.com>
In-Reply-To: <529D0533.7090402@suse.de>
References: <1385350750-21468-1-git-send-email-aik@ozlabs.ru>
	<529CBE15.8010206@msgid.tls.msk.ru> <529D0533.7090402@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
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
X-List-Received-Date: Tue, 03 Dec 2013 10:44:34 -0000

On Mon, 02 Dec 2013 23:09:55 +0100
Andreas F=E4rber <afaerber@suse.de> wrote:

> Am 02.12.2013 18:06, schrieb Michael Tokarev:
> > 25.11.2013 07:39, Alexey Kardashevskiy wrote:
> >> Since modern POWER7/POWER8 chips can have more that 256 CPU threads
> >> (>2000 actually), remove this check from smp_parse.
> >>
> >> The CPUs number is still checked against machine->max_cpus and this ch=
eck
> >> should be enough not to break other archs.
>=20
> "should be" is not exactly the highest level of confidence for a
> "trivial" patch... :/
>=20
> > []
> >> -    if (max_cpus > 255) {
> >> -        fprintf(stderr, "Unsupported number of maxcpus\n");
> >> -        exit(1);
> >> -    }
>=20
> I believe Eduardo touched that code last for NUMA, so let's CC him.
>=20
> > I don't know whenever this is actually safe.  Do we have any static arr=
ays
> > of size 255 somewhere, which will be overflowed without this check? :)
>=20
> s390 has the ipi_states[] array, but not fixed to that size.
>=20
> x86 APIC IDs I think have or had a limitation to 255 rather than 16-bit?
> Igor?
it's still fixed size array:
hw/intc/apic.c: static APICCommonState *local_apics[MAX_APICS + 1];
with: #define MAX_APICS 255

>=20
> Alexey, did you actually check that, e.g., x86 machines don't break with
> 256 or 257 CPUs now?
patch shouldn't hurt x86 machines since
there is check later=20
vl.c:
    if (smp_cpus > machine->max_cpus) {
           fprintf(stderr, "Number of SMP cpus requested (%d), exceeds max =
cpus "
                "supported by machine `%s' (%d)\n", smp_cpus,  machine->nam=
e,
                machine->max_cpus);
        exit(1);
    }
      =20
and both piix4/q35 machines have machine->max_cpus initialized to 255 or lo=
wer(isa/xen).

>=20
> Adding a qtest would be one way to prove that at least the QEMU code of
> all other architectures doesn't break with the ppc change.
>=20
> Regards,
> Andreas
>=20


