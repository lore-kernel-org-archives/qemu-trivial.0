Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YEbB3-000815-2g
	for mharc-qemu-trivial@gnu.org; Fri, 23 Jan 2015 05:09:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38520)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YEbB0-0007y7-GB
	for qemu-trivial@nongnu.org; Fri, 23 Jan 2015 05:09:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YEbAw-00048A-G7
	for qemu-trivial@nongnu.org; Fri, 23 Jan 2015 05:09:18 -0500
Received: from mail-la0-f46.google.com ([209.85.215.46]:56945)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YEbAw-00047p-AD
	for qemu-trivial@nongnu.org; Fri, 23 Jan 2015 05:09:14 -0500
Received: by mail-la0-f46.google.com with SMTP id s18so6437571lam.5
	for <qemu-trivial@nongnu.org>; Fri, 23 Jan 2015 02:09:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=hFvWwdjJIAvvN0lnhk0f/AJGfrvAY9TTN3DTn7wnZZs=;
	b=ZkSDgzwvlbBQIiNpXcWDV50AFzhJZkv8PBwWUi4ITBiymKexLwLG5yvnaw2rk82MAJ
	fL99bJAJOVRw+Zo0q4J4nFI+yduG8hpIfxsZ5HbYxs9G4u5JirjclkwkXfy4G/0uz/hs
	ahMQgQrWM2HJhDXhH5i5kyG1KfKrqq7q83qtuNiYZjHFqH3gHcPj39PdAY0Kttaf6eGh
	gAtd1UEnSUIZACRp9QTzs/Q/3Y7rjdqb7CrEeyBHTW/nmEXF1kIaGv2Wp+E7BGJQ52UX
	+W+nt/kC6LuPNAnkUsPhznfIV0SRcBeLDrQBgQzvj7b50dg7QFcLmSaN+li5cN3rlSq0
	xdVg==
X-Gm-Message-State: ALoCoQnZ6HB78ijUxqH0yl4c+jd9VNt2Ps+FBhzwGfCwo3xFqQEoEVGeq8nBrpaE5HB8YgbzwNGx
X-Received: by 10.112.185.101 with SMTP id fb5mr6462490lbc.12.1422007753704;
	Fri, 23 Jan 2015 02:09:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.21.34 with HTTP; Fri, 23 Jan 2015 02:08:53 -0800 (PST)
In-Reply-To: <54C21D76.8050808@sunrus.com.cn>
References: <54C21D76.8050808@sunrus.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Jan 2015 10:08:53 +0000
Message-ID: <CAFEAcA_NG4E5tc8nQ8EbVDqs=704cnXJZerVAVg-c74VQm5c+Q@mail.gmail.com>
To: Chen Gang S <gang.chen@sunrus.com.cn>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.46
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user/syscall.c: Fix
 typo issue for using target_vec[i].iov_len instead of
 target_vec[i].iov_base
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
X-List-Received-Date: Fri, 23 Jan 2015 10:09:19 -0000

On 23 January 2015 at 10:07, Chen Gang S <gang.chen@sunrus.com.cn> wrote:
> It is only a typo issue, need use tswapal(target_vec[i].iov_len) for the
> len.
>
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> ---
>  linux-user/syscall.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index a66c2ae..8260ed7 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -1896,7 +1896,7 @@ static void unlock_iovec(struct iovec *vec, abi_ulong target_addr,
>      if (target_vec) {
>          for (i = 0; i < count; i++) {
>              abi_ulong base = tswapal(target_vec[i].iov_base);
> -            abi_long len = tswapal(target_vec[i].iov_base);
> +            abi_long len = tswapal(target_vec[i].iov_len);
>              if (len < 0) {
>                  break;
>              }
> --
> 1.9.3 (Apple Git-50)

Nice catch.
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

