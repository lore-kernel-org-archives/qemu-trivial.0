Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aYvzv-00086E-33
	for mharc-qemu-trivial@gnu.org; Thu, 25 Feb 2016 08:30:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38606)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aYvzp-0007zr-IZ
	for qemu-trivial@nongnu.org; Thu, 25 Feb 2016 08:30:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aYvzk-0007wj-OE
	for qemu-trivial@nongnu.org; Thu, 25 Feb 2016 08:30:21 -0500
Received: from [59.151.112.132] (port=15626 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1aYvze-0007o9-Ll; Thu, 25 Feb 2016 08:30:11 -0500
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="3920813"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Feb 2016 21:29:54 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 3815242AC866;
	Thu, 25 Feb 2016 21:29:50 +0800 (CST)
Received: from [10.167.226.69] (10.167.226.69) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 25 Feb 2016 21:29:49 +0800
To: Peter Maydell <peter.maydell@linaro.org>
References: <1456392739-30336-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<CAFEAcA944NgbOvv3mYH2xvEup2V-UevPXPfew=Y2N7sYkvvxpQ@mail.gmail.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <56CF020A.8030704@cn.fujitsu.com>
Date: Thu, 25 Feb 2016 21:30:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA944NgbOvv3mYH2xvEup2V-UevPXPfew=Y2N7sYkvvxpQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 3815242AC866.A4E13
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] doc/memory.txt: fix typo
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
X-List-Received-Date: Thu, 25 Feb 2016 13:30:25 -0000



On 02/25/2016 06:00 PM, Peter Maydell wrote:
> On 25 February 2016 at 09:32, Cao jin <caoj.fnst@cn.fujitsu.com> wrote:

>> diff --git a/docs/memory.txt b/docs/memory.txt
>> index 8745f76..1a3ad622 100644
>> --- a/docs/memory.txt
>> +++ b/docs/memory.txt
>> @@ -297,7 +297,7 @@ various constraints can be supplied to control how these callbacks are called:
>>    - .valid.min_access_size, .valid.max_access_size define the access sizes
>>      (in bytes) which the device accepts; accesses outside this range will
>>      have device and bus specific behaviour (ignored, or machine check)
>> - - .valid.aligned specifies that the device only accepts naturally aligned
>> + - .valid.unaligned specifies that the device only accepts naturally aligned
>>      accesses.  Unaligned accesses invoke device and bus specific behaviour.
>
> This doesn't look like the right change, because (a) a field named
> unaligned which you set true to specifiy that unaligned accesses
> are invalid would be very confusing and (b) the comment in the
> header file says that 'valid.unaligned' means that the device does
> support unaligned accesses.
>

the reason that I think it is a typo is: from the pattern ".xxx.yyy", 
this section looks like a explanation(or detailed comment) of struct 
MemoryRegionOps`s fields, isn`t it? If yes, all the others match with 
the structure, except this /.valid.aligned/

I admit that, the description like ".valid.unaligned specifies that the 
device only accepts naturally aligned accesses" looks very confusing. 
But from the only caller memory_region_access_valid(), I think the 
original maybe not quite good? how about this:

/.valid.unaligned specifies that the device accepts unaligned accesses. 
  If false, Unaligned accesses invoke device and bus specific behaviour/


-- 
Yours Sincerely,

Cao jin



