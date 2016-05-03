Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axWx0-0003sl-Ft
	for mharc-qemu-trivial@gnu.org; Tue, 03 May 2016 05:49:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41840)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>) id 1axWwr-0003br-SA
	for qemu-trivial@nongnu.org; Tue, 03 May 2016 05:49:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>) id 1axWwf-00059k-UV
	for qemu-trivial@nongnu.org; Tue, 03 May 2016 05:48:52 -0400
Received: from mail-vk0-x244.google.com ([2607:f8b0:400c:c05::244]:35366)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>)
	id 1axWwe-0004lD-Mw; Tue, 03 May 2016 05:48:45 -0400
Received: by mail-vk0-x244.google.com with SMTP id s184so1269950vkb.2;
	Tue, 03 May 2016 02:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=o5Di/fq5s37QnO+T3H7Tq4iz3lul+2Hme7UYFZV1e1M=;
	b=KsXdAdyC9ERDrloPFKAx5ClfSc9qF7YG3Tfki4roxnssRgyvGN1ju4r2+tAW+EPy94
	8Aa4QC0qCWzC2kJYybOgjSKSK3Ks+lBvPNJwne6pJq2Uz8Cc8Cb/AREnFbD6hQFERTwW
	74gbWMyKMfANNx4T6briG08rCFQKEuQLEwIvE4PPdmmP0bRZIwgKyo4R1/rr5GIYUJLH
	58vSPdObQRuKplkRhmYZ8qqgwpoVqWKosxvvn264hd4bcx3HNHGGRa5b0ArOC1RqPaX7
	VrQ4gzKclDfozaXgnME8hm8AZtIeJC1edEzsSrJJClEve93m348TMKJwFoV12b0BexLh
	LQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=o5Di/fq5s37QnO+T3H7Tq4iz3lul+2Hme7UYFZV1e1M=;
	b=Lnd1RcKsdcvaY7lU8xpceULmaEEkWDv2jioOO9gvMPMbIPF4tOh52D1qSjXTp42Idc
	YkP7lykgXnzgktneDHYMcfYZfvsV8xgVVpWrFCCymAWXknRdvniu4DzC/WFloDiz5oBq
	JPV/TG19RR4lzVxrKwx7TioXTAWUx9RRYNE/GjCeiU0kYopvNv1nr0gyln8EapG+Ra63
	Z31hQdsmUG6O6d7tNnZ7GE6tNHaK7IxV7G4+hv0mDExU7GVzOOVAjRlVdA5UTPhdZq6U
	KHB6e59WttdcoRPzl5eDAOjNQncVjPf23EHMP//BRFTvgamat+puULCX3C/2M5jjyNGe
	x91Q==
X-Gm-Message-State: AOPr4FXa0/MxffpsC9epPAd/1y0gE2ruaFz1HLPVtyAtfWBIiNLz6ORAdSCD+hhERvR5U2wo/CYQlEbzXv7G1A==
X-Received: by 10.31.133.83 with SMTP id h80mr581683vkd.142.1462268893041;
	Tue, 03 May 2016 02:48:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.184.134 with HTTP; Tue, 3 May 2016 02:47:53 -0700 (PDT)
In-Reply-To: <CAE_WKMw1r7duQ-uA6_moumMxxH3PFXpVAahGmJtdct-OR6Fp6Q@mail.gmail.com>
References: <1458757923-11362-1-git-send-email-haris.phnx@gmail.com>
	<20160330140955.GA2557@stefanha-x1.localdomain>
	<CAE_WKMz4K1hSqwrLzgAPP2BMjokY_E6-R61R2RyRS06Pteb80w@mail.gmail.com>
	<20160331094209.GK32185@stefanha-x1.localdomain>
	<CAE_WKMw1r7duQ-uA6_moumMxxH3PFXpVAahGmJtdct-OR6Fp6Q@mail.gmail.com>
From: haris iqbal <haris.phnx@gmail.com>
Date: Tue, 3 May 2016 15:17:53 +0530
Message-ID: <CAE_WKMzkFWys2wiEhzgDk4fh++K4sSG=s1sw9z9iodO--QDtVA@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, 
	Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [Qemu-Devel] [PATCH] Changed malloc
 to g_malloc, free to g_free in linux-user/qemu.h
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 03 May 2016 09:49:04 -0000

Just a reminder. any more changes needed for this patch? or can it be merged?

On Thu, Mar 31, 2016 at 4:27 PM, haris iqbal <haris.phnx@gmail.com> wrote:
> On Thu, Mar 31, 2016 at 3:12 PM, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>> On Wed, Mar 30, 2016 at 09:58:41PM +0530, haris iqbal wrote:
>>> On Wed, Mar 30, 2016 at 7:39 PM, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>>> > On Thu, Mar 24, 2016 at 12:02:03AM +0530, Md Haris Iqbal wrote:
>>> >> Signed-off-by: Md Haris Iqbal <haris.phnx@gmail.com>
>>> >> ---
>>> >>  linux-user/qemu.h | 4 ++--
>>> >>  1 file changed, 2 insertions(+), 2 deletions(-)
>>> >>
>>> >> diff --git a/linux-user/qemu.h b/linux-user/qemu.h
>>> >> index 26b0ba2..3c3fd15 100644
>>> >> --- a/linux-user/qemu.h
>>> >> +++ b/linux-user/qemu.h
>>> >> @@ -381,7 +381,7 @@ static inline void *lock_user(int type, abi_ulong guest_addr, long len, int copy
>>> >>  #ifdef DEBUG_REMAP
>>> >>      {
>>> >>          void *addr;
>>> >> -        addr = malloc(len);
>>> >> +        addr = g_malloc(len);
>>> >>          if (copy)
>>> >>              memcpy(addr, g2h(guest_addr), len);
>>> >>          else
>>> >> @@ -407,7 +407,7 @@ static inline void unlock_user(void *host_ptr, abi_ulong guest_addr,
>>> >>          return;
>>> >>      if (len > 0)
>>> >>          memcpy(g2h(guest_addr), host_ptr, len);
>>> >> -    free(host_ptr);
>>> >> +    g_free(host_ptr);
>>> >>  #endif
>>> >>  }
>>> >
>>> > If I understand correctly either lock_user() or lock_user_string() may
>>> > be followed by unlock_user().  If you change unlock_user() to g_free()
>>> > then you also need to change lock_user_string() to g_malloc() to avoid a
>>> > malloc()/g_free() mismatch.
>>>
>>> lock_user_string() does not use malloc itself, but calls lock_user()
>>> from itself.
>>
>> You are right.  The reason I got confused is because there are 3
>> versions of lock_user(): linux-user, bsd-user, and
>> include/exec/softmmu-semi.h.
>>
>> Please send equivalent patches for the other 2 versions as well.  This
>> way they stay consistent.
>
> Will do. Actually as they different files, I was told to send patches
> separately.
>
> And I wanted to wait till this one is reviewed, so I don't repeat any
> mistake if there are in this one.
>
>>
>> Thanks,
>> Stefan
>
>
>
> --
>
> With regards,
>
> Md Haris Iqbal,
> Placement Coordinator, MTech IT
> NITK Surathkal,
> Contact: +91 8861996962



-- 

With regards,

Md Haris Iqbal,
Placement Coordinator, MTech IT
NITK Surathkal,
Contact: +91 8861996962

