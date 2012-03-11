Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S6lMu-0001n7-5L
	for mharc-qemu-trivial@gnu.org; Sun, 11 Mar 2012 12:11:36 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60226)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1S6lMj-0001Em-Am
	for qemu-trivial@nongnu.org; Sun, 11 Mar 2012 12:11:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1S6lMZ-00081b-2y
	for qemu-trivial@nongnu.org; Sun, 11 Mar 2012 12:11:24 -0400
Received: from mail-iy0-f173.google.com ([209.85.210.173]:35687)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1S6lMT-0007vZ-0x; Sun, 11 Mar 2012 12:11:09 -0400
Received: by mail-iy0-f173.google.com with SMTP id j26so6038266iaf.4
	for <multiple recipients>; Sun, 11 Mar 2012 09:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=YDx/OqTxn3kYQEV3waVZioOC2zDb3z4jr7o1FR50PVY=;
	b=CiK+L/suADvhSqGiMblCiRCvHbIg0kPWyXDebEHBywUtrc3KTfjpxxF4LN6Na7mg90
	NgcdaQtbMAo8HUeTrWpjMNszlWpqqnrlz5UCkC5HfIJxgCeytgQfD6ibTWo5CzW25RrZ
	ZAUTgv5tI8iGlD1qF1MtSok9NockSQOp2jBC3zCqYH5iwh8KXBgxs3JsvGJgiv0ZzFCm
	/8yxw+32b9FNRYpGl4+UnI8PVlF/6xawqMKSpip+TsPpFQSB8HDeGa7lhpVVJ4uOarw1
	G/Bi9y6P9p+YTEaMbiShGqnSrEI3y6NqHsp767VO1A0pl0kAMAyzXx6/ED2vuJRbiKCu
	EEjQ==
Received: by 10.50.219.232 with SMTP id pr8mr14596414igc.51.1331482267759;
	Sun, 11 Mar 2012 09:11:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.75.41 with HTTP; Sun, 11 Mar 2012 09:10:47 -0700 (PDT)
In-Reply-To: <4F5BA83B.1010403@weilnetz.de>
References: <1328473147-22124-1-git-send-email-sw@weilnetz.de>
	<4F5BA83B.1010403@weilnetz.de>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Sun, 11 Mar 2012 16:10:47 +0000
Message-ID: <CAAu8pHvrVvkNMhDLXvZA8B=jY8f+5wqJW8oY-krRgdT-dsbjtw@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org,
	Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Add missing const
	attributes for MemoryRegionOps
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
X-List-Received-Date: Sun, 11 Mar 2012 16:11:33 -0000

Thanks, applied.

On Sat, Mar 10, 2012 at 19:15, Stefan Weil <sw@weilnetz.de> wrote:
> Am 05.02.2012 21:19, schrieb Stefan Weil:
>>
>> Most MemoryRegionOps already had the const attribute.
>> This patch adds it to the remaining ones.
>>
>> Signed-off-by: Stefan Weil<sw@weilnetz.de>
>> ---
>> =C2=A0hw/cuda.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
>> =C2=A0hw/ide/ahci.c =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A04 ++--
>> =C2=A0hw/ide/cmd646.c =C2=A0 =C2=A0| =C2=A0 =C2=A06 +++---
>> =C2=A0hw/ide/macio.c =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
>> =C2=A0hw/ide/piix.c =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
>> =C2=A0hw/ide/via.c =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
>> =C2=A0hw/mipsnet.c =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
>> =C2=A0hw/opencores_eth.c | =C2=A0 =C2=A04 ++--
>> =C2=A0hw/spapr_pci.c =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
>> =C2=A09 files changed, 13 insertions(+), 13 deletions(-)
>>
>> diff --git a/hw/cuda.c b/hw/cuda.c
>> index 4077436..233ab66 100644
>> --- a/hw/cuda.c
>> +++ b/hw/cuda.c
>> @@ -634,7 +634,7 @@ static uint32_t cuda_readl (void *opaque,
>> target_phys_addr_t addr)
>> =C2=A0 =C2=A0 =C2=A0return 0;
>> =C2=A0}
>>
>> -static MemoryRegionOps cuda_ops =3D {
>> +static const MemoryRegionOps cuda_ops =3D {
>> =C2=A0 =C2=A0 =C2=A0.old_mmio =3D {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.write =3D {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cuda_writeb,
>> diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
>> index 630d572..cc54590 100644
>> --- a/hw/ide/ahci.c
>> +++ b/hw/ide/ahci.c
>> @@ -365,7 +365,7 @@ static void ahci_mem_write(void *opaque,
>> target_phys_addr_t addr,
>>
>> =C2=A0}
>>
>> -static MemoryRegionOps ahci_mem_ops =3D {
>> +static const MemoryRegionOps ahci_mem_ops =3D {
>> =C2=A0 =C2=A0 =C2=A0.read =3D ahci_mem_read,
>> =C2=A0 =C2=A0 =C2=A0.write =3D ahci_mem_write,
>> =C2=A0 =C2=A0 =C2=A0.endianness =3D DEVICE_LITTLE_ENDIAN,
>> @@ -401,7 +401,7 @@ static void ahci_idp_write(void *opaque,
>> target_phys_addr_t addr,
>> =C2=A0 =C2=A0 =C2=A0}
>> =C2=A0}
>>
>> -static MemoryRegionOps ahci_idp_ops =3D {
>> +static const MemoryRegionOps ahci_idp_ops =3D {
>> =C2=A0 =C2=A0 =C2=A0.read =3D ahci_idp_read,
>> =C2=A0 =C2=A0 =C2=A0.write =3D ahci_idp_write,
>> =C2=A0 =C2=A0 =C2=A0.endianness =3D DEVICE_LITTLE_ENDIAN,
>> diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
>> index d78ed69..0aac94a 100644
>> --- a/hw/ide/cmd646.c
>> +++ b/hw/ide/cmd646.c
>> @@ -65,7 +65,7 @@ static void cmd646_cmd_write(void *opaque,
>> target_phys_addr_t addr,
>> =C2=A0 =C2=A0 =C2=A0ide_cmd_write(cmd646bar->bus, addr + 2, data);
>> =C2=A0}
>>
>> -static MemoryRegionOps cmd646_cmd_ops =3D {
>> +static const MemoryRegionOps cmd646_cmd_ops =3D {
>> =C2=A0 =C2=A0 =C2=A0.read =3D cmd646_cmd_read,
>> =C2=A0 =C2=A0 =C2=A0.write =3D cmd646_cmd_write,
>> =C2=A0 =C2=A0 =C2=A0.endianness =3D DEVICE_LITTLE_ENDIAN,
>> @@ -104,7 +104,7 @@ static void cmd646_data_write(void *opaque,
>> target_phys_addr_t addr,
>> =C2=A0 =C2=A0 =C2=A0}
>> =C2=A0}
>>
>> -static MemoryRegionOps cmd646_data_ops =3D {
>> +static const MemoryRegionOps cmd646_data_ops =3D {
>> =C2=A0 =C2=A0 =C2=A0.read =3D cmd646_data_read,
>> =C2=A0 =C2=A0 =C2=A0.write =3D cmd646_data_write,
>> =C2=A0 =C2=A0 =C2=A0.endianness =3D DEVICE_LITTLE_ENDIAN,
>> @@ -193,7 +193,7 @@ static void bmdma_write(void *opaque,
>> target_phys_addr_t addr,
>> =C2=A0 =C2=A0 =C2=A0}
>> =C2=A0}
>>
>> -static MemoryRegionOps cmd646_bmdma_ops =3D {
>> +static const MemoryRegionOps cmd646_bmdma_ops =3D {
>> =C2=A0 =C2=A0 =C2=A0.read =3D bmdma_read,
>> =C2=A0 =C2=A0 =C2=A0.write =3D bmdma_write,
>> =C2=A0};
>> diff --git a/hw/ide/macio.c b/hw/ide/macio.c
>> index a827d81..2c4027d 100644
>> --- a/hw/ide/macio.c
>> +++ b/hw/ide/macio.c
>> @@ -291,7 +291,7 @@ static uint32_t pmac_ide_readl (void
>> *opaque,target_phys_addr_t addr)
>> =C2=A0 =C2=A0 =C2=A0return retval;
>> =C2=A0}
>>
>> -static MemoryRegionOps pmac_ide_ops =3D {
>> +static const MemoryRegionOps pmac_ide_ops =3D {
>> =C2=A0 =C2=A0 =C2=A0.old_mmio =3D {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.write =3D {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pmac_ide_writeb,
>> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
>> index a472bff..c524f55 100644
>> --- a/hw/ide/piix.c
>> +++ b/hw/ide/piix.c
>> @@ -79,7 +79,7 @@ static void bmdma_write(void *opaque, target_phys_addr=
_t
>> addr,
>> =C2=A0 =C2=A0 =C2=A0}
>> =C2=A0}
>>
>> -static MemoryRegionOps piix_bmdma_ops =3D {
>> +static const MemoryRegionOps piix_bmdma_ops =3D {
>> =C2=A0 =C2=A0 =C2=A0.read =3D bmdma_read,
>> =C2=A0 =C2=A0 =C2=A0.write =3D bmdma_write,
>> =C2=A0};
>> diff --git a/hw/ide/via.c b/hw/ide/via.c
>> index 2771f0c..ad6f302 100644
>> --- a/hw/ide/via.c
>> +++ b/hw/ide/via.c
>> @@ -82,7 +82,7 @@ static void bmdma_write(void *opaque, target_phys_addr=
_t
>> addr,
>> =C2=A0 =C2=A0 =C2=A0}
>> =C2=A0}
>>
>> -static MemoryRegionOps via_bmdma_ops =3D {
>> +static const MemoryRegionOps via_bmdma_ops =3D {
>> =C2=A0 =C2=A0 =C2=A0.read =3D bmdma_read,
>> =C2=A0 =C2=A0 =C2=A0.write =3D bmdma_write,
>> =C2=A0};
>> diff --git a/hw/mipsnet.c b/hw/mipsnet.c
>> index a0e6c9f..1b49a79 100644
>> --- a/hw/mipsnet.c
>> +++ b/hw/mipsnet.c
>> @@ -224,7 +224,7 @@ static NetClientInfo net_mipsnet_info =3D {
>> =C2=A0 =C2=A0 =C2=A0.cleanup =3D mipsnet_cleanup,
>> =C2=A0};
>>
>> -static MemoryRegionOps mipsnet_ioport_ops =3D {
>> +static const MemoryRegionOps mipsnet_ioport_ops =3D {
>> =C2=A0 =C2=A0 =C2=A0.read =3D mipsnet_ioport_read,
>> =C2=A0 =C2=A0 =C2=A0.write =3D mipsnet_ioport_write,
>> =C2=A0 =C2=A0 =C2=A0.impl.min_access_size =3D 1,
>> diff --git a/hw/opencores_eth.c b/hw/opencores_eth.c
>> index 09f2757..6f3f5fc 100644
>> --- a/hw/opencores_eth.c
>> +++ b/hw/opencores_eth.c
>> @@ -692,12 +692,12 @@ static void open_eth_desc_write(void *opaque,
>> =C2=A0}
>>
>>
>> -static MemoryRegionOps open_eth_reg_ops =3D {
>> +static const MemoryRegionOps open_eth_reg_ops =3D {
>> =C2=A0 =C2=A0 =C2=A0.read =3D open_eth_reg_read,
>> =C2=A0 =C2=A0 =C2=A0.write =3D open_eth_reg_write,
>> =C2=A0};
>>
>> -static MemoryRegionOps open_eth_desc_ops =3D {
>> +static const MemoryRegionOps open_eth_desc_ops =3D {
>> =C2=A0 =C2=A0 =C2=A0.read =3D open_eth_desc_read,
>> =C2=A0 =C2=A0 =C2=A0.write =3D open_eth_desc_write,
>> =C2=A0};
>> diff --git a/hw/spapr_pci.c b/hw/spapr_pci.c
>> index ed2e4b3..3c08d57 100644
>> --- a/hw/spapr_pci.c
>> +++ b/hw/spapr_pci.c
>> @@ -281,7 +281,7 @@ static void spapr_io_write(void *opaque,
>> target_phys_addr_t addr,
>> =C2=A0 =C2=A0 =C2=A0assert(0);
>> =C2=A0}
>>
>> -static MemoryRegionOps spapr_io_ops =3D {
>> +static const MemoryRegionOps spapr_io_ops =3D {
>> =C2=A0 =C2=A0 =C2=A0.endianness =3D DEVICE_LITTLE_ENDIAN,
>> =C2=A0 =C2=A0 =C2=A0.read =3D spapr_io_read,
>> =C2=A0 =C2=A0 =C2=A0.write =3D spapr_io_write
>>
>
>
>
> Ping. Could someone please commit this patch to QEMU master?
> More than one month should be enough time for a review.
>
> Thanks,
> Stefan Weil
>
>

