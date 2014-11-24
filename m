Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xsqxb-0006Ka-2i
	for mharc-qemu-trivial@gnu.org; Mon, 24 Nov 2014 05:33:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37251)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XsqxT-00067J-SG
	for qemu-trivial@nongnu.org; Mon, 24 Nov 2014 05:33:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XsqxP-00015T-2L
	for qemu-trivial@nongnu.org; Mon, 24 Nov 2014 05:33:27 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:45552)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XsqxE-0000zj-8K; Mon, 24 Nov 2014 05:33:12 -0500
Received: from 172.24.2.119 (EHLO szxeml460-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AXP46487; Mon, 24 Nov 2014 18:33:07 +0800 (CST)
Received: from [127.0.0.1] (10.177.22.69) by szxeml460-hub.china.huawei.com
	(10.82.67.203) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 24 Nov 2014 18:32:55 +0800
Message-ID: <54730955.3040103@huawei.com>
Date: Mon, 24 Nov 2014 18:32:53 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1416799833-9972-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<CAFEAcA_epH7Hcqd3uhzs-tjtTi8Y1gC3UUk5hZHsRaTAUje5dg@mail.gmail.com>
In-Reply-To: <CAFEAcA_epH7Hcqd3uhzs-tjtTi8Y1gC3UUk5hZHsRaTAUje5dg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020208.54730963.0099, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 0d5a69d0bb05927b2b0cd97b89b9daa5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	"Gonglei \(Arei\)" <arei.gonglei@huawei.com>, QEMU
	Developers <qemu-devel@nongnu.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/arm/boot: fix
 uninitialized scalar variable warning reported by coverity
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
X-List-Received-Date: Mon, 24 Nov 2014 10:33:33 -0000

On 2014/11/24 18:03, Peter Maydell wrote:
> On 24 November 2014 at 03:30, zhanghailiang
> <zhang.zhanghailiang@huawei.com> wrote:
>> Coverity reports the 'size' may be used uninitialized, but that can't happen,
>> because the caller has checked "if (binfo->dtb_filename || binfo->get_dtb)"
>> before call 'load_dtb'.
>>
>> Here we simply remove the 'if (binfo->get_dtb)' to satisfy coverity.
>>
>> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
>> ---
>>   hw/arm/boot.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>> index 0014c34..4f515b5 100644
>> --- a/hw/arm/boot.c
>> +++ b/hw/arm/boot.c
>> @@ -352,7 +352,7 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>>               goto fail;
>>           }
>>           g_free(filename);
>> -    } else if (binfo->get_dtb) {
>> +    } else {
>>           fdt = binfo->get_dtb(binfo, &size);
>>           if (!fdt) {
>>               fprintf(stderr, "Board was unable to create a dtb blob\n");
>
> If we do this I would prefer it if we add a clarifying note to the
> doc comment for load_dtb:
>   Must not be called unless have_dtb(binfo) is true.

Good idea! Will add this in v2, Thanks.


