Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1avDtW-0002P3-Bv
	for mharc-qemu-trivial@gnu.org; Tue, 26 Apr 2016 21:03:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55409)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhoujie2011@cn.fujitsu.com>) id 1avDtT-0002KC-KO
	for qemu-trivial@nongnu.org; Tue, 26 Apr 2016 21:03:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhoujie2011@cn.fujitsu.com>) id 1avDtS-000622-PV
	for qemu-trivial@nongnu.org; Tue, 26 Apr 2016 21:03:55 -0400
Received: from [59.151.112.132] (port=9463 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhoujie2011@cn.fujitsu.com>)
	id 1avDtN-000619-GC; Tue, 26 Apr 2016 21:03:50 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="5991129"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Apr 2016 09:03:44 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 873EB42AC851;
	Wed, 27 Apr 2016 09:03:42 +0800 (CST)
Received: from [10.167.226.49] (10.167.226.49) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server id 14.3.279.2; Wed, 27 Apr 2016 09:03:42 +0800
To: Max Filippov <jcmvbkbc@gmail.com>
References: <1461641713-32720-1-git-send-email-zhoujie2011@cn.fujitsu.com>
	<CAMo8BfL=dAerS7LYPwFCf2xr+Zh4S5KUqFRFEPx-zm=N7GueaQ@mail.gmail.com>
CC: qemu-devel <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>
From: Zhou Jie <zhoujie2011@cn.fujitsu.com>
Message-ID: <57200FE9.3080808@cn.fujitsu.com>
Date: Wed, 27 Apr 2016 09:03:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <CAMo8BfL=dAerS7LYPwFCf2xr+Zh4S5KUqFRFEPx-zm=N7GueaQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-yoursite-MailScanner-ID: 873EB42AC851.AC9DA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhoujie2011@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: Re: [Qemu-trivial] [PATCH] hw/net/opencores_eth: Allocating Large
 sized arrays to heap
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
X-List-Received-Date: Wed, 27 Apr 2016 01:03:56 -0000


On 2016/4/26 12:12, Max Filippov wrote:
> Hi Zhou,
>
> On Tue, Apr 26, 2016 at 6:35 AM, Zhou Jie <zhoujie2011@cn.fujitsu.com> wrote:
>> open_eth_start_xmit has a huge stack usage of 65536 bytes approx.
>> Moving large arrays to heap to reduce stack usage.
>
> It's an exception, not the rule when full 65536 byte long buffer might be
> needed. Can we do a little better change and not allocate and free this
> buffer every time unconditionally, but instead make buf smaller (1536
> bytes, maximal frame length when HUGEN bit is not set in MODER)
> and only do allocation when that's not enough?
>
Thank you for your suggestion.
I will modify this patch.

Sincerely,
Zhou Jie

-- 
------------------------------------------------
周潔
Dept 1
No. 6 Wenzhu Road,
Nanjing, 210012, China
TEL：+86+25-86630566-8557
FUJITSU INTERNAL：7998-8557
E-Mail：zhoujie2011@cn.fujitsu.com
------------------------------------------------



