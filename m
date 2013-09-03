Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGmBE-0003en-Lo
	for mharc-qemu-trivial@gnu.org; Tue, 03 Sep 2013 04:41:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55210)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1VGmB7-0003dT-SZ
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 04:41:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1VGmB2-0003zO-AC
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 04:41:37 -0400
Received: from mail-ea0-x22a.google.com ([2a00:1450:4013:c01::22a]:60467)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1VGmB2-0003z8-3c; Tue, 03 Sep 2013 04:41:32 -0400
Received: by mail-ea0-f170.google.com with SMTP id h14so2834847eak.29
	for <multiple recipients>; Tue, 03 Sep 2013 01:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=JusFhQh/CwhVRAgC1HBh+mMm++dRzD1rN88VIhyaQ+Y=;
	b=MZ5BvrVd200MFRTdQoivOioNBkGkZQyHVTtpmrm88BDQS8/k7qyH2he+JAOZqJuCSB
	dRU0w1r3snTfWdjPgGdkFgPL0TgnnALqobzmxbMlyU5sVs3A2OoNt6hITEqLw2xrigrU
	1fAZy+FnQ0SPTYeMUEgzR+yMdQayNyztGtF5ylmLWQk7FE5z/mBQo+HjLRS0VEuSaqzT
	SYbcJMVSJXqjRdajAbr6MvDUyKEQ7/mq79EFxJQmL0v2KXJFBqKAYlFNb462MSM2RwNV
	JI+qSzOXuQE2TvnV1Xr7ZSTTsa+IdRArzar0VIGFeYmyFTOebYRdduepYAd6n7s50ad8
	YCvw==
X-Received: by 10.14.224.198 with SMTP id x46mr1940788eep.53.1378197691124;
	Tue, 03 Sep 2013 01:41:31 -0700 (PDT)
Received: from yakj.usersys.redhat.com
	(net-37-117-144-28.cust.dsl.vodafone.it. [37.117.144.28])
	by mx.google.com with ESMTPSA id a6sm29535570eei.10.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 03 Sep 2013 01:41:30 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <5225A0BA.9000609@redhat.com>
Date: Tue, 03 Sep 2013 10:41:30 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
References: <1378191917-6964-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<52258E44.9010704@redhat.com> <52259F6E.3000205@suse.de>
In-Reply-To: <52259F6E.3000205@suse.de>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c01::22a
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial <qemu-trivial@nongnu.org>,
	Jan Kiszka <jan.kiszka@siemens.com>, Alexander Graf <agraf@suse.de>,
	qemu-devel <qemu-devel@nongnu.org>, liguang <lig.fnst@cn.fujitsu.com>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH] cputlb: remove dead function
	tlb_update_dirty
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
X-List-Received-Date: Tue, 03 Sep 2013 08:41:43 -0000

Il 03/09/2013 10:35, Andreas Färber ha scritto:
> Am 03.09.2013 09:22, schrieb Paolo Bonzini:
>> Il 03/09/2013 09:05, liguang ha scritto:
>>> Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
>>> ---
>>>  cputlb.c |   15 ---------------
>>>  1 files changed, 0 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/cputlb.c b/cputlb.c
>>> index 977c0ca..08e50e0 100644
>>> --- a/cputlb.c
>>> +++ b/cputlb.c
>>> @@ -169,21 +169,6 @@ static inline ram_addr_t qemu_ram_addr_from_host_nofail(void *ptr)
>>>      return ram_addr;
>>>  }
>>>  
>>> -static inline void tlb_update_dirty(CPUTLBEntry *tlb_entry)
>>> -{
>>> -    ram_addr_t ram_addr;
>>> -    void *p;
>>> -
>>> -    if (tlb_is_dirty_ram(tlb_entry)) {
>>> -        p = (void *)(uintptr_t)((tlb_entry->addr_write & TARGET_PAGE_MASK)
>>> -            + tlb_entry->addend);
>>> -        ram_addr = qemu_ram_addr_from_host_nofail(p);
>>> -        if (!cpu_physical_memory_is_dirty(ram_addr)) {
>>> -            tlb_entry->addr_write |= TLB_NOTDIRTY;
>>> -        }
>>> -    }
>>> -}
>>> -
>>>  void cpu_tlb_reset_dirty_all(ram_addr_t start1, ram_addr_t length)
>>>  {
>>>      CPUState *cpu;
>>>
>>
>> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
>>
>> and CCing qemu-trivial.
> 
> Negative, please keep qemu-trivial out of this. My qom-cpu pull was
> already blocked by the s390 and ppc pulls, so let's not add yet another
> potentially interfering one to the mix.
> 
> IF rth agrees as TCG maintainer that this is not needed in any of his
> upcoming refactorings then I'll queue it on qom-cpu. My upcoming
> qom-cpu-13 series touches upon pretty much every core CPU file
> perceivable, including this cputlb.c.

Sure.

> I also don't understand why qemu-trivial is suddenly picking up Stefan's
> arm translation patch, it used to be for unmaintained areas only. But
> arm is not my problem.

That patch is also not "trivial", too.

Paolo


