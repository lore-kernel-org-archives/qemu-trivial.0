Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bHuAN-0005C2-Tz
	for mharc-qemu-trivial@gnu.org; Tue, 28 Jun 2016 10:39:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59451)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bHuAL-00058O-Jy
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 10:39:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bHuAG-0001fX-Lb
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 10:39:04 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:34372)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bHuAG-0001et-AA
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 10:39:00 -0400
Received: by mail-vk0-x22b.google.com with SMTP id c2so24755023vkg.1
	for <qemu-trivial@nongnu.org>; Tue, 28 Jun 2016 07:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Navuuv++IXKakutulrqheU0SZqFxp3di3RqM5yxyqX8=;
	b=WVPvg03t9vwjjg0uv4ctiaeOEiQxdwEqkrNFe/NkrFxLpPgEnYN+YT0OhLFfAhM+Dn
	wIMYMP89v+XQOUkPsEqkw4+2aydh0mJ26k5++ZPTzONcTwIvOhktGWl7kzInKj/ayMYk
	YlSg5YqlXqVBG+OTBsnvSxqi834Dc/0kJrhZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Navuuv++IXKakutulrqheU0SZqFxp3di3RqM5yxyqX8=;
	b=IAXX0+qIwfqznxyOjCsRxVGt3hGh0JcfSyPBAEZZjn+kmvcI2k3cQc7tnpSwrKXg9L
	IKW82tstyn78lRVpf1ZnmoSncj2jluXul9FgsYQS2nVirsn7QoHdzd06x2yOsljt9SQm
	p3KUZwFc6PEHZE7K9IAR1F2VyeJLIfla8oMMhRQAq9YHreaRDs6jgOuSO5N3HHl4CryT
	gmR1ykyQkm7FsRxhZTtuZf25ErFcTI0YTwZ0dZMjSkawI7svuZE+820ziuYFhKkCcuL7
	NThDgGokwJzDHbObN7xKQzsXKKf+e8Ow7rPchfoFHe0NcStzFMkTIWhRBerojHcpnnAo
	joBA==
X-Gm-Message-State: ALyK8tILezb3kcweGzG5Tw6YPxSNGkcQHDWA77ssbuXFQP9hQRTCQng6Ij2gVSjoPNnDxULGSJNcsJ04E87vc/Rt
X-Received: by 10.31.79.198 with SMTP id d189mr749126vkb.47.1467124739739;
	Tue, 28 Jun 2016 07:38:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Tue, 28 Jun 2016 07:38:40 -0700 (PDT)
In-Reply-To: <20160613065522.GA7847@aurel32.net>
References: <1465575021-3774-1-git-send-email-peter.maydell@linaro.org>
	<20160613065522.GA7847@aurel32.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jun 2016 15:38:40 +0100
Message-ID: <CAFEAcA9owUg0zB7Vi3OW=kzjsZwD=B3-4rH1WZT1SFxgQ6TczA@mail.gmail.com>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Patch Tracking <patches@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Subject: Re: [Qemu-trivial] [PATCH] hw/sh4/sh_pci.c: Use ldl_le_p() and
 stl_le_p()
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
X-List-Received-Date: Tue, 28 Jun 2016 14:39:06 -0000

On 13 June 2016 at 07:55, Aurelien Jarno <aurelien@aurel32.net> wrote:
> On 2016-06-10 17:10, Peter Maydell wrote:
>> Use ldl_le_p() and stl_le_p() instead of le32_to_cpup() and
>> cpu_to_le32w(); the former handle misaligned addresses and don't
>> need casts, and the latter are deprecated.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  hw/sh4/sh_pci.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/sh4/sh_pci.c b/hw/sh4/sh_pci.c
>> index e820a32..1747628 100644
>> --- a/hw/sh4/sh_pci.c
>> +++ b/hw/sh4/sh_pci.c
>> @@ -55,7 +55,7 @@ static void sh_pci_reg_write (void *p, hwaddr addr, uint64_t val,
>>
>>      switch(addr) {
>>      case 0 ... 0xfc:
>> -        cpu_to_le32w((uint32_t*)(pcic->dev->config + addr), val);
>> +        stl_le_p(pcic->dev->config + addr, val);
>>          break;
>>      case 0x1c0:
>>          pcic->par = val;
>> @@ -85,7 +85,7 @@ static uint64_t sh_pci_reg_read (void *p, hwaddr addr,
>>
>>      switch(addr) {
>>      case 0 ... 0xfc:
>> -        return le32_to_cpup((uint32_t*)(pcic->dev->config + addr));
>> +        return ldl_le_p(pcic->dev->config + addr);
>>      case 0x1c0:
>>          return pcic->par;
>>      case 0x1c4:
>
> Thanks for the patch. I confirm it builds and works fine.
>
> Acked-by: Aurelien Jarno <aurelien@aurel32.net>

Applied to master, thanks.

-- PMM

