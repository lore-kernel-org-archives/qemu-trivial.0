Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a9zJh-000228-4T
	for mharc-qemu-trivial@gnu.org; Fri, 18 Dec 2015 12:59:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56567)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1a9zJe-0001xu-Ez
	for qemu-trivial@nongnu.org; Fri, 18 Dec 2015 12:59:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1a9zJd-0001Mb-I8
	for qemu-trivial@nongnu.org; Fri, 18 Dec 2015 12:59:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:11656)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1a9zJY-0001KK-H6; Fri, 18 Dec 2015 12:59:36 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 01F7BC001268;
	Fri, 18 Dec 2015 17:59:35 +0000 (UTC)
Received: from [10.36.112.71] (ovpn-112-71.ams2.redhat.com [10.36.112.71])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBIHxTsX007857
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 18 Dec 2015 12:59:31 -0500
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1450436632-23980-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<1450436632-23980-5-git-send-email-caoj.fnst@cn.fujitsu.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56744982.80704@redhat.com>
Date: Fri, 18 Dec 2015 18:59:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1450436632-23980-5-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: ehabkost@redhat.com, mst@redhat.com, qemu-trivial@nongnu.org,
	leon.alrae@imgtec.com, rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH 4/5] gt64120: convert to realize()
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
X-List-Received-Date: Fri, 18 Dec 2015 17:59:43 -0000

Cc: qemu-trivial@nongnu.org


On 18/12/2015 12:03, Cao jin wrote:
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>  hw/mips/gt64xxx_pci.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
> index f76a9fd..c1f3c9c 100644
> --- a/hw/mips/gt64xxx_pci.c
> +++ b/hw/mips/gt64xxx_pci.c
> @@ -1193,7 +1193,7 @@ static int gt64120_init(SysBusDevice *dev)
>      return 0;
>  }
>  
> -static int gt64120_pci_init(PCIDevice *d)
> +static void gt64120_pci_realize(PCIDevice *d, Error **errp)
>  {
>      /* FIXME: Malta specific hw assumptions ahead */
>      pci_set_word(d->config + PCI_COMMAND, 0);
> @@ -1207,8 +1207,6 @@ static int gt64120_pci_init(PCIDevice *d)
>      pci_set_long(d->config + PCI_BASE_ADDRESS_4, 0x14000000);
>      pci_set_long(d->config + PCI_BASE_ADDRESS_5, 0x14000001);
>      pci_set_byte(d->config + 0x3d, 0x01);
> -
> -    return 0;
>  }
>  
>  static void gt64120_pci_class_init(ObjectClass *klass, void *data)
> @@ -1216,7 +1214,7 @@ static void gt64120_pci_class_init(ObjectClass *klass, void *data)
>      PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>      DeviceClass *dc = DEVICE_CLASS(klass);
>  
> -    k->init = gt64120_pci_init;
> +    k->realize = gt64120_pci_realize;
>      k->vendor_id = PCI_VENDOR_ID_MARVELL;
>      k->device_id = PCI_DEVICE_ID_MARVELL_GT6412X;
>      k->revision = 0x10;
> 

