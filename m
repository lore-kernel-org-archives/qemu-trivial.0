Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a9uZ6-0005eB-JW
	for mharc-qemu-trivial@gnu.org; Fri, 18 Dec 2015 07:55:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54948)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a9uZ3-0005cY-Qt
	for qemu-trivial@nongnu.org; Fri, 18 Dec 2015 07:55:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a9uZ3-0005x3-0q
	for qemu-trivial@nongnu.org; Fri, 18 Dec 2015 07:55:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46690)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1a9uYx-0005u4-97; Fri, 18 Dec 2015 07:55:11 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id C03AA8E6E3;
	Fri, 18 Dec 2015 12:55:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-44.phx2.redhat.com
	[10.3.113.44])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBICt9PJ027128
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 18 Dec 2015 07:55:10 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 8D4EB303F81B; Fri, 18 Dec 2015 13:55:08 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Cao jin <caoj.fnst@cn.fujitsu.com>
References: <1450428935-18329-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Date: Fri, 18 Dec 2015 13:55:08 +0100
In-Reply-To: <1450428935-18329-1-git-send-email-caoj.fnst@cn.fujitsu.com> (Cao
	jin's message of "Fri, 18 Dec 2015 16:55:35 +0800")
Message-ID: <87si2zex1v.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, jslaby@suse.cz, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Convert to realize()
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
X-List-Received-Date: Fri, 18 Dec 2015 12:55:19 -0000

Copying qemu-trivial.

Cao jin <caoj.fnst@cn.fujitsu.com> writes:

> for educational PCI device
>
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>  hw/misc/edu.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/hw/misc/edu.c b/hw/misc/edu.c
> index fe50b42..43d5b18 100644
> --- a/hw/misc/edu.c
> +++ b/hw/misc/edu.c
> @@ -327,7 +327,7 @@ static void *edu_fact_thread(void *opaque)
>      return NULL;
>  }
>  
> -static int pci_edu_init(PCIDevice *pdev)
> +static void pci_edu_realize(PCIDevice *pdev, Error **errp)
>  {
>      EduState *edu = DO_UPCAST(EduState, pdev, pdev);
>      uint8_t *pci_conf = pdev->config;
> @@ -344,8 +344,6 @@ static int pci_edu_init(PCIDevice *pdev)
>      memory_region_init_io(&edu->mmio, OBJECT(edu), &edu_mmio_ops, edu,
>                      "edu-mmio", 1 << 20);
>      pci_register_bar(pdev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &edu->mmio);
> -
> -    return 0;
>  }
>  
>  static void pci_edu_uninit(PCIDevice *pdev)
> @@ -385,7 +383,7 @@ static void edu_class_init(ObjectClass *class, void *data)
>  {
>      PCIDeviceClass *k = PCI_DEVICE_CLASS(class);
>  
> -    k->init = pci_edu_init;
> +    k->realize = pci_edu_realize;
>      k->exit = pci_edu_uninit;
>      k->vendor_id = PCI_VENDOR_ID_QEMU;
>      k->device_id = 0x11e8;

Reviewed-by: Markus Armbruster <armbru@redhat.com>

