Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T9089-0005GA-OF
	for mharc-qemu-trivial@gnu.org; Tue, 04 Sep 2012 16:53:53 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41409)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T9087-0005DC-0w
	for qemu-trivial@nongnu.org; Tue, 04 Sep 2012 16:53:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T9085-0003Kn-4b
	for qemu-trivial@nongnu.org; Tue, 04 Sep 2012 16:53:50 -0400
Received: from mail-iy0-f173.google.com ([209.85.210.173]:52298)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T9084-0003Kb-Vt
	for qemu-trivial@nongnu.org; Tue, 04 Sep 2012 16:53:49 -0400
Received: by iakx26 with SMTP id x26so9271794iak.4
	for <qemu-trivial@nongnu.org>; Tue, 04 Sep 2012 13:53:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=2dqwux0Z6U2P8VLqTNNU3hGjo3/SBL1x6ZLFvFSt6oA=;
	b=cZfbKm/tfgp0rB9VCQ4w/snWRNQEr4ZNjYPTyKq+v/RE+qXD9xgjFDp+hxo5kqgpaU
	LDUhfel42uK8Jc/FZLJF15azHiDnxWHJ43dZpWNT/PXNRt4eZ/BH6PPH8UDk8ZmItefy
	aKShcb/heV2DAoPJOxE59QF+S3W1v+9DEzFbZtAyNhkv0bS0hyFzZ3GQriqEe8W5mezS
	KewhIsf0aIacILOhQNgXH4o7jh2H6hfwDxuPSjkzc6Adzrbol2HE+ClKooeBE+hniZZO
	qP8WbKSa+Kfvxwrkrf4B+mCRw++tJ3CJcaZMnFh2nthr1pvzN02VOd7HzKBbT0xz8j9f
	5N5Q==
MIME-Version: 1.0
Received: by 10.50.194.138 with SMTP id hw10mr15603452igc.60.1346792028354;
	Tue, 04 Sep 2012 13:53:48 -0700 (PDT)
Received: by 10.50.19.36 with HTTP; Tue, 4 Sep 2012 13:53:48 -0700 (PDT)
In-Reply-To: <1346790601-14439-1-git-send-email-sw@weilnetz.de>
References: <1346790601-14439-1-git-send-email-sw@weilnetz.de>
Date: Tue, 4 Sep 2012 21:53:48 +0100
Message-ID: <CAFEAcA-r8N+vzqDfLB4592W6V+Mt=ko=nyqp3syXSxOLBz4OkQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQloIgjfziLKEKDn4OOqadXYUShoNWDfy3Pilxbfj1cfWnpNLze09n4B9+KMwgSOdBKbOXZT
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/xics: Fix one-bit signed
	bitfields
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
X-List-Received-Date: Tue, 04 Sep 2012 20:53:52 -0000

On 4 September 2012 21:30, Stefan Weil <sw@weilnetz.de> wrote:
> Report from smatch:
>
> xics.c:169:19: error: dubious one-bit signed bitfield
> xics.c:170:15: error: dubious one-bit signed bitfield
> xics.c:171:19: error: dubious one-bit signed bitfield
> xics.c:172:25: error: dubious one-bit signed bitfield
>
> Instead of replacing 'int' by 'unsigned', 'bool' was used because
> all 4 values are boolean values.
>
> Replacing 0 and 1 in the assignments by false and true
> looks better for those boolean values.

If we're changing this we should just drop the bitfield usage
entirely and use plain bool, I think.

-- PMM

