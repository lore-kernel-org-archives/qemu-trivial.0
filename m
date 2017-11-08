Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eCQaF-0000PY-6J
	for mharc-qemu-trivial@gnu.org; Wed, 08 Nov 2017 08:39:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33567)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1eCQaC-0000Nc-TQ
	for qemu-trivial@nongnu.org; Wed, 08 Nov 2017 08:39:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1eCQaC-0003Xa-2u
	for qemu-trivial@nongnu.org; Wed, 08 Nov 2017 08:39:56 -0500
Received: from mail-vk0-x244.google.com ([2607:f8b0:400c:c05::244]:48271)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1eCQZy-0003ON-5g; Wed, 08 Nov 2017 08:39:49 -0500
Received: by mail-vk0-x244.google.com with SMTP id y196so1718344vkc.5;
	Wed, 08 Nov 2017 05:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=UA3A3RHcl84/RJag9V9cSPf6T5H/J3s5pCeliHqnP88=;
	b=XWYz0Y26rpwnh0wfv7hDtTP8rtyMPYFpMMGCdPiyBM6o3L3bxzdRuGoPnLXMLDutFN
	yznMYGc+aTnlQFiHp0nqFYhpWaKwBRNsTC+CusJCE/npaa6QKQB0vXmHXl//eYABcZRZ
	z9r88P3JcBhpHtRJA7V3oZkZxeoHwgjNvPMUlSyQdgveJZDaoWbuoIKw8KtjdTovmHHc
	bXDeFAcx/PrmUdTZXUYE/Zoh2zzUuJ9ZtqMUNwlIXQ31Xt96QdKg0o2dwDMrvUZmoHAp
	krSJVlrfCPqWyxQUWN05/XNIU3tQuPoOUyz2WFbcZNMgUaAMzz+ym+UfUzRQteVsXdJH
	SS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=UA3A3RHcl84/RJag9V9cSPf6T5H/J3s5pCeliHqnP88=;
	b=Vei3xPcHwgN4G4UgvJDTVIci2VFdmHs0a6QpJipdhO+Xd07HzuPzjmsQbyJBEqGLFp
	AFQzqJ/p8wco3jY3s1Mp5pEVIBc32nzFUfFHkrUElCr2rVAqsxXsF/N1ykkuUx2DsdK5
	0OtH/trqmk+pA25funSlZhWT+H77oTl+umiuR8oNQVsFl1/S5gHoW9cN7VL6KGZmCNQS
	1qg10tMn1tNlTQBBQcFwXuvi1VkpMwdZTFuQAORLskG8nTD6ZZlQWu87BHiYwjKy02N3
	Z0NA+L4ZjWe6k2tFg66YqfGw8G7FvYVtVOjyGlgPoQmM7iG2v9BAPDGfC6KhQbIuJDfh
	QH3w==
X-Gm-Message-State: AJaThX7SLBphb6PCyLug+LZiRbH3qJWFuEpskMSS7i7tBCHrTL09pgvD
	wyBvhof01p+Q7Q91X3kS/7nHlY4xgq8Jywbtp7g=
X-Google-Smtp-Source: ABhQp+QZKe8o9ACkl1rFNffpr72QOvD9vb3jHUuKLaC5p9+mwQ4cQyQhczuz4sLHiXLvjAnVY6K3WXls/FBL7WHxLVg=
X-Received: by 10.31.34.215 with SMTP id i206mr402496vki.19.1510148381344;
	Wed, 08 Nov 2017 05:39:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.27.129 with HTTP; Wed, 8 Nov 2017 05:39:40 -0800 (PST)
In-Reply-To: <20171107223708.17935-1-eblake@redhat.com>
References: <20171107223708.17935-1-eblake@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 8 Nov 2017 14:39:40 +0100
Message-ID: <CAJ+F1CLthEcYFgTn4N-=LP=piFy7ubZjr8xyJWQQBG=gHHZ53Q@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, qemu trival <qemu-trivial@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] coroutine: Fix
 documentation of co_aio_sleep_ns()
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
X-List-Received-Date: Wed, 08 Nov 2017 13:39:57 -0000

Hi

On Tue, Nov 7, 2017 at 11:37 PM, Eric Blake <eblake@redhat.com> wrote:
> co_sleep_ns() was removed in commit 0b9caf9b, leaving behind a
> stale comment.  Update the documentation to match the current
> usage of this function.
>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  include/qemu/coroutine.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
> index 9aff9a735e..01ae415767 100644
> --- a/include/qemu/coroutine.h
> +++ b/include/qemu/coroutine.h
> @@ -262,8 +262,11 @@ void qemu_co_rwlock_unlock(CoRwlock *lock);
>  /**
>   * Yield the coroutine for a given duration
>   *
> - * Behaves similarly to co_sleep_ns(), but the sleeping coroutine will b=
e
> - * resumed when using aio_poll().
> + * This function uses timers and hence needs to know the event loop
> + * (#AioContext) to place the timer on.  In any case, co_aio_sleep_ns()
> + * does not affect the #AioContext where the current coroutine is runnin=
g,
> + * as the coroutine will restart on the same #AioContext that it is
> + * running on.
>   */

comment seems correct to me,

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


>  void coroutine_fn co_aio_sleep_ns(AioContext *ctx, QEMUClockType type,
>                                    int64_t ns);
> --
> 2.13.6
>
>



--=20
Marc-Andr=C3=A9 Lureau

