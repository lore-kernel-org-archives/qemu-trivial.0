Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a9zJM-0001Yq-Fs
	for mharc-qemu-trivial@gnu.org; Fri, 18 Dec 2015 12:59:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56436)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1a9zJJ-0001Um-SH
	for qemu-trivial@nongnu.org; Fri, 18 Dec 2015 12:59:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1a9zJJ-0001DA-16
	for qemu-trivial@nongnu.org; Fri, 18 Dec 2015 12:59:21 -0500
Received: from mx1.redhat.com ([209.132.183.28]:9889)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1a9zJE-0001Cb-04; Fri, 18 Dec 2015 12:59:16 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 38D53C0AF3DE;
	Fri, 18 Dec 2015 17:59:15 +0000 (UTC)
Received: from [10.36.112.71] (ovpn-112-71.ams2.redhat.com [10.36.112.71])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBIHx9b4020381
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 18 Dec 2015 12:59:12 -0500
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1450436632-23980-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<1450436632-23980-2-git-send-email-caoj.fnst@cn.fujitsu.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5674496F.4000503@redhat.com>
Date: Fri, 18 Dec 2015 18:59:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1450436632-23980-2-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: ehabkost@redhat.com, mst@redhat.com, qemu-trivial@nongnu.org,
	leon.alrae@imgtec.com, rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH 1/5] SH PCI Host: convert to realize()
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
X-List-Received-Date: Fri, 18 Dec 2015 17:59:22 -0000

Cc: qemu-trivial@nongnu.org

On 18/12/2015 12:03, Cao jin wrote:
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>  hw/sh4/sh_pci.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/sh4/sh_pci.c b/hw/sh4/sh_pci.c
> index a2f6d9e..4509053 100644
> --- a/hw/sh4/sh_pci.c
> +++ b/hw/sh4/sh_pci.c
> @@ -151,12 +151,11 @@ static int sh_pci_device_init(SysBusDevice *dev)
>      return 0;
>  }
>  
> -static int sh_pci_host_init(PCIDevice *d)
> +static void sh_pci_host_realize(PCIDevice *d, Error **errp)
>  {
>      pci_set_word(d->config + PCI_COMMAND, PCI_COMMAND_WAIT);
>      pci_set_word(d->config + PCI_STATUS, PCI_STATUS_CAP_LIST |
>                   PCI_STATUS_FAST_BACK | PCI_STATUS_DEVSEL_MEDIUM);
> -    return 0;
>  }
>  
>  static void sh_pci_host_class_init(ObjectClass *klass, void *data)
> @@ -164,7 +163,7 @@ static void sh_pci_host_class_init(ObjectClass *klass, void *data)
>      PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>      DeviceClass *dc = DEVICE_CLASS(klass);
>  
> -    k->init = sh_pci_host_init;
> +    k->realize = sh_pci_host_realize;
>      k->vendor_id = PCI_VENDOR_ID_HITACHI;
>      k->device_id = PCI_DEVICE_ID_HITACHI_SH7751R;
>      /*
> 

