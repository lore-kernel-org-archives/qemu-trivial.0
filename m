Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iCPjb-0007Bz-9G
	for mharc-qemu-trivial@gnu.org; Mon, 23 Sep 2019 10:54:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42529)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iCPjX-00076v-PA
 for qemu-trivial@nongnu.org; Mon, 23 Sep 2019 10:54:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iCPjW-0003qn-LP
 for qemu-trivial@nongnu.org; Mon, 23 Sep 2019 10:54:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46710)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iCPjW-0003qQ-CW
 for qemu-trivial@nongnu.org; Mon, 23 Sep 2019 10:54:34 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7AE9761D25
 for <qemu-trivial@nongnu.org>; Mon, 23 Sep 2019 14:54:33 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id z8so4959521wrs.14
 for <qemu-trivial@nongnu.org>; Mon, 23 Sep 2019 07:54:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zP/jlV1v/3MhIk9YH7uyR0if4+SvbBKgh10XpUaUcqw=;
 b=l7JX4eHdcUOVTHMYyP5l+lfzoOC+o+FfuWqGF8sKyiIU5z5yIj2pm3ntYT7CYhl6ku
 tI//VdlEKqLgL88eIFq6mhlQBBlibLNe2WOyfzR0JbWdZCHmC4h9G6jfAEnDTtL4QwAY
 0S1BQnEVP7UmVahBX1lqtHimcgAeuZTvevZahkegkPDatbkNm1hR9cgTl7Xpx77N68jI
 iWezmadJUTi9ApUByo7kNaH0jHUuhq2PzakbXNTOqLUWdC99Nhnc16v+1I0JYs7+ctry
 lQjfjMsk07shJaBh2pTIayKwjhR5NHXSn5/Uzl6UtxZF+BXg8V+pwCdFdlgwDBj7Vva2
 a+hA==
X-Gm-Message-State: APjAAAXuk8FAcv3ZSeGiPAb2YOG1ZZ/+FF4/TV3A8ZRsa96usCEgDMRH
 2zimu+RDw6emIS7nnNCuloDlvjbWKa8C1/lCwneYfAS5l2gbsufMLET9j21+SoRs01nC3eVjJXN
 NoWCV2D1QGGn+sl7K6w==
X-Received: by 2002:adf:f78a:: with SMTP id q10mr21763720wrp.276.1569250472238; 
 Mon, 23 Sep 2019 07:54:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzJYBhinpCcpvtj/FGmej5hv+YchOC8OLDy6gVP3cELq0hJmgD/R+cGcWqWE+gkiTYupXQDUQ==
X-Received: by 2002:adf:f78a:: with SMTP id q10mr21763707wrp.276.1569250472071; 
 Mon, 23 Sep 2019 07:54:32 -0700 (PDT)
Received: from [192.168.1.115] (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id n2sm9808489wmc.1.2019.09.23.07.54.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2019 07:54:31 -0700 (PDT)
Subject: Re: [PATCH] hw/ptimer: Assert next_event is newer than last_event
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Dmitry Osipenko <digetx@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20190921101703.17935-1-philmd@redhat.com>
 <CAFEAcA8RfAPuV9LfL3c01KU+sCtAcWkHsLR7e-4QNJVcniq7Cg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <ec6ddb30-6ae4-a3fb-e97c-58758df65650@redhat.com>
Date: Mon, 23 Sep 2019 16:54:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8RfAPuV9LfL3c01KU+sCtAcWkHsLR7e-4QNJVcniq7Cg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Mon, 23 Sep 2019 14:54:37 -0000

On 9/23/19 4:40 PM, Peter Maydell wrote:
> On Sat, 21 Sep 2019 at 11:17, Philippe Mathieu-Daud=C3=A9 <philmd@redha=
t.com> wrote:
>>
>> If the period is too big, the 'delta * period' product result
>> might overflow, resulting in a negative number, then the
>> next_event ends before the last_event. This is buggy, as there
>> is no forward progress. Assert this can not happen.
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>>  hw/core/ptimer.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
>> index d58e2dfdb0..88085d4c81 100644
>> --- a/hw/core/ptimer.c
>> +++ b/hw/core/ptimer.c
>> @@ -125,6 +125,9 @@ static void ptimer_reload(ptimer_state *s, int del=
ta_adjust)
>>
>>      s->last_event =3D s->next_event;
>>      s->next_event =3D s->last_event + delta * period;
>> +    /* Verify forward progress */
>> +    g_assert(s->next_event > s->last_event);
>> +
>>      if (period_frac) {
>>          s->next_event +=3D ((int64_t)period_frac * delta) >> 32;
>>      }
>> --
>=20
> Can this only happen if a QEMU timer model using the ptimer
> code has a bug, or is it guest-triggerable for some of our
> timer models?

I hit this running a raspi4 guest, I had incorrectly initialized a clock
using the core cpu frequency, while I had to use the APB one (in my
case, core_cpu_freq / 2). The guest use a high value to configure a slow
timer, which in my buggy case made QEMU hang in hard way to debug.

So yes, it seems guest-triggerable if the implementation is broken.
Using assert() is OK for broken implementation, right?
Or should we audit all ptimer calls?

Regards,

Phil.

