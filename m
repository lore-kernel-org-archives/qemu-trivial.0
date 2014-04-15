Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wa2Ur-0005kI-B1
	for mharc-qemu-trivial@gnu.org; Tue, 15 Apr 2014 08:29:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60184)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Wa2Uk-0005d7-P5
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 08:29:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Wa2UZ-0002Ms-8Q
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 08:29:46 -0400
Received: from mail-we0-f177.google.com ([74.125.82.177]:54827)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Wa2UZ-0002Mi-2q
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 08:29:35 -0400
Received: by mail-we0-f177.google.com with SMTP id u57so9462860wes.36
	for <qemu-trivial@nongnu.org>; Tue, 15 Apr 2014 05:29:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=KjVJTMFMzLBK5YvBRoNYBJBtQGt31IQeGucnSvUEabQ=;
	b=muZXlLbdjPYWeecjDmbeTz7OK3uMpwnwDQTQZVYuVD3u7rWCZmSh4iat+j+3hWODqt
	3P1FwXgEBsqJX+Oj9ZCAgDv4MZmveZwP9MO1eg/hlY1OTRFuvTq7TAv59vB56SgF3dpv
	PvloHeL7SmpRpKwYvW/oQA6i0irDVJWMkItT03EzpBDzG025DStroJL2jAgNpfY0WVPw
	4jdjxq3tFLRr6VRzwFFJ7zkhcRFWt+02AxFUmYbpXaw+acWOntJ3dBwTmkYg+FOKWSZ4
	eEBIOzDhgI8VbxT5ivk/AHgDAoHVPKGo9RkLtMYYQ9Rxe3YicyM9VD1EBBvieAj/33jN
	auMw==
X-Gm-Message-State: ALoCoQk8s7BvxN0jtoD5DJIoUfwMFkiLU/9AxDzyAKNwcyVkhi3WK6PvkUcJWvp4owT2uiRSBSPx
MIME-Version: 1.0
X-Received: by 10.194.84.101 with SMTP id x5mr1483477wjy.52.1397564973732;
	Tue, 15 Apr 2014 05:29:33 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.227.128.131 with HTTP; Tue, 15 Apr 2014 05:29:33 -0700 (PDT)
In-Reply-To: <5343E5ED.2040906@gmail.com>
References: <53337BEB.90305@gmail.com> <87wqfgrp83.fsf@blackfin.pond.sub.org>
	<5333F6E2.9080202@gmail.com> <53382DDD.8050001@gmail.com>
	<87fvlylf02.fsf@blackfin.pond.sub.org> <53396545.805@gmail.com>
	<CAFEAcA-GL7bnZ-Pkga9PzDq7DpwPf8Gx0Wezzkm_CCbSUB1W8A@mail.gmail.com>
	<533969AB.4010505@gmail.com>
	<CAFEAcA_w=35e9dVL_Zo84MoxZqCUH9qJ76v=Pn=XQ0FZq8g_-g@mail.gmail.com>
	<53396CE9.9090405@gmail.com>
	<CAFEAcA9dk3991gc+FK0qp9QwhWkjxO0vK=X1TxS37Y1sXD5RNw@mail.gmail.com>
	<533E7DD5.3090203@gmail.com> <5340F4FD.7040305@msgid.tls.msk.ru>
	<53414941.5040908@gmail.com> <5343E4D4.6070305@gmail.com>
	<5343E516.3020103@gmail.com> <5343E571.60407@gmail.com>
	<5343E5ED.2040906@gmail.com>
Date: Tue, 15 Apr 2014 22:29:33 +1000
X-Google-Sender-Auth: FBOC_SDdRn_G-E6_E9ZiGgoRtEI
Message-ID: <CAEgOgz4QNY7yovixKEcxXRWo=9KVAJdaQxMn97ZnXtBkeYtmvA@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Chen Gang <gang.chen.5i5j@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.177
Cc: Peter Maydell <peter.maydell@linaro.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial 3/3] vl: remove
 local variable 'args' in the middle of code block
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
X-List-Received-Date: Tue, 15 Apr 2014 12:29:52 -0000

On Tue, Apr 8, 2014 at 10:05 PM, Chen Gang <gang.chen.5i5j@gmail.com> wrote:
> For C code, it does not recommend to define a local variable in the
> middle of code block without "{...}". The original author may want to
> zero members not mentioned in structure assignment.
>
> So recommend to use structure initializing block "{...}" for structure
> assignment in the middle of code block.
>
> And at present, we can assume that all related gcc versions will be
> latest enough to notice about this grammar.
>
>
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>

With Markus' suggest commit message fixup:

Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

> ---
>  vl.c |   18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/vl.c b/vl.c
> index 377f962..d381443 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -4368,15 +4368,15 @@ int main(int argc, char **argv, char **envp)
>
>      qdev_machine_init();
>
> -    QEMUMachineInitArgs args = { .machine = machine,
> -                                 .ram_size = ram_size,
> -                                 .boot_order = boot_order,
> -                                 .kernel_filename = kernel_filename,
> -                                 .kernel_cmdline = kernel_cmdline,
> -                                 .initrd_filename = initrd_filename,
> -                                 .cpu_model = cpu_model };
> -
> -    current_machine->init_args = args;
> +    current_machine->init_args = (QEMUMachineInitArgs) {
> +        .machine = machine,
> +        .ram_size = ram_size,
> +        .boot_order = boot_order,
> +        .kernel_filename = kernel_filename,
> +        .kernel_cmdline = kernel_cmdline,
> +        .initrd_filename = initrd_filename,
> +        .cpu_model = cpu_model };
> +
>      machine->init(&current_machine->init_args);
>
>      audio_init();
> --
> 1.7.9.5
>

