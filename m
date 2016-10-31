Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1AZR-0005J3-TJ
	for mharc-qemu-trivial@gnu.org; Mon, 31 Oct 2016 07:16:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46560)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1c1AZM-0005ET-TL
	for qemu-trivial@nongnu.org; Mon, 31 Oct 2016 07:16:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1c1AZL-0004sM-ND
	for qemu-trivial@nongnu.org; Mon, 31 Oct 2016 07:16:00 -0400
Received: from [59.151.112.132] (port=58337 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1c1AZC-0004o5-Ly; Mon, 31 Oct 2016 07:15:50 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="12511615"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Oct 2016 19:15:28 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 674D843972A5;
	Mon, 31 Oct 2016 19:15:26 +0800 (CST)
Received: from [10.167.226.69] (10.167.226.69) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Mon, 31 Oct 2016 19:15:29 +0800
To: Thomas Huth <thuth@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	<qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
References: <1477644996-23990-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<92415a45-66a7-c080-2c3c-8f5f67204bd0@msgid.tls.msk.ru>
	<5816C121.4060407@cn.fujitsu.com>
	<12cb403c-4679-3e85-c41c-22fb06a0f27e@redhat.com>
CC: <peter.maydell@linaro.org>, <eblake@redhat.com>, <armbru@redhat.com>,
	<mst@redhat.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <5817285D.8020004@cn.fujitsu.com>
Date: Mon, 31 Oct 2016 19:17:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <12cb403c-4679-3e85-c41c-22fb06a0f27e@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 674D843972A5.A6EF1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: Re: [Qemu-trivial] [PATCH v3] util/mmap-alloc: check parameter
 before using
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
X-List-Received-Date: Mon, 31 Oct 2016 11:16:05 -0000



On 10/31/2016 03:32 PM, Thomas Huth wrote:
> On 31.10.2016 04:57, Cao jin wrote:

>>>
>>> Why did you change ptr to ptr1 here and above?
>>
>> Because, I think there always is: ptr + offset == ptr1
>>
>>>
>>> On linux, mmap(2) manpage says that address serves as hint, and the
>>> system create the mapping at a nearby page boundary.  Generally, this
>>> address is just a hint.  So I'm not really sure if this code is actually
>>> right.. :)
>>>
>>
>> Yes, but the 2nd mmap used MAP_FIXED, which the manpage says:
>>
>> /Don't interpret addr as a hint: place the mapping at exactly that/
>> /address. addr must be a multiple of the page size/
>> /If the specified address cannot be used, mmap() will fail/
>>
>>> At the very least, your commit comment is a bit misleading, as it says
>>> about readability, but it also MAY change semantics.
>>>
>>
>> I don't think so, one just need dig a little deeper:)
>>
>>> Maybe just move BOTH "ptr+=, total-=" parts down the line and keep
>>> using ptr instead of ptr1?
>>>
>>> It'd be very good, in my opinion, to document how this whole thing
>>> is supposed to work :)
>>>
>>
>> the change is just some simple arithmetic operation, I think it is
>> little difficult for me to find a decent description.
>
> I originally had similar problems as Michael understanding your changes
> to ptr / ptr1 ... so you should likely at add the information with
> MAP_FIXED etc. to the patch description at least, I think.
>
> It's maybe also cleaner if you split your patch into two parts, first
> patch to fix the parameter checking, and second patch to change the ptr1
> stuff. That way the later patch could also be easier reverted in case
> there are problems with that.
>
>   Thomas
>

Oh, I didn't realize it would confuse people so easy, seems it actually 
did:(

Readability is kind of personal taste thing, generally, I woundn't send 
a patch only care readability which maybe controversial, so I am not 
sure this one worth the trouble to split the patch, but if everyone want 
it, I am pleased to do it.
I was hoping someone(maybe author) could give a ack, or point out the 
error I made.

Will try to document it in next version.
-- 
Yours Sincerely,

Cao jin



