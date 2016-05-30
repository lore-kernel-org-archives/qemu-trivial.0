Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b7KF2-0003s7-70
	for mharc-qemu-trivial@gnu.org; Mon, 30 May 2016 06:16:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56896)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1b7KEv-0003nk-Hn
	for qemu-trivial@nongnu.org; Mon, 30 May 2016 06:16:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1b7KEt-0002Om-Gn
	for qemu-trivial@nongnu.org; Mon, 30 May 2016 06:16:04 -0400
Received: from [59.151.112.132] (port=55591 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>)
	id 1b7KEi-0002NG-LI; Mon, 30 May 2016 06:15:53 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="7101420"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 May 2016 18:15:45 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 8E447498F583;
	Mon, 30 May 2016 18:15:42 +0800 (CST)
Received: from [10.167.225.55] (10.167.225.55) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server id 14.3.279.2; Mon, 30 May 2016 18:15:42 +0800
Message-ID: <574C13C1.6030105@cn.fujitsu.com>
Date: Mon, 30 May 2016 18:19:45 +0800
From: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Alberto Garcia <berto@igalia.com>, Eric Blake <eblake@redhat.com>,
	<qemu-devel@nongnu.org>
CC: <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>
References: <1464091153-11057-1-git-send-email-berto@igalia.com>
	<5744DFA3.1070806@redhat.com> <574BE26E.9020106@cn.fujitsu.com>
	<w51k2ib50ih.fsf@maestria.local.igalia.com>
In-Reply-To: <w51k2ib50ih.fsf@maestria.local.igalia.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.225.55]
X-yoursite-MailScanner-ID: 8E447498F583.A7811
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xiecl.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] docs: Fix a couple of typos
 in throttle.txt
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
X-List-Received-Date: Mon, 30 May 2016 10:16:10 -0000

On 05/30/2016 06:00 PM, Alberto Garcia wrote:
> On Mon 30 May 2016 08:49:18 AM CEST, Changlong Xie wrote:
>>>>      - Water leaks from the bucket at a rate of 100 IOPS.
>>>>      - Water can be added to the bucket at a rate of 2000 IOPS.
>>>>      - The size of the bucket is 2000 x 60 = 120000
>>>> -  - If 'iops-total-max-length' is unset then the bucket size is 100.
>>>> +  - If 'iops-total-max' is unset then the bucket size is 100.
>>
>> Sorry to brother, why the bucket size is 100 rather than 100 x 60?
>
> Oh, that's because 'iops-total-max-length' can only be set if
> 'iops-total-max' is set as well. It's explained earlier in the document,
> maybe I should make it clear there as well.

Thanks for your explanation,

Thanks
	-Xie

>
> Michael, shall I send a new patch on top of my previous one or can the
> previous one be replaced?
>
> Berto
>
>
>



