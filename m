Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YV9Sl-0007jG-Ar
	for mharc-qemu-trivial@gnu.org; Mon, 09 Mar 2015 22:00:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58648)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chen.fan.fnst@cn.fujitsu.com>) id 1YV9Sd-0007az-UZ
	for qemu-trivial@nongnu.org; Mon, 09 Mar 2015 22:00:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chen.fan.fnst@cn.fujitsu.com>) id 1YV9SX-0001Xu-Ps
	for qemu-trivial@nongnu.org; Mon, 09 Mar 2015 21:59:55 -0400
Received: from [59.151.112.132] (port=8854 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chen.fan.fnst@cn.fujitsu.com>)
	id 1YV9SX-0001X2-EL; Mon, 09 Mar 2015 21:59:49 -0400
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="71390659"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Mar 2015 09:56:08 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t2A1wpFk028953;
	Tue, 10 Mar 2015 09:58:51 +0800
Received: from [10.167.226.78] (10.167.226.78) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server id 14.3.181.6; Tue, 10 Mar 2015 09:59:51 +0800
Message-ID: <54FE4E77.4080506@cn.fujitsu.com>
Date: Tue, 10 Mar 2015 09:52:55 +0800
From: Chen Fan <chen.fan.fnst@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <qemu-devel@nongnu.org>
References: <cover.1425951373.git.chen.fan.fnst@cn.fujitsu.com>
In-Reply-To: <cover.1425951373.git.chen.fan.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.78]
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/3] fix pci related code
	typos
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
X-List-Received-Date: Tue, 10 Mar 2015 02:00:01 -0000

Cc: qemu-trivial

On 03/10/2015 09:49 AM, Chen Fan wrote:
> Chen Fan (3):
>    pcie_aer: fix typos in pcie_aer_inject_error comment
>    aer: fix a wrong init PCI_ERR_COR_STATUS w1cmask type register
>    pci: fix several trivial typos in comment
>
>   hw/pci/pcie_aer.c         | 8 ++++----
>   include/hw/pci/pci.h      | 2 +-
>   include/hw/pci/pcie_aer.h | 2 +-
>   3 files changed, 6 insertions(+), 6 deletions(-)
>


