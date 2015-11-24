Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a1IMm-0005MB-9E
	for mharc-qemu-trivial@gnu.org; Tue, 24 Nov 2015 13:31:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35242)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>) id 1a1IMj-0005IQ-7u
	for qemu-trivial@nongnu.org; Tue, 24 Nov 2015 13:30:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>) id 1a1IMf-00066z-W6
	for qemu-trivial@nongnu.org; Tue, 24 Nov 2015 13:30:57 -0500
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:33108)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>)
	id 1a1IMf-00066v-IT; Tue, 24 Nov 2015 13:30:53 -0500
Received: by wmec201 with SMTP id c201so222692653wme.0;
	Tue, 24 Nov 2015 10:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=reply-to:subject:references:to:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=hITqJjk3sADK928rZmLTgLTeu1n/bEwDY1lXlPnDfOg=;
	b=rbZSO2guq4agu9mH7k9Km8blgEM1NDNLdqevMC6KPGF5Uk+bl/bLQXDdk4im6ZUDWw
	1O0lbgKi2iXC0+JR4IwsCznP++NQ0b0VbcSixf34iJt5CFtYbmaZqifozxfJFQR71w/X
	ZSq3rgujtdwwu04t46u/XQZ6z4Ri4VwLiA5ywlT+e6klCFJPuZZrQVY83C0urysOOhlq
	uPLn2uRKNk3omNyhqHqz9aDD82ikzsXmDvGn+VWxe9laEW6p1Ae5vl1VlmP2V/R7V9/D
	Wz/SS2j5a1pouQQ58M0HqDN3lzPd/X1cxI/iLpz/oOvDA3XZgDXw8iILADycNrH32LZv
	+28w==
X-Received: by 10.194.188.49 with SMTP id fx17mr12667762wjc.47.1448389852529; 
	Tue, 24 Nov 2015 10:30:52 -0800 (PST)
Received: from [192.168.1.115] ([46.120.6.143])
	by smtp.googlemail.com with ESMTPSA id
	h189sm19476856wme.1.2015.11.24.10.30.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Nov 2015 10:30:51 -0800 (PST)
References: <1448284752-18538-1-git-send-email-caoj.fnst@cn.fujitsu.com>
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Message-ID: <5654ACD7.9090303@gmail.com>
Date: Tue, 24 Nov 2015 20:30:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1448284752-18538-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::233
Cc: qemu-trivial@nongnu.org, mst@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] PCI Trivial: remove superfluous code
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
X-List-Received-Date: Tue, 24 Nov 2015 18:30:58 -0000

On 11/23/2015 03:19 PM, Cao jin wrote:
> remove superfluous code in do_pci_register_device(). See its caller:
> pci_qdev_realize()
>
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>   hw/pci/pci.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 168b9cc..4d16da0 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -878,7 +878,6 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev, PCIBus *bus,
>          return NULL;
>       }
>
> -    pci_dev->devfn = devfn;

Hi, can you please explain why this line is not needed?
As far as I see if do_pci_register_device is called with devfn -1 (auto assign),
the devfn will be computed by this function and then passed to pci_dev.

Am I missing anything?

Thanks,
Marcel


>       dma_as = pci_device_iommu_address_space(pci_dev);
>
>       memory_region_init_alias(&pci_dev->bus_master_enable_region,
>


