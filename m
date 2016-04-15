Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aqsik-00004z-0v
	for mharc-qemu-trivial@gnu.org; Thu, 14 Apr 2016 21:38:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38194)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aqsih-0008RX-Jz
	for qemu-trivial@nongnu.org; Thu, 14 Apr 2016 21:38:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aqsig-0008JR-Nh
	for qemu-trivial@nongnu.org; Thu, 14 Apr 2016 21:38:51 -0400
Received: from [59.151.112.132] (port=7364 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1aqsia-0008GS-CH; Thu, 14 Apr 2016 21:38:45 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="5619737"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Apr 2016 09:38:33 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 8BEBE42B55E7;
	Fri, 15 Apr 2016 09:38:30 +0800 (CST)
Received: from [10.167.226.69] (10.167.226.69) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Fri, 15 Apr 2016 09:38:30 +0800
To: <qemu-devel@nongnu.org>
References: <1459244924-9840-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<56FA5192.6060506@cn.fujitsu.com> <5708C7AB.9070309@cn.fujitsu.com>
CC: qemu-trivial <qemu-trivial@nongnu.org>, <imammedo@redhat.com>,
	<mjt@tls.msk.ru>, <mst@redhat.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <571046D2.3050003@cn.fujitsu.com>
Date: Fri, 15 Apr 2016 09:41:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <5708C7AB.9070309@cn.fujitsu.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 8BEBE42B55E7.A8730
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] smbios: fix typo
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
X-List-Received-Date: Fri, 15 Apr 2016 01:38:52 -0000

hi,
    this is a typo patch, could I get confirmed?
    For your quick reference: System Management BIOS (SMBIOS) Reference 
Specification, version 3.0.0. chapter 5.2.1 & 5.2.2

On 04/09/2016 05:13 PM, Cao jin wrote:
> ping?
>
> On 03/29/2016 05:57 PM, Cao jin wrote:
>> sorry mjt, I intended to cc qemu-trivial, now I made it:)
>>
>> On 03/29/2016 05:48 PM, Cao jin wrote:
>>> The spec says: "on paragraph (16-byte) boundaries"
>>>
>>> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
>>> ---
>>>   include/hw/smbios/smbios.h | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/include/hw/smbios/smbios.h b/include/hw/smbios/smbios.h
>>> index 76ccf70..ba36746 100644
>>> --- a/include/hw/smbios/smbios.h
>>> +++ b/include/hw/smbios/smbios.h
>>> @@ -33,7 +33,7 @@ typedef enum SmbiosEntryPointType {
>>>
>>>   /* SMBIOS Entry Point
>>>    * There are two types of entry points defined in the SMBIOS
>>> specification
>>> - * (see below). BIOS must place the entry point(s) at a 16-bit-aligned
>>> + * (see below). BIOS must place the entry point(s) at a 16-byte-aligned
>>>    * address between 0xf0000 and 0xfffff. Note that either entry point
>>> type
>>>    * can be used in a 64-bit target system, except that SMBIOS 2.1
>>> entry point
>>>    * only allows the SMBIOS struct table to reside below 4GB address
>>> space.
>>>
>>
>

-- 
Yours Sincerely,

Cao jin



