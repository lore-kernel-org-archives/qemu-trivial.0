Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XcPKZ-0006kR-Fj
	for mharc-qemu-trivial@gnu.org; Thu, 09 Oct 2014 21:49:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50414)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XcPKP-0006kC-Hb
	for qemu-trivial@nongnu.org; Thu, 09 Oct 2014 21:49:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XcPKG-0006Z8-Fi
	for qemu-trivial@nongnu.org; Thu, 09 Oct 2014 21:49:09 -0400
Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c]:39802)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1XcPKG-0006Z0-8s; Thu, 09 Oct 2014 21:49:00 -0400
Received: by mail-pd0-f172.google.com with SMTP id ft15so723466pdb.17
	for <multiple recipients>; Thu, 09 Oct 2014 18:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=HzZtoxfcEfXMPcPxEVhQ37JhG67iakqJCU2y5YIRyAQ=;
	b=zI6fqPzWUE6NYoiA7G50qrHQ11wbVAg2wE7wS1LGzGvSa/QzKA5g/qp8fpL2Qz/NxQ
	QqJIZVh84B3Ksc7g0ExlPM35z/g4yp3WVOzxBUl2li34E2IsUbKcHzuIv7XNXmmU1Tjb
	wZ883q0CbVTS2EgGtinIQG5vYMtjXVNNTyoPkXucCdG+zHO5vDfe2ZklHYctD6H0wRTQ
	nLMNqCiMjZ4K2T32UdSpHlyQEBS/3ThgojTwatBxUJU/d0AFVziFHHyBNNYVGmfjNOa7
	255WNMegqbctavewCxs/fFFpXUbbozsTHlfgYNzdZHNbiL0mQNPfsMn/vsuHns8JN+Zr
	EgvA==
X-Received: by 10.68.220.164 with SMTP id px4mr1812246pbc.102.1412905738837;
	Thu, 09 Oct 2014 18:48:58 -0700 (PDT)
Received: from ShengShiZhuChengdeMacBook-Pro.local ([1.202.59.152])
	by mx.google.com with ESMTPSA id ty8sm1816465pab.26.2014.10.09.18.48.52
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Oct 2014 18:48:57 -0700 (PDT)
Message-ID: <54373C63.1010005@gmail.com>
Date: Fri, 10 Oct 2014 09:54:43 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <54369514.5000004@gmail.com>
	<CAFEAcA_NOfN=vr98+yqE7B+M88ZDWD_OwxG+noMzGcNjNFwwPw@mail.gmail.com>
In-Reply-To: <CAFEAcA_NOfN=vr98+yqE7B+M88ZDWD_OwxG+noMzGcNjNFwwPw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::22c
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	"rth@twiddle.net" <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH] disas/libvixl/a64/instructions-a64.h:
 Remove useless varialbe to avoid building break with '-Werror'
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
X-List-Received-Date: Fri, 10 Oct 2014 01:49:18 -0000

On 10/9/14 22:34, Peter Maydell wrote:
> On 9 October 2014 15:00, Chen Gang <gang.chen.5i5j@gmail.com> wrote:
>> The related variables are useless, need be removed, or can not pass
>> microblaze building, after fix it, can build microblaze, successfully.
>>
>> The related configuration:
>>
>>  ./configure --target-list="arm-softmmu,microblazeel-softmmu" --enable-fdt --disable-kvm
>>
>> The related compiling error:
> 
> I build this code with both these targets enabled without any
> problems.
> 
> There is an odd compiler thing where if you have any *other*
> compilation issues then these warnings will also be emitted,
> but once you've fixed that other compiler error then these
> warnings are no longer produced. Maybe you ran into that?
> 

I use the latest upstream gcc (which pulled from master in 2014-10-0?).
In my memory (not quite sure), the older version gcc may not notice
about this warning.

But for me, the warning (compiler worries about) sounds reasonable, and
it's harmless to be fixed (after have a look, for me, they are declared,
but never be used).

> The reason I'm reluctant to make changes to these files is
> that they're pulled in from a different upstream project
> (libvixl) so we should only fix critical problems in them,
> or it makes new versions harder to update to.
> 

Originally, I first try the Xilinx branch (Xilinx-master from Xilinx
github), yesterday, and found this issue, then I try upstream main
branch, found the same issue.

For me, when add the related patch (which will use these variables in
'libvixl'), then declare and set them in the related headers, again.
That will let other reviewers and readers easier understanding.

 - removing them at present, is easy understanding.

 - add them again when really need them, is also easy understanding.

So for me, I still prefer to remove these declarations firstly.


Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

