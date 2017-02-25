Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1chfGd-00042F-M0
	for mharc-qemu-trivial@gnu.org; Sat, 25 Feb 2017 11:32:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39020)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1chfGb-00040C-FK
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2017 11:32:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1chfGZ-00081V-58
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2017 11:32:16 -0500
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230]:37472)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1chfGY-00080l-UK
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2017 11:32:15 -0500
Received: by mail-wm0-x230.google.com with SMTP id v77so34530517wmv.0
	for <qemu-trivial@nongnu.org>; Sat, 25 Feb 2017 08:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IOTjbFQ/EztVmbrV1TJfAHLj5tOALyUQlo5+ppEYEjg=;
	b=gDmiC/EKOPzUqNmELAX14Wxpep94JOtYCGQw7Svb8H4M2VVW9JFPAhoyPxmkYaEC7v
	nW5Ic6U0OOCDMIKw59muAb5mjaBYHpid8xMNEL4zxuMzzYEqHwTj8LXAQcSd6qn7O04i
	qqq6McR6bDCGIWgE2qtldMGLRaPPROdSWKa4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IOTjbFQ/EztVmbrV1TJfAHLj5tOALyUQlo5+ppEYEjg=;
	b=Cw1TS2pcvXgWOmtceB7JoSGczuXcPE9S/S4vSS/kTPHU6tRL3Id1DnRxMbtUCdXQ2+
	u9TFv1jx4fgXzYxfR6FeNVkoFJcpIwrlSsUa/lg7iXmjgji01qScMGQECv8PhwRmEtdK
	6/B5DiFuX5lQhhjDECpOAodcEt7IuENt79MTsLJJMbG0gMQ26Jfp1CqbLUD+nLUfJJ+Q
	TVXhYvAHT0hEPw/RbVu1XyPKelvIZBypTG4kkpSkdW3Ej9uoBBGp42MzAX2KkPPK9xRy
	7CaQVVa7XOfkFjNmdWereYz09cQx4j7ksckrCqvKP3TYqkXerQbt6RuAbkbWfJFOD/vm
	mnaw==
X-Gm-Message-State: AMke39mfWqtj1QN1M/AXsoNKHOmoUAiQnT04yxmjCKixCEz1JzHIT49K2IPJegeRqbv59D3OimJNeg8RkLPNnM1t
X-Received: by 10.28.4.10 with SMTP id 10mr7403578wme.142.1488040333814; Sat,
	25 Feb 2017 08:32:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Sat, 25 Feb 2017 08:31:53 -0800 (PST)
In-Reply-To: <alpine.BSF.2.20.1702242239330.76443@zero.eik.bme.hu>
References: <cover.1487522123.git.balaton@eik.bme.hu>
	<8936f97ffdf6fe9a71a300113019bfdba0ecef23.1487522123.git.balaton@eik.bme.hu>
	<CAFEAcA9m8Yjwjn_B5aBZmWVwXXVj7-BQ1_d76ED4bg3cAWw=bw@mail.gmail.com>
	<alpine.BSF.2.20.1702242138290.76443@zero.eik.bme.hu>
	<alpine.BSF.2.20.1702242239330.76443@zero.eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 25 Feb 2017 16:31:53 +0000
Message-ID: <CAFEAcA9MWpWtsS_G-sXt92kRSmteyCVfbTfR4zytnaqOKV6W=g@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::230
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 09/10] sm501: Add some more
 missing registers
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
X-List-Received-Date: Sat, 25 Feb 2017 16:32:18 -0000

On 24 February 2017 at 21:49, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> On Fri, 24 Feb 2017, BALATON Zoltan wrote:
>>
>> On Fri, 24 Feb 2017, Peter Maydell wrote:
>>>
>>> On 19 February 2017 at 16:35, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>>>
>>>> Write only to allow clients to initialise these without failing
>>>>
>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>
>>>
>>> What's the point in write-only register values?

>>> If the registers are writes-ignored, there's no need to store
>>> the data written into the state struct; if the registers are
>>> reads-as-written then implement them that way.
>
>
> Still not sure what do you mean by read-as-written because I think that's
> exactly what is done here, value stored and read back as is, except for
> video_control where there are reserved bits that are always 0.

There are several ways we can make a register behave:

"Read only" -> the guest can only read, it cannot write
"Writes ignored" -> the guest can write but it has no effect
"Reads as written" -> the guest can write, and we store the
data so that when the guest reads it gets back the
value it wrote, but it doesn't have any effect on device behaviour
"Reads as zero" -> the guest can read but it always gets zero
"Write only" -> the guest can write values and we store them
but don't let the guest read them back. This is pointless.

For cases where we don't actually implement some bit of hardware
behaviour yet, it can be a reasonable choice to do either
"read-as-zero/writes-ignored", or "reads as written",
depending on what the guest is expecting. (writes-ignored
is the easiest behaviour to implement, but sometimes guests
won't work if you do that.)

If you're implementing "reads as written" then the commit
message shouldn't say "write only"... But the patch seems
to only add code to the register-write function, not to
the register-read function. That means we're storing
values the guest writes but never doing anything with them.
Either throw away the values immediately ("writes ignored")
or let the guest read them back ("reads as written").

(Optionally, we can also log the access via LOG_UNIMP
to let the user know the guest is trying to use some
bit of the device that doesn't work yet.)

thanks
-- PMM

