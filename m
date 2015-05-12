Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ys4Lr-0004Ne-Px
	for mharc-qemu-trivial@gnu.org; Tue, 12 May 2015 03:11:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59662)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Ys4Lq-0004LG-5G
	for qemu-trivial@nongnu.org; Tue, 12 May 2015 03:11:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Ys4Lp-0004y9-95
	for qemu-trivial@nongnu.org; Tue, 12 May 2015 03:11:38 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:32506)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Ys4Lj-0004ua-IS; Tue, 12 May 2015 03:11:32 -0400
Received: from 172.24.2.119 (EHLO szxeml434-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BFX27712; Tue, 12 May 2015 15:11:17 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml434-hub.china.huawei.com
	(10.82.67.225) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 12 May 2015 15:11:06 +0800
Message-ID: <5551A787.3050404@huawei.com>
Date: Tue, 12 May 2015 15:11:03 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, Shannon Zhao
	<shannon.zhao@linaro.org>
References: <1431397521-2316-1-git-send-email-shannon.zhao@linaro.org>
	<1431397521-2316-7-git-send-email-shannon.zhao@linaro.org>
	<CAFEAcA9+Gd+-WOHJjMrA7f7pcW7usccRSuL2i8E3Uc=tp1Eifw@mail.gmail.com>
In-Reply-To: <CAFEAcA9+Gd+-WOHJjMrA7f7pcW7usccRSuL2i8E3Uc=tp1Eifw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.5551A795.010C, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: aa6281a00371921e89dcf30343d82220
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: hangaohuai@huawei.com, QEMU Trivial <qemu-trivial@nongnu.org>,
	Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	Christoffer Dall <christoffer.dall@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH 6/6] Add comma after
	DEFINE_PROP_END_OF_LIST()
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
X-List-Received-Date: Tue, 12 May 2015 07:11:39 -0000

On 2015/5/12 14:59, Peter Maydell wrote:
> On 12 May 2015 at 03:25,  <shannon.zhao@linaro.org> wrote:
>> From: Shannon Zhao <shannon.zhao@linaro.org>
>>
>> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
>> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>> ---
>> diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
>> index 433463e..d2b3f37 100644
>> --- a/hw/audio/intel-hda.c
>> +++ b/hw/audio/intel-hda.c
>> @@ -31,7 +31,7 @@
>>
>>  static Property hda_props[] = {
>>      DEFINE_PROP_UINT32("cad", HDACodecDevice, cad, -1),
>> -    DEFINE_PROP_END_OF_LIST()
>> +    DEFINE_PROP_END_OF_LIST(),
>>  };
> 
> Why do we need to do this? The usual reason for having a comma
> after the last item in an array is so that if we add another
> item after it later we don't have to edit the line that used to
> be last. But with these lists the DEFINE_PROP_END_OF_LIST()
> line remains last by definition -- new entries will always go
> above it, and anything below it would be a bug. So there's no
> point in having a comma after it.
> 

Here I just want to make the code style consistent. If this is not
necessary, we can drop this one.

-- 
Shannon


