Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGkxA-0003Rs-Dk
	for mharc-qemu-trivial@gnu.org; Tue, 03 Sep 2013 03:23:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1VGkx3-0003Dl-5B
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 03:23:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1VGkwy-0006H1-53
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 03:23:01 -0400
Received: from mail-ea0-x22c.google.com ([2a00:1450:4013:c01::22c]:46099)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1VGkwn-0005yi-MN; Tue, 03 Sep 2013 03:22:45 -0400
Received: by mail-ea0-f172.google.com with SMTP id r16so2782281ead.17
	for <multiple recipients>; Tue, 03 Sep 2013 00:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=d+kZaa2WaVSGsCIHLzaSAf1RIA9pz84foIbuEVNTWvQ=;
	b=mDGDq0Z83sww6B8JyXl/25hRYTwmQ2jWZOgwEbK7hle04uAxqOqEwkp20wUeNmhbch
	2eAJ+uLBaBO2Z9X30SU4N4ctCprhEvP8VS5mCJN1wbxHTyi4hElh4mAb16llV98i5Uak
	Y70Gy4UR2NFrKVmyrfrV8JHHCcAuuxnEqLTRkhE6m9PWnwNiL7aA8VxPms3C8HrtHuA/
	4DAElHUYm8QibCWjSlFB+aYKn4qoMCDlAnoUey9Q80DA/yctH/U7H4u1/YrvUBpGxirI
	yZ1F9yLcbhFGgLBYDgHkZOBtP4BZrBdvVWYbwLSrxsD1JVuNJNrjUrklMlchEp6ETzYK
	pY3g==
X-Received: by 10.14.99.193 with SMTP id x41mr2063373eef.52.1378192964726;
	Tue, 03 Sep 2013 00:22:44 -0700 (PDT)
Received: from yakj.usersys.redhat.com
	(net-37-117-144-28.cust.dsl.vodafone.it. [37.117.144.28])
	by mx.google.com with ESMTPSA id m54sm29040394eex.2.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 03 Sep 2013 00:22:43 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <52258E44.9010704@redhat.com>
Date: Tue, 03 Sep 2013 09:22:44 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: liguang <lig.fnst@cn.fujitsu.com>
References: <1378191917-6964-1-git-send-email-lig.fnst@cn.fujitsu.com>
In-Reply-To: <1378191917-6964-1-git-send-email-lig.fnst@cn.fujitsu.com>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c01::22c
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Jan Kiszka <jan.kiszka@siemens.com>,
	qemu-devel <qemu-devel@nongnu.org>,
	=?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>,
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
X-List-Received-Date: Tue, 03 Sep 2013 07:23:06 -0000

Il 03/09/2013 09:05, liguang ha scritto:
> Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
> ---
>  cputlb.c |   15 ---------------
>  1 files changed, 0 insertions(+), 15 deletions(-)
> 
> diff --git a/cputlb.c b/cputlb.c
> index 977c0ca..08e50e0 100644
> --- a/cputlb.c
> +++ b/cputlb.c
> @@ -169,21 +169,6 @@ static inline ram_addr_t qemu_ram_addr_from_host_nofail(void *ptr)
>      return ram_addr;
>  }
>  
> -static inline void tlb_update_dirty(CPUTLBEntry *tlb_entry)
> -{
> -    ram_addr_t ram_addr;
> -    void *p;
> -
> -    if (tlb_is_dirty_ram(tlb_entry)) {
> -        p = (void *)(uintptr_t)((tlb_entry->addr_write & TARGET_PAGE_MASK)
> -            + tlb_entry->addend);
> -        ram_addr = qemu_ram_addr_from_host_nofail(p);
> -        if (!cpu_physical_memory_is_dirty(ram_addr)) {
> -            tlb_entry->addr_write |= TLB_NOTDIRTY;
> -        }
> -    }
> -}
> -
>  void cpu_tlb_reset_dirty_all(ram_addr_t start1, ram_addr_t length)
>  {
>      CPUState *cpu;
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

and CCing qemu-trivial.

Paolo

