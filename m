Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSNJN-0005jc-Ns
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jun 2018 09:56:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45190)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fSNJL-0005g5-C6
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2018 09:56:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fSNJK-0005j3-Ha
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2018 09:56:43 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:35886)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fSNJK-0005il-9X
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2018 09:56:42 -0400
Received: by mail-oi0-x241.google.com with SMTP id 14-v6so17955122oie.3
	for <qemu-trivial@nongnu.org>; Mon, 11 Jun 2018 06:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qi/gY/uvhO4mxa2WlnGbDcyvJxp3T/EdsH7Y2YMtz/8=;
	b=AStaObEwxC7Kb182Uo+m6k7aDZeV/VzI9ygIA7KwudpSpkZ5S/KFevpIE7Aqq+PgU9
	8twt+D3KcBGPlDDKaZ4ZRSNRl81ZaDwJ1Douaxd0YQz6Ba+009o1eot04R2aliam9XgJ
	TJMY4RMi5Vrow1vMHluk+gBPWkTX7KggBcHL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qi/gY/uvhO4mxa2WlnGbDcyvJxp3T/EdsH7Y2YMtz/8=;
	b=XRYGwvZ5xqyp8AHqt8ffYJO1k0+6C7QDBKIrSQAIMl2y0+GrsNDX6m2RjLKYC4sP6Q
	3rB3J3JsFhp0WEiVvifNLCnMZVCB/1bw/BOplvCvsEyHXide+RZc2whmZJPMoOji0d/K
	lOVm2gtBgFKSxrjjGciKhn/BzVAAFe+EnsSUqJKVWRUumn/rJVxEZlBJJI0UWsAJp8N6
	xKlms82UfdZroChGnVZ1PsoP6izZ+m8araNfqDaJAcmrUmMuYEE38wDw8PQ6WlpTYOCd
	Ryb+THeLKxTX8ccOsQYqUoxB+nWU/Nhq59LIwujhHNR0gxhbvs5b1WWbr2Q9bZaSRBdL
	4SkQ==
X-Gm-Message-State: APt69E3kt59rZDdANgYfSDNqkQ3/jWMezH8ZSciZM5J5wK/4uqm9Zijr
	2sobOOkmBMIetf0yF7fhBUdIZohBxZJUgqwRIUowlg==
X-Google-Smtp-Source: ADUXVKISCwawAx6VkwQYRaaAh9AGeUfRdr48rS9EMMxYEqqWTY2G4rqCTxNDJsO2nPjDAGJPWraDctPW12yX7utaaDA=
X-Received: by 2002:aca:d4c7:: with SMTP id
	l190-v6mr8985209oig.102.1528725401531; 
	Mon, 11 Jun 2018 06:56:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Mon, 11 Jun 2018 06:56:21
	-0700 (PDT)
In-Reply-To: <CAFEAcA86RRfz-YQivsPDRqAbZqOtdNpRnnBeKC24B5yYzY1=zg@mail.gmail.com>
References: <20180426140253.3918-1-peter.maydell@linaro.org>
	<4f0eec20-64a6-fb8f-58ae-1fab9ef34f53@redhat.com>
	<CAFEAcA86RRfz-YQivsPDRqAbZqOtdNpRnnBeKC24B5yYzY1=zg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jun 2018 14:56:21 +0100
Message-ID: <CAFEAcA-xe-zX8_y3p_XKb2pHharJwwfL3ebtUU71E_EY+xvU3w@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vl.c: Don't zero-initialize
 statics for serial_hds
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
X-List-Received-Date: Mon, 11 Jun 2018 13:56:44 -0000

Ping^2 for qemu-trivial?

thanks
-- PMM

On 29 May 2018 at 16:25, Peter Maydell <peter.maydell@linaro.org> wrote:
> Ping for application via qemu-trivial?
>
> thanks
> -- PMM
>
> On 26 April 2018 at 15:19, Thomas Huth <thuth@redhat.com> wrote:
>> On 26.04.2018 16:02, Peter Maydell wrote:
>>> checkpatch reminds us that statics shouldn't be zero-initialized:
>>>
>>> ERROR: do not initialise statics to 0 or NULL
>>> #35: FILE: vl.c:157:
>>> +static int num_serial_hds = 0;
>>>
>>> ERROR: do not initialise statics to 0 or NULL
>>> #36: FILE: vl.c:158:
>>> +static Chardev **serial_hds = NULL;
>>>
>>> I forgot to fix this in 6af2692e86f9fdfb3d; do so now.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>> I wouldn't bother with this except that I forgot to fold
>>> it in when applying the serial-limits patchset.
>>>
>>>  vl.c | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/vl.c b/vl.c
>>> index 616956adf1..6d8b869dad 100644
>>> --- a/vl.c
>>> +++ b/vl.c
>>> @@ -154,8 +154,8 @@ QEMUClockType rtc_clock;
>>>  int vga_interface_type = VGA_NONE;
>>>  static DisplayOptions dpy;
>>>  int no_frame;
>>> -static int num_serial_hds = 0;
>>> -static Chardev **serial_hds = NULL;
>>> +static int num_serial_hds;
>>> +static Chardev **serial_hds;
>>>  Chardev *parallel_hds[MAX_PARALLEL_PORTS];
>>>  Chardev *virtcon_hds[MAX_VIRTIO_CONSOLES];
>>>  Chardev *sclp_hds[MAX_SCLP_CONSOLES];
>>>
>>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>

