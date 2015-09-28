Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZggV1-0003P8-U5
	for mharc-qemu-trivial@gnu.org; Mon, 28 Sep 2015 18:02:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32918)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZgW7n-0005JP-Au
	for qemu-trivial@nongnu.org; Mon, 28 Sep 2015 06:57:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZgW7m-0007fn-HD
	for qemu-trivial@nongnu.org; Mon, 28 Sep 2015 06:57:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45455)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1ZgW7c-0007cJ-EK; Mon, 28 Sep 2015 06:57:28 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 0C4812FAA7F;
	Mon, 28 Sep 2015 10:57:28 +0000 (UTC)
Received: from [10.36.7.147] (vpn1-7-147.ams2.redhat.com [10.36.7.147])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8SAvOs1013122
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 28 Sep 2015 06:57:25 -0400
To: Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org
References: <1443284532-8634-1-git-send-email-laurent@vivier.eu>
	<1443284532-8634-5-git-send-email-laurent@vivier.eu>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <56091D14.6070203@redhat.com>
Date: Mon, 28 Sep 2015 12:57:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1443284532-8634-5-git-send-email-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 04/10][TRIVIAL] grackle: add
 to bridge category
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
X-List-Received-Date: Mon, 28 Sep 2015 10:57:44 -0000

On 26/09/15 18:22, Laurent Vivier wrote:
> Grackle is the PCI host controller of oldworld powermac,
> so add it to the bridge category.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  hw/pci-host/grackle.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/pci-host/grackle.c b/hw/pci-host/grackle.c
> index bfe707a..ea31b72 100644
> --- a/hw/pci-host/grackle.c
> +++ b/hw/pci-host/grackle.c
> @@ -146,8 +146,10 @@ static const TypeInfo grackle_pci_info = {
>  static void pci_grackle_class_init(ObjectClass *klass, void *data)
>  {
>      SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
> +    DeviceClass *dc = DEVICE_CLASS(klass);
>  
>      k->init = pci_grackle_init_device;
> +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>  }

Reviewed-by: Thomas Huth <thuth@redhat.com>



