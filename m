Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UXbH8-0000wl-4i
	for mharc-qemu-trivial@gnu.org; Wed, 01 May 2013 13:57:06 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40335)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UXbH6-0000vl-54
	for qemu-trivial@nongnu.org; Wed, 01 May 2013 13:57:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UXbH4-0001FK-VT
	for qemu-trivial@nongnu.org; Wed, 01 May 2013 13:57:04 -0400
Received: from mail-wg0-x22f.google.com ([2a00:1450:400c:c00::22f]:35408)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UXbAI-0007Md-9X
	for qemu-trivial@nongnu.org; Wed, 01 May 2013 13:50:02 -0400
Received: by mail-wg0-f47.google.com with SMTP id j13so1551352wgh.2
	for <qemu-trivial@nongnu.org>; Wed, 01 May 2013 10:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=FhtEgjkGRIxBJ9RaJPkEww1rnOnRCA5CGTnJnBc7i7M=;
	b=dHb3TqFUBxEVkH8D7z+TCSo71Wsl5VBBetFKZpFwpJ4ueGVy5aAR3hcF8ezXgZyjxy
	Q53rYGWK3tluqTZBmaJrorGPDU5hmVK0lpn5fRw/JqzClxv+65nvu3ATnkTH483yYEE1
	mUfq1/TlvrhYlmYhkuoyg3cywAF6S1pB91XAvFASDaNq6qTnuGk7Di4Pxi+PH/qN8bT5
	fWvs1fcg4X08+hpUWq2K78PY0zs/vmgIJZiqbhW3oBS6K2wuxjelK0shPjggmiuxgC65
	BYC5xdpwa3d2F2yVSgvVOmhQtcIe8BjJroa+5M1m5ePb+djUS58f9cGqXwzERQ8Y0xCB
	RxKA==
X-Received: by 10.180.78.194 with SMTP id d2mr30585999wix.33.1367430601256;
	Wed, 01 May 2013 10:50:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.5.232 with HTTP; Wed, 1 May 2013 10:49:41 -0700 (PDT)
In-Reply-To: <51814C37.4060000@msgid.tls.msk.ru>
References: <1367290790-19159-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<51814C37.4060000@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 1 May 2013 18:49:41 +0100
Message-ID: <CAFEAcA8DWp7GKz8PZGX-9JLYLDk6vVFbz5xstjjSeVpjqe_i6A@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQktoz1jnyXiiDOQnx2xMMOnKjvmR7oDVJONoAC6Qc0ifIJwSP/lRNfyhNqsq0kX8dX7alzt
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::22f
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>,
	liguang <lig.fnst@cn.fujitsu.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] translate: remove
	redundantly included qemu/timer.h
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
X-List-Received-Date: Wed, 01 May 2013 17:57:05 -0000

On 1 May 2013 18:09, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Also, Peter, does your followup email mean your Rewieved-by
> should be added too?

As Andreas says, you don't add R-b: tags unless they
were explicitly given. However in this case I think I
just forgot to write it, so here you are:

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

