Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1USmuu-0004tq-68
	for mharc-qemu-trivial@gnu.org; Thu, 18 Apr 2013 07:22:16 -0400
Received: from eggs.gnu.org ([208.118.235.92]:42545)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1USmur-0004tg-Gt
	for qemu-trivial@nongnu.org; Thu, 18 Apr 2013 07:22:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1USmuq-0006Jb-8f
	for qemu-trivial@nongnu.org; Thu, 18 Apr 2013 07:22:13 -0400
Received: from mail-lb0-f176.google.com ([209.85.217.176]:34487)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1USmuq-0006JO-11
	for qemu-trivial@nongnu.org; Thu, 18 Apr 2013 07:22:12 -0400
Received: by mail-lb0-f176.google.com with SMTP id y8so2532925lbh.7
	for <qemu-trivial@nongnu.org>; Thu, 18 Apr 2013 04:22:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=gSeLOoFq5UeEZ6A5e3WNhDIMps2E99WYLY++3IWfIYo=;
	b=KJaNgKmoHNYH8k4N3Os/TfbEbmHpKPs8lYDshuUBYxZaLmrLs5kddB9j/x6eFGVnMO
	uCEHWU1iHbEYXBKQixu5R6lysE/fdz9MbtAPEQuuSs7Th5OW2JyL1GZBexG5bYY0WiYQ
	d8ZUUjcj362Zye62hejeClCVaWKzsKElVjEkS2JM4rMdzr4k/7cKaN9VbL4EI+TCv7fp
	mgo2tl2o/py34cdDFXAn3dAYtkxAOajYPBVriYJR+1jk3qpEv+3TBJc9nJ15EcuQ8J1N
	JUSMXrrZTJ5b/dmFlBFnwQBKApPV/M4nYVtaIqJP5dPUONxtsgFnqZjWq50Kn3BNn6/N
	CgoA==
X-Received: by 10.152.9.37 with SMTP id w5mr5599079laa.15.1366284130970; Thu,
	18 Apr 2013 04:22:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.198.198 with HTTP; Thu, 18 Apr 2013 04:21:50 -0700 (PDT)
In-Reply-To: <1366283853-31785-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1366283853-31785-1-git-send-email-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Apr 2013 12:21:50 +0100
Message-ID: <CAFEAcA80vAobT2+mcZ7BxLUdjH_39W3KK2noWna_NMutpDmy8A@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQmJDb/qPOv2TtTxDtHmlXRUdc8uiR1ApPxBtm+EzlWbkfGHZmw1I/aV/b07p5yoJKydkwKY
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.217.176
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] allow usage of older libusb which didn't
	define LIBUSB_LOG_LEVEL_WARNING
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
X-List-Received-Date: Thu, 18 Apr 2013 11:22:14 -0000

On 18 April 2013 12:17, Michael Tokarev <mjt@tls.msk.ru> wrote:
> diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
> index 29f35b3..78c315f 100644
> --- a/hw/usb/host-libusb.c
> +++ b/hw/usb/host-libusb.c
> @@ -1251,6 +1251,9 @@ static Property usb_host_dev_properties[] = {
>      DEFINE_PROP_UINT32("isobufs",  USBHostDevice, iso_urb_count,    4),
>      DEFINE_PROP_UINT32("isobsize", USBHostDevice, iso_urb_frames,   32),
>      DEFINE_PROP_INT32("bootindex", USBHostDevice, bootindex,        -1),
> +#ifndef LIBUSB_LOG_LEVEL_WARNING /* older libusb didn't define these */
> +#define LIBUSB_LOG_LEVEL_WARNING 2
> +#endif

Can we put this up near the top of the file rather than in the
middle of the Property list definition, please?

thanks
-- PMM

