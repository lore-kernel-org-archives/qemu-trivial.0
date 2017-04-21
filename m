Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d1UYh-0008WC-S7
	for mharc-qemu-trivial@gnu.org; Fri, 21 Apr 2017 05:08:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35508)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1d1UYg-0008W1-E8
	for qemu-trivial@nongnu.org; Fri, 21 Apr 2017 05:08:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1d1UYf-0006y2-GU
	for qemu-trivial@nongnu.org; Fri, 21 Apr 2017 05:08:54 -0400
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:37847)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1d1UYf-0006xQ-9N
	for qemu-trivial@nongnu.org; Fri, 21 Apr 2017 05:08:53 -0400
Received: by mail-wm0-x22e.google.com with SMTP id m123so11911896wma.0
	for <qemu-trivial@nongnu.org>; Fri, 21 Apr 2017 02:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aggrdniVsAtY1EhXNK/QYZOp4ZGkypNu1KZUEvV7kdg=;
	b=hIh/euZtHlUi4tgxNJJY1HdT/CpLUm6TJzi8MIS4nsVpp4Y8wWvAlwvziLHcjxSpGp
	g5+eLTetlvZFOe5lbxnmKVxaVWICJAhDQqMAx8U85CwHkHIhFD7hY32CvfGMyxlTvMnz
	deviwfLXo+rR/NfEffdzQtaj0UoB1JZLFW0v0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aggrdniVsAtY1EhXNK/QYZOp4ZGkypNu1KZUEvV7kdg=;
	b=K39/8IOnutcON/9y+i8SpByp/RT2P+CHDHkm0kAZYgazqznGVS59HQfqWqm3oNHkZP
	WCTDgXrRs+SCsZtT9GzIJ62wnor3bbpIQaohL6tIkP5sChynpc1NEITRcURqXOsyT1ii
	+x7aESlLZewjwGneh+kiBvOb9nLDWNObWSLZ/FqWwVnNCHl6aEes7ebmhEvsSjsZwXXK
	QMo3wOW/tDpGNXcky2DLmCbGPwLVbaQjnGReDE4qms8YwqOay+3A2UmSzSE+mQdxLZ5y
	dR7NQAXi4kdIFsZQ1O/xSuemBoFIH1oUFy9I3DOHpLeo68gLT8BjV6vaqL0Gt//oiyw9
	WdKQ==
X-Gm-Message-State: AN3rC/6jWDzHndU8PVirxW4RBWti7HmaK7ckpzycCwA3663OkalXY+ey
	F6obFJtnB66/Cm+Ykhl/hxvXOnlMg7c/
X-Received: by 10.28.236.210 with SMTP id h79mr6721323wmi.92.1492765731876;
	Fri, 21 Apr 2017 02:08:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.68 with HTTP; Fri, 21 Apr 2017 02:08:31 -0700 (PDT)
In-Reply-To: <1485879287-12548-1-git-send-email-peter.maydell@linaro.org>
References: <1485879287-12548-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Apr 2017 10:08:31 +0100
Message-ID: <CAFEAcA-XcuXuK2yEG=tapO3ebbh+_RF1aXj2mv_G5YRF3qoj=A@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	"patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22e
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Drop QEMU_GNUC_PREREQ()
 checks for gcc older than 4.1
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
X-List-Received-Date: Fri, 21 Apr 2017 09:08:55 -0000

On 31 January 2017 at 16:14, Peter Maydell <peter.maydell@linaro.org> wrote:
> We already require gcc 4.1 or newer (for the atomic
> support), so the fallback codepaths for older gcc
> versions than that are now dead code and we can
> just delete them.
>
> NB: clang reports itself as gcc 4.2 (regardless of
> clang version), so clang won't be using the fallbacks
> either.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Applied to master, thanks.

-- PMM

