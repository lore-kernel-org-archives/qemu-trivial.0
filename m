Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cJaKz-0002LH-KG
	for mharc-qemu-trivial@gnu.org; Wed, 21 Dec 2016 01:25:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48482)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1cJaKu-0002Fn-9H
	for qemu-trivial@nongnu.org; Wed, 21 Dec 2016 01:25:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1cJaKt-0004MY-E1
	for qemu-trivial@nongnu.org; Wed, 21 Dec 2016 01:25:12 -0500
Received: from [59.151.112.132] (port=14897 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1cJaKo-0004F9-7V; Wed, 21 Dec 2016 01:25:06 -0500
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14127147"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Dec 2016 14:25:04 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 334A3477B1CE;
	Wed, 21 Dec 2016 14:25:04 +0800 (CST)
Received: from [10.167.226.69] (10.167.226.69) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Wed, 21 Dec 2016 14:25:04 +0800
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
References: <1478833368-25917-1-git-send-email-caoj.fnst@cn.fujitsu.com>
CC: Marcel Apfelbaum <marcel@redhat.com>, <mst@redhat.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <585A2156.6000700@cn.fujitsu.com>
Date: Wed, 21 Dec 2016 14:29:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1478833368-25917-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 334A3477B1CE.A57B8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] pcie: fix typo in
 comments
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
X-List-Received-Date: Wed, 21 Dec 2016 06:25:15 -0000

ping

On 11/11/2016 11:02 AM, Cao jin wrote:
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>  hw/pci/pcie.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index 99cfb45..39b10b8 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -656,7 +656,7 @@ static void pcie_ext_cap_set_next(PCIDevice *dev, uint16_t pos, uint16_t next)
>  }
>  
>  /*
> - * caller must supply valid (offset, size) * such that the range shouldn't
> + * Caller must supply valid (offset, size) such that the range wouldn't
>   * overlap with other capability or other registers.
>   * This function doesn't check it.
>   */
> 

-- 
Sincerely,
Cao jin



