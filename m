Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1akvyN-00010c-75
	for mharc-qemu-trivial@gnu.org; Tue, 29 Mar 2016 11:54:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56485)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>) id 1akvyF-0000s0-Fw
	for qemu-trivial@nongnu.org; Tue, 29 Mar 2016 11:54:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>) id 1akvyE-0003us-IR
	for qemu-trivial@nongnu.org; Tue, 29 Mar 2016 11:54:19 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:32875)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>)
	id 1akvyE-0003ul-Do; Tue, 29 Mar 2016 11:54:18 -0400
Received: by mail-vk0-x22b.google.com with SMTP id k1so23918921vkb.0;
	Tue, 29 Mar 2016 08:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Q6/Ef+7TvR6zoh9IRb1AE9+iv/tVfZ3BPLITJuMByXU=;
	b=oe9c+Y1chnBAX5dSV2MOUdVb58sxpjlbrgeolXJ0skcpEARG5KzzfAkc3de4g5fYi2
	+zaVsKdL/LVANwR0k2NddKFHDug5xBqLmdtNpdgha2XXFLHw+v1S7F2x2o3UplzwhSjB
	nl41onD8VHIi547XUnC3jZu3RAWVObqugLVsRgVg00kXAO2NXKoNkF+vppWfVsLjV22c
	Dcih11/AS369/sYRmZDXAy4kuYNyJPaZKrd7Bu1Wqw/iBokm0n0ju3p8rtrKUesIcx5z
	yeANhUX92p8XUJqLJVnRN4J/cSIIGgXREjGd+14VXd8W0sUFYTJPV6N/9vzZMTgdrYXm
	ahTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Q6/Ef+7TvR6zoh9IRb1AE9+iv/tVfZ3BPLITJuMByXU=;
	b=ce00bveuq5ZpVVEu/ylwJ2PtWe19mKfA5+b5KnGMHL/T9vz3qYy1f8aPYwFeiz7ZcR
	QjjUbmzjI7YjeHCszgMi9Sa6P13Hmjg9CtQvijSIX9Dz6BORSEv/AiRd0uF+UUMZM50v
	TPfLvdX6IhpXZ3sC7UNbPkhu+VcTcjooZhidbha+AqZBG/M2Tr2BxcAChwBZUufefC1W
	4XMdPMeAU9/D2lIj4riqsDNjdKYPHPHCoPA/LneEuxdoiDvScGjdzTkMQZhXZctO5yy5
	HnSswE0qK0DtaGyf4ZQ51tUe5LbEfVxFtHlEGa8hlNNyXySgtq8UOLlPpkfglDHvMZdT
	3qdw==
X-Gm-Message-State: AD7BkJKgc53mgIcF/rEnHVUfkIhT1fmJeo4nhDVkFKFoRi50EGvcOxrbiyS3vvxAxLsbyh89eKtq1ULkzy5+cw==
X-Received: by 10.31.14.195 with SMTP id 186mr1744412vko.2.1459266856559; Tue,
	29 Mar 2016 08:54:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.15.9 with HTTP; Tue, 29 Mar 2016 08:53:57 -0700 (PDT)
In-Reply-To: <1458757923-11362-1-git-send-email-haris.phnx@gmail.com>
References: <1458757923-11362-1-git-send-email-haris.phnx@gmail.com>
From: haris iqbal <haris.phnx@gmail.com>
Date: Tue, 29 Mar 2016 21:23:57 +0530
Message-ID: <CAE_WKMz=hYrtZpVrh-RjHmEXu5iCzTczXnh6ANVm4Uw9Xfn6kg@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Md Haris Iqbal <haris.phnx@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-Devel] [PATCH] Changed malloc to g_malloc,
 free to g_free in linux-user/qemu.h
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
X-List-Received-Date: Tue, 29 Mar 2016 15:54:25 -0000

Hi,

Can I get a respond for this patch. Is it complete, or did I miss something?


On Thu, Mar 24, 2016 at 12:02 AM, Md Haris Iqbal <haris.phnx@gmail.com> wrote:
> Signed-off-by: Md Haris Iqbal <haris.phnx@gmail.com>
> ---
>  linux-user/qemu.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/linux-user/qemu.h b/linux-user/qemu.h
> index 26b0ba2..3c3fd15 100644
> --- a/linux-user/qemu.h
> +++ b/linux-user/qemu.h
> @@ -381,7 +381,7 @@ static inline void *lock_user(int type, abi_ulong guest_addr, long len, int copy
>  #ifdef DEBUG_REMAP
>      {
>          void *addr;
> -        addr = malloc(len);
> +        addr = g_malloc(len);
>          if (copy)
>              memcpy(addr, g2h(guest_addr), len);
>          else
> @@ -407,7 +407,7 @@ static inline void unlock_user(void *host_ptr, abi_ulong guest_addr,
>          return;
>      if (len > 0)
>          memcpy(g2h(guest_addr), host_ptr, len);
> -    free(host_ptr);
> +    g_free(host_ptr);
>  #endif
>  }
>
> --
> 1.9.1
>



-- 

With regards,

Md Haris Iqbal,
Placement Coordinator, MTech IT
NITK Surathkal,
Contact: +91 8861996962

