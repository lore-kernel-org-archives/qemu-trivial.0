Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uw3JL-00039k-Ar
	for mharc-qemu-trivial@gnu.org; Mon, 08 Jul 2013 00:44:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43224)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Uw3JI-00035T-QF
	for qemu-trivial@nongnu.org; Mon, 08 Jul 2013 00:44:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Uw3JH-0006uJ-Mm
	for qemu-trivial@nongnu.org; Mon, 08 Jul 2013 00:44:24 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:34541)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1Uw3JE-0006tk-Hk; Mon, 08 Jul 2013 00:44:20 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	EDA0372819E0; Mon,  8 Jul 2013 06:44:18 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id pf13yDgDmTAy; Mon,  8 Jul 2013 06:44:08 +0200 (CEST)
Received: from [192.168.178.35] (p54ADB38E.dip0.t-ipconnect.de
	[84.173.179.142])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	0BD8772819DE; Mon,  8 Jul 2013 06:44:06 +0200 (CEST)
Message-ID: <51DA438A.8060903@weilnetz.de>
Date: Mon, 08 Jul 2013 06:43:54 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1373228703-26226-1-git-send-email-sw@weilnetz.de>
	<037D60EF2A5746E468BF0A04@nimrod.local>
	<CAFEAcA9V_THiPwVwv-gYH14h2kujDnWpGAOSBd95C9W56p3AuQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9V_THiPwVwv-gYH14h2kujDnWpGAOSBd95C9W56p3AuQ@mail.gmail.com>
X-Enigmail-Version: 1.4.6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: Anthony Liguori <aliguori@us.ibm.com>, qemu-trivial@nongnu.org,
	Jan Kiszka <jan.kiszka@siemens.com>, qemu-devel@nongnu.org,
	Corentin Chary <corentincj@iksaif.net>, Alex Bligh <alex@alex.org.uk>
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
X-List-Received-Date: Mon, 08 Jul 2013 04:44:25 -0000

Am 08.07.2013 00:32, schrieb Peter Maydell:
> On 7 July 2013 23:05, Alex Bligh <alex@alex.org.uk> wrote:
>>
>> --On 7 July 2013 22:25:02 +0200 Stefan Weil <sw@weilnetz.de> wrote:
>>
>>> --- a/ui/vnc-enc-zywrle.h
>>> +++ b/ui/vnc-enc-zywrle.h
>>> @@ -305,9 +305,9 @@ static inline void harr(int8_t *px0, int8_t *px1)
>>>     |L1H0H1H0|L1H0H1H0|L1H0H1H0|L1H0H1H0| : level 1
>>>
>>>   In this method, H/L and X0/X1 is always same position.
>>> - This lead us to more speed and less memory.
>>> - Of cause, the result of both method is quite same
>>> - because it's only difference that coefficient position.
>>> + This leads us to more speed and less memory.
>>> + Of course, the result of both methods is quite same
>>> + because its only difference is that coefficient position.
>>>  */
>>>  static inline void wavelet_level(int *data, int size, int l, int
>>> skip_pixel)  {
>>
>> If we're doing spelling/grammar fixes, that should be "is quite the same"
>> and "that of coefficient position".
> "is quite the same" isn't idiomatic English either. I can't
> tell if the author meant "is quite similar" or "is exactly
> the same", so we probably shouldn't change the text unless
> we can work out which one is right...
>
> -- PMM

Thank you for both answers. Even as non native speaker
I was aware that this part still did not sound like correct English,
but I restricted my modifications to those parts where I was sure.

Let's ask the original author Corentin Chary...

Regards
Stefan W.


