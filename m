Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SAQ0R-0001YD-S4
	for mharc-qemu-trivial@gnu.org; Wed, 21 Mar 2012 14:11:31 -0400
Received: from eggs.gnu.org ([208.118.235.92]:39252)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1SAQ0L-0001Tp-7I
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 14:11:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1SAQ0G-00006T-1X
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 14:11:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32559)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1SAQ0F-000064-QK; Wed, 21 Mar 2012 14:11:19 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2LIBFwA010975
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 21 Mar 2012 14:11:16 -0400
Received: from redhat.com (vpn-201-23.tlv.redhat.com [10.35.201.23])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id q2LIB8nN005326; Wed, 21 Mar 2012 14:11:10 -0400
Date: Wed, 21 Mar 2012 20:11:27 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Anthony Liguori <anthony@codemonkey.ws>
Message-ID: <20120321181127.GA25168@redhat.com>
References: <20120320004206.GB22089@truffala.fritz.box>
	<CAJSP0QU4azkZic4GM++uXtj91b_vdXT=TETXTr1AD0qXxii28A@mail.gmail.com>
	<20120320101947.GA19542@truffala.fritz.box>
	<20120321112615.GA15090@stefanha-thinkpad.localdomain>
	<20120321130852.GC21467@redhat.com>
	<4F69E8E1.8050004@codemonkey.ws>
	<20120321151043.GA22707@redhat.com>
	<4F69F05B.5010500@codemonkey.ws>
	<20120321161155.GA23460@redhat.com> <4F6A014A.90704@codemonkey.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4F6A014A.90704@codemonkey.ws>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Rusty Russell <rusty@rustcorp.com.au>,
	qemu-devel@nongnu.org
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
X-List-Received-Date: Wed, 21 Mar 2012 18:11:29 -0000

On Wed, Mar 21, 2012 at 11:26:50AM -0500, Anthony Liguori wrote:
> On 03/21/2012 11:11 AM, Michael S. Tsirkin wrote:
> >On Wed, Mar 21, 2012 at 10:14:35AM -0500, Anthony Liguori wrote:
> >>On 03/21/2012 10:10 AM, Michael S. Tsirkin wrote:
> >>>On Wed, Mar 21, 2012 at 09:42:41AM -0500, Anthony Liguori wrote:
> >>>>On 03/21/2012 08:08 AM, Michael S. Tsirkin wrote:
> >>>>>On Wed, Mar 21, 2012 at 11:26:15AM +0000, Stefan Hajnoczi wrote:
> >>>>>>On Tue, Mar 20, 2012 at 09:19:47PM +1100, David Gibson wrote:
> >>>>>>Looking at hw/pc_piix.c there are QEMUMachine types for each QEMU
> >>>>>>release.  Legacy machine types (e.g. pc_machine_v0_14) have a
> >>>>>>.compat_props array that can override qdev properties.
> >>>>>>
> >>>>>>Perhaps Michael Tsirkin or someone else can comment on how to wire up
> >>>>>>hw/virtio-pci.c so that the class code can be overridden.
> >>>>>>
> >>>>>>Stefan
> >>>>>
> >>>>>afaik we already let users over-write it for some other pci devices,
> >>>>>look there for examples.
> >>>>
> >>>> From hw/pc_piix.c:
> >>>>
> >>>>     .name = "pc-0.10",
> >>>>     .desc = "Standard PC, qemu 0.10",
> >>>>     .init = pc_init_pci_no_kvmclock,
> >>>>     .max_cpus = 255,
> >>>>     .compat_props = (GlobalProperty[]) {
> >>>>         {
> >>>>             .driver   = "virtio-blk-pci",
> >>>>             .property = "class",
> >>>>             .value    = stringify(PCI_CLASS_STORAGE_OTHER),
> >>>>         },{
> >>>>
> >>>>And from the earlier part of the thread, yes, it's imperative that
> >>>>we do not change anything in the PCI configuration space for older
> >>>>pc versions regardless of whether it may or may not work.
> >>>>
> >>>>Certain guests (like Windows) use a complex fingerprinting algorithm
> >>>>to determine when hardware changes.  It can be hard to detect in
> >>>>simple testing because it's based on a threshold.
> >>>>
> >>>>Regards,
> >>>>
> >>>>Anthony Liguori
> >>>
> >>>Which reminds me - qemu sticks the release version in
> >>>guest visible places like CPU version.
> >>>This is wrong and causes windows guests to print messages
> >>>about driver updates when you switch.
> >>>We should find all these places and stop doing this.
> >>
> >>We could probably get away with doing a query/replace of
> >>QEMU_VERSION with qemu_get_version(), make version a static variable
> >>that defaults to QEMU_VERSION, and then provide a way for machines
> >>to override it.
> >>
> >>Then pc-0.10 could report a version of 0.10.
> >>
> >>Regards,
> >>
> >>Anthony Liguori
> >
> >Frankly I don't see value in making it visible to the user,
> >at all. We are just triggering windows reactivations
> >without any user benefit. Why not return a fixed value there
> >to avoid that?
> 
> I don't see a problem making it fixed for 1.1, but for 1.0 and
> older, we should expose what we were supposed to expose.
> We need to fix the bug first, then we can change the behavior.
> 
> Regards,
> 
> Anthony Liguori
> 
> >
> >>>>>
> >>>>>

Makes sense to me.

