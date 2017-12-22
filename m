Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eSUPh-0001hh-GN
	for mharc-qemu-trivial@gnu.org; Fri, 22 Dec 2017 15:59:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43968)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eSUPe-0001hB-Hf
	for qemu-trivial@nongnu.org; Fri, 22 Dec 2017 15:59:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eSUPd-0004jV-NK
	for qemu-trivial@nongnu.org; Fri, 22 Dec 2017 15:59:26 -0500
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:40280)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eSUPd-0004in-Ci; Fri, 22 Dec 2017 15:59:25 -0500
Received: by mail-wm0-x243.google.com with SMTP id f206so23673560wmf.5;
	Fri, 22 Dec 2017 12:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=zJUcQGs+ruiMXsOhPkuDcKbnvEKK5r82yTZYIHGE1Yw=;
	b=VpMilG7CLsRsZglWV3FEgNaBjEz+eq7uEQoNT2muK/tsOVbQiwGHVtOx31yC/NHhxI
	h+mA882LtgUvMExSK0Ac8CgK4YUYokyoW4gXVOAGWWdbmYzeC9Y7A9Ttf6/rpbL1EP78
	68DuI0Rpn5MgN7BGgOohppFr8/XYn9/XDj3uIBZwxztCP23crUaTdd3mZUBuuKtjRara
	Xews0TqxTPBozsv6uwKE+9cYt+lGqUVDTESQpOGP0bf7gLSmy9mG387TGVyL4GkbICPJ
	eCfdsL2OZdamYDEmwqXwe4KXJj4nuz2MYqxcqvX6n1TtOQaWavIwPJg66BRdY6A9Wzq5
	Ih+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=zJUcQGs+ruiMXsOhPkuDcKbnvEKK5r82yTZYIHGE1Yw=;
	b=thNx4DtX+I4kF1fYF+S1UQqPGrqefFgvEKOCkcUFBlTGTjZdJIl/UtrOMB8NMcLFn4
	ZdU2CYlMaKacFeDTbhNo4bInfsUSRMKBSZqmZQ0CzSctv5qkGpPuv8DDyqowqTDdnWkn
	BUHpV+uIO8mh/pkJHAXEXJsyAIknfv6SW6EXOZQErYX64e/JcakLw5zEtnx8v70Pcxpw
	X1BPqMDLPU/O3agznMewl9vfMUY6F4E4C4MSpPbEd8yaJ1s0RiJEcA8KKZbxHa3CZb/p
	V5nIm8kDBRQst9bSfgdhz0AFF/pZpyrwYmjUbCQSZsmVx6GwS8z8lU+h6unYAx+DBIMT
	Hsjg==
X-Gm-Message-State: AKGB3mLXbqIHh90sAA4cE8YTRqJmUpyMrubBlEPW1m7LIRlGWX/WD+dw
	DA6KA7qEHBwR77hlidugt38zuui7WB85XMGSI8w=
X-Google-Smtp-Source: ACJfBotTynt7KR/uGxITGktWaSnm8csW2UJdHv39AIRaI/o5PQCBefWUVLRTwweyZonb2GNMGwe+3KTdXm6HWVZzBxM=
X-Received: by 10.28.152.85 with SMTP id a82mr5288253wme.16.1513976364077;
	Fri, 22 Dec 2017 12:59:24 -0800 (PST)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.28.164.69 with HTTP; Fri, 22 Dec 2017 12:58:53 -0800 (PST)
In-Reply-To: <87a7yah5ea.fsf@dusky.pond.sub.org>
References: <cover.1513790494.git.alistair.francis@xilinx.com>
	<6bad4084f4cbc290e2e9f1a72fcfcda7223383ec.1513790495.git.alistair.francis@xilinx.com>
	<87lghulqno.fsf@dusky.pond.sub.org>
	<1cfb1217-e32d-8e91-da46-07f1c72be77f@redhat.com>
	<CAKmqyKPyL8B5ZjEUePkqVbzP8kVmM48vWML41PRXVVO7LVmMpg@mail.gmail.com>
	<87a7yah5ea.fsf@dusky.pond.sub.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 22 Dec 2017 12:58:53 -0800
X-Google-Sender-Auth: Ynerlr-hRCktSNHZPb-Z-vF_tPc
Message-ID: <CAKmqyKO5sKdiZJ65teDxa16PCE71WCLay7cOAQJQdyS-EVNOJg@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Alistair Francis <alistair.francis@xilinx.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v6 04/29] hw/arm: Replace
 fprintf(stderr, "*\n" with error_report()
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
X-List-Received-Date: Fri, 22 Dec 2017 20:59:27 -0000

On Fri, Dec 22, 2017 at 12:30 PM, Markus Armbruster <armbru@redhat.com> wrote:
> Alistair Francis <alistair.francis@xilinx.com> writes:
>
>> On Fri, Dec 22, 2017 at 9:17 AM, Thomas Huth <thuth@redhat.com> wrote:
>>> On 22.12.2017 16:37, Markus Armbruster wrote:
>>>> Second thoughts...
>>>>
>>>> Alistair Francis <alistair.francis@xilinx.com> writes:
>>> [...]
>>>>>  #include "qemu/osdep.h"
>>>>> +#include "qemu/error-report.h"
>>>>>  #include "qapi/error.h"
>>>>>  #include "qemu-common.h"
>>>>>  #include "cpu.h"
>>>>> @@ -1311,8 +1312,8 @@ static void omap_prcm_apll_update(struct omap_prcm_s *s)
>>>>>      /* TODO: update clocks */
>>>>>
>>>>>      if (mode[0] == 1 || mode[0] == 2 || mode[1] == 1 || mode[1] == 2)
>>>>> -        fprintf(stderr, "%s: bad EN_54M_PLL or bad EN_96M_PLL\n",
>>>>> -                        __func__);
>>>>> +        error_report("%s: bad EN_54M_PLL or bad EN_96M_PLL",
>>>>> +                     __func__);
>>>>>  }
>>>>
>>>> This one's different: we neither exit() nor return a "failed" status to
>>>> the caller.
>>>>
>>>> We get here when the guest writes something funny to a certain
>>>> memory-mapped I/O register.  In other words, it's guest misbehavior, not
>>>> a user error.  I doubt it should be reported with error_report().
>>>> Peter, do we have a canonical way to report or log  guest misbehavior?
>>>
>>> qemu_log_mask(LOG_GUEST_ERROR, ...) ?
>>
>> That seems like the best option to me.
>
> Suggest:
>
> 1. Keep converting fatal errors (the ones that exit())
>
> 2. Keep converting recoverable errors (the ones that return failure)
>
> 3. You can leave the prints that are neither alone.  You can also
>    convert to logging or tracing, as appropriate, but that requires
>    understanding the code.
>
> Makes sense?

Does this apply to new patches after this series or to this series as
well? The series is mostly just mechanical find/replace. I really
don't want to have to dig through every patch to figure out what to
change/not change.

Alistair

>

