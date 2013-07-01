Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UtVo8-0006Fb-0x
	for mharc-qemu-trivial@gnu.org; Mon, 01 Jul 2013 00:33:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50005)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UtVo3-0006FJ-8H
	for qemu-trivial@nongnu.org; Mon, 01 Jul 2013 00:33:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UtVo1-0003Hr-My
	for qemu-trivial@nongnu.org; Mon, 01 Jul 2013 00:33:39 -0400
Received: from mail-vc0-f171.google.com ([209.85.220.171]:37740)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UtVo1-0003HF-IC
	for qemu-trivial@nongnu.org; Mon, 01 Jul 2013 00:33:37 -0400
Received: by mail-vc0-f171.google.com with SMTP id gd11so1712955vcb.16
	for <qemu-trivial@nongnu.org>; Sun, 30 Jun 2013 21:33:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=0I8d3d2TXkwoP9L5xfnAT45UzDaPQPlDyh+5uKY1AgE=;
	b=OE1o7zVH0gamzz6hYmNFxZkXYiMkUszr4Xx9RydNPIHBH5eenR+734Vz7lBbq2WhB8
	QyDNGqK9kB+p6u04d2VhV/MLIcZuti148tvTPw5cNJsaKtPhyJJsnIelpL+EBAGKXyqd
	NkZ43ALFb89USUQCPCF+dYHWhDkRUE6TotpC5D/wb5XNZfULyM6b7zIKJ7YoZhGAMQuO
	Ddg1GD7N2U3CtDaxGph32fSW8rigqBqiAuPKUhJ7tDtsL+YxBvp5AgN1Nlu/a+2QXBYk
	53c5nisfNPcMk/Emt6hQLypfYGvMLQ+Kf0fP4VIvg3cNtVe8kEl8I9jJEkUDnjVax9wO
	3NeA==
MIME-Version: 1.0
X-Received: by 10.52.163.67 with SMTP id yg3mr7726919vdb.14.1372653215792;
	Sun, 30 Jun 2013 21:33:35 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.220.224.201 with HTTP; Sun, 30 Jun 2013 21:33:35 -0700 (PDT)
In-Reply-To: <51D00BF1.5070900@suse.de>
References: <cover.1372055322.git.peter.crosthwaite@xilinx.com>
	<51D00BF1.5070900@suse.de>
Date: Mon, 1 Jul 2013 14:33:35 +1000
X-Google-Sender-Auth: hcCVgBZ6nfWi175vGH1umiyURpw
Message-ID: <CAEgOgz4XdjfpSXh36zKkFvfsaTArRhMYPODLhk82pDnQOOk-+w@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQkZQt2RLWdBJ1NrUYFexhEOlXNFPe78vfIF6rL2fyrglm3om2a3LqYJTpDEn9K/MPjpDWkg
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.171
Cc: mst@redhat.com, qemu-trivial <qemu-trivial@nongnu.org>,
	qemu-devel@nongnu.org, Blue Swirl <blauwirbel@gmail.com>,
	Anthony Liguori <anthony@codemonkey.ws>, pbonzini@redhat.com,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 00/30] PCI: Cleanup
 legacy casts in device land -- ANN: qom-next revived
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
X-List-Received-Date: Mon, 01 Jul 2013 04:33:42 -0000

Hi Andreas,

On Sun, Jun 30, 2013 at 8:44 PM, Andreas F=E4rber <afaerber@suse.de> wrote:
> Hi Peter,
>
> Am 24.06.2013 08:49, schrieb peter.crosthwaite@xilinx.com:
>> From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>>
>> There are a number of different cast implementations from various
>> stages of QEMU development out in device model land. This series cleans
>> up the ones involving TYPE_PCI_DEVICE to consistently use proper QOM
>> casts for both up and down casts.
>>
>> Some were easy, some needed QOM cast macros which are added as
>> appropriate.
>>
>> Following the recent discussion RE performance consequences of QOM
>> casts, im interested in any reports of possible performance regressions
>> here, although I am hoping that Anthony current efforts to improve
>> QOM casting efficiency make this a non-issue.
>
> While I did not run extensive benchmarks, state of the discussion
> between Paolo, Anthony and me, I believe, was that it can be considered
> okay to use QOM casts "everywhere" consistently now, but we should not
> use casts where they are unnecessary (i.e., only where we change type).
> E.g., http://patchwork.ozlabs.org/patch/255367/
>
> I have therefore dropped some opaque casts where the type on both sides
> of void* matched (for an up-/downcast I do prefer the cast for safety).
>
> Anyway, if we get this merged early, then there is still time for more
> benchmarking/optimizations during Soft Freeze IMO.
> Maybe our staging tree will facilitate testing, too. ;)
>
>> Changed since V1:
>> Removed hunks which macroified VMSD names
>> Dropped virtio/virtio.pci patch
>> Rebased
>>
>>
>> Peter Crosthwaite (30):
>>   net/e1000: QOM Upcast Sweep
>>   net/rtl8139: QOM Upcast Sweep
>>   net/pcnet-pci: QOM Upcast Sweep
>>   usb/hcd-xhci: QOM Upcast Sweep
>>   scsi/lsi53c895a: QOM Upcast Sweep
>>   scsi/megasas: QOM Upcast Sweep
>>   scsi/esp-pci: QOM Upcast Sweep
>>   ide/ich: QOM Upcast Sweep
>>   ide/piix: QOM casting sweep
>>   acpi/piix4: QOM Upcast Sweep
>>   misc/pci-testdev: QOM Upcast Sweep
>>   virtio/vmware_vga: QOM casting sweep
>>   misc/ivshmem: QOM Upcast Sweep
>>   xen/xen_platform: QOM casting sweep
>
> As requested, I've started picking up QOM type/cast/realize patches on:
>
> git://github.com/afaerber/qemu-cpu.git qom-next

Perhaps this is becoming the "qom-devices" queue?

> https://github.com/afaerber/qemu-cpu/commits/qom-next
>
> (Not to be confused with my qom-cpu / qom-cpu-next CPU trees.)
>
> If anyone wishes to contribute patches against that tree, please
> indicate so with --subject-prefix=3D"PATCH qom-next ...".
>
> As a matter of personal taste and consistency, I've used the gtk-doc
> notation DO_UPCAST() wherever I stumbled over it in commit messages.
>
> I've queued all patches above except for ide/piix (09/30) and had
> comments and/or minor changes for some of them. Noticing some
> incompleteness, I will reiterate over them.
>

I think the incompleteness comes from the fact that my series is only
worrying about type PCI_DEVICE. I have left alone QOM cast issues for
casts that are not to/from or through TYPE_PCI_DEVICE, so there are
instances where a QOM cast macro may be introduces but not used.

> Whether I send a pull when we're all happy with it or whether we let
> submaintainers pick/pull by subsystem at some point doesn't matter to
> me, as long as we can join efforts to make QOM realize reality soon. :)
>

I think getting it all into one giant queue then we can centralise
testing a little better.

>>   isa/*: QOM casting sweep
>>   pci/*: QOM casting sweep
>>   pci-bridge/pci_bridge_dev: Don't use DO_UPCAST
>>   pci-bridge/*: substitute ->qdev casts with DEVICE()
>>   pci/pci_bridge: substitute ->qdev casts with DEVICE()
>>   misc/vfio: substitute ->qdev casts with DEVICE()
>>   net/eepro100: substitute ->qdev casts with DEVICE()
>>   net/ne2000: substitute ->qdev casts with DEVICE()
>>   usb/*: substitute ->qdev casts with DEVICE()
>>   watchdog/wdt_i6300esb: substitute ->qdev casts with DEVICE()
>>   scsi/vmw_pvscsi: substitute ->qdev casts with DEVICE()
>>   i2c/smbus_ich9: substitute ->qdev casts with DEVICE()
>>   ide/cmd646: substitute ->qdev casts with DEVICE()
>>   ide/via: substitute ->qdev casts with DEVICE()
>>   pci-host/*: substitute ->qdev casts with DEVICE()
>>   i386/*: substitute ->qdev casts with DEVICE()
>
> These patches seem more "sloppy" while not reaching a clear goal such as
> dropping a macro or renaming PCIDevice::qdev, so I'd prefer to get open
> issues sorted out before rushing ahead with half-done conversions.
> Functionally everything I've seen so far looked fine though.
>
> But maybe I'm missing something? What exactly was the motivation behind
> the series? Do you have a follow-up?
>

I have an experimental series out-of-tree (change the parent type of
TYPE_PCI_DEVICE to TYPE_SYSBUS) to remove the need to coreify devices
for use as both sysbus and PCI (e.g. EHCI). These casts get in the way
of that series.

I really want to make it clear though, that this series is legitimate
cleanup without that goal, so I didn't want to tangle this series in
that much-longer discussion.

So this series specifically is a compile bug chase on:

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 6ef1f97..5f607b3 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -217,7 +217,6 @@ typedef void (*MSIVectorPollNotifier)(PCIDevice *dev,
                                       unsigned int vector_end);

 struct PCIDevice {
-    DeviceState qdev;

     /* PCI config space */
     uint8_t *config;

FWIW, one could actually remove all parent_obj fields from QOM structs
(just like this) and the tree should compile, good way to catch all
legacy casts.

Regards,
Peter

> Regards,
> Andreas
>
>>
>>  hw/acpi/piix4.c                    | 31 +++++++++++++++++--------------
>>  hw/display/vmware_vga.c            | 13 ++++++++-----
>>  hw/i2c/smbus_ich9.c                |  2 +-
>>  hw/i386/kvm/pci-assign.c           | 21 ++++++++++++---------
>>  hw/i386/pc.c                       |  3 ++-
>>  hw/i386/pc_piix.c                  |  4 ++--
>>  hw/i386/pc_q35.c                   |  4 ++--
>>  hw/ide/ahci.h                      |  5 +++++
>>  hw/ide/cmd646.c                    |  8 ++++----
>>  hw/ide/ich.c                       | 10 +++++-----
>>  hw/ide/piix.c                      |  8 ++++----
>>  hw/ide/via.c                       |  4 ++--
>>  hw/isa/i82378.c                    |  8 ++++----
>>  hw/isa/lpc_ich9.c                  |  6 +++---
>>  hw/misc/ivshmem.c                  | 18 +++++++++++-------
>>  hw/misc/pci-testdev.c              | 11 ++++++++---
>>  hw/misc/vfio.c                     |  4 ++--
>>  hw/net/e1000.c                     | 18 ++++++++++++------
>>  hw/net/eepro100.c                  | 14 ++++++++------
>>  hw/net/ne2000.c                    |  6 ++++--
>>  hw/net/pcnet-pci.c                 | 14 +++++++++-----
>>  hw/net/rtl8139.c                   | 26 ++++++++++++++++++--------
>>  hw/pci-bridge/dec.c                |  2 +-
>>  hw/pci-bridge/i82801b11.c          |  2 +-
>>  hw/pci-bridge/ioh3420.c            |  2 +-
>>  hw/pci-bridge/pci_bridge_dev.c     |  2 +-
>>  hw/pci-bridge/xio3130_downstream.c |  2 +-
>>  hw/pci-bridge/xio3130_upstream.c   |  2 +-
>>  hw/pci-host/apb.c                  |  4 ++--
>>  hw/pci-host/q35.c                  |  4 ++--
>>  hw/pci/pci-hotplug.c               | 18 ++++++++++--------
>>  hw/pci/pci.c                       | 17 +++++++++--------
>>  hw/pci/pci_bridge.c                |  7 ++++---
>>  hw/pci/pcie.c                      |  4 ++--
>>  hw/pci/shpc.c                      |  8 ++++----
>>  hw/scsi/esp-pci.c                  | 14 +++++++++-----
>>  hw/scsi/lsi53c895a.c               | 26 ++++++++++++++++----------
>>  hw/scsi/megasas.c                  | 15 ++++++++++-----
>>  hw/scsi/vmw_pvscsi.c               |  2 +-
>>  hw/usb/hcd-ehci-pci.c              | 13 ++++++++-----
>>  hw/usb/hcd-ohci.c                  |  2 +-
>>  hw/usb/hcd-uhci.c                  |  2 +-
>>  hw/usb/hcd-xhci.c                  | 19 +++++++++++++------
>>  hw/watchdog/wdt_i6300esb.c         |  2 +-
>>  hw/xen/xen_platform.c              | 28 ++++++++++++++++------------
>>  45 files changed, 258 insertions(+), 177 deletions(-)
>>
>
>
> --
> SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg
>

