Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZEZY1-0007c3-H4
	for mharc-qemu-trivial@gnu.org; Mon, 13 Jul 2015 04:57:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34467)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZEZY0-0007ar-0B
	for qemu-trivial@nongnu.org; Mon, 13 Jul 2015 04:57:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZEZXu-000244-26
	for qemu-trivial@nongnu.org; Mon, 13 Jul 2015 04:57:11 -0400
Received: from mail-vn0-f54.google.com ([209.85.216.54]:44667)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZEZXt-00023m-Um
	for qemu-trivial@nongnu.org; Mon, 13 Jul 2015 04:57:05 -0400
Received: by vnbg129 with SMTP id g129so37366102vnb.11
	for <qemu-trivial@nongnu.org>; Mon, 13 Jul 2015 01:57:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=tIutYUcOhtURhJFYbkyCNSLoNx0U1rgl+3c86TmpSlo=;
	b=IOiURKWe/9OuHwKoSOTCMMwV92WJSkP9u7fpqLoUxfY4xiQpYHzL3RSFAW+AiPWGTl
	K1uKzBNvuGX+LOsmPASmXiiLUxYL7a7x0KelwUS7rVO9YsNQPQTx8pim0LzPrYRR0Ooe
	myNYtH3awy/M+ySoAoex96TTltg80TRD5QkMGLralYhLmH3CXwJYlqwouv0wS1m+cJ6U
	WBQ/WvgtRHfYNI/8+pnham93oHUAryqNcYx5uTrugCxV+zqNW9BuUIXPkyKl/pD99SeO
	w6B95EVM4lk5RDf0SAjW9f076JW66/P2kjkjmNoEiAk5x6tKAATAr2wBzD91AyXNTaU0
	w6Lw==
X-Gm-Message-State: ALoCoQn5VRX7QPRGdvgfxHxkL83zAVVUPmLoj4xbFGKHqPNFBFee5Dt/L5Tyk01WC0DeOC2AAacU
X-Received: by 10.52.113.97 with SMTP id ix1mr29458542vdb.1.1436777825523;
	Mon, 13 Jul 2015 01:57:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.135 with HTTP; Mon, 13 Jul 2015 01:56:46 -0700 (PDT)
In-Reply-To: <1436772617-2490-1-git-send-email-kraxel@redhat.com>
References: <1436772617-2490-1-git-send-email-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Jul 2015 09:56:46 +0100
Message-ID: <CAFEAcA9gbPB8PTimK7J=wAC8gtQtgFxLhEkGOESD1r52f9-m6w@mail.gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.216.54
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] virtio-input: enable on
	non-linux hosts
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
X-List-Received-Date: Mon, 13 Jul 2015 08:57:12 -0000

On 13 July 2015 at 08:30, Gerd Hoffmann <kraxel@redhat.com> wrote:
> As we include a copy of the linux input layer header file in the qemu
> source tree (include/standard-headers/linux/input.h) the virtio-input
> bits (except pass-through) should build and work just fine on non-linux
> hosts too.  Tweak Makefile accordingly.

Does "should" here mean "I haven't actually tested it" ? :-)

thanks
-- PMM

