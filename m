Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bNHII-0002S8-OG
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jul 2016 06:21:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42171)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1bNHIB-0002Rz-OX
	for qemu-trivial@nongnu.org; Wed, 13 Jul 2016 06:21:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1bNHI8-0008Jx-GZ
	for qemu-trivial@nongnu.org; Wed, 13 Jul 2016 06:21:23 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:34980)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1bNHI8-0008Js-9g; Wed, 13 Jul 2016 06:21:20 -0400
Received: by mail-wm0-x244.google.com with SMTP id i5so5341684wmg.2;
	Wed, 13 Jul 2016 03:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=CZp1vdQ0tjx8Ilmdn+a2BA6eZ8AojZxabKBFdl3jsns=;
	b=fB4/twumsdrN+5xV/uPghW8mb8vMCMOmQBe0G3IdXpwEGU8NzM0EG9OjQfM9gfOe/b
	uHv43Ao+uCZJs+1UpEJyiNSQ6cuTZu2/W94MLv5VxLwJxI1GnLmNxbglXeDvo2B9sMMO
	K/1eP2nmtcZcZ4QfmejScJSwXgB42+0hLGwge36SmoeyKZ8by6bkn1itlHIqOagBY8sm
	bh7KsPplNa3aS1LG44GMhSP/rHskETHl83IySer0+WnR2uOvfMh12ysPLpD+C3lsb6IQ
	a2H4Q0TyUQgJbBGZ59r8B4E194L2kAdNCqvbqd5BfzMCJ+GoIfTRHO00MlPeZ2Aixxon
	SruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=CZp1vdQ0tjx8Ilmdn+a2BA6eZ8AojZxabKBFdl3jsns=;
	b=lJPsGWUlfhXOPt2GcgIC4ikPzey9XXykN/iKEr4415Oe7DevKnRlPQx0cHR4UwyLLj
	8o0YDUKYf5uWOhq6XfoqRFH27KTATuCQCARx1RedPiE8UsuvbU0fziD8Js8PWGOzknPY
	gpmogUmeldqUqNeN24T4cnVkY/Rorul+xo5y1+gOXT97PGNYUFRZumTvljO3uW1rgp6+
	ZIpddUk8IZlHKnxWoSiUafShR1sSpcwF//WdYesTZ+1hB5GGt5Ji1mJR4mu9KLjNPhJE
	XQywI1eqiDWxTfl4PepuHYRLccYoy9CGO6aKFcw5j3a5UFcc1/rbDH40w2HXcVwLcRlx
	XBzA==
X-Gm-Message-State: ALyK8tKvp8pmPu2w7NUpjH5BkjW+BMuaLdQwQpra9fLf++WXLMY3U0WvEOngD+fa53Rx2Q==
X-Received: by 10.28.31.147 with SMTP id f141mr16028768wmf.69.1468405279186;
	Wed, 13 Jul 2016 03:21:19 -0700 (PDT)
Received: from [192.168.10.165] (94-39-188-118.adsl-ull.clienti.tiscali.it.
	[94.39.188.118]) by smtp.googlemail.com with ESMTPSA id
	dq2sm127322wjb.16.2016.07.13.03.21.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jul 2016 03:21:18 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1468400796-30474-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Cc: qemu-trivial@nongnu.org
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4b36498b-a15f-1da3-0792-40709c2c230d@redhat.com>
Date: Wed, 13 Jul 2016 12:21:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1468400796-30474-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-trivial] [PATCH] qemu-timer: remove unnecessary code
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
X-List-Received-Date: Wed, 13 Jul 2016 10:21:29 -0000



On 13/07/2016 11:06, Cao jin wrote:
> When passed argument 'ns' is 0, macro DIV_ROUND_UP will return 0 also.

It's potentially slower though.

Paolo

> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>  qemu-timer.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/qemu-timer.c b/qemu-timer.c
> index eb22e92..cfe0893 100644
> --- a/qemu-timer.c
> +++ b/qemu-timer.c
> @@ -285,12 +285,8 @@ int qemu_timeout_ns_to_ms(int64_t ns)
>          return -1;
>      }
>  
> -    if (!ns) {
> -        return 0;
> -    }
> -
>      /* Always round up, because it's better to wait too long than to wait too
> -     * little and effectively busy-wait
> +     * short and effectively busy-wait
>       */
>      ms = DIV_ROUND_UP(ns, SCALE_MS);
>  
> 

