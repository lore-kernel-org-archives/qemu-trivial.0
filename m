Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ce1ls-00053Z-Jj
	for mharc-qemu-trivial@gnu.org; Wed, 15 Feb 2017 10:45:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55927)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ipavlikevich@gmail.com>) id 1ce1lq-00053T-MH
	for qemu-trivial@nongnu.org; Wed, 15 Feb 2017 10:45:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ipavlikevich@gmail.com>) id 1ce1lp-0006OJ-BV
	for qemu-trivial@nongnu.org; Wed, 15 Feb 2017 10:45:30 -0500
Received: from mail-it0-x242.google.com ([2607:f8b0:4001:c0b::242]:33133)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ipavlikevich@gmail.com>)
	id 1ce1lp-0006Ni-7Y; Wed, 15 Feb 2017 10:45:29 -0500
Received: by mail-it0-x242.google.com with SMTP id e137so10157987itc.0;
	Wed, 15 Feb 2017 07:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EXpUpLC6uY1bebJKxycO0r5fTtNX8F8hKJNAkAcA2ro=;
	b=APzeappdWsE1uVvS7sLJ+hsRmPOm1s0RVjv1F4APm/5CF8XuXmfnQjfMBdF+iGZfZM
	KCzpw2hXWdOWJPyniP9sk7+EPnRX848ucsI8l87jOOBLIm9zhndub4FCvfGSlfof6mG+
	TfR4Noqmo7fFz9jmboKVOvPYzjDnnoiLodDr7IG3rlOhv4J0KGgYdm8/OLeHmVVkeFmV
	ADnLoWFH4AhJcDzQyycsvznGQGR/OiSsIaVTNaJDqTJnx3+fnJfZuFE2eQNzTq2gz96a
	euXfczAi0bE3qLqwDo4gyc3ktLVCCuKc+sNkGtjq1cjrVEAgTaYICSXGTBzd6FuHgpEl
	IbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EXpUpLC6uY1bebJKxycO0r5fTtNX8F8hKJNAkAcA2ro=;
	b=Kci0lW/L2a9iuId53viN2I2jhaNBFlPim7amtpqXfWJgnLdEUslAVGL2TvE7dmifm8
	XxpC4wh+f0WHRPg0x32vvN3BG1SxpEY2bKFSWZjD6bnVdJtoC1u3ne4OYwxxtPZuudU0
	EYnprfv2ognq/rMIMCpcaU9fwSKkXJ5+05S72TBUIxbUfP39ftnbNjmayugeBDwt9qWz
	1Jp2fRRQ4xPEcNTn5s5t3qIEhY5pD98vP6ByO/XgndKOzz8CtSMQkRMBEcbLie+M9eJu
	6ZeltlOK6jUctHGyAfBeY9W/18wpex73IIrSaLoUPiGAhwbXof9Kc4s2uR4KIm+Hbhzi
	y4hA==
X-Gm-Message-State: AMke39kjw5lvf2HdppMZGf9JKfwBQZYyP87S6BauSLAQTQ9yoB9Som8z59zeGj6QSSuxBok2M9kJyLr8JKej2Q==
X-Received: by 10.36.47.78 with SMTP id j75mr1004184itj.105.1487173527015;
	Wed, 15 Feb 2017 07:45:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.128.198 with HTTP; Wed, 15 Feb 2017 07:45:26 -0800 (PST)
In-Reply-To: <97012317-0db8-a272-1802-7a402ebe78a5@msgid.tls.msk.ru>
References: <CA+O_+ExjKRNyfbXWzh7RRHgTjqTBC+WscYCiBGyjLK2XOvoPmQ@mail.gmail.com>
	<97012317-0db8-a272-1802-7a402ebe78a5@msgid.tls.msk.ru>
From: Igor Pavlikevich <ipavlikevich@gmail.com>
Date: Wed, 15 Feb 2017 18:45:26 +0300
Message-ID: <CA+O_+Ex6E291g0BKLWox+x8g16j2ij4KYJ9PwiwrH7Qx4J-Epw@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c0b::242
Subject: Re: [Qemu-trivial] [PATCH] hw/acpi/tco.c: fix tco timer stop
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
X-List-Received-Date: Wed, 15 Feb 2017 15:45:32 -0000

On Wed, Feb 15, 2017 at 1:34 PM, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 06.02.2017 17:44, Igor Pavlikevich wrote:
>> TCO timer does not actually stop
>>
>> Signed-off-by: Igor Pavlikevich <ipavlikevich@gmail.com>
>> ---
>>  hw/acpi/tco.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/acpi/tco.c b/hw/acpi/tco.c
>> index 8ce7daf..b4adac8 100644
>> --- a/hw/acpi/tco.c
>> +++ b/hw/acpi/tco.c
>> @@ -49,6 +49,7 @@ static inline void tco_timer_reload(TCOIORegs *tr)
>>  static inline void tco_timer_stop(TCOIORegs *tr)
>>  {
>>      tr->expire_time = -1;
>> +    timer_del(tr->tco_timer);
>>  }
>>
>>  static void tco_timer_expired(void *opaque)
>>
>
> I'm not sure this is really trivial change.
> Can you elaborate a bit please?

When linux guest goes to first reboot, it calls
watchdog_open()->watchdog_start()->iTCO_wdt_start() and write 0 to
TCO1_CNT.
After that can_start_tco_timer() returns true, starts timer in
tco_timer_reload() and guest kernel starts flooding
[  590.392055] Uhhuh. NMI received for unknown reason 30 on CPU 0.
[  590.392055] Do you have a strange power saving mode enabled?
[  590.392055] Dazed and confused, but trying to continue
[  620.392035] Uhhuh. NMI received for unknown reason 20 on CPU 0.
[  620.392035] Do you have a strange power saving mode enabled?
[  620.392035] Dazed and confused, but trying to continue

Timer keeps reloading after ich9_generate_nmi() so there is only one
way to stop reloading by clearing ICH9_CC_GCS_NO_REBOOT and reset
guest via  watchdog_perform_action(), becasue tco_timer_stop() does
not actually modify tr->tco_timer.

Tested on Debian wheezy/jessie guests with default kernels and qemu
2.5+ q35 machine.

>
> And please Cc qemu-devel@ too (doing this now).
>
> Thanks,
>
> /mjt

