Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dhDyn-0006HN-5Q
	for mharc-qemu-trivial@gnu.org; Mon, 14 Aug 2017 07:56:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35123)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dhDyk-0006Ge-Tv
	for qemu-trivial@nongnu.org; Mon, 14 Aug 2017 07:56:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dhDyk-0008FD-7U
	for qemu-trivial@nongnu.org; Mon, 14 Aug 2017 07:56:19 -0400
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:37299)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dhDyj-0008EB-WC
	for qemu-trivial@nongnu.org; Mon, 14 Aug 2017 07:56:18 -0400
Received: by mail-wm0-x22d.google.com with SMTP id i66so41847315wmg.0
	for <qemu-trivial@nongnu.org>; Mon, 14 Aug 2017 04:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iwo7RivoM91dR4m/WhdL8/qYcfSaCNn9Eefia5vS42s=;
	b=Aie74NM/VxiABOFRqv03/tgLlDlQoSGQxrGkdRe+2XhNfqAy7tl1GCjr6Z8fMyckMJ
	eiMDL0ZRH3WmCp27xvSgZ46UXLAGGfoKvAMuRi19BEbg2CwB0qA5gONtNjdy5FF/Inyl
	d+azcwRO02rrxsGi67L0sHSika/oC8Do8Hcr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iwo7RivoM91dR4m/WhdL8/qYcfSaCNn9Eefia5vS42s=;
	b=DOh8SFNt9AVh5uKT+99yjy5IvEtBZVnhRr+Taar7bJrCvYFMO1HwTQQDPBfbhA4V7m
	sQgtcOvDd53RLLCdvVA5z6HcMaegr0PxHJ0nYDjND/aXvFGpGa+x0Kcjgqgcut7HiWym
	hWHAg/wZLXnzyCvQzcK4A9z50E+W1eszWCmIEnCAs29JBdtSFUIC9S4GO89tCCUqzmgu
	uWjBBzsphWxjOI5DAUYVaF7E+4k8ZWrzzjAD+tWJdY0Q2UNk53wFIbMOVF5t/oV9DJAP
	lUYUMvmAX0J1EtGmMke1sl4tblQF2zQnk3Af4e62oWlk7cRr5hrDiAoMpzUdFdjDunrP
	ZziA==
X-Gm-Message-State: AHYfb5iTejXrHoHtuB48MncCuXC5V4nz0KFgBxCh8oPG2tdflkgKLXA2
	TAqJjSX6yzeOYinelnhRhv9fVOn38hIt
X-Received: by 10.28.175.8 with SMTP id y8mr3608738wme.42.1502711776721; Mon,
	14 Aug 2017 04:56:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Mon, 14 Aug 2017 04:55:56 -0700 (PDT)
In-Reply-To: <ff54b90d-9912-ce03-31cf-9fd08571eab2@redhat.com>
References: <cover.1502708830.git.mjt@msgid.tls.msk.ru>
	<a808c0865b720e22ca2929ec3d362d4610fbad51.1502708830.git.mjt@msgid.tls.msk.ru>
	<CAFEAcA-Jac8wFzQ9vRyKjcEwDKYBdXysNyDP7ERFfXFhVcF56w@mail.gmail.com>
	<ff54b90d-9912-ce03-31cf-9fd08571eab2@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Aug 2017 12:55:56 +0100
Message-ID: <CAFEAcA_Fr3U5n+pBqfDk1J9GeaLREU1ttgKvMmmawMF+W1Fi+A@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	KONRAD Frederic <fred.konrad@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22d
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 7/7] hw/misc/mmio_interface:
 Return after error_setg() to avoid crash
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
X-List-Received-Date: Mon, 14 Aug 2017 11:56:19 -0000

On 14 August 2017 at 12:52, Thomas Huth <thuth@redhat.com> wrote:
> On 14.08.2017 13:45, Peter Maydell wrote:
>> It seems like it should be an error to permit this to be
>> created from the command line at all

> That's also what thought first ... but the commit message of commit
> 7cc2298c46a6afa4f4ff7e5cd262809c782d701b says that it "can be
> hotplugged/hotunplugged" ? ... that's confusing ...

It means that memory.c creates and deletes instances of the
device on demand, not that it's hotplugged in the "controlled by
the user simulating PCI or other hotplug" sense.

thanks
-- PMM

