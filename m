Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YGagQ-000859-1Q
	for mharc-qemu-trivial@gnu.org; Wed, 28 Jan 2015 17:01:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39047)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YGagK-0007wE-Ee
	for qemu-trivial@nongnu.org; Wed, 28 Jan 2015 17:01:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YGagJ-0004Ln-B4
	for qemu-trivial@nongnu.org; Wed, 28 Jan 2015 17:01:52 -0500
Received: from out114-136.biz.mail.alibaba.com ([205.204.114.136]:47118
	helo=out21.biz.mail.alibaba.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>)
	id 1YGagD-0004Dc-2N; Wed, 28 Jan 2015 17:01:45 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.0742445|-1; FP=0|0|0|0|0|-1|-1|-1;
	HT=r46d02009; MF=gang.chen@sunrus.com.cn; PH=DS; RN=5; RT=5;
	SR=0; 
Received: from
	ShengShiZhuChengdeMacBook-Pro.local(mailfrom:gang.chen@sunrus.com.cn
	ip:223.72.65.76) by smtp.aliyun-inc.com(10.147.38.253);
	Thu, 29 Jan 2015 06:01:30 +0800
Message-ID: <54C95E09.1030107@sunrus.com.cn>
Date: Thu, 29 Jan 2015 06:09:13 +0800
From: Chen Gang S <gang.chen@sunrus.com.cn>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Riku Voipio <riku.voipio@iki.fi>, Peter Maydell <peter.maydell@linaro.org>
References: <54C4DC4E.3080306@sunrus.com.cn>
	<CAFEAcA_hGO-R85yYXDU7eoC7FHF_v96y7Oh54SX9HXBAss6Vpg@mail.gmail.com>
	<54C5672D.4080800@sunrus.com.cn>
	<CAFEAcA9mqzpHsWcyDdzBYDWdxsR1AoDy3akgHCaMUbjZ0zh=0Q@mail.gmail.com>
	<54C6566B.6050205@sunrus.com.cn>
	<CAFEAcA8q7jNqL8DFygnHaiiv=2pGKXBQ_Gi1icOn9H=diOXK5Q@mail.gmail.com>
	<20150128142705.GA22971@afflict.kos.to>
In-Reply-To: <20150128142705.GA22971@afflict.kos.to>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 205.204.114.136
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] linux-user/syscall.c: Let all
 lock_user_struct() and unlock_user_struct() paired with each other
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
X-List-Received-Date: Wed, 28 Jan 2015 22:01:56 -0000


Thank you for your work, too.

Next month, I shall start tile qemu, I guess, for coding, I shall start
from linux-user (which is mainly for cpu emulation).

 - For each patch, I should make at least a valuable change, and pass
   related test.

 - Each month, I should make 3 patches at least.

 - Hope I can finish tile for linux-user within 2015-06-30: finish all
   tile cpu common instructions emulation, and pass all related test.

Welcome any ideas, suggestions, and completions, e.g.

 - Is what I said above really correct (e.g. is linux-user really mainly
   for cpu emulation)?.

 - For each patch, are there additional information, requirements or
   suggestions which I should notice about?

 - If I can finish 3 patches per month, is it possible to finish tile
   cpu common instructions emulation for linux-user within 2015-06-30?


Thanks.

On 1/28/15 22:27, Riku Voipio wrote:
> Hi,
> 
> First of all, thanks Chen for taking time to improve the linux-user
> codebase in qemu!
> 
> On Mon, Jan 26, 2015 at 03:01:52PM +0000, Peter Maydell wrote:
>> On 26 January 2015 at 14:59, Chen Gang S <gang.chen@sunrus.com.cn> wrote:
>>> On 1/26/15 06:10, Peter Maydell wrote:
>>>> I would just like the commit message to be clear about the
>>>> scope of the work the patch covers. If the patch is just "Fix
>>>> mismatched lock/unlock calls in IPC struct conversion functions"
>>>> then that's fine, but the commit message should say that. At the
>>>> moment the commit message is very vague.
>>>>
>>>
>>> OK, thanks.
>>>
>>> I am not quite familiar with this file, so I describe the modification
>>> by function name, e.g. lock_user_struct() and unlick_user_struct() in
>>> the patch subject.
> 
>> In a big file I think it's often more useful to describe the
>> functions which are being changed. My suggested subject would be:
>  
>> "Fix mismatched lock/unlock calls in IPC struct conversion functions"
>  
>> Riku can decide if he wants a v2 or will just fix it up as he
>> applies it to his linux-user tree.
> 
> No need for v2, I've change the title in my tree.
> 
> Riku
> 
> 

-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

