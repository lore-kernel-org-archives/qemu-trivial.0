Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g21B7-0006Q3-O4
	for mharc-qemu-trivial@gnu.org; Mon, 17 Sep 2018 17:35:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46261)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g21B5-0006PA-R6
	for qemu-trivial@nongnu.org; Mon, 17 Sep 2018 17:35:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g214A-0001Fo-HZ
	for qemu-trivial@nongnu.org; Mon, 17 Sep 2018 17:28:24 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:38028)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g214A-0001ER-5b
	for qemu-trivial@nongnu.org; Mon, 17 Sep 2018 17:28:22 -0400
Received: by mail-ot1-x341.google.com with SMTP id n5-v6so12862295otl.5
	for <qemu-trivial@nongnu.org>; Mon, 17 Sep 2018 14:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pnAD9frVicHwJn8zyTRgXXTvCYdRwdaZESdMVdWi5+M=;
	b=HA0Na/v14SW2ZxHBroGpUdDVnFpIunhmj9xMBWFo34Uoqabvv2hMhSdKgndr37nnsb
	5AUbZpCF7XDHhd0uqHrEb3wmbXKeGfID1RNDFWTAjKhaTSFwZmOE0fb4sMnWH6vM+6Tz
	Tsp4KM+bi0I6KLpw1nTRdrh8xdiFxtb60SziA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pnAD9frVicHwJn8zyTRgXXTvCYdRwdaZESdMVdWi5+M=;
	b=Oaw82MpFMGu8EtACSuGdA9aJ5aKJ1K0cIFg/9nK7/ZnDUAh5Max6ChOEL4cQycnuvs
	nCwzES1HhDJR2q7ulVdOOFxXfpwTuyidUwRbzxzlCS6Lo5gu0eKeZxj2/clh5LUrnkaH
	T5Nz4xDcLbrQ6Vrnp0F7oGy2LCt4bh49H84MD/goss4/KpvbF0wpApKM6aiWWmava1oR
	L1ZBxtnps3d0L6wAQ/5ZlwQ3IpcQJe93CdNSq+2CnMQ96n8yPPGKGSP0F4SjhnE/CIms
	xdbK0lLQdx2rhFQ6Uw/QYjCkbVIMiCgkDLLSuy4j7XKTJUsXGuoqYdoI1UqQXNZyHeP7
	4j5g==
X-Gm-Message-State: APzg51CjrwSqZ37C706OjwaIHiw0kxw7UYXI1SAwxf6nLzUByv9nSvMt
	5Yr83LtsPWmsQ+Wn60HjyzHxNlqXSx5eXHXfZksquw==
X-Google-Smtp-Source: ANB0Vdao+Fk73bWRxAgwQMi2IHk64q2JhGSud9mInwNUGvzhU0JZz4/bMjF6bXfafcsKi9ycI2RiAP6BIwucK9g6aP8=
X-Received: by 2002:a9d:82f:: with SMTP id
	44-v6mr14335473oty.377.1537219700189; 
	Mon, 17 Sep 2018 14:28:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Mon, 17 Sep 2018 14:27:59
	-0700 (PDT)
In-Reply-To: <1537204134-15905-1-git-send-email-thuth@redhat.com>
References: <1537204134-15905-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Sep 2018 22:27:59 +0100
Message-ID: <CAFEAcA8hKwQaOryPY1i+uiO6Skf0mduswE+jXNcpifrOX=+MOQ@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] accel/tcg: Remove dead code
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
X-List-Received-Date: Mon, 17 Sep 2018 21:35:32 -0000

On 17 September 2018 at 18:08, Thomas Huth <thuth@redhat.com> wrote:
> The global cpu_single_env variable has been removed more than 5 years
> ago, so apparently nobody used this dead debug code in that timeframe
> anymore. Thus let's remove it completely now.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

It's also x86-specific debug (R_CS) in the middle of a
generic file, which is pretty ugly, so we're well rid of it.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

