Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNgVm-0002x4-KL
	for mharc-qemu-trivial@gnu.org; Tue, 29 May 2018 11:26:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54188)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fNgVl-0002vq-0E
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 11:26:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fNgVj-0000rE-Px
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 11:26:08 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:36655)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fNgVj-0000qJ-Lf
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 11:26:07 -0400
Received: by mail-oi0-x241.google.com with SMTP id 14-v6so5389057oie.3
	for <qemu-trivial@nongnu.org>; Tue, 29 May 2018 08:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8SuNcFVmr14upjjK9GZeI75FhSPUBQuX/9N92AWu2N4=;
	b=NpW77xrnP01ZZpHaXzvuKP8d+eiFv//HatIFk1M/rG4EyRii877qALujfQC4ag9+iF
	84E0r/k8fdrx1mK1cJVf/odSjfH/X04WQliboJSvZcyYs768ZKg9cOkrHGI3JVvi+Sqh
	GYwB2T4MRA2l4herlvc/nfFR1v7ypzykT6xrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8SuNcFVmr14upjjK9GZeI75FhSPUBQuX/9N92AWu2N4=;
	b=RNsfEeFwxsesz8DbunomR9luEutN5D8C8y1yTNz0c4fYap41iKMPIETEH4FBxBbQRr
	ikpwjP45/STG0cWhJudbf9SC0FN6JQyy3cs77pgaUN4fm0uC2qkJODpMKC7iCUX0nygd
	JQRyzXqfABuu6eS+r7Arv9R4ioC2YQb6PaBgppP4Z9VfbUILU09FeQEJ2GJLH/MSrT90
	Lt+fMRJjz9y/Z54U4oaUeBz/CQz3W985GrcFPYmV8gTHniCTbesHg0UJdg8ea4nUWW9H
	XVjqZj7WFX3zXvy7uS0pADAtO6eFlZgMeelhLNux7hxkZ8PNACuvzms0xpksb1eFp1Cx
	ux0w==
X-Gm-Message-State: ALKqPwdk+fkuvM3Dzb0onPaGPyxHESfH9Ky1BalHixecxY/dZIPNmNAL
	YGkoVW6V1GFQC58pH4SYibf8VyKEiUMc1uRh0k5E6w==
X-Google-Smtp-Source: ADUXVKJcNWWeuptETJire/duIxfCnK/Rg9uQmTlTzcwWR454FV7yWLz/uzdJUoF1P6dLgkkuQSPgR9vrhvRuwk8ZQjc=
X-Received: by 2002:aca:bec6:: with SMTP id
	o189-v6mr9125735oif.337.1527607567015; 
	Tue, 29 May 2018 08:26:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Tue, 29 May 2018 08:25:46
	-0700 (PDT)
In-Reply-To: <4f0eec20-64a6-fb8f-58ae-1fab9ef34f53@redhat.com>
References: <20180426140253.3918-1-peter.maydell@linaro.org>
	<4f0eec20-64a6-fb8f-58ae-1fab9ef34f53@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 May 2018 16:25:46 +0100
Message-ID: <CAFEAcA86RRfz-YQivsPDRqAbZqOtdNpRnnBeKC24B5yYzY1=zg@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vl.c: Don't zero-initialize
 statics for serial_hds
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
X-List-Received-Date: Tue, 29 May 2018 15:26:10 -0000

Ping for application via qemu-trivial?

thanks
-- PMM

On 26 April 2018 at 15:19, Thomas Huth <thuth@redhat.com> wrote:
> On 26.04.2018 16:02, Peter Maydell wrote:
>> checkpatch reminds us that statics shouldn't be zero-initialized:
>>
>> ERROR: do not initialise statics to 0 or NULL
>> #35: FILE: vl.c:157:
>> +static int num_serial_hds = 0;
>>
>> ERROR: do not initialise statics to 0 or NULL
>> #36: FILE: vl.c:158:
>> +static Chardev **serial_hds = NULL;
>>
>> I forgot to fix this in 6af2692e86f9fdfb3d; do so now.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> I wouldn't bother with this except that I forgot to fold
>> it in when applying the serial-limits patchset.
>>
>>  vl.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/vl.c b/vl.c
>> index 616956adf1..6d8b869dad 100644
>> --- a/vl.c
>> +++ b/vl.c
>> @@ -154,8 +154,8 @@ QEMUClockType rtc_clock;
>>  int vga_interface_type = VGA_NONE;
>>  static DisplayOptions dpy;
>>  int no_frame;
>> -static int num_serial_hds = 0;
>> -static Chardev **serial_hds = NULL;
>> +static int num_serial_hds;
>> +static Chardev **serial_hds;
>>  Chardev *parallel_hds[MAX_PARALLEL_PORTS];
>>  Chardev *virtcon_hds[MAX_VIRTIO_CONSOLES];
>>  Chardev *sclp_hds[MAX_SCLP_CONSOLES];
>>
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>

