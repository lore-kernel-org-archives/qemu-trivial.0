Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SALHc-0006VN-D4
	for mharc-qemu-trivial@gnu.org; Wed, 21 Mar 2012 09:08:56 -0400
Received: from eggs.gnu.org ([208.118.235.92]:57670)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1SALHU-0006UV-EO
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 09:08:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1SALHN-0007Xn-Mp
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 09:08:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38008)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1SALHN-0007XM-67; Wed, 21 Mar 2012 09:08:41 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2LD8bAM013618
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 21 Mar 2012 09:08:37 -0400
Received: from redhat.com (vpn-201-23.tlv.redhat.com [10.35.201.23])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q2LD8XDL014260; Wed, 21 Mar 2012 09:08:34 -0400
Date: Wed, 21 Mar 2012 15:08:53 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <20120321130852.GC21467@redhat.com>
References: <1332133163-7890-1-git-send-email-david@gibson.dropbear.id.au>
	<20120319113310.GD30033@stefanha-thinkpad.localdomain>
	<20120320004206.GB22089@truffala.fritz.box>
	<CAJSP0QU4azkZic4GM++uXtj91b_vdXT=TETXTr1AD0qXxii28A@mail.gmail.com>
	<20120320101947.GA19542@truffala.fritz.box>
	<20120321112615.GA15090@stefanha-thinkpad.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20120321112615.GA15090@stefanha-thinkpad.localdomain>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	q2LD8bAM013618
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Rusty Russell <rusty@rustcorp.com.au>,
	qemu-devel@nongnu.org, anthony@codemonkey.ws
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Remove PCI class code from
 virtio balloon device
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
X-List-Received-Date: Wed, 21 Mar 2012 13:08:54 -0000

On Wed, Mar 21, 2012 at 11:26:15AM +0000, Stefan Hajnoczi wrote:
> On Tue, Mar 20, 2012 at 09:19:47PM +1100, David Gibson wrote:
> > On Tue, Mar 20, 2012 at 09:54:20AM +0000, Stefan Hajnoczi wrote:
> > > On Tue, Mar 20, 2012 at 12:42 AM, David Gibson
> > > <david@gibson.dropbear.id.au> wrote:
> > > > On Mon, Mar 19, 2012 at 11:33:10AM +0000, Stefan Hajnoczi wrote:
> > > >> On Mon, Mar 19, 2012 at 03:59:23PM +1100, David Gibson wrote:
> > > >> > Currently the virtio balloon device, when using the virtio-pci=
 interface
> > > >> > advertises itself with PCI class code MEMORY_RAM. =A0This is w=
rong; the
> > > >> > balloon is vaguely related to memory, but is nothing like a PC=
I memory
> > > >> > device in the meaning of the class code, and this code is not =
required or
> > > >> > suggested by the virtio PCI specification.
> > > >> >
> > > >> > Worse, this patch causes problems on the pseries machine, beca=
use the
> > > >> > firmware, seeing this class code, advertises the device as mem=
ory in the
> > > >> > device tree, and then a guest kernel bug causes it to see this=
 "memory"
> > > >> > before the real system memory, leading to a crash in early boo=
t.
> > > >> >
> > > >> > This patch fixes the problem by removing the bogus PCI class c=
ode on the
> > > >> > balloon device.
> > > >> >
> > > >> > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > >> > Cc: Rusty Russell <rusty@rustcorp.com.au>
> > > >> >
> > > >> > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > > >> > ---
> > > >> > =A0hw/virtio-pci.c | =A0 =A02 +-
> > > >> > =A01 files changed, 1 insertions(+), 1 deletions(-)
> > > >>
> > > >> Since this is a guest-visible change we might need to be careful=
 about
> > > >> how it's introduced.
> > > >>
> > > >> Do we need to keep the old class code for existing machine types=
? =A0The
> > > >> new class code could be introduced only for 1.1 and later machin=
e types
> > > >> if we want to be extra careful about introducing guest-visible
> > > >> changes.
> > > >
> > > > So as a general rule, I like to be very careful about user-visibl=
e
> > > > changes. =A0But in this case, I don't think we want to be too hes=
itant.
> > > > In particular, it's not just a question of the machine type, but =
also
> > > > of how the guest OS will deal with the PCI class code.
> > > >
> > > > The class code we were using was Just Plain Wrong. =A0It was not
> > > > suggetsed by the virtio spec, and it makes no sense. =A0It happen=
s that
> > > > so far this caused problems only for a guest on a particular mach=
ine
> > > > type, but there's no reason it couldn't cause (different) problem=
s for
> > > > guests on any machine type.
> > > >
> > > > More to the point, it seems reasonably unlikely for existing gues=
ts to
> > > > rely on the broken behaviour: again, there's no reason they'd thi=
nk
> > > > they need to based on the spec, and the usual way of matching dri=
vers
> > > > to PCI devices is with the vendor/device IDs which are correct an=
d not
> > > > changed by this patch.
> > > >
> > > > So, unless we have a known example of an existing guest that woul=
d be
> > > > broken by this change, I think we should implement it ASAP for al=
l
> > > > machine types.
> > >=20
> > > I agree that in practice the risk is low because working guests are
> > > probably not using the class code.  On the other hand I don't see a
> > > downside to making this part of the 1.1 machine type,
> >=20
> > Well.. there's the fact that I can't what mechanism we would use to
> > make this per-machine...
>=20
> Not sure I parsed this correctly, but I think you're asking how to do
> it.
>=20
> Looking at hw/pc_piix.c there are QEMUMachine types for each QEMU
> release.  Legacy machine types (e.g. pc_machine_v0_14) have a
> .compat_props array that can override qdev properties.
>=20
> Perhaps Michael Tsirkin or someone else can comment on how to wire up
> hw/virtio-pci.c so that the class code can be overridden.
>=20
> Stefan

afaik we already let users over-write it for some other pci devices,
look there for examples.


