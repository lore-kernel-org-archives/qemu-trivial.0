Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9xsG-0007AS-6v
	for mharc-qemu-trivial@gnu.org; Thu, 05 Mar 2020 16:17:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40297)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j9wlH-0001cd-Kz
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 15:06:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j9wlG-0000RD-LV
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 15:06:27 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:32931)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j9wlG-0000Qt-Fd
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 15:06:26 -0500
Received: by mail-pl1-x641.google.com with SMTP id ay11so3107814plb.0
 for <qemu-trivial@nongnu.org>; Thu, 05 Mar 2020 12:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=aK2JQAB7Q1gn7fdcHul4fN6uds+oVK0UvAfAjO2mZ9Q=;
 b=nkLciiEOFdnmJr4oaNmteD5JKyspPP2UPNugBq1tAic4ve8l5Go3WA297cbIfocXnq
 BMxP9DE+LMWiv5M0NoYtrF2ixRGqcVgpxowEdPeRYaakQIejO/tLvLl2PtMSjTFqmXhI
 tP/cnCetytZdexpXIQtUB7w6Q/t3X4ZE20Sb/BbZ9Au603Z8ZtV8N0iUJvnOgQsIL75G
 psKuKZurxHD7A6TXquL8Z2Q+dXVAjHtL/D976QhA6+cyvwJnuq+nvFDq63WvuA9xFEUe
 uILwGjbduMG1YXCNqMuw9zN27eNRkO3ZJehju+jkVFs/Mjh3pH+D/4Gu1RJmvDosub2H
 ziog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=aK2JQAB7Q1gn7fdcHul4fN6uds+oVK0UvAfAjO2mZ9Q=;
 b=IGG+HgQG2WL3EuwTa3ORa13ow2BdBA+k7sdFcsTAHoigfQtE/wUun85v4Itotoid6e
 DFJDL55tbzF45vJdzVedfsaIC0NfCsd9E9qZm5F2Xg6KcxNbGbFOdiuOXgtp4D+NTDMF
 gaKd5IrKLcSzmDX35EA9NPx2aEH/TKMIyPkkK/QFm2t28PPbyEQsr4SO2EE3W/VCuHWv
 rO/dt9RwSdaR/pwNu6hhPyZKO+6YwRwrzg0kZ1Wpct5/W7VPcnrSw1D4hH2PH21Yna9h
 s5/eTizEm49nHjl5l9YS2g2CdHi/VwZ3VzKN7xxkudF4LfFnedYkxnoW2LZyfB6iwZTL
 o1mg==
X-Gm-Message-State: ANhLgQ3rUspSz3IWtwICn93/1gD3LTfKOpkblF9Zte1011G7yTFmchPX
 Ih31tH3FIKDtTzNT1PIrjfrpIQ==
X-Google-Smtp-Source: ADFU+vsOxdipjlXH6tWhcB8BNh2LE6l/eUDwDH4lZXskAUlEvO2bwAXVEzAT0oFf5hTuNGjRjmEtWg==
X-Received: by 2002:a17:90a:22cd:: with SMTP id
 s71mr299051pjc.181.1583438785358; 
 Thu, 05 Mar 2020 12:06:25 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id r13sm6969216pjp.14.2020.03.05.12.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 12:06:24 -0800 (PST)
Date: Thu, 05 Mar 2020 12:06:24 -0800 (PST)
X-Google-Original-Date: Thu, 05 Mar 2020 12:06:22 PST (-0800)
Subject: Re: [PATCH] RISC-V: Add a missing "," in riscv_excp_names
In-Reply-To: <CAP+75-XPHkSkcOmLct=jerOPx_WmYTc6a-=f2LfvtFku_p1WBw@mail.gmail.com>
CC: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: philmd@redhat.com
Message-ID: <mhng-9606b2d7-09a7-4598-81ad-120a74a40e68@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
X-Mailman-Approved-At: Thu, 05 Mar 2020 16:17:42 -0500
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Mar 2020 20:06:28 -0000

On Thu, 05 Mar 2020 09:20:31 PST (-0800), philmd@redhat.com wrote:
> Cc'ing qemu-trivial@ in case there is a pending PR in  progress, it
> might get merged quicker.
>
> On Thu, Mar 5, 2020 at 6:19 PM Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> On 3/5/20 5:48 PM, Palmer Dabbelt wrote:
>> > THis would almost certainly cause the exception names to be reported
>> > incorrectly.  Covarity found the issue (CID 1420223).  As per Peter's
>>
>> "This", "Coverity" typos.
>>
>> Fixes: ab67a1d07a4
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Thanks.  I guess I'll just send the PR, as there's really no reason to block
this on the other RISC-V stuff.  It'll just be a single patch PR, so if the
patch goes in some other way then it should be easy to drop.  I usually don't
like rushing these sorts of things, but this one seems pretty safe.

>>
>> > suggestion, I've also added a comma at the end of the list to avoid the issue
>> > reappearing in the future.
>> >
>> > Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
>> > ---
>> >   target/riscv/cpu.c | 4 ++--
>> >   1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> > index c47d10b739..c0b7023100 100644
>> > --- a/target/riscv/cpu.c
>> > +++ b/target/riscv/cpu.c
>> > @@ -66,7 +66,7 @@ const char * const riscv_excp_names[] = {
>> >       "exec_page_fault",
>> >       "load_page_fault",
>> >       "reserved",
>> > -    "store_page_fault"
>> > +    "store_page_fault",
>> >       "reserved",
>> >       "reserved",
>> >       "reserved",
>> > @@ -74,7 +74,7 @@ const char * const riscv_excp_names[] = {
>> >       "guest_exec_page_fault",
>> >       "guest_load_page_fault",
>> >       "reserved",
>> > -    "guest_store_page_fault"
>> > +    "guest_store_page_fault",
>> >   };
>> >
>> >   const char * const riscv_intr_names[] = {
>> >

