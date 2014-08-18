Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJGKU-0004u8-Uw
	for mharc-qemu-trivial@gnu.org; Mon, 18 Aug 2014 02:22:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35849)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XJGKN-0004th-Eg
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 02:22:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XJGKH-00010d-6R
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 02:21:59 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:28327)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XJGKG-0000wW-FE; Mon, 18 Aug 2014 02:21:53 -0400
Received: from 172.24.2.119 (EHLO szxeml423-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id ATF10700; Mon, 18 Aug 2014 14:21:34 +0800 (CST)
Received: from [127.0.0.1] (10.177.22.69) by szxeml423-hub.china.huawei.com
	(10.82.67.162) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 18 Aug 2014 14:21:28 +0800
Message-ID: <53F19B6C.7070907@huawei.com>
Date: Mon, 18 Aug 2014 14:21:32 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Richard Henderson <rth@twiddle.net>
References: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>	<1408001361-13580-10-git-send-email-zhang.zhanghailiang@huawei.com>
	<20140814103350.GH31346@redhat.com>
	<53EE212A.60405@msgid.tls.msk.ru> <53EE3AFF.8020005@twiddle.net>
In-Reply-To: <53EE3AFF.8020005@twiddle.net>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.53F19B70.00B6,ss=1,re=0.000,fgs=0,
	ip=0.0.0.0, so=2013-05-26 15:14:31,
	dmn=2011-05-27 18:58:46
X-Mirapoint-Loop-Id: b952db56483fe307420938678cade0f2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: kwolf@redhat.com, lkurusa@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-trivial@nongnu.org, jan.kiszka@siemens.com,
	riku.voipio@iki.fi, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, lcapitulino@redhat.com,
	stefanha@redhat.com, Li Liu <john.liuli@huawei.com>,
	luonengjun@huawei.com, pbonzini@redhat.com,
	peter.huangpeng@huawei.com, alex.bennee@linaro.org
Subject: Re: [Qemu-trivial] [PATCH v6 09/10] tcg: check return value of
	fopen()
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
X-List-Received-Date: Mon, 18 Aug 2014 06:22:05 -0000

On 2014/8/16 0:53, Richard Henderson wrote:
> On 08/15/2014 05:03 AM, Michael Tokarev wrote:
>>>>       f = fopen("/tmp/op.log", "w");
>>
>> Gosh.  So why are we still use fixed filenames in /tmp?????
>> Every such use is a potential security holw... :(  Ughm.
>>
>> Can't we get rid of this somehow, by requiring a filename
>> parameter for example?
>
> It's in code that isn't compiled in by default.
>
> Better than taking a parameter, or doing something else one-off, I think it'd
> be best to dump this to the normal log file.  I.e. use qemu_log instead of fprintf.
>

Hmm, i agreed. I will get rid of this, and use qemu_log instead.
Thanks.:)



