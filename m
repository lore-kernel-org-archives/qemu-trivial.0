Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk54I-0004O9-LK
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 03:57:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60785)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk54G-0004M2-ID
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 03:57:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk54F-0004Ff-O2
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 03:57:16 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46383)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bk54B-0004Eg-4c; Wed, 14 Sep 2016 03:57:11 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 904604183E;
	Wed, 14 Sep 2016 10:57:06 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 1268BAAB;
	Wed, 14 Sep 2016 10:57:06 +0300 (MSK)
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1466403224-16604-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<1466403224-16604-3-git-send-email-caoj.fnst@cn.fujitsu.com>
Cc: Marcel Apfelbaum <marcel@redhat.com>, Paolo Bonzini
	<pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <01a359c4-3923-8dd7-9050-d6e0b80353ce@msgid.tls.msk.ru>
Date: Wed, 14 Sep 2016 10:57:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <1466403224-16604-3-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v9 02/13] mptsas: change .realize
 function name
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
X-List-Received-Date: Wed, 14 Sep 2016 07:57:17 -0000

20.06.2016 09:13, Cao jin wrote:
> All the other devices` .realize function name are xxx_realize, except this one.

Applied to -trivial, thanks!

/mjt

> cc: Michael S. Tsirkin <mst@redhat.com>
> cc: Marcel Apfelbaum <marcel@redhat.com>
> cc: Paolo Bonzini <pbonzini@redhat.com>
> cc: Markus Armbruster <armbru@redhat.com>
>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Marcel Apfelbaum <marcel@redhat.com>
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>  hw/scsi/mptsas.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
> index be88e16..ae8514e 100644
> --- a/hw/scsi/mptsas.c
> +++ b/hw/scsi/mptsas.c
> @@ -1269,7 +1269,7 @@ static const struct SCSIBusInfo mptsas_scsi_info = {
>      .load_request = mptsas_load_request,
>  };
>
> -static void mptsas_scsi_init(PCIDevice *dev, Error **errp)
> +static void mptsas_scsi_realize(PCIDevice *dev, Error **errp)
>  {
>      DeviceState *d = DEVICE(dev);
>      MPTSASState *s = MPT_SAS(dev);
> @@ -1412,7 +1412,7 @@ static void mptsas1068_class_init(ObjectClass *oc, void *data)
>      DeviceClass *dc = DEVICE_CLASS(oc);
>      PCIDeviceClass *pc = PCI_DEVICE_CLASS(oc);
>
> -    pc->realize = mptsas_scsi_init;
> +    pc->realize = mptsas_scsi_realize;
>      pc->exit = mptsas_scsi_uninit;
>      pc->romfile = 0;
>      pc->vendor_id = PCI_VENDOR_ID_LSI_LOGIC;
>


