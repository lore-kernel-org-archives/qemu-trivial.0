Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gnaoh-0008M5-6F
	for mharc-qemu-trivial@gnu.org; Sat, 26 Jan 2019 22:09:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59114)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shorne@gmail.com>) id 1gnaoe-0008KC-Px
	for qemu-trivial@nongnu.org; Sat, 26 Jan 2019 22:09:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shorne@gmail.com>) id 1gnaod-0001vm-LF
	for qemu-trivial@nongnu.org; Sat, 26 Jan 2019 22:09:00 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:42497)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <shorne@gmail.com>)
	id 1gnaob-0001tP-6F; Sat, 26 Jan 2019 22:08:57 -0500
Received: by mail-pg1-x543.google.com with SMTP id d72so5756933pga.9;
	Sat, 26 Jan 2019 19:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=NJQjBDh24q3u7PEex/fWKno2Ygk++Hh61OSAlzBytkg=;
	b=QS9zIImiBZ6BuKNAl+zgJtPNAYYpt0/jIRmd41MPb58VjQNlJ+8eBa7oxqy26loHGv
	SqPqyOgYAtw7uaCeI0mWN8GpL2NcBkXeeAJ4su2pYt1qVmC//9CJ1lm20GGvmJjr9Hoy
	MxgLnnTZSp2KfRyB8FZahQW2EeTIdRUy8vOM3cwR3IQFqqbObE9fcOB7ztlF+cUSWEy9
	W6ztrfsgNraQA5k8I57jNsDndOn/9WSWesV/q1mjBpXZhqEZSSAt+J/D9ymzSsIqozFP
	3GQWaYYjWqIxa6Ky+RKDTyNKA0SWL/gcKbwTZ68se+5oaySI1iEAU1pVYBbzGqzdT8jc
	/jhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=NJQjBDh24q3u7PEex/fWKno2Ygk++Hh61OSAlzBytkg=;
	b=GQUyixExKSfeTqePQcMkvLA+xiTPcm5BGlQPi78mmApHf5aBz0Ne4pEeOivpls02DU
	VVAMdMpklD5TAWv/J904pF2cLOYUD03sxnk5MgQnfNW33mbVScMFnKKAJ7VOHj0LWZpb
	cFImgBHTm3xkG/wjGbjyU2kQb0/KipSdRvjZH8A0LcP3UdmR4+UirYfHDAbESdozPuww
	pzS/j0XiMqaVD+h1jZuiViFE/0ZAKNi5jrYzCwFKsl5gm/KAggqgstIBuoxYteO0iMLz
	tXgFNQAWKZk9dwLeO7AhviisybCswfo3Pr1jBiGKncyhf3KjU2RIZI+CS0JznsUy7miV
	KBGg==
X-Gm-Message-State: AJcUukcAA+CHXO5dEKnYNMOP90jkYLSb4DA4xPHaXvpXm8rnrXO9Aj7R
	Emu6XnW8rokng/iqzwuDoN4=
X-Google-Smtp-Source: ALg8bN71zzvg4gXzdUyim45+9k/ohqVQuUyKaweIbIgCe/YWBkWxUAACydTXyF6OmlfmsRx/xTU+DA==
X-Received: by 2002:a63:ff62:: with SMTP id s34mr15374014pgk.325.1548558535502;
	Sat, 26 Jan 2019 19:08:55 -0800 (PST)
Received: from localhost (g206.124-44-15.ppp.wakwak.ne.jp. [124.44.15.206])
	by smtp.gmail.com with ESMTPSA id
	u87sm72480536pfi.2.2019.01.26.19.08.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 26 Jan 2019 19:08:55 -0800 (PST)
Date: Sun, 27 Jan 2019 12:08:53 +0900
From: Stafford Horne <shorne@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20190127030853.GV3235@lianli.shorne-pla.net>
References: <1548252536-6242-1-git-send-email-thuth@redhat.com>
	<1548252536-6242-3-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1548252536-6242-3-git-send-email-thuth@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: Re: [Qemu-trivial] [PATCH 2/4] target/openrisc: Fix LGPL version
 number
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
X-List-Received-Date: Sun, 27 Jan 2019 03:09:02 -0000

On Wed, Jan 23, 2019 at 03:08:54PM +0100, Thomas Huth wrote:
> It's either "GNU *Library* General Public version 2" or "GNU Lesser
> General Public version *2.1*", but there was no "version 2.0" of the
> "Lesser" library. So assume that version 2.1 is meant here.
> 
> Cc: Stafford Horne <shorne@gmail.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  target/openrisc/cpu.c              | 2 +-
>  target/openrisc/exception.h        | 2 +-
>  target/openrisc/gdbstub.c          | 2 +-
>  target/openrisc/helper.h           | 2 +-
>  target/openrisc/interrupt_helper.c | 2 +-
>  target/openrisc/sys_helper.c       | 2 +-
>  target/openrisc/translate.c        | 2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
> index fb7cb5c..541b2a6 100644
> --- a/target/openrisc/cpu.c
> +++ b/target/openrisc/cpu.c
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/openrisc/exception.h b/target/openrisc/exception.h
> index 4ec56b4..c9c4e47 100644
> --- a/target/openrisc/exception.h
> +++ b/target/openrisc/exception.h
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/openrisc/gdbstub.c b/target/openrisc/gdbstub.c
> index f9af650..43b1a18 100644
> --- a/target/openrisc/gdbstub.c
> +++ b/target/openrisc/gdbstub.c
> @@ -7,7 +7,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/openrisc/helper.h b/target/openrisc/helper.h
> index 9db9bf3..96d79a8 100644
> --- a/target/openrisc/helper.h
> +++ b/target/openrisc/helper.h
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/openrisc/interrupt_helper.c b/target/openrisc/interrupt_helper.c
> index 9c5489f..ab4ea88 100644
> --- a/target/openrisc/interrupt_helper.c
> +++ b/target/openrisc/interrupt_helper.c
> @@ -7,7 +7,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/openrisc/sys_helper.c b/target/openrisc/sys_helper.c
> index b66a45c..05f66c4 100644
> --- a/target/openrisc/sys_helper.c
> +++ b/target/openrisc/sys_helper.c
> @@ -7,7 +7,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
> index c089914..89680f8 100644
> --- a/target/openrisc/translate.c
> +++ b/target/openrisc/translate.c
> @@ -7,7 +7,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of

All of this looks ok to me, though I didn't the licenses:

Acked-by: Stafford Horne <shorne@gmail.com>


