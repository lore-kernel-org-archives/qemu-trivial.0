Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ck927-0000q9-WF
	for mharc-qemu-trivial@gnu.org; Sat, 04 Mar 2017 07:43:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57026)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ck923-0000nt-W1
	for qemu-trivial@nongnu.org; Sat, 04 Mar 2017 07:43:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ck922-0006d2-W0
	for qemu-trivial@nongnu.org; Sat, 04 Mar 2017 07:43:31 -0500
Received: from mail-wr0-x22f.google.com ([2a00:1450:400c:c0c::22f]:34944)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ck922-0006cJ-PJ
	for qemu-trivial@nongnu.org; Sat, 04 Mar 2017 07:43:30 -0500
Received: by mail-wr0-x22f.google.com with SMTP id g10so89225250wrg.2
	for <qemu-trivial@nongnu.org>; Sat, 04 Mar 2017 04:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mzcfx924PyHq20GVOivftYK/d9T3sfpqLN3zft08KwM=;
	b=AUW3Hrm8QcQ3VgrdUcEB36UM/pla9u/CNPQQTBVa1/0X0dQfOECUA9E5KTDh+6pSo6
	J9C8RGNO76/Tx46bLhCXDBNxdfep6AluaILSW6U9kPm+xPZ3pU+keDv3GGrkckx0wyaw
	MaHCHDCk1SAybWtHnqrXvF7BY+bTD7hKwL5Jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mzcfx924PyHq20GVOivftYK/d9T3sfpqLN3zft08KwM=;
	b=bAEikCQejlz/0TaZyoDOm9X/ooMKEL04YyWdvLoKldNJyHDFphmO0zo0ybmV0w9Cov
	sknaSq1nKgado9GjwWrAskWVW/3c06IUT7++EpFhjrQaVhcvqqwB8FRWkd6cIXe3Oh/B
	VvhQ1AXqyGxWVr9/GYGUPzbiURGHIQOBM5QeZiGz/ziDx2mf35HWMYG8a1LZdGG9Czra
	i04tKSYAdNuK95FtjRMjRJQ26AquGE8oMdt3D7cp63ekB5F+03fdfgt6rZgcddIeQiyI
	AcPAobSUKIpLqirZMrYCfITYhG4i3cl+CFjeAwB9An5v0ia1/IxNf01hzVMm+Tvy+OBw
	2eEQ==
X-Gm-Message-State: AMke39mUx8HL2nCI5OHGW2ImVWNIFXY8cbfgCHmlXjbTikA2SU2rQuefXxvXz4rddIxlBqfe73Gyn/hPqtUkbjnk
X-Received: by 10.223.152.215 with SMTP id w81mr7655252wrb.151.1488631409629; 
	Sat, 04 Mar 2017 04:43:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Sat, 4 Mar 2017 04:43:08 -0800 (PST)
In-Reply-To: <alpine.BSF.2.20.1703032154440.14293@zero.eik.bme.hu>
References: <cover.1488504063.git.balaton@eik.bme.hu>
	<7e582e5ca2aaa7b8b6c1f8a040562b099767ff81.1488504063.git.balaton@eik.bme.hu>
	<CAFEAcA8w9ox2KSSvky6aY3sHG=Xq=h7Wu2F_9UHRtQAKCPTrLg@mail.gmail.com>
	<alpine.BSF.2.20.1703032154440.14293@zero.eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 4 Mar 2017 12:43:08 +0000
Message-ID: <CAFEAcA99umdWSiDkHjSP71cO=HhsjVoQUmFTeLONX9mdWt9aFQ@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22f
Subject: Re: [Qemu-trivial] [PATCH v3 04/13] sm501: QOMify
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
X-List-Received-Date: Sat, 04 Mar 2017 12:43:33 -0000

On 3 March 2017 at 20:56, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> On Fri, 3 Mar 2017, Peter Maydell wrote:
>> Just noticed this. I think reporting the error upwards by
>> failing device realize is better than adjusting the value.
>> It's what we tend to do for other devices. Management tools
>> like libvirt prefer to get hard errors if there's a config
>> file error that means they misconfigure a device.
>
>
> Making this change would need rebasing the whole series again an fixing
> conflicts. Do you insist on this or can we live with this warning which is
> closer to the original behaviour of this device?

Yes, I think we need to correct this.

The original behaviour of this device was "only the embedded
device", where we know that the board won't pass us a wrong
memory size. You're adding new behaviour where the user
can specify the memory size (for the PCI device), so we
need to have that new behaviour be correct and follow
how we handle other devices.

thanks
-- PMM

