Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hW3D4-00049e-BK
	for mharc-qemu-trivial@gnu.org; Wed, 29 May 2019 14:21:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48461)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <claudio.fontana@gmail.com>) id 1hW2Eh-0006gs-4N
	for qemu-trivial@nongnu.org; Wed, 29 May 2019 13:19:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <claudio.fontana@gmail.com>) id 1hW2Eg-0002ny-6Y
	for qemu-trivial@nongnu.org; Wed, 29 May 2019 13:19:35 -0400
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41]:38057)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <claudio.fontana@gmail.com>)
	id 1hW2Eb-0002kL-Qz; Wed, 29 May 2019 13:19:30 -0400
Received: by mail-vs1-xe41.google.com with SMTP id b10so2425777vsp.5;
	Wed, 29 May 2019 10:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=s2Vf3XUHOtrZk+kyek2qQBzgKAlez1r7ITBpE4sqocQ=;
	b=M4DniTv17P19RZmh+ZicoUJSIOZ5JRiVr8U3HQa2t5KihSDG7+0qhKWZ9u56plmkwL
	33JSA4v2iICr3rPErgV8pQsBTlKsxZmMzf8eNpzg0xZhCPs4Dbh5Te9Sf0Ix6qVHR6JU
	d2ZEIqGFC6+pwF4Yl1OsY7g1EaXzD6oteV6oYEOxds33YaThAsIc839U40NR5r23T/ao
	0Ry/O1kcQsnJuCqiNN1TEweERMWEgumVNOEth+njDjE/J7i18RqYX2SPqgZT4xjKq0Un
	aHGvS5n+QNH57vYpiDBr0HSSepUFUQ7HAPTzz61Uq4L14Au8OvdcjuqvRxswtsTeSbv/
	td/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=s2Vf3XUHOtrZk+kyek2qQBzgKAlez1r7ITBpE4sqocQ=;
	b=RRJcBBB31frokYazYpjpCUU/MPBG5ceqfFyVy1hkfUulvGKucpvekEli8Xl66V8fOM
	aNFd5NUh1MMYwzATh8oE4eyi7CFGBOBWac0FXpYFLG1A5ty31EGf0IpFnrgl1MHvdp5F
	Q2WBTyzq0L/GdP1sXnZdK8SOKBkp/btAVFbNSgjqzgk7NGym33vT/ia55ID2Z+kNmWXO
	7n887Er3kphTUymJiKvhSaq2+r8eDjUlk3vpUgnd5smTSkZYK1sBFlRz4RDGIcugP+qZ
	cUpId22lyePqUhrl7xesEfwxpC0JWkdfD2JYe/f5kgLXRnhwrS0+MpOp9EQFShpPdUyJ
	JHxw==
X-Gm-Message-State: APjAAAUWUuldRpoJp8xDqka9fwZcp/Te3Gim0K+AFXE6Eng0qt8sBQF5
	1+Y+EGtcjY9CCJ5eH9X9eZjZRHEq881GzoGoVC0=
X-Google-Smtp-Source: APXvYqxgi+e/dWkOpHN0HquZMyehG4V0cPJQfzxc5GV4qTHekabPfHohSXyywS3NSUDs6qOU1Q8vL/0k22xJAX2rsPI=
X-Received: by 2002:a67:c111:: with SMTP id d17mr57768556vsj.176.1559150368772;
	Wed, 29 May 2019 10:19:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190529140207.20719-1-philmd@redhat.com>
In-Reply-To: <20190529140207.20719-1-philmd@redhat.com>
From: Claudio Fontana <claudio.fontana@gmail.com>
Date: Wed, 29 May 2019 19:17:59 +0200
Message-ID: <CAJuRt+q+KPJGTFoHyNaqV=ZxfLtdLu78xtRS_GV-JHvLJU7uCQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, "open list:AArch64 target" <qemu-arm@nongnu.org>,
	qemu-trivial@nongnu.org, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::e41
X-Mailman-Approved-At: Wed, 29 May 2019 14:21:56 -0400
Subject: Re: [Qemu-trivial] [PATCH] MAINTAINERS: Remove bouncing email in
 AArch64 target
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
X-List-Received-Date: Wed, 29 May 2019 17:19:38 -0000

Hi Philippe,

On Wed, May 29, 2019 at 4:02 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Claudio Fontana's email at Huawei is bouncing: remove it.
>
>     From: Mail Delivery Subsystem <mailer-daemon@googlemail.com>
>     Auto-Submitted: auto-replied
>     Subject: Delivery Status Notification (Failure)
>     X-Failed-Recipients: claudio.fontana@huawei.com
>     ** Address not found **
>     Your message wasn't delivered to claudio.fontana@huawei.com because t=
he address couldn't be found, or is unable to receive mail.
>
> Note that the section still contains his personal email.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

I think you can remove my personal email from there as well.

I think that Richard Henderson has been maintaining it in practice,
and that should probably be formalized in the MAINTAINERS file as
well.

Ciao,

Claudio

> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1f5f8b7a2c..5ed917329d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2290,7 +2290,6 @@ S: Maintained
>  F: tcg/
>
>  AArch64 target
> -M: Claudio Fontana <claudio.fontana@huawei.com>
>  M: Claudio Fontana <claudio.fontana@gmail.com>
>  S: Maintained
>  L: qemu-arm@nongnu.org
> --
> 2.20.1

