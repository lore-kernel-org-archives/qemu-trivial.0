Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YFV5w-0000aI-Ek
	for mharc-qemu-trivial@gnu.org; Sun, 25 Jan 2015 16:51:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51033)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YFV5u-0000Y1-0e
	for qemu-trivial@nongnu.org; Sun, 25 Jan 2015 16:51:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YFV5s-0007yj-VG
	for qemu-trivial@nongnu.org; Sun, 25 Jan 2015 16:51:45 -0500
Received: from mail113-251.mail.alibaba.com ([205.204.113.251]:49718
	helo=us-alimail-mta1.hst.scl.en.alidc.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>)
	id 1YFV5n-0007wP-9A; Sun, 25 Jan 2015 16:51:39 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07539206|-1; FP=0|0|0|0|0|-1|-1|-1;
	HT=r41g03008; MF=gang.chen@sunrus.com.cn; PH=DS; RN=4; RT=4;
	SR=0; 
Received: from
	ShengShiZhuChengdeMacBook-Pro.local(mailfrom:gang.chen@sunrus.com.cn
	ip:223.72.65.44) by smtp.aliyun-inc.com(10.194.100.11);
	Mon, 26 Jan 2015 05:51:28 +0800
Message-ID: <54C5672D.4080800@sunrus.com.cn>
Date: Mon, 26 Jan 2015 05:59:09 +0800
From: Chen Gang S <gang.chen@sunrus.com.cn>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <54C4DC4E.3080306@sunrus.com.cn>
	<CAFEAcA_hGO-R85yYXDU7eoC7FHF_v96y7Oh54SX9HXBAss6Vpg@mail.gmail.com>
In-Reply-To: <CAFEAcA_hGO-R85yYXDU7eoC7FHF_v96y7Oh54SX9HXBAss6Vpg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 205.204.113.251
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
X-List-Received-Date: Sun, 25 Jan 2015 21:51:47 -0000

On 1/25/15 20:49, Peter Maydell wrote:
> On 25 January 2015 at 12:06, Chen Gang S <gang.chen@sunrus.com.cn> wrote:
>> lock_user_struct() and unlock_user_struct() need always be paired with
>> each other, or will cause resource leak.
>>
>> Also remove redundant check for 'target_mb' in abi_long do_msgrcv().
>>
>> Also match the coding styles found by "./scripts/checkpatch.pl".
>>
>> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
 
Thank you for your work about the several patches.


> Are you claiming that you've reviewed *all* the code in this
> file for mismatched lock/unlock calls? If so, it would be nice
> to say so explicitly in the commit message. If not, it would be
> nice if the commit message was clearer about what areas of the
> code it applied to. The code changes are correct, though.
> 

At present, I finished all lock_user_struct() and unlock_user_struct()
in "linux-user/syscall.c". For me, after this patch, they are all OK.

But for all lock/unlock in "linux-user/syscall.c", for me, I am doubting
several areas, but I did not send patch for them:

 - I need check them carefully again to be sure they are really issue:

   Read the related code again and again, if I really treat it as an
   issue, I shall make related patch (and pass compiling, at least).

 - I have no enough time resources on it:

   In week end, I have to spend some time resource on my son (check his
   homework, play with him). I also need spend time resources on Linux
   kernel and gcc/binutils.

   In week day, I may work overtime sometimes, also I need spend 4 hours
   on subway between my home and office per day (come and go).

 - So it is really necessary for me to make a schedule (the tasks/steps,
   the time point, and the risks), and also need consider about:

   How to use the time resources efficiently: e.g. fully use the time
   resources on the subway between home and office, in work day; fully
   use the time resources on holidays (e.g. Chinese Spring Festival).

   How to fully use the human resources: e.g. try my best to always keep
   well communication with all related open source members (which will
   give much valuable help for the related tasks).

Welcome any members' ideas, suggestions, and completions, also welcome
any members to help check "linux-user/syscall.c" (it will save my time
resource: now for qemu, my highest priority task is for tile qemu).

Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

