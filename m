Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SAJj7-00044D-NH
	for mharc-qemu-trivial@gnu.org; Wed, 21 Mar 2012 07:29:13 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40841)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SAJiy-0003g2-Rg
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 07:29:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SAJit-0007za-TV
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 07:29:04 -0400
Received: from mail-yx0-f173.google.com ([209.85.213.173]:45171)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SAJik-0007yI-5D; Wed, 21 Mar 2012 07:28:50 -0400
Received: by yenr5 with SMTP id r5so941187yen.4
	for <multiple recipients>; Wed, 21 Mar 2012 04:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=FqSkGAk4AUddTfLeO9XnhLnjEfjvFIHfsi4H+O+p+iY=;
	b=VZ5UpfKMRA09PhiWJe1Cu8x35dBmEPvd4J1ISLbSJ8mPkstE8LF4Ok/J1wTwexeMjQ
	y5tgvsVOIR6mbZinR7+O14jXewZWh2HR5MJFLS6yW+9N/3fl/fCOMeI7kqWqlPCsyPLu
	Gikewjhj3cLSAQhuIuT/+Lg/QRH+7xU3CYQezl5n5/4aYoP03RlczjTrEx3qTqCmfBCh
	NgWfBqJVgSonD3vzxWmH/+PDnxozubG9qSqmmFgrHa+yAvBznYwErEJZEfpdI8W2TnWx
	UME1evHS7r1KACgvTCn8tk894CavV2yrZtT8kEquv1kG0osp8XNKQrEAOMyGwlMu/AwY
	ehmQ==
MIME-Version: 1.0
Received: by 10.50.168.67 with SMTP id zu3mr2485744igb.28.1332329327611; Wed,
	21 Mar 2012 04:28:47 -0700 (PDT)
Received: by 10.231.65.16 with HTTP; Wed, 21 Mar 2012 04:28:47 -0700 (PDT)
In-Reply-To: <20120321112615.GA15090@stefanha-thinkpad.localdomain>
References: <1332133163-7890-1-git-send-email-david@gibson.dropbear.id.au>
	<20120319113310.GD30033@stefanha-thinkpad.localdomain>
	<20120320004206.GB22089@truffala.fritz.box>
	<CAJSP0QU4azkZic4GM++uXtj91b_vdXT=TETXTr1AD0qXxii28A@mail.gmail.com>
	<20120320101947.GA19542@truffala.fritz.box>
	<20120321112615.GA15090@stefanha-thinkpad.localdomain>
Date: Wed, 21 Mar 2012 11:28:47 +0000
Message-ID: <CAJSP0QW6VkyRvB0e7UGXmUC=qMgunib10Y4EApisFd5cpS-5pA@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.213.173
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
X-List-Received-Date: Wed, 21 Mar 2012 11:29:12 -0000

Hi,
It seems your Mail-Followup-To: header causes my client to drop you
from the To: list.

On Wed, Mar 21, 2012 at 11:26 AM, Stefan Hajnoczi <stefanha@gmail.com> wrot=
e:
> On Tue, Mar 20, 2012 at 09:19:47PM +1100, David Gibson wrote:
>> On Tue, Mar 20, 2012 at 09:54:20AM +0000, Stefan Hajnoczi wrote:
>> > On Tue, Mar 20, 2012 at 12:42 AM, David Gibson
>> > <david@gibson.dropbear.id.au> wrote:
>> > > On Mon, Mar 19, 2012 at 11:33:10AM +0000, Stefan Hajnoczi wrote:
>> > >> On Mon, Mar 19, 2012 at 03:59:23PM +1100, David Gibson wrote:
>> > >> > Currently the virtio balloon device, when using the virtio-pci in=
terface
>> > >> > advertises itself with PCI class code MEMORY_RAM. =A0This is wron=
g; the
>> > >> > balloon is vaguely related to memory, but is nothing like a PCI m=
emory
>> > >> > device in the meaning of the class code, and this code is not req=
uired or
>> > >> > suggested by the virtio PCI specification.
>> > >> >
>> > >> > Worse, this patch causes problems on the pseries machine, because=
 the
>> > >> > firmware, seeing this class code, advertises the device as memory=
 in the
>> > >> > device tree, and then a guest kernel bug causes it to see this "m=
emory"
>> > >> > before the real system memory, leading to a crash in early boot.
>> > >> >
>> > >> > This patch fixes the problem by removing the bogus PCI class code=
 on the
>> > >> > balloon device.
>> > >> >
>> > >> > Cc: Michael S. Tsirkin <mst@redhat.com>
>> > >> > Cc: Rusty Russell <rusty@rustcorp.com.au>
>> > >> >
>> > >> > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
>> > >> > ---
>> > >> > =A0hw/virtio-pci.c | =A0 =A02 +-
>> > >> > =A01 files changed, 1 insertions(+), 1 deletions(-)
>> > >>
>> > >> Since this is a guest-visible change we might need to be careful ab=
out
>> > >> how it's introduced.
>> > >>
>> > >> Do we need to keep the old class code for existing machine types? =
=A0The
>> > >> new class code could be introduced only for 1.1 and later machine t=
ypes
>> > >> if we want to be extra careful about introducing guest-visible
>> > >> changes.
>> > >
>> > > So as a general rule, I like to be very careful about user-visible
>> > > changes. =A0But in this case, I don't think we want to be too hesita=
nt.
>> > > In particular, it's not just a question of the machine type, but als=
o
>> > > of how the guest OS will deal with the PCI class code.
>> > >
>> > > The class code we were using was Just Plain Wrong. =A0It was not
>> > > suggetsed by the virtio spec, and it makes no sense. =A0It happens t=
hat
>> > > so far this caused problems only for a guest on a particular machine
>> > > type, but there's no reason it couldn't cause (different) problems f=
or
>> > > guests on any machine type.
>> > >
>> > > More to the point, it seems reasonably unlikely for existing guests =
to
>> > > rely on the broken behaviour: again, there's no reason they'd think
>> > > they need to based on the spec, and the usual way of matching driver=
s
>> > > to PCI devices is with the vendor/device IDs which are correct and n=
ot
>> > > changed by this patch.
>> > >
>> > > So, unless we have a known example of an existing guest that would b=
e
>> > > broken by this change, I think we should implement it ASAP for all
>> > > machine types.
>> >
>> > I agree that in practice the risk is low because working guests are
>> > probably not using the class code. =A0On the other hand I don't see a
>> > downside to making this part of the 1.1 machine type,
>>
>> Well.. there's the fact that I can't what mechanism we would use to
>> make this per-machine...
>
> Not sure I parsed this correctly, but I think you're asking how to do
> it.
>
> Looking at hw/pc_piix.c there are QEMUMachine types for each QEMU
> release. =A0Legacy machine types (e.g. pc_machine_v0_14) have a
> .compat_props array that can override qdev properties.
>
> Perhaps Michael Tsirkin or someone else can comment on how to wire up
> hw/virtio-pci.c so that the class code can be overridden.
>
> Stefan

