Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S9wBm-00062K-1L
	for mharc-qemu-trivial@gnu.org; Tue, 20 Mar 2012 06:21:14 -0400
Received: from eggs.gnu.org ([208.118.235.92]:36636)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1S9wBi-0005t6-T7
	for qemu-trivial@nongnu.org; Tue, 20 Mar 2012 06:21:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1S9wBd-0002rz-Oo
	for qemu-trivial@nongnu.org; Tue, 20 Mar 2012 06:21:10 -0400
Received: from ozlabs.org ([203.10.76.45]:47714)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1S9wAV-0002aT-17; Tue, 20 Mar 2012 06:19:55 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 6AFC5B6EF4; Tue, 20 Mar 2012 21:19:50 +1100 (EST)
Date: Tue, 20 Mar 2012 21:19:47 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <20120320101947.GA19542@truffala.fritz.box>
Mail-Followup-To: Stefan Hajnoczi <stefanha@gmail.com>,
	anthony@codemonkey.ws, qemu-trivial@nongnu.org,
	Rusty Russell <rusty@rustcorp.com.au>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <1332133163-7890-1-git-send-email-david@gibson.dropbear.id.au>
	<20120319113310.GD30033@stefanha-thinkpad.localdomain>
	<20120320004206.GB22089@truffala.fritz.box>
	<CAJSP0QU4azkZic4GM++uXtj91b_vdXT=TETXTr1AD0qXxii28A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CAJSP0QU4azkZic4GM++uXtj91b_vdXT=TETXTr1AD0qXxii28A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 203.10.76.45
Cc: qemu-trivial@nongnu.org, Rusty Russell <rusty@rustcorp.com.au>,
	qemu-devel@nongnu.org, anthony@codemonkey.ws,
	"Michael S. Tsirkin" <mst@redhat.com>
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
X-List-Received-Date: Tue, 20 Mar 2012 10:21:12 -0000

On Tue, Mar 20, 2012 at 09:54:20AM +0000, Stefan Hajnoczi wrote:
> On Tue, Mar 20, 2012 at 12:42 AM, David Gibson
> <david@gibson.dropbear.id.au> wrote:
> > On Mon, Mar 19, 2012 at 11:33:10AM +0000, Stefan Hajnoczi wrote:
> >> On Mon, Mar 19, 2012 at 03:59:23PM +1100, David Gibson wrote:
> >> > Currently the virtio balloon device, when using the virtio-pci int=
erface
> >> > advertises itself with PCI class code MEMORY_RAM. =A0This is wrong=
; the
> >> > balloon is vaguely related to memory, but is nothing like a PCI me=
mory
> >> > device in the meaning of the class code, and this code is not requ=
ired or
> >> > suggested by the virtio PCI specification.
> >> >
> >> > Worse, this patch causes problems on the pseries machine, because =
the
> >> > firmware, seeing this class code, advertises the device as memory =
in the
> >> > device tree, and then a guest kernel bug causes it to see this "me=
mory"
> >> > before the real system memory, leading to a crash in early boot.
> >> >
> >> > This patch fixes the problem by removing the bogus PCI class code =
on the
> >> > balloon device.
> >> >
> >> > Cc: Michael S. Tsirkin <mst@redhat.com>
> >> > Cc: Rusty Russell <rusty@rustcorp.com.au>
> >> >
> >> > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> >> > ---
> >> > =A0hw/virtio-pci.c | =A0 =A02 +-
> >> > =A01 files changed, 1 insertions(+), 1 deletions(-)
> >>
> >> Since this is a guest-visible change we might need to be careful abo=
ut
> >> how it's introduced.
> >>
> >> Do we need to keep the old class code for existing machine types? =A0=
The
> >> new class code could be introduced only for 1.1 and later machine ty=
pes
> >> if we want to be extra careful about introducing guest-visible
> >> changes.
> >
> > So as a general rule, I like to be very careful about user-visible
> > changes. =A0But in this case, I don't think we want to be too hesitan=
t.
> > In particular, it's not just a question of the machine type, but also
> > of how the guest OS will deal with the PCI class code.
> >
> > The class code we were using was Just Plain Wrong. =A0It was not
> > suggetsed by the virtio spec, and it makes no sense. =A0It happens th=
at
> > so far this caused problems only for a guest on a particular machine
> > type, but there's no reason it couldn't cause (different) problems fo=
r
> > guests on any machine type.
> >
> > More to the point, it seems reasonably unlikely for existing guests t=
o
> > rely on the broken behaviour: again, there's no reason they'd think
> > they need to based on the spec, and the usual way of matching drivers
> > to PCI devices is with the vendor/device IDs which are correct and no=
t
> > changed by this patch.
> >
> > So, unless we have a known example of an existing guest that would be
> > broken by this change, I think we should implement it ASAP for all
> > machine types.
>=20
> I agree that in practice the risk is low because working guests are
> probably not using the class code.  On the other hand I don't see a
> downside to making this part of the 1.1 machine type,

Well.. there's the fact that I can't what mechanism we would use to
make this per-machine...

> which is what
> users will run when they get this code change anyway.  That way we can
> tell users that we never change the device model in a release with a
> straight face :).
>=20
> Anthony: I'm not sure how strict we are about a user-visible change lik=
e this?
>=20
> Stefan
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other=
_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

