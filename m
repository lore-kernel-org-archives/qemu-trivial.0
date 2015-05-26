Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YxE7V-0007iC-9r
	for mharc-qemu-trivial@gnu.org; Tue, 26 May 2015 08:38:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44319)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>) id 1YxAaI-00032K-VI
	for qemu-trivial@nongnu.org; Tue, 26 May 2015 04:51:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>) id 1YxAaE-00044l-UH
	for qemu-trivial@nongnu.org; Tue, 26 May 2015 04:51:38 -0400
Received: from mail-wi0-x22a.google.com ([2a00:1450:400c:c05::22a]:32997)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>)
	id 1YxAaE-00044V-MR; Tue, 26 May 2015 04:51:34 -0400
Received: by wicmx19 with SMTP id mx19so57995550wic.0;
	Tue, 26 May 2015 01:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:reply-to:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=SQj9FvwGriLmXk2utS/O0b4vm4D2x2tJcKM4W2iySOw=;
	b=ENym0wBIsUARNHDD174bgJz2NbumJsejYGeWaHIf32WR0XiVndbK+m608bo4q9gTJv
	1vn7ul9D5GtS4FwrQKEJpPVoZ/ts+VF26sJsNSRXTgv2RLDyDQItBDNZ5b3ZioeUOXpb
	S9cAa7GN/zDnPbIwz2mfH2KtBci+QJaY6ipWbU1BQAnKf+MVO5Jb3LDPLCWdf8n/0a+t
	HIDKN+w6VFzsKKFqgmThsgoz6W5re8Pt71AUGbuXfMLBh8WlrYr6sOrj8OTGxWnWh4Z6
	SJ3cfNJ5gSzHFKo8w0NNSsiF0IdtdeuP/ailB55l0hUL6xmBWGsspZTYNoCP9RF0uZrs
	9dLg==
X-Received: by 10.181.13.5 with SMTP id eu5mr37350580wid.37.1432630293608;
	Tue, 26 May 2015 01:51:33 -0700 (PDT)
Received: from [10.0.0.6] (87.68.245.222.adsl.012.net.il. [87.68.245.222])
	by mx.google.com with ESMTPSA id
	gs7sm15752938wib.10.2015.05.26.01.51.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 May 2015 01:51:32 -0700 (PDT)
Message-ID: <55643412.5000703@gmail.com>
Date: Tue, 26 May 2015 11:51:30 +0300
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org
References: <1432604767-5964-1-git-send-email-zhaoshenglong@huawei.com>
	<1432604767-5964-3-git-send-email-zhaoshenglong@huawei.com>
In-Reply-To: <1432604767-5964-3-git-send-email-zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22a
X-Mailman-Approved-At: Tue, 26 May 2015 08:38:07 -0400
Cc: qemu-trivial@nongnu.org, shannon.zhao@linaro.org
Subject: Re: [Qemu-trivial] [PATCH v2 2/3] hw/ide/pci: Fix memory leak
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
X-List-Received-Date: Tue, 26 May 2015 08:51:40 -0000

On 05/26/2015 04:46 AM, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
>
> valgrind complains about:
> ==16447== 16 bytes in 2 blocks are definitely lost in loss record 1,304 of 3,310
> ==16447==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
> ==16447==    by 0x2E4FD7: malloc_and_trace (vl.c:2546)
> ==16447==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
> ==16447==    by 0x36FB47: qemu_extend_irqs (irq.c:55)
> ==16447==    by 0x36FBD3: qemu_allocate_irqs (irq.c:64)
> ==16447==    by 0x3B4B44: bmdma_init (pci.c:464)
> ==16447==    by 0x3B547B: pci_piix_init_ports (piix.c:144)
> ==16447==    by 0x3B55D2: pci_piix_ide_realize (piix.c:164)
> ==16447==    by 0x3EAEC6: pci_qdev_realize (pci.c:1790)
> ==16447==    by 0x36C685: device_set_realized (qdev.c:1058)
> ==16447==    by 0x47179E: property_set_bool (object.c:1514)
> ==16447==    by 0x470098: object_property_set (object.c:837)
>
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>   hw/ide/pci.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/hw/ide/pci.c b/hw/ide/pci.c
> index 1b3d1c1..4b5e32d 100644
> --- a/hw/ide/pci.c
> +++ b/hw/ide/pci.c
> @@ -452,8 +452,6 @@ static const struct IDEDMAOps bmdma_ops = {
>
>   void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d)
>   {
> -    qemu_irq *irq;
> -
>       if (bus->dma == &bm->dma) {
>           return;
>       }
> @@ -461,8 +459,7 @@ void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d)
>       bm->dma.ops = &bmdma_ops;
>       bus->dma = &bm->dma;
>       bm->irq = bus->irq;
> -    irq = qemu_allocate_irqs(bmdma_irq, bm, 1);
> -    bus->irq = *irq;
> +    bus->irq = qemu_allocate_irq(bmdma_irq, bm, 0);
>       bm->pci_dev = d;
>   }
>
>
Reviewed-by: Marcel Apfelbaum <marcel@redhat.com>

Thanks,
Marcel

