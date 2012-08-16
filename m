Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T1zUL-0001BY-Ef
	for mharc-qemu-trivial@gnu.org; Thu, 16 Aug 2012 08:47:49 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43945)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T1zUG-0001BD-Dx
	for qemu-trivial@nongnu.org; Thu, 16 Aug 2012 08:47:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T1zUF-0001MW-DW
	for qemu-trivial@nongnu.org; Thu, 16 Aug 2012 08:47:44 -0400
Received: from mail-yx0-f173.google.com ([209.85.213.173]:59238)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T1zUF-0001MS-9K
	for qemu-trivial@nongnu.org; Thu, 16 Aug 2012 08:47:43 -0400
Received: by yenm4 with SMTP id m4so2826383yen.4
	for <qemu-trivial@nongnu.org>; Thu, 16 Aug 2012 05:47:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=4YLkWIgX/pE+SSvEoPpUAtl3tKHlcYOTyyZsahgB6Lk=;
	b=lMfLoT5wJZfvi+HmcsHv+q7+lTO4uGDYG21FntMBfdpRJKUUZc9sTUnHdKk5bpETDW
	1KulnXOytHstHpft+hr7rXatr0al8h8rMGm5fqgicKXHt07JdZG0QM9/BJQjAWlNd3up
	r/z/S6bshuELfWz2Ulaz+li9Yg18+jwEFK37z1Tl2/2UPlYh/eKwE4vo8ltiQ8yu0qKJ
	g/vccchvDgN42pdSmeaTzhOEARF+JAhUv2uZtKUR4+UEBpnswxHbp8UtvmWZfJrkomd+
	GlIO4mnF80WqYuwHvLDYCSBEs9UDRTUfdBuXZGkSocUcYw8g0U6bumT9/mFeoUMMAA9e
	GLHA==
MIME-Version: 1.0
Received: by 10.50.236.4 with SMTP id uq4mr1311546igc.18.1345121262429; Thu,
	16 Aug 2012 05:47:42 -0700 (PDT)
Received: by 10.50.3.9 with HTTP; Thu, 16 Aug 2012 05:47:42 -0700 (PDT)
In-Reply-To: <1344629007-23311-1-git-send-email-sw@weilnetz.de>
References: <1344629007-23311-1-git-send-email-sw@weilnetz.de>
Date: Thu, 16 Aug 2012 13:47:42 +0100
Message-ID: <CAFEAcA-n2umNP7HYL-UDPN7qMEsyAkjUiOb0YJNavzDuBZ4oyA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQmz7HHh9i12bbE0Jjj0/E3xEkfu4vm0KqD0fFSf9T04XAxTOKKUKqJVLvN0Xlf/Lyyzt+ga
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.213.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Spelling fixes in comments
	and documentation
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
X-List-Received-Date: Thu, 16 Aug 2012 12:47:48 -0000

On 10 August 2012 21:03, Stefan Weil <sw@weilnetz.de> wrote:
> diff --git a/docs/usb2.txt b/docs/usb2.txt
> index d17e3c0..21f6d14 100644
> --- a/docs/usb2.txt
> +++ b/docs/usb2.txt
> @@ -58,11 +58,11 @@ try ...
>  xhci controller support
>  -----------------------
>
> -There also is xhci host controller support available.  It got alot
> +There also is xhci host controller support available.  It got a lot

"is also"

>  less testing than ehci and there are a bunch of known limitations, so
>  ehci may work better for you.  On the other hand the xhci hardware
>  design is much more virtualization-friendly, thus xhci emulation uses
> -less ressources (especially cpu).  If you wanna give xhci a try
> +less ressources (especially cpu).  If you want to give xhci a try

"resources"

-- PMM

