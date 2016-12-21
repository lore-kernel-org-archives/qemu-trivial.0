Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cJaKW-0001hr-8I
	for mharc-qemu-trivial@gnu.org; Wed, 21 Dec 2016 01:24:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48352)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1cJaKT-0001em-Uc
	for qemu-trivial@nongnu.org; Wed, 21 Dec 2016 01:24:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1cJaKS-00047z-Vm
	for qemu-trivial@nongnu.org; Wed, 21 Dec 2016 01:24:45 -0500
Received: from [59.151.112.132] (port=18886 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1cJaKN-00045p-R8; Wed, 21 Dec 2016 01:24:40 -0500
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14127127"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Dec 2016 14:24:37 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 7C4A0477B1CE;
	Wed, 21 Dec 2016 14:24:37 +0800 (CST)
Received: from [10.167.226.69] (10.167.226.69) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Wed, 21 Dec 2016 14:24:37 +0800
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
References: <1478833296-25853-1-git-send-email-caoj.fnst@cn.fujitsu.com>
CC: <alex.williamson@redhat.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <585A213C.4090706@cn.fujitsu.com>
Date: Wed, 21 Dec 2016 14:29:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1478833296-25853-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 7C4A0477B1CE.A68B1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] vfio: remove a
 duplicated word in comments
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
X-List-Received-Date: Wed, 21 Dec 2016 06:24:47 -0000

ping

On 11/11/2016 11:01 AM, Cao jin wrote:
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>  hw/vfio/pci.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 31aaecb..c94987c 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -1881,8 +1881,8 @@ static void vfio_add_ext_cap(VFIOPCIDevice *vdev)
>       * 0 is reserved for this since absence of capabilities is indicated by
>       * 0 for the ID, version, AND next pointer.  However, pcie_add_capability()
>       * uses ID 0 as reserved for list management and will incorrectly match and
> -     * assert if we attempt to pre-load the head of the chain with with this
> -     * ID.  Use ID 0xFFFF temporarily since it is also seems to be reserved in
> +     * assert if we attempt to pre-load the head of the chain with this ID.
> +     * Use ID 0xFFFF temporarily since it is also seems to be reserved in
>       * part for identifying absence of capabilities in a root complex register
>       * block.  If the ID still exists after adding capabilities, switch back to
>       * zero.  We'll mark this entire first dword as emulated for this purpose.
> 

-- 
Sincerely,
Cao jin



