Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VEykV-0002Rj-KO
	for mharc-qemu-trivial@gnu.org; Thu, 29 Aug 2013 05:42:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49066)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fabio.fantoni@m2r.biz>) id 1VEykP-0002Qt-9p
	for qemu-trivial@nongnu.org; Thu, 29 Aug 2013 05:42:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <fabio.fantoni@m2r.biz>) id 1VEykJ-00054P-7q
	for qemu-trivial@nongnu.org; Thu, 29 Aug 2013 05:42:37 -0400
Received: from mail-bk0-f54.google.com ([209.85.214.54]:35659)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fabio.fantoni@m2r.biz>) id 1VEykJ-000544-1B
	for qemu-trivial@nongnu.org; Thu, 29 Aug 2013 05:42:31 -0400
Received: by mail-bk0-f54.google.com with SMTP id mz12so66830bkb.41
	for <qemu-trivial@nongnu.org>; Thu, 29 Aug 2013 02:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=VYa3GzmFMxhhGF8nn9SVFSy9sXhweF/mv/zUmedi5I0=;
	b=f79Icr27lG7nkDHdXHkHj5GHGtWfOysjAXbUJ/Mb9YHctwo8qiX2G8uF/IhTlbL4eR
	CR2EaNhDopuMQ/CFXDbzsPtwOTq6i9gL2b3PNOQaFzrFXW2kUMgCh9iye1uJ+7YBNb7Q
	ShB2iV2kDMI9F5VvlKfNiVw0PhHQGem5VqxxDClpereLH+pNaGNJZ32LjG03/PjFNRZi
	MZjYEfl834QO4EDBg1S0qupfy7GozwihM3h6zYoNAhP++mppmVTD4VuRWBhM6xCb7XtR
	AknAI4sRbg8qu6mr4VrE4FNQJ6mqJG6ZqCRAuluH0LRqcjFcJjaFQXPf8hjkAJwKDt+0
	Zc+g==
X-Gm-Message-State: ALoCoQmiJypsfLiynYD9MrAauMQmvInvqAW9I6AzwWzxYWDjTAhg35tsAxndoEa+tTEx9c8z8fpy
X-Received: by 10.204.247.71 with SMTP id mb7mr1780728bkb.7.1377769349907;
	Thu, 29 Aug 2013 02:42:29 -0700 (PDT)
Received: from [192.168.1.26] (ip-73-126.sn2.eutelia.it. [83.211.73.126])
	by mx.google.com with ESMTPSA id kk2sm6870779bkb.10.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 02:42:29 -0700 (PDT)
Message-ID: <521F178C.2020506@m2r.biz>
Date: Thu, 29 Aug 2013 11:42:36 +0200
From: Fabio Fantoni <fabio.fantoni@m2r.biz>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1376664409-2695-1-git-send-email-anthony.perard@citrix.com>
	<521F0DB6.9090203@redhat.com>
In-Reply-To: <521F0DB6.9090203@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.214.54
Cc: Anthony PERARD <anthony.perard@citrix.com>, qemu-trivial@nongnu.org,
	Stefano Stabellini <stefano.stabellini@citrix.com>,
	QEMU-devel <qemu-devel@nongnu.org>, Xen Devel <xen-devel@lists.xen.org>
Subject: Re: [Qemu-trivial] [Xen-devel] [PATCH for v1.6] pc: Fix
 initialization of the ram_memory variable.
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
X-List-Received-Date: Thu, 29 Aug 2013 09:42:42 -0000

Il 29/08/2013 11:00, Paolo Bonzini ha scritto:
> Il 16/08/2013 16:46, Anthony PERARD ha scritto:
>> In some cases (Xen), it will not be initialized before to be used. This
>> leads to segv.
>>
>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
>>
>> ---
>>
>> It works with this simple initialization to NULL, but would it be
>> necessary (or better) to assign a proper value to this variables ?
> Yeah, the right value of this variable comes from xen_ram_init (called
> by xen_hvm_init).
>
> Paolo

I done a fast search of patch between 1.5 and 1.6 about memory on xen 
files and I found this patch:

Commit:2c9b15cab12c21e32dffb67c5e18f3dc407ca224
* memory: add owner argument to initialization functions

I not understand if can be this that have introduced an unexpected event 
with xen and how to solve correctly.

Thanks for any reply and sorry for my bad english.

>
>> ---
>>   hw/i386/pc_piix.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>> index 6e1e654..596d433 100644
>> --- a/hw/i386/pc_piix.c
>> +++ b/hw/i386/pc_piix.c
>> @@ -86,7 +86,7 @@ static void pc_init1(MemoryRegion *system_memory,
>>       BusState *idebus[MAX_IDE_BUS];
>>       ISADevice *rtc_state;
>>       ISADevice *floppy;
>> -    MemoryRegion *ram_memory;
>> +    MemoryRegion *ram_memory = NULL;
>>       MemoryRegion *pci_memory;
>>       MemoryRegion *rom_memory;
>>       DeviceState *icc_bridge;
>>
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xen.org
> http://lists.xen.org/xen-devel


