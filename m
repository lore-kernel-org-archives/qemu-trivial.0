Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1da0Ze-0004XL-6K
	for mharc-qemu-trivial@gnu.org; Tue, 25 Jul 2017 10:12:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55260)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1da0Zb-0004V6-Nx
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 10:12:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1da0ZY-0003Sj-IB
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 10:12:31 -0400
Received: from mail-wr0-x231.google.com ([2a00:1450:400c:c0c::231]:33797)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1da0ZY-0003SK-9r
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 10:12:28 -0400
Received: by mail-wr0-x231.google.com with SMTP id 12so119802636wrb.1
	for <qemu-trivial@nongnu.org>; Tue, 25 Jul 2017 07:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=OjivPNwH41lbjOrSq7ZYsnI6cbYUoQqYUeF0bAQUx78=;
	b=AJYUo8UGd0UE5xzPMrCCu6uqit/bApbeqVeEdltrY3YbHq95EmH+l/oyDLsmzWADNw
	m7AJDPbSva+K3MDPw2R1uQ+I8BcMgM9P6YNctXFnGXQu7VNAIvaaovSBFlTBKA6Un0ta
	8X92xlT4/M0HvVIVtYu0R2VQmMdpIYlMLit/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=OjivPNwH41lbjOrSq7ZYsnI6cbYUoQqYUeF0bAQUx78=;
	b=ABrD3+ckxFal0Q3wmQZ5SQO6Nx+YJPNQw8fgm9wJ0agL2JV0tB5d/3FAQQZLuaBQxe
	rMBQ+MXUxGrM02LG9Ekfvzz6BzW65HLjSasHxIU+9k+Hy4i8oyEK2I6iB5QAbIG2p86k
	mKQkeXI80oVMlMQ/NGqDJXVfmoxTzmdWU57I9la5IXS+6OcT4nCCI6p8vT+cxqisw+Ra
	rpCFmz0o5qESLhPwlL0QScTY+4RzbtvnDmEtWfQqhzIGLp6DYR8492Zn2+2yQ8EgdNMf
	4azQriHgmWFyUd5sytrdukugqTOsMUn6MWPe/z8Wn1tHtiZmdBbl2l+NOYZERG9LfrNK
	+U+g==
X-Gm-Message-State: AIVw112lKpG6s2GGIVmYyHQHROeQf85rg7a/ORLPFnRqKtZbVdakuRIH
	Tx29XRaBgxkeEnhl
X-Received: by 10.223.165.23 with SMTP id i23mr5247550wrb.35.1500991947010;
	Tue, 25 Jul 2017 07:12:27 -0700 (PDT)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	c47sm10535108wrc.7.2017.07.25.07.12.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Jul 2017 07:12:25 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 37CED3E0127;
	Tue, 25 Jul 2017 15:12:25 +0100 (BST)
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-36-f4bug@amsat.org>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Eric Blake <eblake@redhat.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
	<marcandre.lureau@redhat.com>, Fam Zheng <famz@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
In-reply-to: <20170724182751.18261-36-f4bug@amsat.org>
Date: Tue, 25 Jul 2017 15:12:25 +0100
Message-ID: <87lgncehbq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::231
Subject: Re: [Qemu-trivial] [RFC PATCH for 2.10 35/35] script to run docker
 image
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
X-List-Received-Date: Tue, 25 Jul 2017 14:12:32 -0000


Philippe Mathieu-Daudé <f4bug@amsat.org> writes:

> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  scripts/dockershell | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100755 scripts/dockershell
>
> diff --git a/scripts/dockershell b/scripts/dockershell
> new file mode 100755
> index 0000000000..f6a2276172
> --- /dev/null
> +++ b/scripts/dockershell
> @@ -0,0 +1,30 @@
> +#! /bin/sh
> +
> +# This script starts a docker shell with QEMU directory mounted
> +#
> +# Copyright (C) 2017 Philippe Mathieu-Daudé. GPLv2+.
> +#
> +# Usage:
> +# ./scripts/dockershell qemu:debian-bleeding-dev
<snip>

This isn't appropriate for 2.10 now we are feature frozen. That said I
have pondered a helper script for this sort of thing before. As it stand
I just rely on my shell to remember the correct invocation for me.

This is the sort of functionality we would need for maybe cross
compiling tests using docker.

--
Alex Bennée

