Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZX3az-0005Ur-7v
	for mharc-qemu-trivial@gnu.org; Wed, 02 Sep 2015 04:40:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47841)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>) id 1ZX3aw-0005Om-0m
	for qemu-trivial@nongnu.org; Wed, 02 Sep 2015 04:40:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>) id 1ZX3ap-0008D1-Pl
	for qemu-trivial@nongnu.org; Wed, 02 Sep 2015 04:40:37 -0400
Received: from mail-wi0-x22a.google.com ([2a00:1450:400c:c05::22a]:35102)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>)
	id 1ZX3ap-0008Cf-Jr; Wed, 02 Sep 2015 04:40:31 -0400
Received: by wicge5 with SMTP id ge5so32186865wic.0;
	Wed, 02 Sep 2015 01:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=reply-to:subject:references:to:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=2bIz9cez4UpYl2Xhs3kwr2i/3UAGyutzB/SUMJdl7BA=;
	b=IMzeKLBOAxka4r2TGC+0zBLHq3RHZ1JqgqWs1Y08f1JHgL6/t3kTb+cDkDBTiN0VPu
	7QsB1UOp52vs+d0xShTLWAKjWblNF30LVSLvbNsy5hWiHUBXRnW4gzU5uqDgI0CGHVi/
	vQAi4Rrka6/flrpPXsQVH1A+7TYtIfRGx9SD9v3AY/+6+sRfFwJIzOeyH/dE9EuH+/Hr
	QlW6sRLXiKbFC+DK06NGZt4iig2ngSSQLTjCoxTTCiOfYE5wvdOVA4lzfBsxhfCgUBnz
	AvSWuIPa3hXiscgAA8kWbvvR94KWKhshKRh84fBU2A4StLXZgU0e6wQ3A4tTwDTFzj3u
	Fwtw==
X-Received: by 10.180.103.2 with SMTP id fs2mr2667151wib.4.1441183230300;
	Wed, 02 Sep 2015 01:40:30 -0700 (PDT)
Received: from [192.168.1.115] ([46.120.6.143])
	by smtp.googlemail.com with ESMTPSA id
	ny7sm2406406wic.11.2015.09.02.01.40.28
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Sep 2015 01:40:29 -0700 (PDT)
References: <1441143203-15044-1-git-send-email-lersek@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Message-ID: <55E6B5FB.7030907@gmail.com>
Date: Wed, 2 Sep 2015 11:40:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1441143203-15044-1-git-send-email-lersek@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22a
Cc: qemu-trivial@nongnu.org, Don Koch <dkoch@verizon.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [Qemu-trivial] [trivial PATCH] hw/pci: fix
 pci_update_mappings() trace events
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: marcel@redhat.com
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Sep 2015 08:40:39 -0000

On 09/02/2015 12:33 AM, Laszlo Ersek wrote:
> The current trace prototypes and (matching) trace calls lead to
> "unorthodox" PCI BDF notation in at least the stderr trace backend. For
> example, the four BARs of a QXL video card at 00:01.0 (bus 0, slot 1,
> function 0) are traced like this (PID and timestamps removed):
>
>    pci_update_mappings_add d=0x7f14a73bf890 00:00.1 0,0x84000000+0x4000000
>    pci_update_mappings_add d=0x7f14a73bf890 00:00.1 1,0x80000000+0x4000000
>    pci_update_mappings_add d=0x7f14a73bf890 00:00.1 2,0x88200000+0x2000
>    pci_update_mappings_add d=0x7f14a73bf890 00:00.1 3,0xd060+0x20
>
> The slot and function values are in reverse order.
>
> Stick with the conventional BDF notation.
>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Don Koch <dkoch@verizon.com>
> Cc: qemu-trivial@nongnu.org
> Fixes: 7828d75045
> Signed-off-by: Laszlo Ersek <lersek@redhat.com>
> ---
>   hw/pci/pci.c | 4 ++--
>   trace-events | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 9f57aea..47f42ea 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -1154,16 +1154,16 @@ static void pci_update_mappings(PCIDevice *d)
>           /* now do the real mapping */
>           if (r->addr != PCI_BAR_UNMAPPED) {
>               trace_pci_update_mappings_del(d, pci_bus_num(d->bus),
> -                                          PCI_FUNC(d->devfn),
>                                             PCI_SLOT(d->devfn),
> +                                          PCI_FUNC(d->devfn),
>                                             i, r->addr, r->size);
>               memory_region_del_subregion(r->address_space, r->memory);
>           }
>           r->addr = new_addr;
>           if (r->addr != PCI_BAR_UNMAPPED) {
>               trace_pci_update_mappings_add(d, pci_bus_num(d->bus),
> -                                          PCI_FUNC(d->devfn),
>                                             PCI_SLOT(d->devfn),
> +                                          PCI_FUNC(d->devfn),
>                                             i, r->addr, r->size);
>               memory_region_add_subregion_overlap(r->address_space,
>                                                   r->addr, r->memory, 1);
> diff --git a/trace-events b/trace-events
> index 8f9614a..5e78f18 100644
> --- a/trace-events
> +++ b/trace-events
> @@ -1303,8 +1303,8 @@ spapr_pci_lsi_set(const char *busname, int pin, uint32_t irq) "%s PIN%d IRQ %u"
>   spapr_pci_msi_retry(unsigned config_addr, unsigned req_num, unsigned max_irqs) "Guest device at %x asked %u, have only %u"
>
>   # hw/pci/pci.c
> -pci_update_mappings_del(void *d, uint32_t bus, uint32_t func, uint32_t slot, int bar, uint64_t addr, uint64_t size) "d=%p %02x:%02x.%x %d,%#"PRIx64"+%#"PRIx64
> -pci_update_mappings_add(void *d, uint32_t bus, uint32_t func, uint32_t slot, int bar, uint64_t addr, uint64_t size) "d=%p %02x:%02x.%x %d,%#"PRIx64"+%#"PRIx64
> +pci_update_mappings_del(void *d, uint32_t bus, uint32_t slot, uint32_t func, int bar, uint64_t addr, uint64_t size) "d=%p %02x:%02x.%x %d,%#"PRIx64"+%#"PRIx64
> +pci_update_mappings_add(void *d, uint32_t bus, uint32_t slot, uint32_t func, int bar, uint64_t addr, uint64_t size) "d=%p %02x:%02x.%x %d,%#"PRIx64"+%#"PRIx64
>
>   # hw/net/pcnet.c
>   pcnet_s_reset(void *s) "s=%p"
>


Reviewed-by: Marcel Apfelbaum <marcel@redhat.com>

Thanks,
Marcel

