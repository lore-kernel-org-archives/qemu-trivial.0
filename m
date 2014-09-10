Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XRdni-0000bn-6k
	for mharc-qemu-trivial@gnu.org; Wed, 10 Sep 2014 05:02:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43453)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XRdnX-0000Lk-Av
	for qemu-trivial@nongnu.org; Wed, 10 Sep 2014 05:02:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XRdnS-0004cx-BN
	for qemu-trivial@nongnu.org; Wed, 10 Sep 2014 05:02:43 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:53350)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XRdnR-0004cV-Le; Wed, 10 Sep 2014 05:02:38 -0400
Received: from 172.24.2.119 (EHLO szxeml419-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AUD63253; Wed, 10 Sep 2014 17:02:32 +0800 (CST)
Received: from [127.0.0.1] (10.177.22.69) by szxeml419-hub.china.huawei.com
	(10.82.67.158) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 10 Sep 2014 17:02:31 +0800
Message-ID: <541013A5.5030603@huawei.com>
Date: Wed, 10 Sep 2014 17:02:29 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
References: <1410233038-15928-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<CAFEAcA_+MeAyajE=LpvAd3nvSgomucOsEYiipxPNEnGiDzN8Ug@mail.gmail.com>
	<540F040B.8080405@suse.de>
In-Reply-To: <540F040B.8080405@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020205.541013A9.006E,ss=1,re=0.000,fgs=0,
	ip=0.0.0.0, so=2013-05-26 15:14:31,
	dmn=2011-05-27 18:58:46
X-Mirapoint-Loop-Id: 936d78f1672eec2efd280584958e9ef5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix typos and misspellings
	in comments
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
X-List-Received-Date: Wed, 10 Sep 2014 09:02:48 -0000

On 2014/9/9 21:43, Andreas Färber wrote:
> Am 09.09.2014 10:09, schrieb Peter Maydell:
>> On 9 September 2014 04:23, zhanghailiang<zhang.zhanghailiang@huawei.com>  wrote:
>>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>>> index 2ab4460..bedef2f 100644
>>> --- a/hw/ppc/spapr.c
>>> +++ b/hw/ppc/spapr.c
>>> @@ -541,7 +541,7 @@ static void *spapr_create_fdt_skel(hwaddr initrd_base,
>>>       _FDT((fdt_property_cell(fdt, "rtas-error-log-max", RTAS_ERROR_LOG_MAX)));
>>>
>>>       /*
>>> -     * According to PAPR, rtas ibm,os-term, does not gaurantee a return
>>> +     * According to PAPR, rtas ibm,os-term, does not guarantee a return
>
> "..., rtas,os-term does not ..."? (i.e., drop the comma while at it)
>

OK, Thanks.

>>>        * back to the guest cpu.
>>>        *
>>>        * While an additional ibm,extended-os-term property indicates that
>>
>> OK
>
> Regards,
> Andreas
>



