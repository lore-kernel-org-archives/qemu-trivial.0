Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UtW4e-0000IY-SV
	for mharc-qemu-trivial@gnu.org; Mon, 01 Jul 2013 00:50:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57990)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UtW4a-0000HT-7M
	for qemu-trivial@nongnu.org; Mon, 01 Jul 2013 00:50:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UtW4X-0002II-ML
	for qemu-trivial@nongnu.org; Mon, 01 Jul 2013 00:50:44 -0400
Received: from mail-ve0-f169.google.com ([209.85.128.169]:40227)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UtW4X-0002Hg-Ap
	for qemu-trivial@nongnu.org; Mon, 01 Jul 2013 00:50:41 -0400
Received: by mail-ve0-f169.google.com with SMTP id m1so3367262ves.14
	for <qemu-trivial@nongnu.org>; Sun, 30 Jun 2013 21:50:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=6VRAEJDtst+eDmwaUEvpBaC/G7OXRKWQH8PUpaOXcxI=;
	b=BO68FCgdEYw5YWKfAsF3aYDGmq1x9I547PaPWlWgRgn8wcp79RTCPhMkREtjoAXBbZ
	yffagP9TYRoXm265fi3mZZy4L5e3YHtumFKymahn8YcFDmHJzTuz8UParrgT7ajcWm8N
	1jeDhaok0Wy+6h3+NEbmQAWnlbFqhAcLrIS/hQWn3+zhaGsCoXeprbE2U+p8K4qTggvs
	KF/kOczvO81q4o+0OxCT0wh0NezWPj+ahdjfZmBR2Qdn43yAIlth+MiXnDu8n9hm5ZIC
	kTNZ3eDCmZVylRe6syXPoP4XzkjDV6eK31qnbo9L0UgsCqDl+qTrMP0Vq+8nAhokd5NX
	8y8Q==
MIME-Version: 1.0
X-Received: by 10.220.143.140 with SMTP id v12mr9013687vcu.95.1372654240409;
	Sun, 30 Jun 2013 21:50:40 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.220.224.201 with HTTP; Sun, 30 Jun 2013 21:50:40 -0700 (PDT)
In-Reply-To: <51D00BF1.5070900@suse.de>
References: <cover.1372055322.git.peter.crosthwaite@xilinx.com>
	<51D00BF1.5070900@suse.de>
Date: Mon, 1 Jul 2013 14:50:40 +1000
X-Google-Sender-Auth: TrekzBe5CLe_Cu5n8YJLqBYm-B8
Message-ID: <CAEgOgz5na8X9-UNYCiY3HbceG1QHG7eB-uomgqXQ9FgSBjL9hQ@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQm7cA8R0kK0Gfv1UNVrIniS/2FebE2IkpauV3zXdoor/t1hSuzzqASg6YUx9K+DfNilAyoD
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.169
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
X-List-Received-Date: Mon, 01 Jul 2013 04:50:47 -0000

Hi Andreas,

Thanks for the review and fixups. ACK to all modifications and
squashes as commented.

Regards,
Peter

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
> Whether I send a pull when we're all happy with it or whether we let
> submaintainers pick/pull by subsystem at some point doesn't matter to
> me, as long as we can join efforts to make QOM realize reality soon. :)
>
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

