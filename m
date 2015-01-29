Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YGdwH-0000pO-Oo
	for mharc-qemu-trivial@gnu.org; Wed, 28 Jan 2015 20:30:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36404)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YGdwE-0000mV-SJ
	for qemu-trivial@nongnu.org; Wed, 28 Jan 2015 20:30:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YGdwD-00032o-T0
	for qemu-trivial@nongnu.org; Wed, 28 Jan 2015 20:30:30 -0500
Received: from mail113-251.mail.alibaba.com ([205.204.113.251]:37891
	helo=us-alimail-mta1.hst.scl.en.alidc.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>)
	id 1YGdw9-00031k-Ip; Wed, 28 Jan 2015 20:30:25 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08021643|-1; FP=0|0|0|0|0|-1|-1|-1;
	HT=r41g03013; MF=gang.chen@sunrus.com.cn; PH=DS; RN=5; RT=5;
	SR=0; 
Received: from
	ShengShiZhuChengdeMacBook-Pro.local(mailfrom:gang.chen@sunrus.com.cn
	ip:124.127.118.42) by smtp.aliyun-inc.com(10.194.100.108);
	Thu, 29 Jan 2015 09:30:13 +0800
Message-ID: <54C98EF3.3070405@sunrus.com.cn>
Date: Thu, 29 Jan 2015 09:37:55 +0800
From: Chen Gang S <gang.chen@sunrus.com.cn>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <54C4DC4E.3080306@sunrus.com.cn>
	<CAFEAcA_hGO-R85yYXDU7eoC7FHF_v96y7Oh54SX9HXBAss6Vpg@mail.gmail.com>
	<54C5672D.4080800@sunrus.com.cn>
	<CAFEAcA9mqzpHsWcyDdzBYDWdxsR1AoDy3akgHCaMUbjZ0zh=0Q@mail.gmail.com>
	<54C6566B.6050205@sunrus.com.cn>
	<CAFEAcA8q7jNqL8DFygnHaiiv=2pGKXBQ_Gi1icOn9H=diOXK5Q@mail.gmail.com>
	<20150128142705.GA22971@afflict.kos.to>
	<54C95E09.1030107@sunrus.com.cn>
	<CAFEAcA-GviCfmB3vZVFRNXK7BDHoKON7ZCE9-=bE0SrYCQj9gg@mail.gmail.com>
In-Reply-To: <CAFEAcA-GviCfmB3vZVFRNXK7BDHoKON7ZCE9-=bE0SrYCQj9gg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 205.204.113.251
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user/syscall.c: Let
 all lock_user_struct() and unlock_user_struct() paired with each other
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
X-List-Received-Date: Thu, 29 Jan 2015 01:30:31 -0000

On 1/29/15 06:36, Peter Maydell wrote:
> On 28 January 2015 at 22:09, Chen Gang S <gang.chen@sunrus.com.cn> wrote:
>>  - Is what I said above really correct (e.g. is linux-user really mainly
>>    for cpu emulation)?.
> 
> Not really. linux-user is mainly for running single Linux binaries.
> It has a secondary use for running gcc test binaries which think
> they are "bare metal" but actually use some kind of semihosting API.
> (You should check whether tile has one of those.)
> 
> As well as linux-user mode, QEMU has system emulation mode, where
> we emulate a complete machine.
> 
> Both modes need CPU emulation.
> 

OK, thanks.

For coding and test, is linux-user a good starting position for me? (I
guess it is).


Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

