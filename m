Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ggwbl-0006hh-9i
	for mharc-qemu-trivial@gnu.org; Tue, 08 Jan 2019 14:00:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ggwbi-0006gA-M0
	for qemu-trivial@nongnu.org; Tue, 08 Jan 2019 14:00:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ggwbf-0004Lj-IU
	for qemu-trivial@nongnu.org; Tue, 08 Jan 2019 14:00:10 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:42963)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ggwbe-0003zK-GM
	for qemu-trivial@nongnu.org; Tue, 08 Jan 2019 14:00:07 -0500
Received: by mail-ot1-x342.google.com with SMTP id v23so4442059otk.9
	for <qemu-trivial@nongnu.org>; Tue, 08 Jan 2019 10:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RMChPQU/qfqWhy6QfX3Sjm+dYcTzAExfn8wTdtx7HzQ=;
	b=hoRvoY+G5GE2ZszeO27MHlIFvgvyuQC1Q/o6BDNY2qepiNv+zAfigKrLMKbngIUfEZ
	m7Wj3sQllbTqsGWNM121lqefQhuozyKQAmcigNlWu5010x84sAxV7u9nb52BIFlDU7Ua
	LSNs63BXIgQCu5RYtXa4nuvVHnEZqu4ANbg5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RMChPQU/qfqWhy6QfX3Sjm+dYcTzAExfn8wTdtx7HzQ=;
	b=tOjsSzuG+WN/HDmBLBlY7KiioB+vZMbaNebOudwAOOEKPAPEyTAkcidNPXwbvfvM7q
	B2aWl0Ja+IdryN3WY0LJH5WIMarO8CZyRkJL73W2pCAud9fHmlRJD5Um4j7mOkCKdfhG
	ygOFAozyZLTi2Ehh/ahRQue/Sq3j/+R/dQGgkVKivGd9mg5sN13PaCSdJGgllIggwNmC
	F9VOqXWxLQtVWKfkaGjbjxEIoOA3bwMwUoT0McptVYKn5Gy7TkIxg4ItnHIMuC8h7qXC
	20SY/2Li80zBjmDItOhqEDQw0xt1ZuWzeXMkPaTYTRWHLcZ4qSMShy1AjiPHaflDyxql
	ZdNw==
X-Gm-Message-State: AJcUukc7uJypPENYlGVNQ4XMhuWZY194SDGDVq4us1SpmtCz9HprMqQ6
	m4PZpl+FrihaeMpm52jT+bL1JuZnBBOb8QGEYdXCMg==
X-Google-Smtp-Source: ALg8bN5vsOHonSKtmasZ1o6rD2pxyl0eCab6FIc26TLEgjCe1VPjLZHFKtUPkmCnPof64RtZsDMDvI7WHCm6gpdW9QM=
X-Received: by 2002:a9d:6f0b:: with SMTP id n11mr1830382otq.363.1546973997782; 
	Tue, 08 Jan 2019 10:59:57 -0800 (PST)
MIME-Version: 1.0
References: <20180908182205.GB409@mornington.dcs.gla.ac.uk>
	<CAFEAcA83dVVyQLsADoNBN7feFxnWcVr5r0SPA8PffaG2140yPw@mail.gmail.com>
In-Reply-To: <CAFEAcA83dVVyQLsADoNBN7feFxnWcVr5r0SPA8PffaG2140yPw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Jan 2019 18:59:46 +0000
Message-ID: <CAFEAcA-CWxOufmf-UF8m=nH-kUXDym-yPr1y1VU5Dp_jQ71yrA@mail.gmail.com>
To: Tony Garnock-Jones <tony.garnock-jones@glasgow.ac.uk>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Riku Voipio <riku.voipio@iki.fi>, qemu-stable <qemu-stable@nongnu.org>, 
	Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: write(fd, NULL,
 0) parity with linux's treatment of same
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
X-List-Received-Date: Tue, 08 Jan 2019 19:00:11 -0000

On Thu, 3 Jan 2019 at 18:31, Peter Maydell <peter.maydell@linaro.org> wrote:
> Hi; following up on this, we've just had
> https://bugs.launchpad.net/qemu/+bug/1810433 which is
> a report of the same NULL/0 bug for pwrite64. Looking at the
> kernel code I see that both the write and pwrite64 syscalls
> go through the same vfs_write() common function, so their
> behaviour for NULL/0 should be identical. Experimentally,
> stracing the 1810433 test program gives
>  pwrite64(3, NULL, 0, 0)                 = 0
> so we do indeed need to special case NULL/0 there as well
> as in write().
>
> The extra fix should be straightforward -- does anybody
> feel like writing up a patch for it?

I've just sent a patch:
https://patchwork.ozlabs.org/patch/1022092/

thanks
-- PMM

