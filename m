Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YFl1k-00087N-QI
	for mharc-qemu-trivial@gnu.org; Mon, 26 Jan 2015 09:52:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58629)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YFl1h-00083o-LZ
	for qemu-trivial@nongnu.org; Mon, 26 Jan 2015 09:52:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YFl1g-0004hy-Ms
	for qemu-trivial@nongnu.org; Mon, 26 Jan 2015 09:52:29 -0500
Received: from out1134-251.mail.aliyun.com ([42.120.134.251]:62362)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>)
	id 1YFl1a-0004g2-E4; Mon, 26 Jan 2015 09:52:22 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436774|-1; FP=0|0|0|0|0|-1|-1|-1;
	HT=r41g03021; MF=gang.chen@sunrus.com.cn; PH=DS; RN=4; RT=4;
	SR=0; 
Received: from
	ShengShiZhuChengdeMacBook-Pro.local(mailfrom:gang.chen@sunrus.com.cn
	ip:223.72.65.115) by smtp.aliyun-inc.com(10.147.38.218);
	Mon, 26 Jan 2015 22:52:14 +0800
Message-ID: <54C6566B.6050205@sunrus.com.cn>
Date: Mon, 26 Jan 2015 22:59:55 +0800
From: Chen Gang S <gang.chen@sunrus.com.cn>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <54C4DC4E.3080306@sunrus.com.cn>
	<CAFEAcA_hGO-R85yYXDU7eoC7FHF_v96y7Oh54SX9HXBAss6Vpg@mail.gmail.com>
	<54C5672D.4080800@sunrus.com.cn>
	<CAFEAcA9mqzpHsWcyDdzBYDWdxsR1AoDy3akgHCaMUbjZ0zh=0Q@mail.gmail.com>
In-Reply-To: <CAFEAcA9mqzpHsWcyDdzBYDWdxsR1AoDy3akgHCaMUbjZ0zh=0Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 42.120.134.251
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
X-List-Received-Date: Mon, 26 Jan 2015 14:52:30 -0000

On 1/26/15 06:10, Peter Maydell wrote:
> On 25 January 2015 at 21:59, Chen Gang S <gang.chen@sunrus.com.cn> wrote:
>> On 1/25/15 20:49, Peter Maydell wrote:
>>> Are you claiming that you've reviewed *all* the code in this
>>> file for mismatched lock/unlock calls? If so, it would be nice
>>> to say so explicitly in the commit message. If not, it would be
>>> nice if the commit message was clearer about what areas of the
>>> code it applied to. The code changes are correct, though.
>>>
>>
>> At present, I finished all lock_user_struct() and unlock_user_struct()
>> in "linux-user/syscall.c". For me, after this patch, they are all OK.
>>
>> But for all lock/unlock in "linux-user/syscall.c", for me, I am doubting
>> several areas, but I did not send patch for them:
>>
>>  - I need check them carefully again to be sure they are really issue:
>>
>>    Read the related code again and again, if I really treat it as an
>>    issue, I shall make related patch (and pass compiling, at least).
>>
>>  - I have no enough time resources on it:
> 
> That's fine. I'm definitely not asking you to do this work.

OK, thanks. :-)

> I would just like the commit message to be clear about the
> scope of the work the patch covers. If the patch is just "Fix
> mismatched lock/unlock calls in IPC struct conversion functions"
> then that's fine, but the commit message should say that. At the
> moment the commit message is very vague.
> 

OK, thanks.

I am not quite familiar with this file, so I describe the modification
by function name, e.g. lock_user_struct() and unlick_user_struct() in
the patch subject.

Welcome to help improve the patch comments. If necessary to send patch
v2, please let me know, I shall try.


Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

