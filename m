Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ccMCx-0005gU-EV
	for mharc-qemu-trivial@gnu.org; Fri, 10 Feb 2017 20:10:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54782)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ccMCv-0005gN-2f
	for qemu-trivial@nongnu.org; Fri, 10 Feb 2017 20:10:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ccMCt-0006OQ-Vf
	for qemu-trivial@nongnu.org; Fri, 10 Feb 2017 20:10:33 -0500
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:33547)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ccMCt-0006OL-QF; Fri, 10 Feb 2017 20:10:31 -0500
Received: by mail-ot0-x241.google.com with SMTP id f9so5425028otd.0;
	Fri, 10 Feb 2017 17:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=NZkLiovIeceaItBVqRy0Dy0xkkhL83pTj0cHCQ/vaTU=;
	b=gwQoui6vbxQtnxl5caRV0Ovx9ERrxMu9OhBmqQxXAg4G+B6i8QX1/OI+fEpJwTuKl2
	TvJAAZyB2AYPfbz7QpYMuH3eYRXRGxJLGuP39Pur/6GzqMc+QzDMy2QTMM7Pcmd4nszo
	Ex/edXvTJfmkyQ1n48RXaeZOpU2ensHsbWGsSif7riBGuTBjibB9HjnIi80N86lirnoT
	iVMrtZvJBGXh1TaICO9WRMmkfrJwz/qYuqqf93Rm9LqAU4XhQ5dE2TxFTYtboIQikSKy
	zQKOf6G+Ky1O5P07kL5buv5RBQkqFhFgUKF8VF1PGscl95gWZOrU3woOPMsB7oGgJZal
	uDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=NZkLiovIeceaItBVqRy0Dy0xkkhL83pTj0cHCQ/vaTU=;
	b=pEUdLlV31T11J94tX9/jean+oifssNf0iUSL7G0gKWepdFR8Hqsdrx70RhQ2js04OP
	Qc8hHfKCaueIxodn6w66nnYp6tO9QmxyYrTdogWAWzUyMYBMfiFlnXxdW8pjlIhOzO+l
	x3CRMcYC8OB4ALulH/27XgrXwIV36KUE/ywMcj/3t2x2IZYEBumKwMXoBkXXn/G54kjo
	1v2xp8JEhDAoWYNpEA5ja9/aOkOH/oBsUXeJxXQU7ujMAqjn6JrBNcbDbJHHHC/wLPmm
	QUQ+Ymh3/jwgQ0cY4BBQkKgiYYBpFmgJYQ6/tRP5jFcYKlogY3aGOkvdS98OssdQDNwc
	yUlw==
X-Gm-Message-State: AMke39k1KiYL1ONVErOY81S+PEWZmmEYDCwIHaJTOqpvjf1ofkwtwSklMyJhX7y5yhJ9Jw30L2rKGuA7Zg1kKQ==
X-Received: by 10.157.11.14 with SMTP id a14mr7528303ota.121.1486775431052;
	Fri, 10 Feb 2017 17:10:31 -0800 (PST)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.183.26.67 with HTTP; Fri, 10 Feb 2017 17:10:00 -0800 (PST)
In-Reply-To: <87mvdvaknu.fsf@dusky.pond.sub.org>
References: <1486576669-29760-1-git-send-email-thuth@redhat.com>
	<87mvdvaknu.fsf@dusky.pond.sub.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 10 Feb 2017 17:10:00 -0800
X-Google-Sender-Auth: RRTtbR9r5dDsk_Lqe2ZnE5tGElg
Message-ID: <CAKmqyKN94euwX16E8z-eEdCwi0NY5szRyGf92YWnwr15vdo3+A@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] hw/core/or-irq: Mark the
 device with cannot_instantiate_with_device_add_yet
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
X-List-Received-Date: Sat, 11 Feb 2017 01:10:34 -0000

On Wed, Feb 8, 2017 at 11:27 PM, Markus Armbruster <armbru@redhat.com> wrote:
> Thomas Huth <thuth@redhat.com> writes:
>
>> The "or-irq" device needs to be wired up in source code, there is no
>> way the user can make any real use of this device with the "-device"
>> parameter or the "device_add" monitor command yet.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

>

