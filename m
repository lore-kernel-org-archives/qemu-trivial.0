Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cW4P7-00063F-SK
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2017 11:57:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32953)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cW4P5-00061L-A7
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 11:57:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cW4P4-0007zn-H1
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 11:57:07 -0500
Received: from mail-ua0-x235.google.com ([2607:f8b0:400c:c08::235]:36257)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cW4P4-0007zR-Cn
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 11:57:06 -0500
Received: by mail-ua0-x235.google.com with SMTP id 96so138374219uaq.3
	for <qemu-trivial@nongnu.org>; Tue, 24 Jan 2017 08:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=y09sZZg8u0TP7uGGrk7cmgUBmV/mIdOBSDSBl//aYUs=;
	b=QcMTy74mKX9bUD/9/gZIkFNI5sBFeDix5cMqnNFluZbcuN0FP1CxoNVP8V0vuGmpYv
	Lb5CLCgSHDBKXXAIt5iX4LXrFVW66C1hp/g2PntvgD1lRdUsO86wv1qKKKQYQkhoyF7H
	gCbQfoFe03Mk3KGQbjAkP/cDpq/HtzQah+8kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=y09sZZg8u0TP7uGGrk7cmgUBmV/mIdOBSDSBl//aYUs=;
	b=jwt3tmbVP/cvpfIMxX+h0SdthrNi28/StyvG6HnFRnXMXefO+40IHWZaKWGQRbNq16
	0dE1z9IKsRBv9NmHF4l27dFYrSlsuXRHxEMG57Fpv4kHBg6eswV8SU0Lfd/mViFP+Br/
	OJN6DcYuHeWJhe3RrGL6xeOhclxx6mb1jBqfhwFDy8684zU+0WkY+fhaH3YM3gLRRimT
	WbqJUJSIeVIthWJROWKyrvA1BzNaEOkIqz9GaNJPdKDkzY6EYoL8Pie/2lbgjuoxea+Z
	XFibb6OnLMbc9WGElVCSsv+zWXITOVJ4OCFqNPEyeah99E1kV/Vsx0CCsJg5MSTMJQ6J
	dvTA==
X-Gm-Message-State: AIkVDXIW4I2+z/otgNubS9BBBATQVH9s7jNp6/QH4yNe0epQDFjylzmNgFsKcGTVKtGHe40MrXLqS5QDe02uwp83
X-Received: by 10.159.37.1 with SMTP id 1mr18622310uaz.2.1485277025738; Tue,
	24 Jan 2017 08:57:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Tue, 24 Jan 2017 08:56:45 -0800 (PST)
In-Reply-To: <CAFEAcA8EYZy4C3mmOfZUGUBENvdWOsADMCyG3fyoYAdMa-qBxQ@mail.gmail.com>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
	<CAFEAcA8EYZy4C3mmOfZUGUBENvdWOsADMCyG3fyoYAdMa-qBxQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Jan 2017 16:56:45 +0000
Message-ID: <CAFEAcA-=4h61JXkovzXsVMW9z47FiWKQmcuuH73h-Tcbe1_srw@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::235
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/31] Trivial patches for
 2017-01-24
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
X-List-Received-Date: Tue, 24 Jan 2017 16:57:08 -0000

On 24 January 2017 at 16:55, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 24 January 2017 at 09:39, Michael Tokarev <mjt@tls.msk.ru> wrote:
>> Hi!
>> This is a next trivial-patches pull request after a long while.
>> We had a new release (2.8), new year holidays and other stuff.
>> So here we go now with whatever has been collected so far.
>>
>> Please consider applying.
>>
>> Thanks,
>>
>> /mjt
>>
>> The following changes since commit 3879284d6517dc22529395bdb259f4183b589127:
>>
>>   Merge remote-tracking branch 'remotes/berrange/tags/pull-qio-2017-01-23-2' into staging (2017-01-23 15:59:09 +0000)
>>
>> are available in the git repository at:
>>
>>   git://git.corpit.ru/qemu.git tags/trivial-patches-fetch
>>
>> for you to fetch changes up to bed534dd4032446750ad3e7a806c24d81bc5851b:
>>
>>   hw/isa/isa-bus: Set category of the "isabus-bridge" device (2017-01-24 12:38:03 +0300)
>>
>> ----------------------------------------------------------------
>> trivial patches for 2017-01-24
>>
>
> Applied, thanks.

whoops, replied to wrong mail. This one's still processing.

thanks
-- PMM

