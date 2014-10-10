Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XcW1o-0001Bw-T3
	for mharc-qemu-trivial@gnu.org; Fri, 10 Oct 2014 04:58:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XcW1h-0001Bj-2C
	for qemu-trivial@nongnu.org; Fri, 10 Oct 2014 04:58:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XcW1a-0001hn-6d
	for qemu-trivial@nongnu.org; Fri, 10 Oct 2014 04:58:17 -0400
Received: from mail-pd0-x229.google.com ([2607:f8b0:400e:c02::229]:36149)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1XcW1Z-0001hW-V6; Fri, 10 Oct 2014 04:58:10 -0400
Received: by mail-pd0-f169.google.com with SMTP id w10so1312648pde.14
	for <multiple recipients>; Fri, 10 Oct 2014 01:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=NvrBG+qVejFOON48Rfgg5mi0R/t7Q6RbTxPs/5uhyHQ=;
	b=iMlTWn02iqeIbCZMy7+2ZuarTpHE3iSCD2YDwZDqBZI1oRfztF7FDVJFJRpEnx5+l9
	HKtPI6NKiq+DekctxrUlyLleVnR4dQ++w0mvDzBa70MHQilfzThOYzRe6UwFahWEFY+5
	Hn7MVYjhsVuLQLP0gl/SBvrh4zD0hXyRfWS0r/cTYZMaUFT03qpEb2dSFQ0kMGm90/kJ
	SaU1xOLAGpyTkeTyFAXNrxCu9kvNbyYIhAh7QYxUSfv+j93a8IOfjKbcY5HUT2+i71Uy
	eHcitrhM5PgjMF89wM/Djzg9uBm54DD0t/YPE4LiBzEw43mPQtUcTcQN++sphC2S58iy
	xZQA==
X-Received: by 10.70.101.71 with SMTP id fe7mr1091627pdb.155.1412931488616;
	Fri, 10 Oct 2014 01:58:08 -0700 (PDT)
Received: from [192.168.2.113] ([124.127.118.42])
	by mx.google.com with ESMTPSA id td4sm2776116pbc.36.2014.10.10.01.57.47
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Oct 2014 01:58:07 -0700 (PDT)
Message-ID: <5437A0E5.1040200@gmail.com>
Date: Fri, 10 Oct 2014 17:03:33 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <54369514.5000004@gmail.com>
	<CAFEAcA_NOfN=vr98+yqE7B+M88ZDWD_OwxG+noMzGcNjNFwwPw@mail.gmail.com>
	<54373C63.1010005@gmail.com>
	<CAFEAcA83aUuhBQ+Pu+Ott+W3ar20pKQN7vSmZfLaBoBGSwQ1mg@mail.gmail.com>
	<54379E88.4050102@gmail.com>
In-Reply-To: <54379E88.4050102@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::229
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
X-List-Received-Date: Fri, 10 Oct 2014 08:58:24 -0000

On 10/10/14 16:53, Chen Gang wrote:
> On 10/10/14 15:37, Peter Maydell wrote:
>>>> The reason I'm reluctant to make changes to these files is
>>>> that they're pulled in from a different upstream project
>>>> (libvixl) so we should only fix critical problems in them,
>>>> or it makes new versions harder to update to.
>>>>
>>>
>>> Originally, I first try the Xilinx branch (Xilinx-master from Xilinx
>>> github), yesterday, and found this issue, then I try upstream main
>>> branch, found the same issue.
>>>
>>> For me, when add the related patch (which will use these variables in
>>> 'libvixl'), then declare and set them in the related headers, again.
>>> That will let other reviewers and readers easier understanding.
>>>
>>>  - removing them at present, is easy understanding.
>>>
>>>  - add them again when really need them, is also easy understanding.
>>
>> But it's all changes which we would have to carry locally
>> and then re-make every time we updated to a new libvixl.
>> I definitely don't want to do that unless it's absolutely
>> required.
>>
> 
> It is really a little complex, we almost can not touch this header file,
> sorry for my original misunderstanding.
> 
> And I guess, "disas/arm-64.cc" is our own file (only for qemu, not from
> libvixl upstream project). If really it is, we may do something in it to
> avoid this warning, e.g.
> 
>   "#pragma GCC diagnostic ignored -Wunused-variable" (almost like "include/ui/qemu-pixman.h" have done).
> 

Oh, may need "-Wunused-but-set-variable" instead of "-Wunused-variable",
and also need check CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE (I guess the
latest gcc should be OK).

If what I guess is OK, I shall try to test it under both the latest gcc
for x86_64 and the host gcc under Fedora 20 x86_64. If they are all OK,
I shall send patch v2 for it.


Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

