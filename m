Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIsZL-00038e-JO
	for mharc-qemu-trivial@gnu.org; Tue, 12 Jan 2016 01:36:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39761)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aIsZJ-000368-6E
	for qemu-trivial@nongnu.org; Tue, 12 Jan 2016 01:36:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aIsZI-0004T2-8V
	for qemu-trivial@nongnu.org; Tue, 12 Jan 2016 01:36:37 -0500
Received: from [59.151.112.132] (port=20855 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1aIsZD-0004R6-MC; Tue, 12 Jan 2016 01:36:31 -0500
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2487677"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Jan 2016 14:36:24 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 0404E418910B;
	Tue, 12 Jan 2016 14:36:12 +0800 (CST)
Received: from [10.167.226.69] (10.167.226.69) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 12 Jan 2016 14:36:11 +0800
To: Michael Tokarev <mjt@tls.msk.ru>, <qemu-devel@nongnu.org>
References: <1448091903-14460-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<5693688A.9030201@msgid.tls.msk.ru>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <56949FA3.6060908@cn.fujitsu.com>
Date: Tue, 12 Jan 2016 14:39:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <5693688A.9030201@msgid.tls.msk.ru>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 0404E418910B.A7194
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org, mst@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] PCI: add param check for api
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
X-List-Received-Date: Tue, 12 Jan 2016 06:36:38 -0000



On 01/11/2016 04:32 PM, Michael Tokarev wrote:
> 21.11.2015 10:45, Cao jin wrote:
>> add param check for pci_add_capability2, as it is a public API.
>>
>> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
>> ---
>>   hw/pci/pci.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>> index 168b9cc..6938f64 100644
>> --- a/hw/pci/pci.c
>> +++ b/hw/pci/pci.c
>> @@ -2144,6 +2144,9 @@ int pci_add_capability2(PCIDevice *pdev, uint8_t cap_id,
>>       uint8_t *config;
>>       int i, overlapping_cap;
>>
>> +    assert(size > 0);
>> +    assert(offset >= PCI_CONFIG_HEADER_SIZE || !offset);
>> +
>
> I'd like to see some ACKs/Reviews for this one, in particular why
> size should be != 0.

see pci_find_space(), if size == 0, I guess it will always return 0.
But I should admit that I did made a mistake, I will talk about it in
next mail.

Also either move offset assert to the below
> "else" clause or rewrite it to be offset == 0 instead if !offset :)
>
> Thanks,
>
> /mjt
>
>>       if (!offset) {
>>           offset = pci_find_space(pdev, size);
>>           if (!offset) {
>>
>
>
>
> .
>

-- 
Yours Sincerely,

Cao jin



