Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5BADCD4F50
	for <qemu-trivial@archiver.kernel.org>; Mon, 18 May 2026 16:30:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wP0rG-00017c-A1; Mon, 18 May 2026 12:30:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wP0rE-00017A-Un
 for qemu-trivial@nongnu.org; Mon, 18 May 2026 12:30:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wP0rD-0001cI-9Q
 for qemu-trivial@nongnu.org; Mon, 18 May 2026 12:30:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779121818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=EkvGzwI+6QgqsDc/f/iWKDak2124pSFbHpxQvHPbUlE=;
 b=SP2B8TJIQr17SWIEwG+LzRcfzpa0Ryoz1+hzHuWmf0zNuNfDke5clDls1nDxuwrNNGw5H5
 +KwhhelE0I7ac3a2eIGmDAupqnc6xieuShon/ATLMgPfJFfOWadyIw/so/4Y6+j+Jfo0PT
 SMHdBEulz+jG/1d3ADiW4WyHw7d0Ux8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-6LVWzPH8PpKpaArkNUWx3g-1; Mon, 18 May 2026 12:30:14 -0400
X-MC-Unique: 6LVWzPH8PpKpaArkNUWx3g-1
X-Mimecast-MFC-AGG-ID: 6LVWzPH8PpKpaArkNUWx3g_1779121813
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-4411a36715dso1638159f8f.2
 for <qemu-trivial@nongnu.org>; Mon, 18 May 2026 09:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779121813; x=1779726613;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EkvGzwI+6QgqsDc/f/iWKDak2124pSFbHpxQvHPbUlE=;
 b=fhmYQqLezX0ZbjpbUIVTBhsP7ANONQV3CURINDouC7cinx/XjZWx7tPEUpm5rjkqn8
 Qa9TB6lqHdQsGnCaDzYdCp4KoGxI3Z38I9RFtwPetwKRNKx4OsbRQ5RPg8nZ3aRDD+mb
 6RK6NUO6jGrwNQ9ON7wP26HilhDK4o5uTniUX134N4JvJfQ7HHtretWLyGGJPrKm2SCJ
 2HJXOty8ubrMydVR+M3q7pHa6K3tCHr/zj7xgQZUirKkLIOMwrMBaPUtKOv0dNvzqBJH
 bGYuCh0a332L72gyT5iEB51l1gk4cFnBsTvc2s9E+dpRyPRz0BdlyJLoIx5ZQDBDsv+R
 ixsw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Z/UpnRgmzTNtkaZ8vGmguf7rmlxrGrkOWwVpImeu7oGE+LADmUXvRvYk3QyemFXcEBC5JcxzIsacUdIQ=@nongnu.org
X-Gm-Message-State: AOJu0Ywig6Q510dFvdjt46LdWMu9/QUHJwMPc36SLq4ah+2nXsSSvR51
 1MQ5boDxiGeSOXxexxuH7nq+bBpKPhBaeLLB2UH74Z6kmXKoPY59XX1m4h7Hx+0D/wuHMx/vcly
 3c8qAy3Au7uNoQf1f6jzUROZymwhGQriblEB3ugjXsDE4A4lAeDbHwsptNU4=
X-Gm-Gg: Acq92OE3tcuRpQO0/FPOgSdx8HYQSW0dPgdS0iDehAxRVA/CPrIowK9jiuk/ccwmpLb
 gr8sEIs78lTf1qOzJP7JuxqWgARvsSDCWIP1fNb/KxYVpHhTbJud7jSs5Og51r/D6v94PbAeinl
 kSZt3LXmGJL/6N/bvE0/JQ15S0KSZ763wfXtA4beoCF+yhssGcBuvOdz2dvpAaitjWYl4CdNotK
 P8mNZVq5QQBmpnHlGwamY3LIV5N2sdljmHajqJtefyRmTqwWPqdo8CTGSnHDdn/dxGoev555xf/
 DziUPQ9FWexzOpIJ4gMqhDGHcurv/jamlVZtXfU+kQt2L6lUjyE9epCLRiKtbAKqMq31GWiTO8W
 EpdXYJM5HJALhYkpGQg==
X-Received: by 2002:a05:6000:24c6:b0:45d:b14b:23f0 with SMTP id
 ffacd0b85a97d-45e5c36754dmr24062663f8f.15.1779121813010; 
 Mon, 18 May 2026 09:30:13 -0700 (PDT)
X-Received: by 2002:a05:6000:24c6:b0:45d:b14b:23f0 with SMTP id
 ffacd0b85a97d-45e5c36754dmr24062606f8f.15.1779121812553; 
 Mon, 18 May 2026 09:30:12 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.114.83]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da15a5653sm38979616f8f.35.2026.05.18.09.30.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2026 09:30:12 -0700 (PDT)
Message-ID: <d0e57863-da5f-417d-8790-00749904524f@redhat.com>
Date: Mon, 18 May 2026 18:30:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] system/rtc: Fix a possible year-2038 integer overflow
 problem
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20260518160255.1844308-1-thuth@redhat.com>
 <ags5_IDkvxClCdHm@redhat.com> <ags7xIsUG2DqX5vu@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <ags7xIsUG2DqX5vu@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: stHsVH8aM2u35_ifw8r_7_JCzHKwUeRnnme-X4awTrg_1779121813
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On 18/05/2026 18.18, Daniel P. Berrangé wrote:
> On Mon, May 18, 2026 at 05:10:36PM +0100, Daniel P. Berrangé wrote:
>> On Mon, May 18, 2026 at 06:02:55PM +0200, Thomas Huth wrote:
>>> From: Thomas Huth <thuth@redhat.com>
>>>
>>> rtc_realtime_clock_offset is initialized with:
>>>
>>>    rtc_realtime_clock_offset = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) / 1000;
>>>
>>> And QEMU_CLOCK_REALTIME might be based on gettimeofday() in certain
>>> cases (see get_clock_realtime() in include/qemu/timer.h). So this
>>> counter will exceed 32 bits in the year 2038, thus we should not
>>> store this value in a normal integer variable. Change it to an int64_t
>>> to fix the problem.
>>> And while we're at it, also adjust the nearby rtc_host_datetime_offset
>>> variable to be on the safe side in the related code.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   system/rtc.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> Actually on second reading I think this patch is not quite right.
> The code which uses the value is:
> 
>      time_t value = qemu_clock_get_ms(clock) / 1000;
>      switch (clock) {
>      case QEMU_CLOCK_REALTIME:
>          value -= rtc_realtime_clock_offset;
> 
> 
> On 64-bit platforms 'int' was 64-bit already and so was time_t so we
> have no bug to fix.

Uh, did you mix this up with "long" ?

> On 32-bit platforms the patch fixes 'int' to 'int64' which is fine
> but that int64 value is then subtracted from time_t which is usually
> going to be 32-bit again, unless the OS was built with 64-bit time_t
> on 32-bit which almost no one does.
> 
> IOW we only platform this fixes is 32-bit OS with 64-bit time_t.
> 
> We can't do any better than that as the caller code paths need a
> time_t to pass into gmtime/localtime.
> 
> So IMHO we should just declare it as time_t.

Fine for me, too. I'll send a v2...

  Thomas


