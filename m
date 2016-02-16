Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aVk2G-0006KJ-Uw
	for mharc-qemu-trivial@gnu.org; Tue, 16 Feb 2016 13:07:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44560)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aVk2F-0006HU-Bi
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 13:07:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aVk2E-0005IC-6W
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 13:07:39 -0500
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:36300)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aVk2E-0005I4-0U
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 13:07:38 -0500
Received: by mail-vk0-x231.google.com with SMTP id c3so140588684vkb.3
	for <qemu-trivial@nongnu.org>; Tue, 16 Feb 2016 10:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=9sqjJQpKjk+wQCp2aR08eR0lAGwj2uC6e3q0+lLvO8E=;
	b=FtESIYI26jDdJ1HjYK8Pdnmp1GMP/Tac70/NK2grfoA7zpHZzXzjEzJPDprv99+8q8
	1CfHN6o5tHPm3mf5LamQ3w/qQ/uZZb2WGcB0rySMkLnsoA497/YiExq87b7hc0xNnqXX
	iK2zuBdSKDf0p41hK54VDh3UYQcNSHW5xCHvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=9sqjJQpKjk+wQCp2aR08eR0lAGwj2uC6e3q0+lLvO8E=;
	b=GHuRppbSVHZ17aqmQ0ZnnmADYbHoZW2Fvjci4O6KLpET54ONnxB6CsY0eJD3C5yDFt
	0uymtJLI+rwW9O85QKoL8qNN5Si32N8NanHxq/PJtRC8pzLN3dLP9IgnQrUnxsvZ5Tma
	FqlU/JSbi/oJOCe6MepHw+4Wkfaytl6UMhQYXv3DPi4+4DZhJxGAPYrBDY5f8O2CIiqX
	OgsvZQAuWF8UtB40VeoWQRkbdqUnWMbMFbKHQT1fKDchKYRMjzwkQRf3ywvg4vFXvusc
	K2pc+Pt6ChNZkMbsSbFE6+0I0fB41wAcyXtzRFhRySBODBNjEDUyMmLE7YAv1TUL7B+m
	pyJA==
X-Gm-Message-State: AG10YOTFkQ4cp/DgrMx8UZ9en6b+lgZDBT4pHaf+it9GabnvFWCHDO7GJfcRcxLz/clVlI9qc6X/+woMWIETe9J1
X-Received: by 10.31.107.194 with SMTP id k63mr17362878vki.27.1455646057611;
	Tue, 16 Feb 2016 10:07:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Tue, 16 Feb 2016 10:07:18 -0800 (PST)
In-Reply-To: <56C362FD.7070008@redhat.com>
References: <1455638581-5912-1-git-send-email-peter.maydell@linaro.org>
	<56C34F18.7090006@redhat.com> <56C3562C.8000503@redhat.com>
	<56C362FD.7070008@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2016 18:07:18 +0000
Message-ID: <CAFEAcA_Ly17OQ5=V-sWkH-8uuErbjXWqJb3KoLx2tToLoG6K3A@mail.gmail.com>
To: Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-options.hx: Improve
 documentation of chardev multiplexing mode
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
X-List-Received-Date: Tue, 16 Feb 2016 18:07:40 -0000

On 16 February 2016 at 17:57, Laszlo Ersek <lersek@redhat.com> wrote:
> On 02/16/16 18:02, Paolo Bonzini wrote:
>>
>>
>> On 16/02/2016 17:32, Laszlo Ersek wrote:
>>> I'm a big fan of muxing the stdio backend between the (human) monitor
>>> and the guest's serial console:
>>>
>>>   -chardev stdio,signal=off,mux=on,id=char0 \
>>>   -mon chardev=char0,mode=readline,default \
>>>   -serial chardev:char0 \
>>
>> Or just "-serial mon:stdio". :)
>
> For what reason on earth are these three *possible* at all to tie up
> into a single command line option?

Legacy convenience options. The muxing of the monitor and the
console way predates the implementation of chardev backends
and a generic mux.

QEMU's command line options are full of this kind of thing, where
we started off with a special purpose thingy that got a nice
short comprehensible option to turn it on and off, and then later
we got a general purpose facility with lots of orthogonal bells
and whistles. If you're lucky then the special-purpose legacy
option is exactly equivalent to some longer general purpose
option set; sometimes it isn't...

thanks
-- PMM

