Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aZGJf-0000H7-9c
	for mharc-qemu-trivial@gnu.org; Fri, 26 Feb 2016 06:12:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aZGJc-0000CR-Et
	for qemu-trivial@nongnu.org; Fri, 26 Feb 2016 06:12:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aZGJb-0000m5-Ce
	for qemu-trivial@nongnu.org; Fri, 26 Feb 2016 06:12:08 -0500
Received: from [59.151.112.132] (port=46306 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1aZGJW-0000jc-7t; Fri, 26 Feb 2016 06:12:03 -0500
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="3959015"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Feb 2016 19:11:58 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id B114F42AC87B;
	Fri, 26 Feb 2016 19:11:56 +0800 (CST)
Received: from [10.167.226.69] (10.167.226.69) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 26 Feb 2016 19:11:56 +0800
To: Peter Maydell <peter.maydell@linaro.org>
References: <1456484343-7445-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<CAFEAcA8+ekWvpkch2-YrOVdyVOjtH2t3R851WEj4k49DGCd-2Q@mail.gmail.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <56D0333A.2000605@cn.fujitsu.com>
Date: Fri, 26 Feb 2016 19:12:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8+ekWvpkch2-YrOVdyVOjtH2t3R851WEj4k49DGCd-2Q@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: B114F42AC87B.A7D26
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] doc/memory.txt: fix typo
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
X-List-Received-Date: Fri, 26 Feb 2016 11:12:09 -0000



On 02/26/2016 07:03 PM, Peter Maydell wrote:
> On 26 February 2016 at 10:59, Cao jin <caoj.fnst@cn.fujitsu.com> wrote:

>>
>> diff --git a/docs/memory.txt b/docs/memory.txt
>> index 8745f76..8aee3d6 100644
>> --- a/docs/memory.txt
>> +++ b/docs/memory.txt
>> @@ -186,15 +186,15 @@ of its own subregions: D of size 0x1000 at offset 0 and E of size 0x1000 at
>>   offset 0x2000. As a diagram:
>>
>>           0      1000   2000   3000   4000   5000   6000   7000    8000
>> -        |------|------|------|------|------|------|------|-------|
>> +        |------|------|------|------|------|------|------|------|
>>     A:    [                                                       ]
>> -  C:    [CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC]
>> -  B:                  [                          ]
>> -  D:                  [DDDDD]
>> -  E:                                [EEEEE]
>> +  C:    [CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC]
>> +  B:                  [                           ]
>> +  D:                  [DDDDDD]
>> +  E:                                [EEEEEE]
>>
>>   The regions that will be seen within this address range then are:
>> -        [CCCCCCCCCCCC][DDDDD][CCCCC][EEEEE][CCCCC]
>> +        [CCCCCCCCCCCCC[DDDDDD]CCCCCC[EEEEEE]CCCCCC]
>>
>>   Since B has higher priority than C, its subregions appear in the flat map
>>   even where they overlap with C. In ranges where B has not mapped anything
>> @@ -203,7 +203,7 @@ C's region appears.
>>   If B had provided its own MMIO operations (ie it was not a pure container)
>>   then these would be used for any addresses in its range not handled by
>>   D or E, and the result would be:
>> -        [CCCCCCCCCCCC][DDDDD][BBBBB][EEEEE][BBBBB]
>> +        [CCCCCCCCCCCCC[DDDDDD]BBBBBB[EEEEEE]BBBBBB]
>>
>>   Priority values are local to a container, because the priorities of two
>>   regions are only compared when they are both children of the same container.
>
> Why is this patch touching all these ascii art diagrams? If you want
> to change them, that's a different patch, but I don't see any need to.
> In fact you seem to have lost some of the [] from your version, so your
> change doesn't look like an improvement to me.
>

well, the diagram seem not aligned so well, so I did the modification.

>
> thanks
> -- PMM
>
>
> .
>

-- 
Yours Sincerely,

Cao jin



