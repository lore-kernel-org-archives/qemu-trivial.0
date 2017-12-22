Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eSTS6-0002nj-Uq
	for mharc-qemu-trivial@gnu.org; Fri, 22 Dec 2017 14:57:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eSTS4-0002n2-Lf
	for qemu-trivial@nongnu.org; Fri, 22 Dec 2017 14:57:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eSTS4-0001Qw-0I
	for qemu-trivial@nongnu.org; Fri, 22 Dec 2017 14:57:52 -0500
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:35080)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eSTS3-0001QR-QO; Fri, 22 Dec 2017 14:57:51 -0500
Received: by mail-wr0-x242.google.com with SMTP id l19so16416113wrc.2;
	Fri, 22 Dec 2017 11:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=d2CnRm+mcTo7YAxTriRpmpOxjBitfxPWPM3aPJKVUrQ=;
	b=biqBAF7Y3cbon6ARv3vz1XWPlcc1lF0AHwB6URMwyROe/aAMC35N3Ek9YiDPH+6WcW
	STKwupIXJ9H0Dqy7yetdxtO3lPs3+xsl7JNRRGtAmAOBFtb+59YN7Vp6ijd/BXrStIjI
	8ralGMXz+Mr9l7ufHpR1/lzR2AOYOvNyjzTt4luLhkXR7dCl1MI76BCO58cFRU/DNrMW
	ZsZ0scSa9Ysq084mUfwZHej/rq8DJCwxHNlZAzJJkgkxPW7kDwnQVevz6Kvh+nDJvwyX
	OhRy8BGMHkn4o6IVsoqtple6hWM/ULOHGIw03TraGapdMTKusQizdPEpLPgQKaAKffaU
	5HAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=d2CnRm+mcTo7YAxTriRpmpOxjBitfxPWPM3aPJKVUrQ=;
	b=AE6z1vtcC5uzocRX4JW6DWHUX5sp43IZm75h3vMo8qNTqzOtB6EG3/L/A6NhFRfd+W
	P8ZDapW6XWexMJHiO5qHVhPzTPTDS7ir9aNd/LHg35wywqcjd+kKVeW8E9abuVxd7rww
	OlRgLERLXQpBvj8xO9jgRuHEncc+fcrwQo9yFAJY6QjqUs6cNg1EC5tlklWZ9VptDx0V
	c3Shpk3rXSj0lDwyGkAszwgzdqO5aILKhxdx2YQ0POQID5ILdlj/Q/iP/c0it7ekx6D5
	4Vnx18yFpG3JBmtM2ksoI+lundzbWl8jaQkO5gl9ivVCkAuLerflVV5dMNM6GLz8ia4p
	1BDA==
X-Gm-Message-State: AKGB3mJnqfXMtrW5VZtIJU1L2LCu4h8YHtr+A9keO6Tkv5WnIaHpy15P
	YwZYI44NysLA8FQteB2LNnku+MF7UG4gmYIa5WA=
X-Google-Smtp-Source: ACJfBosOm0R97RsHQ/sUR5kVPE/Yz/NLG4ckH+psXBGoYajpQ0e5HRrZz1r7VSbzs2jg9iypDj4PnFOXZgRyujQb+x0=
X-Received: by 10.223.190.12 with SMTP id n12mr8062363wrh.34.1513972670649;
	Fri, 22 Dec 2017 11:57:50 -0800 (PST)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.28.164.69 with HTTP; Fri, 22 Dec 2017 11:57:20 -0800 (PST)
In-Reply-To: <1cfb1217-e32d-8e91-da46-07f1c72be77f@redhat.com>
References: <cover.1513790494.git.alistair.francis@xilinx.com>
	<6bad4084f4cbc290e2e9f1a72fcfcda7223383ec.1513790495.git.alistair.francis@xilinx.com>
	<87lghulqno.fsf@dusky.pond.sub.org>
	<1cfb1217-e32d-8e91-da46-07f1c72be77f@redhat.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 22 Dec 2017 11:57:20 -0800
X-Google-Sender-Auth: OPophdmIQmdkYxSRGV6PTz0Twic
Message-ID: <CAKmqyKPyL8B5ZjEUePkqVbzP8kVmM48vWML41PRXVVO7LVmMpg@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v6 04/29] hw/arm: Replace
 fprintf(stderr, "*\n" with error_report()
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
X-List-Received-Date: Fri, 22 Dec 2017 19:57:53 -0000

On Fri, Dec 22, 2017 at 9:17 AM, Thomas Huth <thuth@redhat.com> wrote:
> On 22.12.2017 16:37, Markus Armbruster wrote:
>> Second thoughts...
>>
>> Alistair Francis <alistair.francis@xilinx.com> writes:
> [...]
>>>  #include "qemu/osdep.h"
>>> +#include "qemu/error-report.h"
>>>  #include "qapi/error.h"
>>>  #include "qemu-common.h"
>>>  #include "cpu.h"
>>> @@ -1311,8 +1312,8 @@ static void omap_prcm_apll_update(struct omap_prcm_s *s)
>>>      /* TODO: update clocks */
>>>
>>>      if (mode[0] == 1 || mode[0] == 2 || mode[1] == 1 || mode[1] == 2)
>>> -        fprintf(stderr, "%s: bad EN_54M_PLL or bad EN_96M_PLL\n",
>>> -                        __func__);
>>> +        error_report("%s: bad EN_54M_PLL or bad EN_96M_PLL",
>>> +                     __func__);
>>>  }
>>
>> This one's different: we neither exit() nor return a "failed" status to
>> the caller.
>>
>> We get here when the guest writes something funny to a certain
>> memory-mapped I/O register.  In other words, it's guest misbehavior, not
>> a user error.  I doubt it should be reported with error_report().
>> Peter, do we have a canonical way to report or log  guest misbehavior?
>
> qemu_log_mask(LOG_GUEST_ERROR, ...) ?

That seems like the best option to me.

Alistair

>
>  Thomas
>
>

