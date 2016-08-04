Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bV9uR-0006rU-UC
	for mharc-qemu-trivial@gnu.org; Thu, 04 Aug 2016 00:05:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45967)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bV9uP-0006pX-JH
	for qemu-trivial@nongnu.org; Thu, 04 Aug 2016 00:05:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bV9uN-0004xK-Nt
	for qemu-trivial@nongnu.org; Thu, 04 Aug 2016 00:05:24 -0400
Received: from [59.151.112.132] (port=39547 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1bV9uG-0004ue-T0; Thu, 04 Aug 2016 00:05:17 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="9535543"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Aug 2016 12:05:00 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id B3E8742CA545;
	Thu,  4 Aug 2016 12:04:59 +0800 (CST)
Received: from [10.167.226.69] (10.167.226.69) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Thu, 4 Aug 2016 12:04:59 +0800
To: Paolo Bonzini <pbonzini@redhat.com>, <qemu-devel@nongnu.org>
References: <1469790338-28990-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<45e4afbd-e09a-c711-c4f3-5fe597234ea9@redhat.com>
CC: <qemu-trivial@nongnu.org>, Richard Henderson <rth@twiddle.net>, Peter
	Maydell <peter.maydell@linaro.org>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <57A2C0C7.9000508@cn.fujitsu.com>
Date: Thu, 4 Aug 2016 12:12:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <45e4afbd-e09a-c711-c4f3-5fe597234ea9@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: B3E8742CA545.A87BC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: Re: [Qemu-trivial] [PATCH 0/3] trivial changes of timer & cpus
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
X-List-Received-Date: Thu, 04 Aug 2016 04:05:26 -0000



On 08/01/2016 07:44 PM, Paolo Bonzini wrote:
>
>
> On 29/07/2016 13:05, Cao jin wrote:
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc  Peter Crosthwaite <crosthwaite.peter@gmail.com>
>> Cc: Richard Henderson <rth@twiddle.net>
>>
>> Cao jin (3):
>>    timer: update comments
>>    cpus: rename local variable to meaningful one
>>    cpus: update comments
>>
>>   cpus.c               | 13 +++++++------
>>   include/qemu/timer.h | 19 ++++++-------------
>>   2 files changed, 13 insertions(+), 19 deletions(-)
>>
>
> Thanks, these can go in 2.8.
>
I am fine with the time. Do you want me to repost these after 2.8?

-- 
Yours Sincerely,

Cao jin



