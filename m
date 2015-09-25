Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZfaxU-0004yv-CW
	for mharc-qemu-trivial@gnu.org; Fri, 25 Sep 2015 17:55:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55076)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZfaxS-0004yb-HV
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 17:55:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZfaxP-0002Qx-CJ
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 17:55:10 -0400
Received: from mail-vk0-f41.google.com ([209.85.213.41]:34070)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZfaxP-0002QD-93
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 17:55:07 -0400
Received: by vkhf67 with SMTP id f67so64123918vkh.1
	for <qemu-trivial@nongnu.org>; Fri, 25 Sep 2015 14:55:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5Aqmx9yH3y/73q5UX43qSvejuN6Ff27Jalpo4qRMjeE=;
	b=bL0avOMoji7ZzEZ8UtK5vOkjmAylTmUyW/5R+TQXGviwaWw1sfpdKRMxJPdhpW03by
	gIt01RX1gRnD9x64feM4E4mqwlLa5WigJK77wMhzmJIIZYyDEjovg0EZcNNitUr9u10G
	oM4sYYd+FpolN+mhQ9Bu3HRfssSxew0VjuQIVElA6Widb1hUEAaPpme8DjK0KaE1jyZu
	DTLbRykzmuYs+ifz1jw3EzuKVDnm4bR6i1IqMgM3GlAkfoxSLoCnVjJiO0wuIrLAiMN9
	lRNnT4H6S7xrlkuBoDddz3z6FA6dj+lpqIJCldrral977Z17WOEv2kTXUFngPDvM0FuK
	8CNw==
X-Gm-Message-State: ALoCoQn77g7jaBDGhURqiDeINwsMpXO1zc7Mz3VhwxG6JufFWzAe0nmFc7fgxASsVR6PmaRgJ+Rc
X-Received: by 10.31.136.9 with SMTP id k9mr4628119vkd.92.1443218106839; Fri,
	25 Sep 2015 14:55:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 25 Sep 2015 14:54:47 -0700 (PDT)
In-Reply-To: <5605A6BF.5050803@weilnetz.de>
References: <1426328388-2888-1-git-send-email-sw@weilnetz.de>
	<5605A6BF.5050803@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Sep 2015 14:54:47 -0700
Message-ID: <CAFEAcA_tDp-0m=8ugHGLdmdZP+wdSo3hR_-jjxpSBVNq2SyUmg@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.41
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developer <qemu-devel@nongnu.org>,
	Antony Pavlov <antonynpavlov@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/arm/digic: Fix memory
	leak reported by Coverity
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
X-List-Received-Date: Fri, 25 Sep 2015 21:55:11 -0000

On 25 September 2015 at 12:55, Stefan Weil <sw@weilnetz.de> wrote:
> Am 14.03.2015 um 11:19 schrieb Stefan Weil:
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>  hw/arm/digic_boards.c |    1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
>> index 7114c36..ad70f7b 100644
>> --- a/hw/arm/digic_boards.c
>> +++ b/hw/arm/digic_boards.c
>> @@ -109,6 +109,7 @@ static void digic_load_rom(DigicBoardState *s, hwaddr addr,
>>          }
>>
>>          rom_size = load_image_targphys(fn, addr, max_size);
>> +        g_free(fn);
>>          if (rom_size < 0 || rom_size > max_size) {
>>              error_report("Couldn't load rom image '%s'.", filename);
>>              exit(1);
>>
>
> Ping? Maybe this old patch can be applied to qemu-trivial.
>
> fn = qemu_find_file() allocates memory, so g_free is needed.

No, this was fixed by commit 6e05a12f8f7f32a3 so although this
patch still textually applies it would introduce a double-free.

thanks
-- PMM

