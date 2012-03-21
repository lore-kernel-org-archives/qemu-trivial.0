Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SAJgZ-0002ZX-Le
	for mharc-qemu-trivial@gnu.org; Wed, 21 Mar 2012 07:26:35 -0400
Received: from eggs.gnu.org ([208.118.235.92]:57879)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SAJgU-0002ZM-3Z
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 07:26:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SAJgM-0007Ij-VD
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 07:26:29 -0400
Received: from mail-wi0-f181.google.com ([209.85.212.181]:59658)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SAJgM-0007IN-Hs; Wed, 21 Mar 2012 07:26:22 -0400
Received: by wibhr17 with SMTP id hr17so1183396wib.10
	for <multiple recipients>; Wed, 21 Mar 2012 04:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=Uf63/Fouh8tGsGT3N1uOB78F7O5KRMtIXeBZA8RuCmA=;
	b=VeQavAvkBCuxsaOtQayD3qwoD+XsMwP7nXCmbsSjFsYeze8BedkHkJB54E9VcRAWmi
	k4dDuIUZJ0TfCJeVokZcDpQ9TH7HoVGzcQn4jJiMcgoLXQB4rt+4BkpSd5OikbYs+raC
	muYxjvq04U34doNueP8e2Ouc4JxYZEdnxf8W1uFJFwiGCQAeVFu+4AJPVoiZFZhZffxg
	HTRXzN4s0E0sT083YzKslcEbwCX1Mm3J72NeDo71MU3AtqjqmBQfrS+35jEsq6KEy+pb
	EUsvOoJLgziDkhTsbiWXbmMkkiBdBmqH/IyWj2JawuTD8EC0hiiKE+9dTEOoyoKdY0C0
	3Kgg==
Received: by 10.216.138.38 with SMTP id z38mr2054206wei.63.1332329179558;
	Wed, 21 Mar 2012 04:26:19 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id 17sm3932266wis.0.2012.03.21.04.26.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 04:26:18 -0700 (PDT)
Date: Wed, 21 Mar 2012 11:26:15 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: anthony@codemonkey.ws, qemu-trivial@nongnu.org,
	Rusty Russell <rusty@rustcorp.com.au>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Message-ID: <20120321112615.GA15090@stefanha-thinkpad.localdomain>
References: <1332133163-7890-1-git-send-email-david@gibson.dropbear.id.au>
	<20120319113310.GD30033@stefanha-thinkpad.localdomain>
	<20120320004206.GB22089@truffala.fritz.box>
	<CAJSP0QU4azkZic4GM++uXtj91b_vdXT=TETXTr1AD0qXxii28A@mail.gmail.com>
	<20120320101947.GA19542@truffala.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20120320101947.GA19542@truffala.fritz.box>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.181
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
X-List-Received-Date: Wed, 21 Mar 2012 11:26:34 -0000

On Tue, Mar 20, 2012 at 09:19:47PM +1100, David Gibson wrote:
> On Tue, Mar 20, 2012 at 09:54:20AM +0000, Stefan Hajnoczi wrote:
> > On Tue, Mar 20, 2012 at 12:42 AM, David Gibson
> > <david@gibson.dropbear.id.au> wrote:
> > > On Mon, Mar 19, 2012 at 11:33:10AM +0000, Stefan Hajnoczi wrote:
> > >> On Mon, Mar 19, 2012 at 03:59:23PM +1100, David Gibson wrote:
> > >> > Currently the virtio balloon device, when using the virtio-pci interface
> > >> > advertises itself with PCI class code MEMORY_RAM.  This is wrong; the
> > >> > balloon is vaguely related to memory, but is nothing like a PCI memory
> > >> > device in the meaning of the class code, and this code is not required or
> > >> > suggested by the virtio PCI specification.
> > >> >
> > >> > Worse, this patch causes problems on the pseries machine, because the
> > >> > firmware, seeing this class code, advertises the device as memory in the
> > >> > device tree, and then a guest kernel bug causes it to see this "memory"
> > >> > before the real system memory, leading to a crash in early boot.
> > >> >
> > >> > This patch fixes the problem by removing the bogus PCI class code on the
> > >> > balloon device.
> > >> >
> > >> > Cc: Michael S. Tsirkin <mst@redhat.com>
> > >> > Cc: Rusty Russell <rusty@rustcorp.com.au>
> > >> >
> > >> > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > >> > ---
> > >> >  hw/virtio-pci.c |    2 +-
> > >> >  1 files changed, 1 insertions(+), 1 deletions(-)
> > >>
> > >> Since this is a guest-visible change we might need to be careful about
> > >> how it's introduced.
> > >>
> > >> Do we need to keep the old class code for existing machine types?  The
> > >> new class code could be introduced only for 1.1 and later machine types
> > >> if we want to be extra careful about introducing guest-visible
> > >> changes.
> > >
> > > So as a general rule, I like to be very careful about user-visible
> > > changes.  But in this case, I don't think we want to be too hesitant.
> > > In particular, it's not just a question of the machine type, but also
> > > of how the guest OS will deal with the PCI class code.
> > >
> > > The class code we were using was Just Plain Wrong.  It was not
> > > suggetsed by the virtio spec, and it makes no sense.  It happens that
> > > so far this caused problems only for a guest on a particular machine
> > > type, but there's no reason it couldn't cause (different) problems for
> > > guests on any machine type.
> > >
> > > More to the point, it seems reasonably unlikely for existing guests to
> > > rely on the broken behaviour: again, there's no reason they'd think
> > > they need to based on the spec, and the usual way of matching drivers
> > > to PCI devices is with the vendor/device IDs which are correct and not
> > > changed by this patch.
> > >
> > > So, unless we have a known example of an existing guest that would be
> > > broken by this change, I think we should implement it ASAP for all
> > > machine types.
> > 
> > I agree that in practice the risk is low because working guests are
> > probably not using the class code.  On the other hand I don't see a
> > downside to making this part of the 1.1 machine type,
> 
> Well.. there's the fact that I can't what mechanism we would use to
> make this per-machine...

Not sure I parsed this correctly, but I think you're asking how to do
it.

Looking at hw/pc_piix.c there are QEMUMachine types for each QEMU
release.  Legacy machine types (e.g. pc_machine_v0_14) have a
.compat_props array that can override qdev properties.

Perhaps Michael Tsirkin or someone else can comment on how to wire up
hw/virtio-pci.c so that the class code can be overridden.

Stefan

