Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UvxVw-0008C4-Od
	for mharc-qemu-trivial@gnu.org; Sun, 07 Jul 2013 18:33:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39290)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UvxVt-0008Aw-PI
	for qemu-trivial@nongnu.org; Sun, 07 Jul 2013 18:33:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UvxVs-0003CC-TO
	for qemu-trivial@nongnu.org; Sun, 07 Jul 2013 18:33:01 -0400
Received: from mail-la0-f44.google.com ([209.85.215.44]:65318)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UvxVs-0003Bw-MA
	for qemu-trivial@nongnu.org; Sun, 07 Jul 2013 18:33:00 -0400
Received: by mail-la0-f44.google.com with SMTP id er20so3284061lab.3
	for <qemu-trivial@nongnu.org>; Sun, 07 Jul 2013 15:32:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=WDexkGm2Mw6QSTwjs4BUl0kwPDCUVeb7oJksQY+m+kU=;
	b=l31vPxrnQo6xK0eXIzPjCVCYwewbcst5kTEKkfEaqJUctlakFnMHsJSBRqUMg8vzPd
	hAswKHsybqW+omXpgRDYVSsIApDNnkB8cDrXDi1W2QUQDqtxBqYjGcDonXjzB50TBDWL
	hgKq5Mw1hWdf1d8bMfLK33BthE05qWUFXzT+wX3HA3LIGF4u4djTt4SPj26Z1bcRMlUU
	zVPXt0/tmjGE9euUJStisDHb5vVcoJ6h6R6X+ZRD011lwoxOkcJ/SgqFUCL1vMQU0Km9
	WKR7UOvUcUB7sEcTLc8T3CSCkBqpUSiMd0BID9Hd4zDTAjMczBdFq23Y0quaG0tM5zYf
	KoJw==
X-Received: by 10.112.132.7 with SMTP id oq7mr9376264lbb.2.1373236378815; Sun,
	07 Jul 2013 15:32:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.97.146 with HTTP; Sun, 7 Jul 2013 15:32:38 -0700 (PDT)
In-Reply-To: <037D60EF2A5746E468BF0A04@nimrod.local>
References: <1373228703-26226-1-git-send-email-sw@weilnetz.de>
	<037D60EF2A5746E468BF0A04@nimrod.local>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 7 Jul 2013 23:32:38 +0100
Message-ID: <CAFEAcA9V_THiPwVwv-gYH14h2kujDnWpGAOSBd95C9W56p3AuQ@mail.gmail.com>
To: Alex Bligh <alex@alex.org.uk>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQl3wxoBacUuEEHrzO5TLeDfjKnmbypTmd5orSeZBWT9GMnIe+OUOFT0ZEJrPOoTBHqIuX3t
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.44
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel@nongnu.org,
	Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Spelling fixes
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
X-List-Received-Date: Sun, 07 Jul 2013 22:33:03 -0000

On 7 July 2013 23:05, Alex Bligh <alex@alex.org.uk> wrote:
>
>
> --On 7 July 2013 22:25:02 +0200 Stefan Weil <sw@weilnetz.de> wrote:
>
>> --- a/ui/vnc-enc-zywrle.h
>> +++ b/ui/vnc-enc-zywrle.h
>> @@ -305,9 +305,9 @@ static inline void harr(int8_t *px0, int8_t *px1)
>>     |L1H0H1H0|L1H0H1H0|L1H0H1H0|L1H0H1H0| : level 1
>>
>>   In this method, H/L and X0/X1 is always same position.
>> - This lead us to more speed and less memory.
>> - Of cause, the result of both method is quite same
>> - because it's only difference that coefficient position.
>> + This leads us to more speed and less memory.
>> + Of course, the result of both methods is quite same
>> + because its only difference is that coefficient position.
>>  */
>>  static inline void wavelet_level(int *data, int size, int l, int
>> skip_pixel)  {
>
>
> If we're doing spelling/grammar fixes, that should be "is quite the same"
> and "that of coefficient position".

"is quite the same" isn't idiomatic English either. I can't
tell if the author meant "is quite similar" or "is exactly
the same", so we probably shouldn't change the text unless
we can work out which one is right...

-- PMM

