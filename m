Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VExf3-0003XO-9r
	for mharc-qemu-trivial@gnu.org; Thu, 29 Aug 2013 04:33:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35788)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fabio.fantoni@m2r.biz>) id 1VExew-0003Kr-D5
	for qemu-trivial@nongnu.org; Thu, 29 Aug 2013 04:32:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <fabio.fantoni@m2r.biz>) id 1VExeq-0007ss-JT
	for qemu-trivial@nongnu.org; Thu, 29 Aug 2013 04:32:54 -0400
Received: from mail-bk0-f52.google.com ([209.85.214.52]:63057)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fabio.fantoni@m2r.biz>) id 1VExeq-0007sH-DO
	for qemu-trivial@nongnu.org; Thu, 29 Aug 2013 04:32:48 -0400
Received: by mail-bk0-f52.google.com with SMTP id e11so35409bkh.25
	for <qemu-trivial@nongnu.org>; Thu, 29 Aug 2013 01:32:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=c6c0TM3YALUle2zxL8zYjD9J7ki7orXupNFMHWn0xyk=;
	b=PWNJ/0lCX00Samb1ISxVgcTRoAM9xMlPh0yKt6PVtxS/F06ucHfw+n9sparMo6X8a9
	/zIU0KBLbWGWfTnSvRJqkNd3xTOfQEtntV1jgyrWXGfssHwrrBqgMcTKuWVEGmidTJpf
	25G1xgRg9N7i/TIuHuVNQbaYesd1kxSkEK2MGH9Gbn/RJaCA8gn9Cc/4mYsneQ6s5aSz
	kWW/449QJhBNkD7tRr81Tr4/QwPOrj/DwcWCSX4yCJeDmv98ohlRq/d4rU6WkBmQmUXY
	8NP4ERL1SSXZebMzl1olM5MEfqRCOTizgsdT6bpABoj6vTURS33jqpru+x+p6oPba7m9
	nfag==
X-Gm-Message-State: ALoCoQlPwKpmLo2oogBYrMCqFH4+FyffFm1o5Lt5z51UOBVyGIq5cRaZYWFn37nefPtP18+oxeAL
X-Received: by 10.204.121.201 with SMTP id i9mr1505308bkr.13.1377765166651;
	Thu, 29 Aug 2013 01:32:46 -0700 (PDT)
Received: from [192.168.1.26] (ip-73-126.sn2.eutelia.it. [83.211.73.126])
	by mx.google.com with ESMTPSA id pn6sm6753053bkb.14.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 01:32:46 -0700 (PDT)
Message-ID: <521F0735.4090102@m2r.biz>
Date: Thu, 29 Aug 2013 10:32:53 +0200
From: Fabio Fantoni <fabio.fantoni@m2r.biz>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Anthony PERARD <anthony.perard@citrix.com>
References: <1376664409-2695-1-git-send-email-anthony.perard@citrix.com>
	<521B6DA5.1010801@m2r.biz>
In-Reply-To: <521B6DA5.1010801@m2r.biz>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.214.52
Cc: qemu-trivial@nongnu.org, Stefano Stabellini <stefano.stabellini@citrix.com>,
	QEMU-devel <qemu-devel@nongnu.org>,
	Anthony Liguori <anthony@codemonkey.ws>,
	Xen Devel <xen-devel@lists.xen.org>
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
X-List-Received-Date: Thu, 29 Aug 2013 08:32:59 -0000

Il 26/08/2013 17:00, Fabio Fantoni ha scritto:
> Il 16/08/2013 16:46, Anthony PERARD ha scritto:
>> In some cases (Xen), it will not be initialized before to be used. This
>> leads to segv.
>>
>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
>
> Tested-by: Fabio Fantoni <fabio.fantoni@m2r.biz>
> This patch have solved the critical regression of all hvm domUs that 
> prevented domUs starting with qemu 1.6.
>

I not see this patch on git for now, I think is urgent apply this patch 
or solve the problem in other way because qemu 1.6 is unusable at all 
for hvm domUs on xen and 1.5.x doesn't works with hvm domUs with ram > 
2gb, with qemu 1.6 the regression of > 2 gb ram is solved but without 
this patch doesn't works at all.
Thanks for any reply and sorry for my bad english.

>>
>> ---
>>
>> It works with this simple initialization to NULL, but would it be
>> necessary (or better) to assign a proper value to this variables ?
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
>


