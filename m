Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjyAX-00012J-8T
	for mharc-qemu-trivial@gnu.org; Tue, 04 Jun 2013 16:49:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57603)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UjyAV-000122-8s
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 16:49:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UjyAT-0005g0-KB
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 16:49:23 -0400
Received: from mail-la0-x22b.google.com ([2a00:1450:4010:c03::22b]:57260)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UjyAT-0005fj-DL
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 16:49:21 -0400
Received: by mail-la0-f43.google.com with SMTP id gw10so718183lab.16
	for <qemu-trivial@nongnu.org>; Tue, 04 Jun 2013 13:49:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=cFk2uEqKjFjC46sh1MpF7PKYv/CFchj+hk94REVrqBc=;
	b=ae7dRFYxlbnJoBTSPOVHKTsCcDLdV26BUUMggra5dYdwbIjxMKEmVrppuioU3EvmkI
	2Tpc9F+MDNMeJjcYZJslm9DgBUKXAB6lat3V+bY9H07STxKr4IKU5OUxVQ9MThMqS1Ju
	/liEGsjeupfIsgK3Aazhb4fXEJrXv599NV11eef2XvZrZkRPhdF5ep9CCaQ9XnAVj6g6
	2qQO1nTm0g56Wr+EgdbrOtkdZZLba8UPiKQP/IU9Oe2a+sVAvBnnp1j9obz6djjJxZcd
	yO55jzE29Sh2cxluddC514fP0EnDI3LMZwWkiH9vJdW0+RMCVwYColqaL9Z29QZHQkLF
	XxdQ==
X-Received: by 10.112.35.69 with SMTP id f5mr13396462lbj.105.1370378959716;
	Tue, 04 Jun 2013 13:49:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.2.39 with HTTP; Tue, 4 Jun 2013 13:48:59 -0700 (PDT)
In-Reply-To: <1370377419-31788-1-git-send-email-alevy@redhat.com>
References: <1370377419-31788-1-git-send-email-alevy@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Jun 2013 21:48:59 +0100
Message-ID: <CAFEAcA9r4iM-a-v4GhNzN53za5iToH5r3F-EEENRL5J5bziUQA@mail.gmail.com>
To: Alon Levy <alevy@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQkWtv7Y1jKGLcqQNlCHXfVFO+WGQ7rknifIkFrKuPyppj/hFVkSiVe+a1wrmwiu9cDNi64I
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::22b
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/5] oslib-posix: add
	qemu_pipe_non_block
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
X-List-Received-Date: Tue, 04 Jun 2013 20:49:24 -0000

On 4 June 2013 21:23, Alon Levy <alevy@redhat.com> wrote:
>
> +int qemu_pipe_non_block(int pipefd[2])
> +{
> +    int ret;
> +
> +    ret = qemu_pipe(pipefd);
> +    if (ret) {
> +        return ret;
> +    }
> +    if (fcntl(card->pipe[0], F_SETFL, O_NONBLOCK) == -1) {
> +        return -errno;
> +    }
> +    if (fcntl(card->pipe[1], F_SETFL, O_NONBLOCK) == -1) {
> +        return -errno;
> +    }

    qemu_set_nonblock(card->pipe[0]);
    qemu_set_nonblock(card->pipe[1]);

> +    if (fcntl(card->pipe[0], F_SETOWN, getpid()) == -1) {
> +        return -errno;
> +    }

You should either just trust that the fcntl() succeeds
(as we do in qemu_set_block() and friends), or you need
to close the pipe fds on failure here.

> +}

You've forgotten to return anything at the end of the function.
(surprised the compiler didn't pick that up, maybe it's
one of the warnings that needs optimimisation turned on).

thanks
-- PMM

