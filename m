Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bsWSC-0001My-Ug
	for mharc-qemu-trivial@gnu.org; Fri, 07 Oct 2016 10:48:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56456)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bsWSA-0001LY-MM
	for qemu-trivial@nongnu.org; Fri, 07 Oct 2016 10:48:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bsWS9-0006lO-Rh
	for qemu-trivial@nongnu.org; Fri, 07 Oct 2016 10:48:50 -0400
Received: from mail-ua0-x235.google.com ([2607:f8b0:400c:c08::235]:33681)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bsWS9-0006ko-Cz
	for qemu-trivial@nongnu.org; Fri, 07 Oct 2016 10:48:49 -0400
Received: by mail-ua0-x235.google.com with SMTP id p102so46856255uap.0
	for <qemu-trivial@nongnu.org>; Fri, 07 Oct 2016 07:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/qzglz2LSPEP4spr2UEzxHj31w/02orv3qrecVD/uNQ=;
	b=U0m8OZrscayn5kclkymS5b26jzhK4qv4iyt83rnFyKOK8Qayq0HWJLb4QtwRKrK42L
	I5h+jmdTAyz+NQk/AiWVgnTNYtDhYilaRXRch+1pHCl5kGUdU8b81mSzzugg9+p90Mli
	v+3dId6PZjlDEAjzNTcmOYU67vQWIp5gpAYMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/qzglz2LSPEP4spr2UEzxHj31w/02orv3qrecVD/uNQ=;
	b=mksZ2/EjqN6ks1fVuDM9FBnkSWq+7VchL8PrxsI3vZEgLUUTmOvCX/XudW5ax12qNO
	yivsYdNtJnKHa9+vg6Ysydp0oux6UyNDt874WSBgLs1orzq2kDuIWxsUQCMdZzgqwfRz
	yVoL72cQcF/TSc1mZP43BPg6UoKcntrMq+dbSmmWPHN6+SeuOeeNKLhCyAimeCHqUhiv
	rAoKp98NBqhKXXCp0AyZyE0ChLIlyczRJD8DNJA6JmK51VjkbIQjl10aoEU6xnLs6IKm
	/xajlELdZ5pbPYGuhN9l0Yy5j2i01rIEzTeQHNm8jebAJTtivkp04U0bHGWxaVuTMniY
	iyfQ==
X-Gm-Message-State: AA6/9RluAZXeSfpUP6zIUCNq0Hh4n8sBkk+Q1luC5Mop4/kbFeRyF1G96BR3FFAiAoJzGMteoX0TRdvYshqSRrsC
X-Received: by 10.176.69.238 with SMTP id u101mr14977222uau.175.1475851728673; 
	Fri, 07 Oct 2016 07:48:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Fri, 7 Oct 2016 07:48:28 -0700 (PDT)
In-Reply-To: <1475829975-17413-1-git-send-email-anand.indukala@gmail.com>
References: <1475829975-17413-1-git-send-email-anand.indukala@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2016 15:48:28 +0100
Message-ID: <CAFEAcA8Cq6PppL1T28V75D54h0EmAGMa8KMCwhRUdjC5uhAfpA@mail.gmail.com>
To: Anand J <anand.indukala@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::235
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] clean-up: removed duplicate
 #includes
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
X-List-Received-Date: Fri, 07 Oct 2016 14:48:51 -0000

On 7 October 2016 at 09:46, Anand J <anand.indukala@gmail.com> wrote:
> Some files contain multiple #includes of the same header file.
> Removed most of those unnecessary duplicate entries.
>
> Signed-off-by: Anand J <anand.indukala@gmail.com>

>  disas/libvixl/vixl/globals.h        | 1 -

This is a third party file which we copy into our tree;
we prefer to avoid making changes to our local copy unless
they're critically required.

thanks
-- PMM

