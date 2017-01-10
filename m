Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cQrz9-0005Yp-HF
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jan 2017 03:40:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53107)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1cQrz7-0005XJ-Cj
	for qemu-trivial@nongnu.org; Tue, 10 Jan 2017 03:40:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1cQrz6-0005VJ-92
	for qemu-trivial@nongnu.org; Tue, 10 Jan 2017 03:40:49 -0500
Received: from [59.151.112.132] (port=55586 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1cQrz1-0005Pm-MN; Tue, 10 Jan 2017 03:40:44 -0500
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14632948"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Jan 2017 16:40:30 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 8B2C547AD1D0;
	Tue, 10 Jan 2017 16:40:29 +0800 (CST)
Received: from [10.167.226.69] (10.167.226.69) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Tue, 10 Jan 2017 16:40:29 +0800
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1482459390-14386-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<20170110003733-mutt-send-email-mst@kernel.org>
CC: <qemu-devel@nongnu.org>, <marcel@redhat.com>, <qemu-trivial@nongnu.org>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <58749F4C.9080902@cn.fujitsu.com>
Date: Tue, 10 Jan 2017 16:46:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <20170110003733-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 8B2C547AD1D0.A863B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
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
X-List-Received-Date: Tue, 10 Jan 2017 08:40:50 -0000



On 01/10/2017 06:37 AM, Michael S. Tsirkin wrote:
> On Fri, Dec 23, 2016 at 10:16:30AM +0800, Cao jin wrote:
>> "size >= 8" connote "size > 0"
>>
>> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> 
> Isn't the point to check for overflows?
> 

Make sense. If it is intended to check overflows, the following sequence
would make more sense:

    assert(offset >= PCI_CONFIG_SPACE_SIZE);
    assert(size >= 8);
    assert(offset < offset + size);
    assert(offset + size <= PCIE_CONFIG_SPACE_SIZE);

or else, size 0 will pass the assert(offset < offset + size) first and
hit assert(size >= 8)
-- 
Sincerely,
Cao jin

>> ---
>>  hw/pci/pcie.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
>> index 39b10b852d91..f864c5cd5458 100644
>> --- a/hw/pci/pcie.c
>> +++ b/hw/pci/pcie.c
>> @@ -668,7 +668,6 @@ void pcie_add_capability(PCIDevice *dev,
>>      uint16_t next;
>>  
>>      assert(offset >= PCI_CONFIG_SPACE_SIZE);
>> -    assert(offset < offset + size);
>>      assert(offset + size <= PCIE_CONFIG_SPACE_SIZE);
>>      assert(size >= 8);
>>      assert(pci_is_express(dev));
>> -- 
>> 2.1.0
>>
>>
> 
> 
> 





