Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YwsB3-0001qJ-M7
	for mharc-qemu-trivial@gnu.org; Mon, 25 May 2015 09:12:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41865)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YwsB1-0001pq-Tp
	for qemu-trivial@nongnu.org; Mon, 25 May 2015 09:12:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YwsAx-0001kh-Ux
	for qemu-trivial@nongnu.org; Mon, 25 May 2015 09:12:19 -0400
Received: from mail-wi0-x236.google.com ([2a00:1450:400c:c05::236]:38014)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YwsAx-0001kS-OV; Mon, 25 May 2015 09:12:15 -0400
Received: by wichy4 with SMTP id hy4so48692564wic.1;
	Mon, 25 May 2015 06:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=1g/et/pRJqtbRRa8jOlecTrLmMc1jjiKm9DTYoSKQ3I=;
	b=FdlgqPTacIFZ2Rh+rqlunaiEESTm76KJ1yPrFudwY4VkKTCgHcyMr0yi7Dx5pZ4JlN
	HpUqsMm1J2N/scX7LGuZofq0TePz9ouCu2k+8UPy1YZX0KG/c3TG00CoONUDnMYspGki
	w2rJk3srl88YG2M6PusAJ/v5pGpXUBOpNCxq2sCXmu+cDOe7P5a9uCCmurfSxJOBb4dR
	GlgsGbbAZl5szdUNITA+PAfp6CINC3HsfxvzMefQ+mtFdrrAWU8VtkhS8xdZIIqVJpFG
	Yw64Dl13QFlYd+T08ojh+Tqdxt8NhLK4OrJZJJjOvZaCY804hOf5XPHdkz87dhnoo9I5
	s55w==
X-Received: by 10.180.19.100 with SMTP id d4mr31489752wie.29.1432559535234;
	Mon, 25 May 2015 06:12:15 -0700 (PDT)
Received: from [192.168.10.165] (dynamic-adsl-94-39-199-114.clienti.tiscali.it.
	[94.39.199.114])
	by mx.google.com with ESMTPSA id o5sm12010002wia.0.2015.05.25.06.12.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 May 2015 06:12:14 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <55631FAB.4010906@redhat.com>
Date: Mon, 25 May 2015 15:12:11 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org
References: <1432543077-12656-1-git-send-email-zhaoshenglong@huawei.com>
	<1432543077-12656-3-git-send-email-zhaoshenglong@huawei.com>
In-Reply-To: <1432543077-12656-3-git-send-email-zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::236
Cc: qemu-trivial@nongnu.org, shannon.zhao@linaro.org
Subject: Re: [Qemu-trivial] [PATCH 2/3] hw/ide/pci: Fix memory leak
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
X-List-Received-Date: Mon, 25 May 2015 13:12:21 -0000



On 25/05/2015 10:37, Shannon Zhao wrote:
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
>  hw/ide/pci.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/ide/pci.c b/hw/ide/pci.c
> index 1b3d1c1..c5c4441 100644
> --- a/hw/ide/pci.c
> +++ b/hw/ide/pci.c
> @@ -464,6 +464,7 @@ void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d)
>      irq = qemu_allocate_irqs(bmdma_irq, bm, 1);
>      bus->irq = *irq;
>      bm->pci_dev = d;
> +    g_free(irq);
>  }

You can use qemu_allocate_irq here:

   bus->irq = qemu_allocate_irq(bmdma_irq, bm, 0);

Paolo

>  static const TypeInfo pci_ide_type_info = {
> 

