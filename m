Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1alaIe-00029R-5t
	for mharc-qemu-trivial@gnu.org; Thu, 31 Mar 2016 06:58:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52531)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>) id 1alaIc-00029K-7a
	for qemu-trivial@nongnu.org; Thu, 31 Mar 2016 06:58:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>) id 1alaIb-0007J1-71
	for qemu-trivial@nongnu.org; Thu, 31 Mar 2016 06:58:02 -0400
Received: from mail-vk0-x242.google.com ([2607:f8b0:400c:c05::242]:35640)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>)
	id 1alaIb-0007Iv-1z; Thu, 31 Mar 2016 06:58:01 -0400
Received: by mail-vk0-x242.google.com with SMTP id e185so10819384vkb.2;
	Thu, 31 Mar 2016 03:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DFJUze6Zi8e5szknZGFLWKVoFQFiD+uOnN+P/XQUZCI=;
	b=Z4EaBZYh+YzW1PZW595d96ho60ffvcqEagIW5dWFJ6y1+TkyV1k2JUbYHkeIQDgODo
	Su8BcrQC2YePUMCyOCDVKPYdWFRhzT6nXnTV15aoRNJ9y2FcfWTrsZUnGYlwig/RD7jH
	W3eUTpMb1kuOCfJ2jnXbHE4nWHqFuiIAEeDYLqcDiLB28FyGuV0xJ4fL0YbjjMBuXJn+
	bLqxYDAbAqi/7GMpBrJOlRvqKMDpKP/lLAnXSppOOngNZW2ME8JqGFotNoaWZJUxogj/
	6tAnRyHfChpqu6XCgwvmD5EnIKmVjuBTX8Q41HJLXmqySsTgn2EymuWr/A4AMy9uMXpV
	qJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DFJUze6Zi8e5szknZGFLWKVoFQFiD+uOnN+P/XQUZCI=;
	b=Y78QCFDRsU4QUzFUhGl1no0Xyl5VhjgWo4PI1Po01yfYdaFPsW/AdNQxx1+4CxEsxk
	bz52N4CZldgCPd4/xiO0xzb/KriEEwvBwYLRMYoN2XEasdp6NqmqVG7pvY5tPad7bfwJ
	/T2FUuPXwD4trScFTcgcn3LjDaKuR6bt/HJxWR1v6V+hx3OUkZPuGTZcR0SZLBsjZixu
	Uw0EjMOswnMELjoBfIh2gw4N17XzRffWJYYcnP4q3UTtSQbRx9VSguVSUjhf7RIY7gz6
	IjodNemRfx6OErgUqwnyD5ZgKmzgpOdgu6Q7M28/tlYhow2U8mx0taJmgBETC6YO0NNq
	h9ng==
X-Gm-Message-State: AD7BkJIc+dyMRSG0IaseghnqJ90EE8b6nStW1opjAeXh5MulV71pSoQyY5qoyZFMo7lyPyXo61L1SoxpFVPCmQ==
X-Received: by 10.31.13.140 with SMTP id 134mr8790452vkn.142.1459421880401;
	Thu, 31 Mar 2016 03:58:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.15.9 with HTTP; Thu, 31 Mar 2016 03:57:41 -0700 (PDT)
In-Reply-To: <20160331094209.GK32185@stefanha-x1.localdomain>
References: <1458757923-11362-1-git-send-email-haris.phnx@gmail.com>
	<20160330140955.GA2557@stefanha-x1.localdomain>
	<CAE_WKMz4K1hSqwrLzgAPP2BMjokY_E6-R61R2RyRS06Pteb80w@mail.gmail.com>
	<20160331094209.GK32185@stefanha-x1.localdomain>
From: haris iqbal <haris.phnx@gmail.com>
Date: Thu, 31 Mar 2016 16:27:41 +0530
Message-ID: <CAE_WKMw1r7duQ-uA6_moumMxxH3PFXpVAahGmJtdct-OR6Fp6Q@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::242
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [Qemu-Devel] [PATCH] Changed malloc
 to g_malloc, free to g_free in linux-user/qemu.h
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
X-List-Received-Date: Thu, 31 Mar 2016 10:58:03 -0000

On Thu, Mar 31, 2016 at 3:12 PM, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Wed, Mar 30, 2016 at 09:58:41PM +0530, haris iqbal wrote:
>> On Wed, Mar 30, 2016 at 7:39 PM, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>> > On Thu, Mar 24, 2016 at 12:02:03AM +0530, Md Haris Iqbal wrote:
>> >> Signed-off-by: Md Haris Iqbal <haris.phnx@gmail.com>
>> >> ---
>> >>  linux-user/qemu.h | 4 ++--
>> >>  1 file changed, 2 insertions(+), 2 deletions(-)
>> >>
>> >> diff --git a/linux-user/qemu.h b/linux-user/qemu.h
>> >> index 26b0ba2..3c3fd15 100644
>> >> --- a/linux-user/qemu.h
>> >> +++ b/linux-user/qemu.h
>> >> @@ -381,7 +381,7 @@ static inline void *lock_user(int type, abi_ulong guest_addr, long len, int copy
>> >>  #ifdef DEBUG_REMAP
>> >>      {
>> >>          void *addr;
>> >> -        addr = malloc(len);
>> >> +        addr = g_malloc(len);
>> >>          if (copy)
>> >>              memcpy(addr, g2h(guest_addr), len);
>> >>          else
>> >> @@ -407,7 +407,7 @@ static inline void unlock_user(void *host_ptr, abi_ulong guest_addr,
>> >>          return;
>> >>      if (len > 0)
>> >>          memcpy(g2h(guest_addr), host_ptr, len);
>> >> -    free(host_ptr);
>> >> +    g_free(host_ptr);
>> >>  #endif
>> >>  }
>> >
>> > If I understand correctly either lock_user() or lock_user_string() may
>> > be followed by unlock_user().  If you change unlock_user() to g_free()
>> > then you also need to change lock_user_string() to g_malloc() to avoid a
>> > malloc()/g_free() mismatch.
>>
>> lock_user_string() does not use malloc itself, but calls lock_user()
>> from itself.
>
> You are right.  The reason I got confused is because there are 3
> versions of lock_user(): linux-user, bsd-user, and
> include/exec/softmmu-semi.h.
>
> Please send equivalent patches for the other 2 versions as well.  This
> way they stay consistent.

Will do. Actually as they different files, I was told to send patches
separately.

And I wanted to wait till this one is reviewed, so I don't repeat any
mistake if there are in this one.

>
> Thanks,
> Stefan



-- 

With regards,

Md Haris Iqbal,
Placement Coordinator, MTech IT
NITK Surathkal,
Contact: +91 8861996962

