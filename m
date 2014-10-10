Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XcVrm-0006Ig-8J
	for mharc-qemu-trivial@gnu.org; Fri, 10 Oct 2014 04:48:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55086)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XcVrd-000695-OR
	for qemu-trivial@nongnu.org; Fri, 10 Oct 2014 04:48:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XcVrW-0005it-TE
	for qemu-trivial@nongnu.org; Fri, 10 Oct 2014 04:47:53 -0400
Received: from mail-pd0-x22d.google.com ([2607:f8b0:400e:c02::22d]:47624)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1XcVrW-0005ii-Mj; Fri, 10 Oct 2014 04:47:46 -0400
Received: by mail-pd0-f173.google.com with SMTP id g10so1298553pdj.18
	for <multiple recipients>; Fri, 10 Oct 2014 01:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=uiuyTWSIAuphyqayWBBrwyZnMwJs1iUuhW/HYbditcM=;
	b=DFucRot+NifYMqWv5uzDzReR43iqMSGi7A9DZJqo1qz5mMy50OAl5FEgCkYxXg07cS
	hiz0JfRF8vSxVDv/0cOEPhAnGCtJjCOJb9R3F5GrqUFU0FIAxfnwHYr+PPz4LbZSRfTl
	9+kyA+LG/JqOGw9h8n/grsY37QbFea/B55FIIFHRIDEK/JZSY3F+A2deBeXqRbDVkOtv
	1Uy5/WuIGfov3gYSdC/ctPb1vBRBoWDxVk3JK3L2dEtpdWxAQB4/JLa0kgycFrzPb7q6
	Xg9JBw+yy30IAYkmGpAKdKdsU9wKSHd56MZo9dzVcv1GBhRbC54hvywtYHqqP3q6h9pk
	kh4w==
X-Received: by 10.70.125.197 with SMTP id ms5mr770124pdb.166.1412930865324;
	Fri, 10 Oct 2014 01:47:45 -0700 (PDT)
Received: from [192.168.2.113] ([124.127.118.42])
	by mx.google.com with ESMTPSA id c8sm2845878pat.6.2014.10.10.01.47.38
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Oct 2014 01:47:44 -0700 (PDT)
Message-ID: <54379E88.4050102@gmail.com>
Date: Fri, 10 Oct 2014 16:53:28 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <54369514.5000004@gmail.com>
	<CAFEAcA_NOfN=vr98+yqE7B+M88ZDWD_OwxG+noMzGcNjNFwwPw@mail.gmail.com>
	<54373C63.1010005@gmail.com>
	<CAFEAcA83aUuhBQ+Pu+Ott+W3ar20pKQN7vSmZfLaBoBGSwQ1mg@mail.gmail.com>
In-Reply-To: <CAFEAcA83aUuhBQ+Pu+Ott+W3ar20pKQN7vSmZfLaBoBGSwQ1mg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::22d
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
X-List-Received-Date: Fri, 10 Oct 2014 08:48:00 -0000

On 10/10/14 15:37, Peter Maydell wrote:
> On 10 October 2014 02:54, Chen Gang <gang.chen.5i5j@gmail.com> wrote:
>> I use the latest upstream gcc (which pulled from master in 2014-10-0?).
>> In my memory (not quite sure), the older version gcc may not notice
>> about this warning.
> 
> Hmm. I'll see if I can test with that gcc.
> 

It is not quite difficult to do that: get upstream source code, follow
the related document to build, then use it, it should be OK (I just do
like that).

>> But for me, the warning (compiler worries about) sounds reasonable, and
>> it's harmless to be fixed (after have a look, for me, they are declared,
>> but never be used).
> 
> It's a library. Other users of this code upstream will use these
> constants; it's just that we don't happen to.
> 
>>> The reason I'm reluctant to make changes to these files is
>>> that they're pulled in from a different upstream project
>>> (libvixl) so we should only fix critical problems in them,
>>> or it makes new versions harder to update to.
>>>
>>
>> Originally, I first try the Xilinx branch (Xilinx-master from Xilinx
>> github), yesterday, and found this issue, then I try upstream main
>> branch, found the same issue.
>>
>> For me, when add the related patch (which will use these variables in
>> 'libvixl'), then declare and set them in the related headers, again.
>> That will let other reviewers and readers easier understanding.
>>
>>  - removing them at present, is easy understanding.
>>
>>  - add them again when really need them, is also easy understanding.
> 
> But it's all changes which we would have to carry locally
> and then re-make every time we updated to a new libvixl.
> I definitely don't want to do that unless it's absolutely
> required.
> 

It is really a little complex, we almost can not touch this header file,
sorry for my original misunderstanding.

And I guess, "disas/arm-64.cc" is our own file (only for qemu, not from
libvixl upstream project). If really it is, we may do something in it to
avoid this warning, e.g.

  "#pragma GCC diagnostic ignored -Wunused-variable" (almost like "include/ui/qemu-pixman.h" have done).


Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

