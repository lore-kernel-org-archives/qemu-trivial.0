Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YFsZB-0001VW-24
	for mharc-qemu-trivial@gnu.org; Mon, 26 Jan 2015 17:55:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33278)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YFsZ8-0001SP-27
	for qemu-trivial@nongnu.org; Mon, 26 Jan 2015 17:55:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YFsZ7-0001dI-7A
	for qemu-trivial@nongnu.org; Mon, 26 Jan 2015 17:55:29 -0500
Received: from out11.biz.mail.alibaba.com ([205.204.114.131]:55430)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>)
	id 1YFsZ2-0001cL-05; Mon, 26 Jan 2015 17:55:24 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07723664|-1; FP=0|0|0|0|0|-1|-1|-1;
	HT=r41f05022; MF=gang.chen@sunrus.com.cn; PH=DS; RN=4; RT=4;
	SR=0; 
Received: from
	ShengShiZhuChengdeMacBook-Pro.local(mailfrom:gang.chen@sunrus.com.cn
	ip:223.72.65.66) by smtp.aliyun-inc.com(10.147.38.22);
	Tue, 27 Jan 2015 06:55:13 +0800
Message-ID: <54C6C79E.1090303@sunrus.com.cn>
Date: Tue, 27 Jan 2015 07:02:54 +0800
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
In-Reply-To: <CAFEAcA8q7jNqL8DFygnHaiiv=2pGKXBQ_Gi1icOn9H=diOXK5Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 205.204.114.131
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>,
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
X-List-Received-Date: Mon, 26 Jan 2015 22:55:31 -0000

On 1/26/15 23:01, Peter Maydell wrote:
> On 26 January 2015 at 14:59, Chen Gang S <gang.chen@sunrus.com.cn> wrote:
>> On 1/26/15 06:10, Peter Maydell wrote:
>>> I would just like the commit message to be clear about the
>>> scope of the work the patch covers. If the patch is just "Fix
>>> mismatched lock/unlock calls in IPC struct conversion functions"
>>> then that's fine, but the commit message should say that. At the
>>> moment the commit message is very vague.
>>>
>>
>> OK, thanks.
>>
>> I am not quite familiar with this file, so I describe the modification
>> by function name, e.g. lock_user_struct() and unlick_user_struct() in
>> the patch subject.
> 
> In a big file I think it's often more useful to describe the
> functions which are being changed. My suggested subject would be:
> 
> "Fix mismatched lock/unlock calls in IPC struct conversion functions"
> 

What you said above sounds reasonable to me. 
 
> Riku can decide if he wants a v2 or will just fix it up as he
> applies it to his linux-user tree.
> 

OK, thanks.

-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

