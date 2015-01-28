Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YGLH3-0002D7-FO
	for mharc-qemu-trivial@gnu.org; Wed, 28 Jan 2015 00:34:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47591)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YGLGz-00026Y-Fw
	for qemu-trivial@nongnu.org; Wed, 28 Jan 2015 00:34:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YGLGy-00010s-FK
	for qemu-trivial@nongnu.org; Wed, 28 Jan 2015 00:34:41 -0500
Received: from mail113-248.mail.alibaba.com ([205.204.113.248]:37461
	helo=us-alimail-mta1.hst.scl.en.alidc.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>)
	id 1YGLGr-0000yv-RY; Wed, 28 Jan 2015 00:34:34 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.0742354|-1; FP=0|0|0|0|0|-1|-1|-1;
	HT=r41g03007; MF=gang.chen@sunrus.com.cn; PH=DS; RN=6; RT=6;
	SR=0; 
Received: from
	ShengShiZhuChengdeMacBook-Pro.local(mailfrom:gang.chen@sunrus.com.cn
	ip:124.127.118.42) by smtp.aliyun-inc.com(10.194.100.111);
	Wed, 28 Jan 2015 13:34:23 +0800
Message-ID: <54C876AC.5040904@sunrus.com.cn>
Date: Wed, 28 Jan 2015 13:42:04 +0800
From: Chen Gang S <gang.chen@sunrus.com.cn>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, riku.voipio@iki.fi, 
	david.gilbert@linaro.org, Peter Maydell <peter.maydell@linaro.org>
References: <54C4CD81.10503@sunrus.com.cn> <54C7B8CE.5020708@msgid.tls.msk.ru>
In-Reply-To: <54C7B8CE.5020708@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 205.204.113.248
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH v2] linux-user/main.c: Remove redundant
 end_exclusive() in arm_kernel_cmpxchg64_helper()
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
X-List-Received-Date: Wed, 28 Jan 2015 05:34:42 -0000

On 1/28/15 00:11, Michael Tokarev wrote:
> 25.01.2015 14:03, Chen Gang S wrote:
>> start/end_exclusive() need be pairs, except the start_exclusive() in
> 
>  "need TO be pairs", or "should be pairs" or "should be called in pairs".
> 
>> stop_all_tasks() which is only used by force_sig(), which will be abort.
> 
>  "which will abort" or "which will call abort()" or "which calls abort()".
> 
>> So at present, start_exclusive() in stop_all_task() need not be paired.
>>
>> queue_signal() may call force_sig(), or return after kill pid (or queue
>> signal).
> 
>  "or return after killing pid (or queuing signal)".
> 
>>     If could return from queue_signal(), stop_all_task() would not
>> be called in time,
> 
>  "if queue_signal() returns
> 
>>     the next end_exclusive() would be issue.
> 
>  "would be AN issue".
> 

OK, thanks, I shall notice about them, next time.

> But actually we're interested to know answer to a slightly different
> question: whenever queue_signal() returns or not (it doesn't return in
> force_sig case).  So whole this part becomes something like:
> 
>  queue_signal() may either call force_sig() and die, or return.  In
>  the latter case, stop_all_task() would not be called in time, so
>  next end_exclusive() will be an issue.
> 

OK, it sounds good to me.

> And even more, when you look at this function (arm_kernel_cmpxchg64_helper),
> you'll notice it has two calls to end_exclusive() in sigsegv case, without
> a call to start_exclusive().  _That_ is, I think, the key point here --
> the rest of the information here is not really very relevant, because
> the actual problem is this double call to end_exclusive() which should
> be removed.  It is not really that interesting to know that it's not
> _necessary_ to call end_exclusive() in some cases which leads to abort(),
> because this is not one of them anyway (since queue_signal() might return
> just fine), and because while it is not necessary, it is not an error
> either.  With all this extra info, thie commit message becomes just too
> confusing.
> 

For me, when process paired functions, need consider a little more.

 - Are there any recurse code between lock/unlock?

 - After lock, do any code call unlock indirectly? Or before unlock(),
   do any code call lock() indirectly?

 - Between 2 unlocks (or 2 locks), does any code call lock (or unlock)
   indirectly?

In our case, queue_signal() may call lock indirectly between 2 unlocks,
So for me, the patch is necessary to mention about queue_signal() in
commit comments.


>> So in arm_kernel_cmpxchg64_helper() for ARM, need remove end_exclusive()
>> after queue_signal().
> 
> "need TO remove", and again the missing subject.  "We need to remove", or
> "we should remove", or, yet another variant, "extra end_exclusive() call
> should be removed".
>

OK.
 
>>   The related commit: "97cc756 linux-user: Implement
>> new ARM 64 bit cmpxchg kernel helper".
> 
> 
> So, how about this (the subject is fine):
> 
>  start/end_exclusive() should be paired to each other.  However, in
>  arm_kernel_cmpxchg64_helper() function, end_exclusive() is called
>  twice in a row.  Remove the second, redundrand, call.
> 
>  Commit which introduced this problem is"97cc756 linux-user: Implement
>  new ARM 64 bit cmpxchg kernel helper".
> 
> ?
> 
> Did I understand the problem correctly?
> 

For me, I still suggest to give some descriptions for queue_signal().


Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

