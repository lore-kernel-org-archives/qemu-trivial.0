Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c08ez-00065f-Kk
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2016 11:01:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1c08ew-000628-LN
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:01:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1c08ev-0005rp-HT
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:01:30 -0400
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:34148)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1c08ev-0005rL-Aj
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:01:29 -0400
Received: by mail-vk0-x22d.google.com with SMTP id c203so12141200vke.1
	for <qemu-trivial@nongnu.org>; Fri, 28 Oct 2016 08:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sHQXJVdAUtQ8jmo6pggNkMx7I0I505Df4gm+g/JjvR8=;
	b=JXmKJ74RO5H3EZTXn3XrbvKlgoEDkdGZ7NoOvvZjfmfoN46WsWhFB5dFUDgS9gufCe
	9GcW4ySHW2Owdjla6WlyrFUw7qgKLR5ls7RwnKuSZktXem3vKZ5vNIxvF/N7Y2WMFoTW
	QYMHvY3QuNHZZS37zHdm7Xx1qxTfM7vvtKZj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sHQXJVdAUtQ8jmo6pggNkMx7I0I505Df4gm+g/JjvR8=;
	b=mlj4GAqNXINhVPJy2hmnOVkLKgWBSWUxk6W5q/BPtcMX/Vyg6DvccrRwNwOC3BeuB3
	sF6XIjpWED6bHD2ut29sxQroEl6Es1VsJWiWuFZegMRI4L6YkmwciugJMOqCiO78VEDE
	xfvQkUsWR361ZQzv6mA4PgZcHnEqAfPpXZvSuDR1CfzSzBvlmfI6Ay/tA+azDSolCAbR
	cDaqM1uUo3F+aHRfZKw7xPX3yzuTHrK/Fup6uHM9ht2G5KA+DiGIbX1KXaMQ/n6ZnaIY
	xVkFhg5GSxIQGuKrdG/jvchI39b4QU/kY/mI4pVU2oDmmKIY1iYyX0KnfgandFpEmkMt
	gD9w==
X-Gm-Message-State: ABUngvdI0LO+DT3xekGqI5fRWcSj4JWKpsLDYbPsXZhicYKRY29vQZNSgWrCcigbkcdm4PcY/cVLj5rat3Ergtex
X-Received: by 10.31.16.36 with SMTP id g36mr4758270vki.170.1477666887880;
	Fri, 28 Oct 2016 08:01:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Fri, 28 Oct 2016 08:01:07 -0700 (PDT)
In-Reply-To: <caa78983-7b80-cac5-b7c0-152f20e48201@msgid.tls.msk.ru>
References: <1476383370-30650-1-git-send-email-sw@weilnetz.de>
	<9af01992-677a-11d5-e372-fc5e942907be@msgid.tls.msk.ru>
	<CAFEAcA-u-XrxYrb_tCOfk5dHh1j2xpHZek8oRWqWKX-jS5i4uQ@mail.gmail.com>
	<48f03c8d-7697-bcc0-beee-4e8eb10cdcd2@weilnetz.de>
	<caa78983-7b80-cac5-b7c0-152f20e48201@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Oct 2016 16:01:07 +0100
Message-ID: <CAFEAcA_yPWL6oC0nxaF5YLOVaVYJP3rx=Fga6aEdX=bN8e9EVA@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Stefan Weil <sw@weilnetz.de>, QEMU Trivial <qemu-trivial@nongnu.org>, 
	QEMU Developer <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Subject: Re: [Qemu-trivial] [PATCH] Fix build for less common build
 directories names
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
X-List-Received-Date: Fri, 28 Oct 2016 15:01:32 -0000

On 28 October 2016 at 15:57, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 17.10.2016 07:43, Stefan Weil wrote:
>> Am 16.10.2016 um 21:04 schrieb Peter Maydell:
>>> On 16 October 2016 at 15:31, Michael Tokarev <mjt@tls.msk.ru> wrote:
>>>> 13.10.2016 21:29, Stefan Weil wrote:
>>>>> scripts/tracetool generates a C preprocessor macro from the name of the
>>>>> build directory. Any characters which are possible in a directory name
>>>>> but not allowed in a macro name must be substituted, otherwise builds
>>>>> will fail.
>>>>
>>>> Applied to -trivial, thank you!
>>>
>>> Consensus on this and the other thread seemed to be
>>> that we should just fix the bug where tracetool is
>>> putting the build directory name into symbols
>>> rather than working around that...
>>>
>>> thanks
>>> -- PMM
>>
>> IMHO the patch can be applied nevertheless, as it uses a clearer
>> regular expression for characters allowed in macro names
>> (not one that is specific for the current QEMU code).
>
> So, what's the thing here?

I think we concluded that the underlying problem was a bit
tricky to fix and we should apply this workaround in the
meantime.

thanks
-- PMM

