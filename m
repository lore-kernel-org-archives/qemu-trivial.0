Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bKd09-0005X2-6C
	for mharc-qemu-trivial@gnu.org; Tue, 05 Jul 2016 22:55:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56834)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bKd07-0005Se-3T
	for qemu-trivial@nongnu.org; Tue, 05 Jul 2016 22:55:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bKd05-0001aC-3v
	for qemu-trivial@nongnu.org; Tue, 05 Jul 2016 22:55:46 -0400
Received: from [59.151.112.132] (port=5333 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1bKczy-0001W7-6Y; Tue, 05 Jul 2016 22:55:38 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="8399200"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Jul 2016 10:55:25 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 5BEF341C0BBA;
	Wed,  6 Jul 2016 10:55:22 +0800 (CST)
Received: from [10.167.226.69] (10.167.226.69) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 6 Jul 2016 10:55:22 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial <qemu-trivial@nongnu.org>
References: <1466403224-16604-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<1466403224-16604-3-git-send-email-caoj.fnst@cn.fujitsu.com>
CC: <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel@redhat.com>, Markus
	Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <577C74AC.8090207@cn.fujitsu.com>
Date: Wed, 6 Jul 2016 11:02:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1466403224-16604-3-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 5BEF341C0BBA.AAF39
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v9 02/13] mptsas: change
 .realize function name
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
X-List-Received-Date: Wed, 06 Jul 2016 02:55:48 -0000

Hi,
I guess this one is suitable for trivial tree, so CC them


On 06/20/2016 02:13 PM, Cao jin wrote:
> All the other devices` .realize function name are xxx_realize, except this one.
>
> cc: Michael S. Tsirkin <mst@redhat.com>
> cc: Marcel Apfelbaum <marcel@redhat.com>
> cc: Paolo Bonzini <pbonzini@redhat.com>
> cc: Markus Armbruster <armbru@redhat.com>
>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Marcel Apfelbaum <marcel@redhat.com>
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>   hw/scsi/mptsas.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
> index be88e16..ae8514e 100644
> --- a/hw/scsi/mptsas.c
> +++ b/hw/scsi/mptsas.c
> @@ -1269,7 +1269,7 @@ static const struct SCSIBusInfo mptsas_scsi_info = {
>       .load_request = mptsas_load_request,
>   };
>
> -static void mptsas_scsi_init(PCIDevice *dev, Error **errp)
> +static void mptsas_scsi_realize(PCIDevice *dev, Error **errp)
>   {
>       DeviceState *d = DEVICE(dev);
>       MPTSASState *s = MPT_SAS(dev);
> @@ -1412,7 +1412,7 @@ static void mptsas1068_class_init(ObjectClass *oc, void *data)
>       DeviceClass *dc = DEVICE_CLASS(oc);
>       PCIDeviceClass *pc = PCI_DEVICE_CLASS(oc);
>
> -    pc->realize = mptsas_scsi_init;
> +    pc->realize = mptsas_scsi_realize;
>       pc->exit = mptsas_scsi_uninit;
>       pc->romfile = 0;
>       pc->vendor_id = PCI_VENDOR_ID_LSI_LOGIC;
>

-- 
Yours Sincerely,

Cao jin



