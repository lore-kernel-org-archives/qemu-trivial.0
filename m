Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dMvX1-0002aj-4a
	for mharc-qemu-trivial@gnu.org; Mon, 19 Jun 2017 08:11:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33390)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1dMvWz-0002ZH-4b
	for qemu-trivial@nongnu.org; Mon, 19 Jun 2017 08:11:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1dMvWy-0000U6-Au
	for qemu-trivial@nongnu.org; Mon, 19 Jun 2017 08:11:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37656)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcel@redhat.com>)
	id 1dMvWh-0000Im-BI; Mon, 19 Jun 2017 08:11:27 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6255240F10;
	Mon, 19 Jun 2017 12:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6255240F10
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=marcel@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 6255240F10
Received: from mapfelba-osx.local (unknown [10.35.206.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F07EA183F3;
	Mon, 19 Jun 2017 12:11:17 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
	qemu-trivial@nongnu.org
References: <1497383329-10393-1-git-send-email-thuth@redhat.com>
From: Marcel Apfelbaum <marcel@redhat.com>
Message-ID: <621d32aa-930c-ad9d-3c5e-b3488567bf41@redhat.com>
Date: Mon, 19 Jun 2017 15:11:14 +0300
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <1497383329-10393-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 19 Jun 2017 12:11:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] hw/pci-bridge/dec: Classify the DEC PCI
 bridge as bridge device
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Jun 2017 12:11:46 -0000

On 13/06/2017 22:48, Thomas Huth wrote:
> This way the bridge shows up in the correct section of the
> "-device help" text.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/pci-bridge/dec.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/hw/pci-bridge/dec.c b/hw/pci-bridge/dec.c
> index cca9362..eb275e1 100644
> --- a/hw/pci-bridge/dec.c
> +++ b/hw/pci-bridge/dec.c
> @@ -62,6 +62,7 @@ static void dec_21154_pci_bridge_class_init(ObjectClass *klass, void *data)
>       DeviceClass *dc = DEVICE_CLASS(klass);
>       PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>   
> +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>       k->realize = dec_pci_bridge_realize;
>       k->exit = pci_bridge_exitfn;
>       k->vendor_id = PCI_VENDOR_ID_DEC;
> @@ -118,6 +119,7 @@ static void dec_21154_pci_host_class_init(ObjectClass *klass, void *data)
>       PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>       DeviceClass *dc = DEVICE_CLASS(klass);
>   
> +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>       k->realize = dec_21154_pci_host_realize;
>       k->vendor_id = PCI_VENDOR_ID_DEC;
>       k->device_id = PCI_DEVICE_ID_DEC_21154;
>



Reviewed-by: Marcel Apfelbaum <marcel@redhat.com>

Thanks,
Marcel

