Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXT6E-0000tc-To
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 11:08:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38136)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXT69-0000qF-S8
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 11:08:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXT64-00015i-1P
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 11:08:09 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:35088)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXT5y-00012q-Gv; Mon, 25 Jun 2018 11:07:58 -0400
Received: by mail-qt0-x243.google.com with SMTP id z6-v6so12230168qti.2;
	Mon, 25 Jun 2018 08:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=3r9SYJEZuQwMuIzSVtIQjBWzfbm9NhCrBSgcS/p+Q6g=;
	b=bxkyuPIzpyRNHKyO2Nipi4eFi1RTz2y/4BHYEtr2rR6D3ZmR9IYrDcuTQPrrC2Mza9
	w6lISHPIkQJz8iRBTNDSOYGv61Cs5SL9VR93j52pVctyw9d9+fKcL/efjIsR4JYEuFu2
	b4Xd66qZpIjsj4QCXR4REAAxFX+0VXxlOoMAdc6U2YZl+AZYj52JdVYOmT9JDMFrui2L
	tdDTpN7Y1r//+0K3NwRbX7TzdpdCxUK0mWWCznWCQYl7GdQcJmzRvei8FOSZI27cEQzp
	IaATQeVQScnfxqf97sIYq/scEEUKqFesAccntqAbpJ0RTd5iXv5zyLTZY3rnEBBxSdlA
	1M5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=3r9SYJEZuQwMuIzSVtIQjBWzfbm9NhCrBSgcS/p+Q6g=;
	b=Em+TuZGOpUh0fj3vuLoVdZ3dDMZ2sKDnISKuawKkzcf2CfqIn0kc6OyBL63/JsLhlO
	NP0AySVAG62QVk1wYOD7DN554KsJh87ig1+wyrvQuw6ita9//29KkC7/fA8YhafCnlUC
	cJviIVSuKfYphE5G08DI/Yw/QifzKINkMzkYt5WFKzBrqxELoCpe0sXgV7Z9SVq3rzC0
	3YLqxLzwhHlV0wIs67BNPhbpUhpU6abGiNdHPcT3OFYNq9hm1YoX/Lt+zKvTtrAxc3KH
	junbL0Bxq/QZ11Bex4pSDFMckMyREeKeZaRdQr02TA3KG/ml9I2aHv9Q1xO05dpb1aFT
	SWcw==
X-Gm-Message-State: APt69E2nxxyrG9m80Au32gFC88J1X52vZHkgpSBgq4Ejlndwjxy1DzCX
	T2+O7Wv9fy5g8thBbAoTsC3hh8avdVs=
X-Google-Smtp-Source: ADUXVKKB2C3lAF8r6zG8jtYAfWsnswgVkSz4HsqeuPy642Ef8K8o3+ZShLlp7tNFNR7YvF6FHntGpA==
X-Received: by 2002:ac8:3885:: with SMTP id
	f5-v6mr4661450qtc.337.1529939277680; 
	Mon, 25 Jun 2018 08:07:57 -0700 (PDT)
Received: from [192.168.1.124] ([190.177.167.108])
	by smtp.gmail.com with ESMTPSA id
	m16-v6sm9089181qtn.92.2018.06.25.08.07.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 08:07:57 -0700 (PDT)
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
	<57e04a05-442c-bd4a-2daa-1b690540c061@amsat.org>
	<2eab61ba-1220-095d-721b-53357104fb45@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <9ad2df7b-afa2-8470-6353-facdde6b0587@amsat.org>
Date: Mon, 25 Jun 2018 12:07:52 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <2eab61ba-1220-095d-721b-53357104fb45@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
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
X-List-Received-Date: Mon, 25 Jun 2018 15:08:14 -0000

On 06/25/2018 11:30 AM, Thomas Huth wrote:
> On 25.06.2018 14:52, Philippe Mathieu-Daudé wrote:
>> On 06/25/2018 03:08 AM, Thomas Huth wrote:
>>> On 22.06.2018 22:10, Philippe Mathieu-Daudé wrote:
>>>> On 06/22/2018 04:38 PM, Thomas Huth wrote:
>>>>> On 22.06.2018 15:40, Philippe Mathieu-Daudé wrote:
>>>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>>> ---
>>>>>>  hw/i2c/omap_i2c.c | 20 ++++++++++++--------
>>>>>>  1 file changed, 12 insertions(+), 8 deletions(-)
>>>>>>
>>>>>> diff --git a/hw/i2c/omap_i2c.c b/hw/i2c/omap_i2c.c
>>>>>> index 26e3e5ebf6..690876e43e 100644
>>>>>> --- a/hw/i2c/omap_i2c.c
>>>>>> +++ b/hw/i2c/omap_i2c.c
>>>>>> @@ -17,6 +17,7 @@
>>>>>>   * with this program; if not, see <http://www.gnu.org/licenses/>.
>>>>>>   */
>>>>>>  #include "qemu/osdep.h"
>>>>>> +#include "qemu/log.h"
>>>>>>  #include "hw/hw.h"
>>>>>>  #include "hw/i2c/i2c.h"
>>>>>>  #include "hw/arm/omap.h"
>>>>>> @@ -339,14 +340,15 @@ static void omap_i2c_write(void *opaque, hwaddr addr,
>>>>>>              }
>>>>>>              break;
>>>>>>          }
>>>>>> -        if ((value & (1 << 15)) && !(value & (1 << 10))) {	/* MST */
>>>>>> -            fprintf(stderr, "%s: I^2C slave mode not supported\n",
>>>>>> -                            __func__);
>>>>>> +        if ((value & (1 << 15)) && !(value & (1 << 10))) { /* MST */
>>>>>
>>>>> Please keep the white spaces before the comment if you don't change
>>>>> anything else.
>>>>
>>>> This is a <tab> and checkpatch complains...
>>>>
>>>> I can use 4 spaces for this tab. I tried to align with other tab-aligned
>>>> comments I didn't modify, but the result is messier. Thus a simple space.
>>>
>>> Oh, sorry, I didn't notice that you've replaced a TAB here. I guess it's
>>> ok then. But why does checkpatch complain if it is just in the context
>>> of your modification? That's weird.
>>
>> The first 2 contexts (MST and XA) are fine, however checkpatch complains
>> with the last one (ST_EN):
>>
>> ERROR: code indent should never use tabs
>> #38: FILE: hw/i2c/omap_i2c.c:397:
>> +        if (value & (1 << 15)) {^I^I^I^I^I/* ST_EN */$
>>
>> Since I replaced this one, I also did with the 2 previous.
>>
>> Now I realize I can _not_ add the brackets so I don't have to update the
>> <tabs>:
>>
>>          if (value & (1 << 15))^I^I^I^I^I/* ST_EN */
>> -            fprintf(stderr, "%s: System Test not supported\n", __func__);
>> +            qemu_log_mask(LOG_UNIMP,
>> +                          "%s: System Test not supported\n", __func__);
>>          break;
>>
>> I think if it better to unify the code style when possible, but it is up
>> to you, if you prefer I can resend with tabs and no brackets.
> 
> I think it's OK to fix up the coding style here, too. Maybe just mention
> it in the patch description ("While we're at it, change TABs to spaces
> and add missing curly braces to the surounding if-statements" or so).

OK. If that's fine with you I won't respin the whole series for this
comment, but if I have to respin for another reason I'll improve the
comment. I kindly learned the lesson for the next time although.

Thanks for the series review,

Phil.

