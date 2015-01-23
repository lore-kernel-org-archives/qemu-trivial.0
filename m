Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YEbof-0008TF-8j
	for mharc-qemu-trivial@gnu.org; Fri, 23 Jan 2015 05:50:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45970)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YEbod-0008Qw-5o
	for qemu-trivial@nongnu.org; Fri, 23 Jan 2015 05:50:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YEboc-0008Kh-10
	for qemu-trivial@nongnu.org; Fri, 23 Jan 2015 05:50:15 -0500
Received: from out114-136.biz.mail.alibaba.com ([205.204.114.136]:47043
	helo=out21.biz.mail.alibaba.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>)
	id 1YEboU-00081B-2J; Fri, 23 Jan 2015 05:50:06 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07508906|-1; FP=0|0|0|0|0|-1|-1|-1;
	HT=r41f05020; MF=gang.chen@sunrus.com.cn; PH=DS; RN=5; RT=5;
	SR=0; 
Received: from
	ShengShiZhuChengdeMacBook-Pro.local(mailfrom:gang.chen@sunrus.com.cn
	ip:124.127.118.42) by smtp.aliyun-inc.com(10.194.100.110);
	Fri, 23 Jan 2015 18:49:51 +0800
Message-ID: <54C22918.8040505@sunrus.com.cn>
Date: Fri, 23 Jan 2015 18:57:28 +0800
From: Chen Gang S <gang.chen@sunrus.com.cn>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <54C21D76.8050808@sunrus.com.cn>
	<CAFEAcA_NG4E5tc8nQ8EbVDqs=704cnXJZerVAVg-c74VQm5c+Q@mail.gmail.com>
In-Reply-To: <CAFEAcA_NG4E5tc8nQ8EbVDqs=704cnXJZerVAVg-c74VQm5c+Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 205.204.114.136
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Chris Metcalf <cmetcalf@ezchip.com>,
	Riku Voipio <riku.voipio@iki.fi>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user/syscall.c: Fix
 typo issue for using target_vec[i].iov_len instead of
 target_vec[i].iov_base
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
X-List-Received-Date: Fri, 23 Jan 2015 10:50:16 -0000


Thank you for all of your work.

I plan to let qemu support tile architecture: "can let gcc run testsuite
with qemu for tile". It is really hard to me, but I should try, it is my
duty (I met it, and it's within my boarder, although no one pay for me).
:-)

At present, I am just preparing:

 - Reading architecture related documents (thank tile kernel member, who
   let me know about all tile architecture related documents).

 - Reading qemu architecture related code for understanding how to add
   tile code for qemu.

 - After preparing, I should provide a schedule for it (the steps, and
   the time point, and the risks which I may face to). Hope I can finish
   preparing within this month.

Welcome any ideas, suggestions and completions by any members, e.g.

 - Share any related documents or knowledge for architecture.

 - Is there any original code for tile? Maybe originally, someone tried
   qemu for tile, but the related code was not merged into main line.

 - Suggestions about the schedule: the common steps, the time resources
   may need, and which risks have to face to.


Thanks.

On 1/23/15 18:08, Peter Maydell wrote:
> On 23 January 2015 at 10:07, Chen Gang S <gang.chen@sunrus.com.cn> wrote:
>> It is only a typo issue, need use tswapal(target_vec[i].iov_len) for the
>> len.
>>
>> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
>> ---
>>  linux-user/syscall.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index a66c2ae..8260ed7 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -1896,7 +1896,7 @@ static void unlock_iovec(struct iovec *vec, abi_ulong target_addr,
>>      if (target_vec) {
>>          for (i = 0; i < count; i++) {
>>              abi_ulong base = tswapal(target_vec[i].iov_base);
>> -            abi_long len = tswapal(target_vec[i].iov_base);
>> +            abi_long len = tswapal(target_vec[i].iov_len);
>>              if (len < 0) {
>>                  break;
>>              }
>> --
>> 1.9.3 (Apple Git-50)
> 
> Nice catch.
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> thanks
> -- PMM
> 

-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

