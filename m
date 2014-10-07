Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XbPDl-0005Tk-5m
	for mharc-qemu-trivial@gnu.org; Tue, 07 Oct 2014 03:30:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35017)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XbPDe-0005Fx-MO
	for qemu-trivial@nongnu.org; Tue, 07 Oct 2014 03:30:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XbPDZ-00026N-53
	for qemu-trivial@nongnu.org; Tue, 07 Oct 2014 03:30:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:24019)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1XbPDO-00025b-NE; Tue, 07 Oct 2014 03:29:46 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s977TeKo018845
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 7 Oct 2014 03:29:41 -0400
Received: from redhat.com (ovpn-116-55.ams2.redhat.com [10.36.116.55])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id s977TbAO005309; Tue, 7 Oct 2014 03:29:38 -0400
Date: Tue, 7 Oct 2014 10:33:11 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: arei.gonglei@huawei.com
Message-ID: <20141007073311.GA3231@redhat.com>
References: <1412664828-6852-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1412664828-6852-1-git-send-email-arei.gonglei@huawei.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, luonengjun@huawei.com, weidong.huang@huawei.com,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] pcie: change confused comment clearer
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
X-List-Received-Date: Tue, 07 Oct 2014 07:30:08 -0000

On Tue, Oct 07, 2014 at 02:53:48PM +0800, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
> 
> This comment applies to all functions below it.
> It is not appropriate that called capability allocation
> functions, change it into capability list management functions.
> 
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>

Applied, thanks!

> ---
>  hw/pci/pcie.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index 1babddf..d17bd27 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -529,7 +529,7 @@ bool pcie_cap_is_arifwd_enabled(const PCIDevice *dev)
>  }
>  
>  /**************************************************************************
> - * pci express extended capability allocation functions
> + * pci express extended capability list management functions
>   * uint16_t ext_cap_id (16 bit)
>   * uint8_t cap_ver (4 bit)
>   * uint16_t cap_offset (12 bit)
> -- 
> 1.7.12.4
> 

