Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Upodb-00036U-HK
	for mharc-qemu-trivial@gnu.org; Thu, 20 Jun 2013 19:51:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35651)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UpodX-000329-Vi
	for qemu-trivial@nongnu.org; Thu, 20 Jun 2013 19:51:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UpodV-0005Jb-Rb
	for qemu-trivial@nongnu.org; Thu, 20 Jun 2013 19:51:31 -0400
Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230]:56483)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UpodV-0005JC-Hj
	for qemu-trivial@nongnu.org; Thu, 20 Jun 2013 19:51:29 -0400
Received: by mail-pa0-f48.google.com with SMTP id kp12so6916535pab.35
	for <qemu-trivial@nongnu.org>; Thu, 20 Jun 2013 16:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=iZkUsp9W/c5jB6+W6rN2JCGF0vctjVLVBNT0eTWRFXw=;
	b=PTrwhFPjvU3QG+GwP4ioCXcPi+hnYbjM2F5oblhd7ISt5SMN9h8IRlnxIEUlnyeS7y
	suZ6ty7JOb45/C9HqoQI2066tvE/I3mVyG2gBKtp0vOF2/KF6VsTFVIGADRMbUQwBhhp
	IGZf/aEgmcMxOlMb5X4tOqPwrDrRJAarB79MrZqEHAZEbotkAujj1IBl9tdqE7llCgrW
	RKXapqM7n/jVM2Th2wZDQAry12DfiN+lLl6AfCBJjae0pfwl2j9Enf2ZE4oM9qTrjrW1
	09KI2OdXvnRu5EdQcS1ifDJj62aTnRjbLKwMxDTgLpINbau3hVDk6LylFcL5r+3c945O
	k5kg==
X-Received: by 10.68.69.108 with SMTP id d12mr9671703pbu.187.1371772287802;
	Thu, 20 Jun 2013 16:51:27 -0700 (PDT)
Received: from aik.ozlabs.ibm.com (60-242-102-4.tpgi.com.au. [60.242.102.4])
	by mx.google.com with ESMTPSA id iq2sm2119708pbb.19.2013.06.20.16.51.22
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 20 Jun 2013 16:51:26 -0700 (PDT)
Message-ID: <51C39578.6020204@ozlabs.ru>
Date: Fri, 21 Jun 2013 09:51:20 +1000
From: Alexey Kardashevskiy <aik@ozlabs.ru>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Anthony Liguori <aliguori@us.ibm.com>
References: <1371737338-25148-1-git-send-email-aik@ozlabs.ru>
	<874ncshh67.fsf@codemonkey.ws>
In-Reply-To: <874ncshh67.fsf@codemonkey.ws>
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: 7bit
X-Gm-Message-State: ALoCoQlpLSObYOYMWEtMlQnV+wkTIIcwo7uLxrHeC1QA31ftMdm7YLgawhRyS2ApqjdVPGU/UTHo
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::230
Cc: "Michael S . Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Paul Mackerras <paulus@samba.org>,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] RFC kvm irqfd: add directly
 mapped MSI IRQ support
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
X-List-Received-Date: Thu, 20 Jun 2013 23:51:34 -0000

On 06/21/2013 02:37 AM, Anthony Liguori wrote:
> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
> 
>> At the moment QEMU creates a route for every MSI IRQ.
>>
>> Now we are about to add IRQFD support on PPC64-pseries platform.
>> pSeries already has in-kernel emulated interrupt controller with
>> 8192 IRQs. Also, pSeries PHB already supports MSIMessage to IRQ
>> mapping as a part of PAPR requirements for MSI/MSIX guests.
>> Specifically, the pSeries guest does not touch MSIMessage's at
>> all, instead it uses rtas_ibm_change_msi and rtas_ibm_query_interrupt_source
>> rtas calls to do the mapping.
>>
>> Therefore we do not really need more routing than we got already.
>> The patch introduces the infrastructure to enable direct IRQ mapping.
>>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>
>> ---
>>
>> The patch is raw and ugly indeed, I made it only to demonstrate
>> the idea and see if it has right to live or not.
>>
>> For some reason which I do not really understand (limited GSI numbers?)
>> the existing code always adds routing and I do not see why we would need it.
>>
>> Thanks!
>> ---
>>  hw/misc/vfio.c           |   11 +++++++++--
>>  hw/pci/pci.c             |   13 +++++++++++++
>>  hw/ppc/spapr_pci.c       |   13 +++++++++++++
>>  hw/virtio/virtio-pci.c   |   26 ++++++++++++++++++++------
>>  include/hw/pci/pci.h     |    4 ++++
>>  include/hw/pci/pci_bus.h |    1 +
>>  6 files changed, 60 insertions(+), 8 deletions(-)
>>
>> diff --git a/hw/misc/vfio.c b/hw/misc/vfio.c
>> index 14aac04..2d9eef7 100644
>> --- a/hw/misc/vfio.c
>> +++ b/hw/misc/vfio.c
>> @@ -639,7 +639,11 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
>>       * Attempt to enable route through KVM irqchip,
>>       * default to userspace handling if unavailable.
>>       */
>> -    vector->virq = msg ? kvm_irqchip_add_msi_route(kvm_state, *msg) : -1;
>> +
>> +    vector->virq = msg ? pci_bus_map_msi(vdev->pdev.bus, *msg) : -1;
>> +    if (vector->virq < 0) {
>> +        vector->virq = msg ? kvm_irqchip_add_msi_route(kvm_state, *msg) : -1;
>> +    }
>>      if (vector->virq < 0 ||
>>          kvm_irqchip_add_irqfd_notifier(kvm_state, &vector->interrupt,
>>                                         vector->virq) < 0) {
>> @@ -807,7 +811,10 @@ retry:
>>           * Attempt to enable route through KVM irqchip,
>>           * default to userspace handling if unavailable.
>>           */
>> -        vector->virq = kvm_irqchip_add_msi_route(kvm_state, msg);
>> +        vector->virq = pci_bus_map_msi(vdev->pdev.bus, msg);
>> +        if (vector->virq < 0) {
>> +            vector->virq = kvm_irqchip_add_msi_route(kvm_state, msg);
>> +        }
> 
> I don't understand why you're adding a pci level hook verses just having
> a kvmppc specific hook in the kvm_irqchip_add_msi_route function..

Me neither :) I am just asking. The existing mapping code already exists in
sPAPR PCI host bridge and it is not going anywhere else.

And kvm_irqchip_add_msi_route does not have any link to a device or a bus
so I'll have to walk through all PHBs in system and see if PHB's MSI window
is the one from MSIMessage and convert MSIMessage to virq. Pretty easy and
quick but still dirty hack, would it be better?


-- 
Alexey

