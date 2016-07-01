Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bIycD-0002xW-JD
	for mharc-qemu-trivial@gnu.org; Fri, 01 Jul 2016 09:36:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58756)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bIycB-0002x9-Fm
	for qemu-trivial@nongnu.org; Fri, 01 Jul 2016 09:36:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bIyc9-00059y-8x
	for qemu-trivial@nongnu.org; Fri, 01 Jul 2016 09:36:14 -0400
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:33721)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bIyc9-00059p-4Q
	for qemu-trivial@nongnu.org; Fri, 01 Jul 2016 09:36:13 -0400
Received: by mail-vk0-x229.google.com with SMTP id k68so66628869vkb.0
	for <qemu-trivial@nongnu.org>; Fri, 01 Jul 2016 06:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xuHlyURBOzexIwc55G8tBRlNEJQhyoLtOWl1NJo2FAY=;
	b=GKZCnYh/1nSzfcf7F8ykKMEFGiMR45/5mWSTz4E1NFvbFli9kiYMfX06a5x7XEZqBi
	EVYY3fis0JnvDHLklfPnMwd18BGfF2G0UDqyZe+KofvEDVxT7N1iGWRPLm/I9xiUn5cZ
	7tjejhxH8gxgR+MIp0af0yu9KA2sqJZDu35Ig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xuHlyURBOzexIwc55G8tBRlNEJQhyoLtOWl1NJo2FAY=;
	b=AYE4jVMJl6q6DlQ9kV6DpnuvR/lBviZ0NjjVkYsstpP1tYtWlj7zaOsJ2e3yC+MiHW
	WHHk1ndMCiEfPLzQfajvaegdLrYI6duZFiM8H4TeUmX2mZqmpJLqc+v/7geq9HcNJtFw
	OyPhZ57FlfxyCDtq/oq3zFP8ys6BlibpHJl143F0PimqU93nQoxJnPqA9hEWdO2nr+Ws
	nzUZbV2lonUl0yT5z43Nly+7yfFyAH65XHHoUKk8W4oRZ0ztVJ21VUQqe6ngV9Nlh8WM
	w4zwcOUPXJtk3EP9hd6lcurALRxbpuScc0QGxmwu2aNKW17PN1UJ7ZD8G2B76kj6uRDL
	uOIA==
X-Gm-Message-State: ALyK8tJ7j/pTZtv5f6dG8oPXS2P3M5BaeKpc82hGJuYqVV12hCzg4OvpfVi1PepNsWPg3V0iVC2IaU6zxj64L+A7
X-Received: by 10.176.65.71 with SMTP id j65mr8030118uad.103.1467380172662;
	Fri, 01 Jul 2016 06:36:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Fri, 1 Jul 2016 06:35:53 -0700 (PDT)
In-Reply-To: <92770843-66C8-471B-BA9C-DA46E92817B9@akamai.com>
References: <92770843-66C8-471B-BA9C-DA46E92817B9@akamai.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2016 14:35:53 +0100
Message-ID: <CAFEAcA9VxFBB7BYBWY1gtHeScPkPehoh6SMVY-68UGz6RSFS=g@mail.gmail.com>
To: "Wirth, Allan" <awirth@akamai.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Riku Voipio <riku.voipio@iki.fi>, 
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: fix signal()
 syscall on x86_64
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
X-List-Received-Date: Fri, 01 Jul 2016 13:36:16 -0000

On 1 July 2016 at 12:59, Wirth, Allan <awirth@akamai.com> wrote:
> Linux on X86_64 does not use sel_arg_struct for select(), the args are
> passed directly. This patch switches a define so X86_64 uses the correct
> calling convention.
>
> Signed-off-by: Allan Wirth <awirth@akamai.com>
> ---
>  linux-user/syscall.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 8bf6205..209b2a7 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8002,7 +8002,7 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
>          break;
>  #if defined(TARGET_NR_select)
>      case TARGET_NR_select:
> -#if defined(TARGET_S390X) || defined(TARGET_ALPHA)
> +#if defined(TARGET_S390X) || defined(TARGET_ALPHA) || defined(TARGET_X86_64)
>          ret = do_select(arg1, arg2, arg3, arg4, arg5);
>  #else
>          {

There is a cleaner approach which we should use to fix this:
see my comments in reply to this recent patch trying to do
a similar thing:
https://patchwork.kernel.org/patch/9185927/

thanks
-- PMM

