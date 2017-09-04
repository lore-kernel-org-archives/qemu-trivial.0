Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dolGf-0004zX-9Y
	for mharc-qemu-trivial@gnu.org; Mon, 04 Sep 2017 02:53:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33023)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1dolGc-0004wP-Jx
	for qemu-trivial@nongnu.org; Mon, 04 Sep 2017 02:53:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1dolGb-00075g-Re
	for qemu-trivial@nongnu.org; Mon, 04 Sep 2017 02:53:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45696)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1dolGR-0006sX-V7; Mon, 04 Sep 2017 02:53:44 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C48A1C058EAF;
	Mon,  4 Sep 2017 06:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C48A1C058EAF
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=lvivier@redhat.com
Received: from [10.36.116.175] (ovpn-116-175.ams2.redhat.com [10.36.116.175])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ED6EB7DDE0;
	Mon,  4 Sep 2017 06:53:38 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <1504030416-18618-1-git-send-email-thuth@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <eb148e1c-6cfa-b871-c201-de3f3565e4c8@redhat.com>
Date: Mon, 4 Sep 2017 08:53:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1504030416-18618-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 04 Sep 2017 06:53:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH for-2.11] tests: Fix broken
 ivshmem-server-msi/-irq tests
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
X-List-Received-Date: Mon, 04 Sep 2017 06:53:55 -0000

On 29/08/2017 20:13, Thomas Huth wrote:
> Broken with commit b4ba67d9a7025 ("libqos: Change PCI accessors to take
> opaque BAR handle") a while ago, but nobody noticed since the tests are
> only run in SPEED=slow mode: The msix_pba_bar is not correctly initialized

you mean "SPEED=quick"?

> anymore if bir_pba has the same value as bir_table. With this fix,
> "make check SPEED=slow" should work fine again.
> 
> Fixes: b4ba67d9a702507793c2724e56f98e9b0f7be02b
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/libqos/pci.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/libqos/pci.c b/tests/libqos/pci.c
> index 2dcdead..28d576c 100644
> --- a/tests/libqos/pci.c
> +++ b/tests/libqos/pci.c
> @@ -120,6 +120,8 @@ void qpci_msix_enable(QPCIDevice *dev)
>      bir_pba = table & PCI_MSIX_FLAGS_BIRMASK;
>      if (bir_pba != bir_table) {
>          dev->msix_pba_bar = qpci_iomap(dev, bir_pba, NULL);
> +    } else {
> +        dev->msix_pba_bar = dev->msix_table_bar;
>      }
>      dev->msix_pba_off = table & ~PCI_MSIX_FLAGS_BIRMASK;
>  
> @@ -138,8 +140,11 @@ void qpci_msix_disable(QPCIDevice *dev)
>      qpci_config_writew(dev, addr + PCI_MSIX_FLAGS,
>                                                  val & ~PCI_MSIX_FLAGS_ENABLE);
>  
> +    if (dev->msix_pba_bar.addr != dev->msix_table_bar.addr) {
> +        qpci_iounmap(dev, dev->msix_pba_bar);
> +    }
>      qpci_iounmap(dev, dev->msix_table_bar);
> -    qpci_iounmap(dev, dev->msix_pba_bar);
> +
>      dev->msix_enabled = 0;
>      dev->msix_table_off = 0;
>      dev->msix_pba_off = 0;
> 

Reviewed-by: Laurent Vivier <lvivier@redhat.com>


