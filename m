Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1an6tv-0002tH-7r
	for mharc-qemu-trivial@gnu.org; Mon, 04 Apr 2016 11:58:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37731)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1an6ts-0002pl-Rx
	for qemu-trivial@nongnu.org; Mon, 04 Apr 2016 11:58:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1an6to-0008AC-FP
	for qemu-trivial@nongnu.org; Mon, 04 Apr 2016 11:58:48 -0400
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:36111)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1an6tn-00089h-8r
	for qemu-trivial@nongnu.org; Mon, 04 Apr 2016 11:58:44 -0400
Received: by mail-vk0-x233.google.com with SMTP id c4so60175353vkb.3
	for <qemu-trivial@nongnu.org>; Mon, 04 Apr 2016 08:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IJVawAnYxW+wveNVtp8TDGV8YWsxT1b7RzI4kGJ1ZEg=;
	b=RY5Ku/hT97MDr5dx+tylugITrOTdlkNZGnaYgHDZvzePbCZNeL2A+p6hbdWkpc+bC9
	+0qfj1Dm+5InTAa5IyTWOCBEav2ZLlBd4FHxzBoFavJ2Qe+wB7bX/7lNkZJ0I0CGwZnV
	99HhSpxArvIYsPLBWgSQwh5zOL3Zczaeh9V/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IJVawAnYxW+wveNVtp8TDGV8YWsxT1b7RzI4kGJ1ZEg=;
	b=UWJLGtW+iJYhJYCdglR32kAaGcbUlm/QZ0XOuc0YmtdG6/AIVJrFhVlubQQzMwnL5j
	7XkuRu6LyFeX8CBvJNvyvmHJslguwbztVhmXQ8bRDkv8NxTJEZyUylRhksmHjOuMk/ry
	WZJsWcsLEp//WkkJOSOw2RbBI3ZYEWAwp56UXH/5eLpTfBliHfa7NZVIyitfD06x3l+V
	wWT43FtMls4zGdIlnunzjlXysYINHgsygkLMPksW3KB0ZYTYDQhgfIRe7Fi6hBOLxXsD
	Kop/eEirblHU0Of3UjoUM6wnNbraZaz3OJuKOXG+wICujMu5HLz27oj9as0Hu0g6ZGFN
	jJUw==
X-Gm-Message-State: AD7BkJKcFvgufE3cBdu3kRfi4of1m0uqbqRr2T3vfvmEcpy2iszYaPkEVuOlPd6O2xGJR4S6XwoJ71V6JB9betMz
X-Received: by 10.31.7.138 with SMTP id 132mr7003068vkh.92.1459785522425; Mon,
	04 Apr 2016 08:58:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Mon, 4 Apr 2016 08:58:23 -0700 (PDT)
In-Reply-To: <1459781903-64465-1-git-send-email-emaste@freebsd.org>
References: <1459781903-64465-1-git-send-email-emaste@freebsd.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Apr 2016 16:58:23 +0100
Message-ID: <CAFEAcA-JKW_DKJhG-XF2sYszKtKog5-r_5ZCWvDEGeYt0tK2Zg@mail.gmail.com>
To: Ed Maste <emaste@freebsd.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] bsd-user: add necessary
	includes to fix warnings
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
X-List-Received-Date: Mon, 04 Apr 2016 15:58:49 -0000

On 4 April 2016 at 15:58, Ed Maste <emaste@freebsd.org> wrote:
> Signed-off-by: Ed Maste <emaste@freebsd.org>
> ---
>  bsd-user/syscall.c | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

-- PMM

