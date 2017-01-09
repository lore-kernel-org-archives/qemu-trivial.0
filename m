Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cQiZl-0006Od-QT
	for mharc-qemu-trivial@gnu.org; Mon, 09 Jan 2017 17:38:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47769)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1cQiZj-0006Nb-OE
	for qemu-trivial@nongnu.org; Mon, 09 Jan 2017 17:38:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1cQiZi-0007M4-Vn
	for qemu-trivial@nongnu.org; Mon, 09 Jan 2017 17:37:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35778)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1cQiZd-0007Il-T7; Mon, 09 Jan 2017 17:37:54 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4ADF131B304;
	Mon,  9 Jan 2017 22:37:53 +0000 (UTC)
Received: from redhat.com (ovpn-116-30.rdu2.redhat.com [10.10.116.30])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id v09MbqA3019965; Mon, 9 Jan 2017 17:37:52 -0500
Date: Tue, 10 Jan 2017 00:37:51 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cao jin <caoj.fnst@cn.fujitsu.com>
Cc: qemu-devel@nongnu.org, marcel@redhat.com, qemu-trivial@nongnu.org
Message-ID: <20170110003733-mutt-send-email-mst@kernel.org>
References: <1482459390-14386-1-git-send-email-caoj.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1482459390-14386-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 09 Jan 2017 22:37:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] pcie: remove duplicate assertion
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
X-List-Received-Date: Mon, 09 Jan 2017 22:38:00 -0000

On Fri, Dec 23, 2016 at 10:16:30AM +0800, Cao jin wrote:
> "size >= 8" connote "size > 0"
> 
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>

Isn't the point to check for overflows?

> ---
>  hw/pci/pcie.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index 39b10b852d91..f864c5cd5458 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -668,7 +668,6 @@ void pcie_add_capability(PCIDevice *dev,
>      uint16_t next;
>  
>      assert(offset >= PCI_CONFIG_SPACE_SIZE);
> -    assert(offset < offset + size);
>      assert(offset + size <= PCIE_CONFIG_SPACE_SIZE);
>      assert(size >= 8);
>      assert(pci_is_express(dev));
> -- 
> 2.1.0
> 
> 

