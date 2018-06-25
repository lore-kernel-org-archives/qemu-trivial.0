Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQyp-00008N-OG
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:52:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57238)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQyl-0008WU-90
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:52:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQyk-0002fh-AQ
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:52:23 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:38728)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQyc-0002ds-Iy; Mon, 25 Jun 2018 08:52:14 -0400
Received: by mail-qk0-x244.google.com with SMTP id y4-v6so7381453qka.5;
	Mon, 25 Jun 2018 05:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+8CSZUYeCXcw1B8w4xUpTJo22rtL9bOkMP2z5pbZtI8=;
	b=SEma1cNvwoIpiVfmMzPm65aId82pj4vCJZQARzAxHqoE2Uv6s+b+QoCn8TDo3Bazpz
	eZlajNUqcDj92Ndo8ndyFvWEZqtuBb4msOI1EqGDlaoKGCJ2hddJJOxhhWY8Iy+SF4WS
	0Oy/w/r+dqeuf1QJMU7j/74+SW7Vhb773/xOlN6cioBp6RpMjjRWCKwTY9sGn2VkgrRm
	NASHt1wCKhZwcR5Rh9c0ToLeDBS2FxFpiHDAXus7G/sVzJr4a+AHiqO101HZsCJ5v7zp
	PtEI8P2Q6pSyKl8nUaTuJ9CjA13Ug87/CJ7iChBxtIlCzVVYJyNspByZ16YwlkPUQZpa
	WKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=+8CSZUYeCXcw1B8w4xUpTJo22rtL9bOkMP2z5pbZtI8=;
	b=HRqcP7LjnfMb88rV7EI+lg7LbhhGFo1p0s/R1tm86KsA2En62orYhRBUD3nFhX52zn
	io02/RgFFtsk26bJTYgralCl0lf7bfPtbUtQ/dmDioQbJ/i9uy0ZcV9+4Qr1ENj6wJDg
	vRIrjHIWLNenXTuQqdWfsJmNvWOrZdhFAEzq4/48Yll74y67hKNJ7GKTeePoCx8sVDzb
	OM4D3wXx2TLfehdLiWzn0uCcISFsrKDND5j3d77gSxh8wQ81iOH5NJQGGZUuMUO9jE9d
	JTcC2k+dtUh4ljnQIZU5FahwxLwhCnzutn0S5STdCdRk3yqmL8G9zkPdfiMqb7S0FAyQ
	jjnw==
X-Gm-Message-State: APt69E0MN35Q/q8hf//FMgU9r6vQ5PyYrVUqQL6ie/KpRx+/RTVfBIBq
	FwsQrjMwLzIaVliBj110pZephy1nmQM=
X-Google-Smtp-Source: ADUXVKJ0fZvyS4KYF1vyG/laDnivvbUqkU+LfwpISNjT2vOd6clWDBrvDZnHMugEuEcZOPDf4zorMw==
X-Received: by 2002:a37:8fc3:: with SMTP id
	r186-v6mr10467566qkd.27.1529931133839; 
	Mon, 25 Jun 2018 05:52:13 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	f9-v6sm9254645qkb.43.2018.06.25.05.52.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:52:13 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, qemu-arm@nongnu.org
References: <20180622134036.23182-1-f4bug@amsat.org>
	<20180622134036.23182-8-f4bug@amsat.org>
	<e98bac2c-ce0b-e226-3d96-004e46478f2f@redhat.com>
	<8256c2d4-722c-299f-e8e3-42c1a7f68e1d@amsat.org>
	<0bf443e6-fd49-9aaf-43fb-f171edf5fd38@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <57e04a05-442c-bd4a-2daa-1b690540c061@amsat.org>
Date: Mon, 25 Jun 2018 09:52:10 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <0bf443e6-fd49-9aaf-43fb-f171edf5fd38@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-trivial] [PATCH v2 07/14] hw/i2c/omap_i2c: Use
 qemu_log_mask(UNIMP) instead of fprintf
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
X-List-Received-Date: Mon, 25 Jun 2018 12:52:26 -0000

On 06/25/2018 03:08 AM, Thomas Huth wrote:
> On 22.06.2018 22:10, Philippe Mathieu-Daudé wrote:
>> On 06/22/2018 04:38 PM, Thomas Huth wrote:
>>> On 22.06.2018 15:40, Philippe Mathieu-Daudé wrote:
>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>> ---
>>>>  hw/i2c/omap_i2c.c | 20 ++++++++++++--------
>>>>  1 file changed, 12 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/hw/i2c/omap_i2c.c b/hw/i2c/omap_i2c.c
>>>> index 26e3e5ebf6..690876e43e 100644
>>>> --- a/hw/i2c/omap_i2c.c
>>>> +++ b/hw/i2c/omap_i2c.c
>>>> @@ -17,6 +17,7 @@
>>>>   * with this program; if not, see <http://www.gnu.org/licenses/>.
>>>>   */
>>>>  #include "qemu/osdep.h"
>>>> +#include "qemu/log.h"
>>>>  #include "hw/hw.h"
>>>>  #include "hw/i2c/i2c.h"
>>>>  #include "hw/arm/omap.h"
>>>> @@ -339,14 +340,15 @@ static void omap_i2c_write(void *opaque, hwaddr addr,
>>>>              }
>>>>              break;
>>>>          }
>>>> -        if ((value & (1 << 15)) && !(value & (1 << 10))) {	/* MST */
>>>> -            fprintf(stderr, "%s: I^2C slave mode not supported\n",
>>>> -                            __func__);
>>>> +        if ((value & (1 << 15)) && !(value & (1 << 10))) { /* MST */
>>>
>>> Please keep the white spaces before the comment if you don't change
>>> anything else.
>>
>> This is a <tab> and checkpatch complains...
>>
>> I can use 4 spaces for this tab. I tried to align with other tab-aligned
>> comments I didn't modify, but the result is messier. Thus a simple space.
> 
> Oh, sorry, I didn't notice that you've replaced a TAB here. I guess it's
> ok then. But why does checkpatch complain if it is just in the context
> of your modification? That's weird.

The first 2 contexts (MST and XA) are fine, however checkpatch complains
with the last one (ST_EN):

ERROR: code indent should never use tabs
#38: FILE: hw/i2c/omap_i2c.c:397:
+        if (value & (1 << 15)) {^I^I^I^I^I/* ST_EN */$

Since I replaced this one, I also did with the 2 previous.

Now I realize I can _not_ add the brackets so I don't have to update the
<tabs>:

         if (value & (1 << 15))^I^I^I^I^I/* ST_EN */
-            fprintf(stderr, "%s: System Test not supported\n", __func__);
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: System Test not supported\n", __func__);
         break;

I think if it better to unify the code style when possible, but it is up
to you, if you prefer I can resend with tabs and no brackets.

Regards,

Phil.

