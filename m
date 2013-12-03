Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vnrds-0001l0-6Q
	for mharc-qemu-trivial@gnu.org; Tue, 03 Dec 2013 10:12:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45611)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1VnrGT-0005ib-Mc
	for qemu-trivial@nongnu.org; Tue, 03 Dec 2013 09:47:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1VnrGN-0007uX-Ea
	for qemu-trivial@nongnu.org; Tue, 03 Dec 2013 09:47:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:32376)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1VnrGN-0007uP-5U; Tue, 03 Dec 2013 09:47:47 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rB3Eli6t020604
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 3 Dec 2013 09:47:45 -0500
Received: from localhost ([10.3.113.9])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id rB3EleM0016170; Tue, 3 Dec 2013 09:47:41 -0500
Date: Tue, 3 Dec 2013 12:47:40 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Message-ID: <20131203144740.GL22837@otherpad.lan.raisama.net>
References: <1385350750-21468-1-git-send-email-aik@ozlabs.ru>
	<529CBE15.8010206@msgid.tls.msk.ru> <529D0533.7090402@suse.de>
	<529D11C5.2080505@ozlabs.ru> <529DDD08.4030206@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <529DDD08.4030206@suse.de>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	rB3Eli6t020604
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Tue, 03 Dec 2013 10:12:01 -0500
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>
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
X-List-Received-Date: Tue, 03 Dec 2013 14:48:00 -0000

On Tue, Dec 03, 2013 at 02:30:48PM +0100, Andreas F=E4rber wrote:
> Am 03.12.2013 00:03, schrieb Alexey Kardashevskiy:
> > On 12/03/2013 09:09 AM, Andreas F=E4rber wrote:
> >> Am 02.12.2013 18:06, schrieb Michael Tokarev:
> >>> 25.11.2013 07:39, Alexey Kardashevskiy wrote:
> >>>> Since modern POWER7/POWER8 chips can have more that 256 CPU thread=
s
> >>>> (>2000 actually), remove this check from smp_parse.
> >>>>
> >>>> The CPUs number is still checked against machine->max_cpus and thi=
s check
> >>>> should be enough not to break other archs.
> >>
> >> "should be" is not exactly the highest level of confidence for a
> >> "trivial" patch... :/
> [...]
> >> Alexey, did you actually check that, e.g., x86 machines don't break =
with
> >> 256 or 257 CPUs now?
> >=20
> > PC_DEFAULT_MACHINE_OPTIONS sets it to 255. And I cannot find any mach=
ine
> > which would not define max_cpus, have I missed any?
>=20
> If you've actually *checked* the other machines' code then fine with me=
,
> just say so in the commit message. :)

I just grepped for "max_cpus" and checked every match. The largest
values I found were:

hw/ppc/spapr.c: 256
s390: 255
pc: 255

All the rest had values <=3D 32.

Machines with missing max_cpus value shouldn't be a problem, as
max_cpus=3D=3D0 is interpreted as 1 by the vl.c code.

But we still need to add a check for max_cpus > machine->max_cpus to
vl.c, before we eliminate the smp_parse() check.

There's also this, at main():

        if (i =3D=3D nb_numa_nodes) {
            for (i =3D 0; i < max_cpus; i++) {
                set_bit(i, node_cpumask[i % nb_numa_nodes]);
            }
        }

node_cpumask[] is initialized using bitmap_new(MAX_CPUMASK_BITS), and
MAX_CPUMASK_BITS is 255. To fix this, we can initialize node_cpumask[] us=
ing
max_cpus instead, if we initialize it after smp_parse().

--=20
Eduardo

