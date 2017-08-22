Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dkB8r-00006z-4a
	for mharc-qemu-trivial@gnu.org; Tue, 22 Aug 2017 11:30:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60168)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dkB8h-0008QZ-Us
	for qemu-trivial@nongnu.org; Tue, 22 Aug 2017 11:30:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dkB8g-0003TD-8y
	for qemu-trivial@nongnu.org; Tue, 22 Aug 2017 11:30:47 -0400
Received: from mail-wr0-x22e.google.com ([2a00:1450:400c:c0c::22e]:35074)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dkB8g-0003Sf-3c
	for qemu-trivial@nongnu.org; Tue, 22 Aug 2017 11:30:46 -0400
Received: by mail-wr0-x22e.google.com with SMTP id k46so53834980wre.2
	for <qemu-trivial@nongnu.org>; Tue, 22 Aug 2017 08:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=K689UJ20caYraXmMmfDxf9wN8+vASUJEbWGNufvR6Xw=;
	b=AHu+XPlTpEUu+3CKIhB8x93ocMFtRZ1JRsO3eggImBkOdwyerUjRbVw3O4GJEVFsyN
	YPf+t6nlzqrQeL5IpYOraQcjC2OLMzDiV7y1byjLc1ZYhTTtkT6RpccPe9W912wHBLLp
	9vbCvFSBWGAR9Gjg59waxoG3amkEoCBjovTmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=K689UJ20caYraXmMmfDxf9wN8+vASUJEbWGNufvR6Xw=;
	b=lMro5AVtvjtk8jxLGldzUTtkhuReKfQrKkHAA7moykT3DykwK3dDl/UVPgfc37+CX3
	cjGXPlBB28cT2PXgDN/QblFxo8sXvLxkaPnkGDveQXbtv47SIXLWHnz8J84Jv/ESiann
	/vWEhd3T5BVq86fQvQiirVH1wWjqNWFtG27aB6dx7H2jZJcezYlofZd/rpvAwwLeXR2J
	IrKA0Mohd7EtyXJTcvw6RgDpQeXb/o2L9JI32Og26yt6Yfp229jEb+px9doyaZOsRcOF
	3sKG7SnRDFHlxlgSxKD1RsQgrFE6VJUzjMvIqgP+TOFbcO5nuGEEcdekkzpvxsF1Uyo9
	bv8w==
X-Gm-Message-State: AHYfb5gZKNEs6kWLgfDs8EZBeyzDz4NNWjz2usS2cFfx7GfkPplEQd/U
	vWISiaEVNqAT09amGA41+NDUxXWhh2VK
X-Received: by 10.223.167.138 with SMTP id j10mr682990wrc.97.1503415844860;
	Tue, 22 Aug 2017 08:30:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Tue, 22 Aug 2017 08:30:24 -0700 (PDT)
In-Reply-To: <443135b4-4b36-bae6-b50a-12fb4a55a858@redhat.com>
References: <1503414375-21009-1-git-send-email-thuth@redhat.com>
	<CAFEAcA-92Jjz2uCC387oX2u0NWfijPwB_8zGaagC1m=sKD8zhQ@mail.gmail.com>
	<443135b4-4b36-bae6-b50a-12fb4a55a858@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Aug 2017 16:30:24 +0100
Message-ID: <CAFEAcA-AG5XoOJr3p_UU9dACjawp3OtKDy8GMRMpdFfE8foqTA@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	KONRAD Frederic <frederic.konrad@adacore.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Markus Armbruster <armbru@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22e
Subject: Re: [Qemu-trivial] [PATCH] hw/misc/auxbus.c: Mark the
 aux-to-i2c-bridge device as non-hotpluggable
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
X-List-Received-Date: Tue, 22 Aug 2017 15:30:56 -0000

On 22 August 2017 at 16:26, Thomas Huth <thuth@redhat.com> wrote:
> On 22.08.2017 17:12, Peter Maydell wrote:
>> Why is our default "hotpluggable" rather than "not hotpluggable" ?
>> We must have way more non-hotpluggable devices than hotpluggable
>> ones, and it takes active effort to make a hotpluggable device
>> model, so it seems like it would be much less bug-prone to
>> require hotpluggable devices to set dc->hotpluggable true
>> rather than all the non-hotpluggable ones to set it false...
>
> I think most devices are already non-hotpluggable automatically because
> they sit on a bus that is not hot-pluggable (e.g. sysbus devices). The
> problematic ones are the devices with .parent = TYPE_DEVICE. And for
> these, I think it is quite hard to say whether they should be
> hot-pluggable by default or not?

To implement hotplug you need to write extra code (notably some
kind of unrealize method to undo whatever you did in realize),
at which point also setting the hotpluggable flag is trivial.

> Anyway, according to my tests (I'm currently working on a test that
> automatically does device_add + device_del for all devices, as you might
> have guessed already), there are not that many devices that cause
> problems here, so I guess marking some few with hotpluggable = false
> should be OK?

The problem is not the devices we have today but the ones we're
going to write tomorrow. Having hotpluggable default to false
"fails safe" -- the worst that happens is that somebody writing
a hotpluggable device finds in their testing that they need to
set the flag to make it work. Having it default to true fails
non-safely -- as you've found, people writing devices that
were never expected to be hotplugged don't try to test the
error case of attempting hotplug anyway, and in code review
the absence of a line of code is very hard to reliably spot,
so we get devices in tree that crash QEMU if you try to
hotplug them. If we make the default be not-hotpluggable
we fix this not just today but forever.

thanks
-- PMM

