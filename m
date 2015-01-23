Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YElNx-0003L8-69
	for mharc-qemu-trivial@gnu.org; Fri, 23 Jan 2015 16:03:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44537)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YElNu-0003Fp-0I
	for qemu-trivial@nongnu.org; Fri, 23 Jan 2015 16:03:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YElNs-0002Ls-MZ
	for qemu-trivial@nongnu.org; Fri, 23 Jan 2015 16:03:17 -0500
Received: from mail113-250.mail.alibaba.com ([205.204.113.250]:47675
	helo=us-alimail-mta1.hst.scl.en.alidc.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>)
	id 1YElNn-0002H7-PJ; Fri, 23 Jan 2015 16:03:12 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07992458|-1; FP=0|0|0|0|0|-1|-1|-1;
	HT=r46d02036; MF=gang.chen@sunrus.com.cn; PH=DS; RN=5; RT=5;
	SR=0; 
Received: from
	ShengShiZhuChengdeMacBook-Pro.local(mailfrom:gang.chen@sunrus.com.cn
	ip:223.72.65.28) by smtp.aliyun-inc.com(10.147.38.22);
	Sat, 24 Jan 2015 05:03:01 +0800
Message-ID: <54C2B8D2.1030803@sunrus.com.cn>
Date: Sat, 24 Jan 2015 05:10:42 +0800
From: Chen Gang S <gang.chen@sunrus.com.cn>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <54C21D76.8050808@sunrus.com.cn>
	<CAFEAcA_NG4E5tc8nQ8EbVDqs=704cnXJZerVAVg-c74VQm5c+Q@mail.gmail.com>
	<54C22918.8040505@sunrus.com.cn>
	<CAFEAcA9WwAT4ft9Hk0Apoa1MG1PeGOZ660OtK+qvJYeJvVMCGg@mail.gmail.com>
	<54C25428.7030304@sunrus.com.cn>
	<CAFEAcA_4GvLC30OAjxqyNjd=x5SUUosd6nqNjYG6gM=-EbSR9w@mail.gmail.com>
In-Reply-To: <CAFEAcA_4GvLC30OAjxqyNjd=x5SUUosd6nqNjYG6gM=-EbSR9w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 205.204.113.250
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
X-List-Received-Date: Fri, 23 Jan 2015 21:03:19 -0000

On 1/23/15 21:55, Peter Maydell wrote:
> On 23 January 2015 at 14:01, Chen Gang S <gang.chen@sunrus.com.cn> wrote:
>> What I shall do for tile qemu should obey the related license of qemu
>> (all the related code should belong to qemu upstream). If necessary to
>> follow some copyright working flow, please let me know, I shall follow.
> 
> We don't have a copyright assignment process. I recommend
> reading http://wiki.qemu.org/Contribute/SubmitAPatch if you haven't
> already.
> 

OK, thank. I assume (or declare):

 - The code what I write for qemu are all provided by myself (personal),
   not by any companies or any organizations (no one pay for it).

 - The documents which I have get are all free (e.g. tile architecture
   related pdf files), I can reference them freely for development.

 - If the related code what I have provided are integrated into qemu
   upstream, qemu upstream have the full right for it (follow with qemu
   upstream own copyright).

I send the mail from my company email address, the reason is gmail is
broken in China, my gmail can not be used, so I have to use my another
email address in these days (but my gmail is still for Signed-of-by).

Welcome any suggestions and completions by any members or organizations.

Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

