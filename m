Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1USmx5-0005oi-22
	for mharc-qemu-trivial@gnu.org; Thu, 18 Apr 2013 07:24:31 -0400
Received: from eggs.gnu.org ([208.118.235.92]:42880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1USmx1-0005nL-Bm
	for qemu-trivial@nongnu.org; Thu, 18 Apr 2013 07:24:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1USmx0-0006bT-Eg
	for qemu-trivial@nongnu.org; Thu, 18 Apr 2013 07:24:27 -0400
Received: from mail-lb0-f182.google.com ([209.85.217.182]:40915)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1USmx0-0006bJ-7G
	for qemu-trivial@nongnu.org; Thu, 18 Apr 2013 07:24:26 -0400
Received: by mail-lb0-f182.google.com with SMTP id z13so2586708lbh.13
	for <qemu-trivial@nongnu.org>; Thu, 18 Apr 2013 04:24:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=Orc9Gfp7/dCVbaTzv8EER2XbxkA4ugDp2bKsX7A09Xg=;
	b=el8ILqP1rqY05z1MfdOC8KmLa0WLV7mMAachoilnlhYQE0uINDB4ghdjDR5vLlUbWi
	tB1QqLNSKCf+5PJyFfHiaZgOIAalT9pleF2KzYHdLPUAXZAZtS7y2p2u3WT8hxDGVnqU
	3p4FiwYtNlX2WNOvv7iJsb5PfFX6RhL9M9E3cD0oyw4g+c+zRbrEWmjwdCMFIz629xCh
	q/YMa30TkF0hu9Be1yp4Ni+yTfJdy7N/xrqUsLc6EPTUuLYdgAUfpSwpFNikEp6qE7kW
	gpBUyt93iFpTPsASLBszemOKWjsp3GvjrNI5o5UREPf2m2ukK3VOJxzHOrH2XiMqWKFa
	Uxxg==
X-Received: by 10.112.125.33 with SMTP id mn1mr5660007lbb.89.1366284265117;
	Thu, 18 Apr 2013 04:24:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.198.198 with HTTP; Thu, 18 Apr 2013 04:24:05 -0700 (PDT)
In-Reply-To: <1366283853-31785-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1366283853-31785-1-git-send-email-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Apr 2013 12:24:05 +0100
Message-ID: <CAFEAcA_pR8uik81i5kBGHF-=ZMfLg3xyuDbvxY2d5HwnxXN3hw@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQlN3ptb+jufgmKbz5I5PCq7j4zI+8UhBlSlLGL/pQIReON6Zw16rWszQEEHnx3+jqvInaCi
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.217.182
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
X-List-Received-Date: Thu, 18 Apr 2013 11:24:29 -0000

On 18 April 2013 12:17, Michael Tokarev <mjt@tls.msk.ru> wrote:
> +#ifndef LIBUSB_LOG_LEVEL_WARNING /* older libusb didn't define these */
> +#define LIBUSB_LOG_LEVEL_WARNING 2
> +#endif

By the way, where these are provided by the header, they're
provided as an enum, not #defined constants. So we'll always
#define the define (which will work, but I don't know if you
did this deliberately).

-- PMM

