Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1anUXn-0004ef-6q
	for mharc-qemu-trivial@gnu.org; Tue, 05 Apr 2016 13:13:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56510)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1anUXl-0004bg-8y
	for qemu-trivial@nongnu.org; Tue, 05 Apr 2016 13:13:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1anUXk-0002Xz-Ak
	for qemu-trivial@nongnu.org; Tue, 05 Apr 2016 13:13:33 -0400
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:35572)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1anUXk-0002XU-6Q
	for qemu-trivial@nongnu.org; Tue, 05 Apr 2016 13:13:32 -0400
Received: by mail-vk0-x234.google.com with SMTP id e6so26273490vkh.2
	for <qemu-trivial@nongnu.org>; Tue, 05 Apr 2016 10:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cDX4HC8mWVhcQE6cpHGJZgNPCS9CRQFii/HD7IGQTws=;
	b=DZqpYT1J+E0NWfM0hTQoEa2YwiwNZRmzizRBnB5ChtN6naGRjJBPS5G9Ktc9AOpzxe
	gNgXtTLeGfGTfrd+Qrxg3PZzkVaM7O5i7J/Abs+agyW1yXjod0VBVIS8ZHv/k+aVXVfF
	Tpf6HCz6mg3iVEP2J+QbYdvdTJvsW+uo0UZgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cDX4HC8mWVhcQE6cpHGJZgNPCS9CRQFii/HD7IGQTws=;
	b=TGbnP2r75JbvIEqo88vAeRe0uDvP2Rjr0M73qlxG9HiadN2fu6+JLYT2+M5UCtWtL0
	Joh6uD72UDUca91fShuxvGXHdll2aOQLoUD0n/Irdnq9F2lhB0aoqZ+LqL9zBQMwCTK7
	FSgDjbYXIg81feYMG3xxXNjqJGrA2ZY4jcSNdJuDSwZDh6R54cfREJDiEmOfkOTVNZ2H
	Q+o6QIa+F1s6co+OOgOsV7Y+u+b5gmfSN642GrJJV/+gVb/LlYbMOdy0249RV/QV458p
	omlVdqvLNBdqooOtlr89f3lZAFwX6R4bUOh4KsI6gvOAX0Jm5LvuKrj7QVYptnkSUG0s
	VEEw==
X-Gm-Message-State: AD7BkJJvdAaGbdLHo175SBGzl0PWr7h3hEjO8VTHM3vrKD/evzEb/iGA5nYf/mKMV72IHAtgUJrtnx24yPKuKrw7
X-Received: by 10.31.149.73 with SMTP id x70mr8641384vkd.83.1459876411915;
	Tue, 05 Apr 2016 10:13:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Tue, 5 Apr 2016 10:13:12 -0700 (PDT)
In-Reply-To: <1459867593-72017-1-git-send-email-emaste@freebsd.org>
References: <1459867593-72017-1-git-send-email-emaste@freebsd.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Apr 2016 18:13:12 +0100
Message-ID: <CAFEAcA815OmtxmxafnGN=5B9gHDmz4r5YC6zhkFN9DbywUDJeQ@mail.gmail.com>
To: Ed Maste <emaste@freebsd.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] bsd-user: Suppress gcc 4.x
 -Wpointer-sign (included in -Wall) warning
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
X-List-Received-Date: Tue, 05 Apr 2016 17:13:34 -0000

On 5 April 2016 at 15:46, Ed Maste <emaste@freebsd.org> wrote:
> This is the same change as b55266b5 in linux-user.
>
> Signed-off-by: Ed Maste <emaste@freebsd.org>
> ---
>  bsd-user/uaccess.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/bsd-user/uaccess.c b/bsd-user/uaccess.c
> index b7b3a06..91e2067 100644
> --- a/bsd-user/uaccess.c
> +++ b/bsd-user/uaccess.c
> @@ -51,7 +51,7 @@ abi_long target_strlen(abi_ulong guest_addr1)
>          ptr = lock_user(VERIFY_READ, guest_addr, max_len, 1);
>          if (!ptr)
>              return -TARGET_EFAULT;
> -        len = qemu_strnlen((char *)ptr, max_len);
> +        len = qemu_strnlen((const char *)ptr, max_len);
>          unlock_user(ptr, guest_addr, 0);
>          guest_addr += len;
>          /* we don't allow wrapping or integer overflow */
> --
> 2.4.6

Applied to master, thanks.

-- PMM

