Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YEegH-0000WU-GA
	for mharc-qemu-trivial@gnu.org; Fri, 23 Jan 2015 08:53:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56581)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YEegE-0000Sp-Vq
	for qemu-trivial@nongnu.org; Fri, 23 Jan 2015 08:53:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YEegD-0002nX-VO
	for qemu-trivial@nongnu.org; Fri, 23 Jan 2015 08:53:46 -0500
Received: from out1134-250.mail.aliyun.com ([42.120.134.250]:42796)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>)
	id 1YEeg8-0002lI-Kc; Fri, 23 Jan 2015 08:53:40 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07440022|-1; FP=0|0|0|0|0|-1|-1|-1;
	HT=r46d02008; MF=gang.chen@sunrus.com.cn; PH=DS; RN=5; RT=5;
	SR=0; 
Received: from
	ShengShiZhuChengdeMacBook-Pro.local(mailfrom:gang.chen@sunrus.com.cn
	ip:223.72.65.59) by smtp.aliyun-inc.com(10.194.100.113);
	Fri, 23 Jan 2015 21:53:31 +0800
Message-ID: <54C25428.7030304@sunrus.com.cn>
Date: Fri, 23 Jan 2015 22:01:12 +0800
From: Chen Gang S <gang.chen@sunrus.com.cn>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <54C21D76.8050808@sunrus.com.cn>
	<CAFEAcA_NG4E5tc8nQ8EbVDqs=704cnXJZerVAVg-c74VQm5c+Q@mail.gmail.com>
	<54C22918.8040505@sunrus.com.cn>
	<CAFEAcA9WwAT4ft9Hk0Apoa1MG1PeGOZ660OtK+qvJYeJvVMCGg@mail.gmail.com>
In-Reply-To: <CAFEAcA9WwAT4ft9Hk0Apoa1MG1PeGOZ660OtK+qvJYeJvVMCGg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 42.120.134.250
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
X-List-Received-Date: Fri, 23 Jan 2015 13:53:48 -0000

On 1/23/15 19:21, Peter Maydell wrote:
> On 23 January 2015 at 10:57, Chen Gang S <gang.chen@sunrus.com.cn> wrote:
>>
>> Thank you for all of your work.
>>
>> I plan to let qemu support tile architecture: "can let gcc run testsuite
>> with qemu for tile". It is really hard to me, but I should try, it is my
>> duty (I met it, and it's within my boarder, although no one pay for me).
>> :-)
> 
>> Welcome any ideas, suggestions and completions by any members
> 
> My single biggest suggestion is to make sure you split the work
> up so that you can post parts of it as you go along. Typically
> for a target-*/ new port that looks something like
>  * initial framework, but no instruction decode (so all instructions
>    just throw an illegal instruction exception)
>  * support for one or a few simple classes of instruction
>  * gradually fill in the gaps of missing instructions
> 
> This way you get the benefit of code review on your early patches,
> so you can write the later ones in line with the comments you
> get on the first patches. We also get to review the code in
> smaller and more manageable chunks.
> 
> I think the last target code to go in was target-tricore; you
> could look back in the git history and the archives to get an
> idea of how to structure the patchset and the kinds of review
> comment that patchseries received.
> 

That sounds a good idea to me. In this way, I will bother qemu upstream
frequently (which also means will get much help from qemu upstream for
tile, frequently).

If can get much help from qemu upstream frequently (in above way), I
guess, it is possible to me to finish it: "let gcc run testsuit with
tile qemu". :-)

What I shall do for tile qemu should obey the related license of qemu
(all the related code should belong to qemu upstream). If necessary to
follow some copyright working flow, please let me know, I shall follow.


Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

