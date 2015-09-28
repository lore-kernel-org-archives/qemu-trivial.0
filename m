Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zggb2-000655-0v
	for mharc-qemu-trivial@gnu.org; Mon, 28 Sep 2015 18:08:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34598)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZgWEu-0005z7-5P
	for qemu-trivial@nongnu.org; Mon, 28 Sep 2015 07:05:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZgWEt-0002F7-8A
	for qemu-trivial@nongnu.org; Mon, 28 Sep 2015 07:05:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59830)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1ZgWEZ-00028G-BG; Mon, 28 Sep 2015 07:04:39 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id E3F23C0B64B7;
	Mon, 28 Sep 2015 11:04:38 +0000 (UTC)
Received: from [10.36.7.147] (vpn1-7-147.ams2.redhat.com [10.36.7.147])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8SB4ZGh016803
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 28 Sep 2015 07:04:36 -0400
To: Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org
References: <1443284532-8634-1-git-send-email-laurent@vivier.eu>
	<1443284532-8634-8-git-send-email-laurent@vivier.eu>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <56091EC3.9010007@redhat.com>
Date: Mon, 28 Sep 2015 13:04:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1443284532-8634-8-git-send-email-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 07/10][TRIVIAL] uninorth:
 add to bridge category
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
X-List-Received-Date: Mon, 28 Sep 2015 11:05:04 -0000

On 26/09/15 18:22, Laurent Vivier wrote:
> Uninorth is the mac99 PCI host controller, so add
> it to the bridge category.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  hw/pci-host/uninorth.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/hw/pci-host/uninorth.c b/hw/pci-host/uninorth.c
> index f0144eb..215b64f 100644
> --- a/hw/pci-host/uninorth.c
> +++ b/hw/pci-host/uninorth.c
> @@ -446,8 +446,10 @@ static const TypeInfo unin_internal_pci_host_info = {
>  static void pci_unin_main_class_init(ObjectClass *klass, void *data)
>  {
>      SysBusDeviceClass *sbc = SYS_BUS_DEVICE_CLASS(klass);
> +    DeviceClass *dc = DEVICE_CLASS(klass);
>  
>      sbc->init = pci_unin_main_init_device;
> +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>  }
>  
>  static const TypeInfo pci_unin_main_info = {
> @@ -460,8 +462,10 @@ static const TypeInfo pci_unin_main_info = {
>  static void pci_u3_agp_class_init(ObjectClass *klass, void *data)
>  {
>      SysBusDeviceClass *sbc = SYS_BUS_DEVICE_CLASS(klass);
> +    DeviceClass *dc = DEVICE_CLASS(klass);
>  
>      sbc->init = pci_u3_agp_init_device;
> +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>  }
>  
>  static const TypeInfo pci_u3_agp_info = {
> @@ -474,8 +478,10 @@ static const TypeInfo pci_u3_agp_info = {
>  static void pci_unin_agp_class_init(ObjectClass *klass, void *data)
>  {
>      SysBusDeviceClass *sbc = SYS_BUS_DEVICE_CLASS(klass);
> +    DeviceClass *dc = DEVICE_CLASS(klass);
>  
>      sbc->init = pci_unin_agp_init_device;
> +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>  }
>  
>  static const TypeInfo pci_unin_agp_info = {
> @@ -488,8 +494,10 @@ static const TypeInfo pci_unin_agp_info = {
>  static void pci_unin_internal_class_init(ObjectClass *klass, void *data)
>  {
>      SysBusDeviceClass *sbc = SYS_BUS_DEVICE_CLASS(klass);
> +    DeviceClass *dc = DEVICE_CLASS(klass);
>  
>      sbc->init = pci_unin_internal_init_device;
> +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>  }

Reviewed-by: Thomas Huth <thuth@redhat.com>



