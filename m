Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dpI4Z-00016I-AP
	for mharc-qemu-trivial@gnu.org; Tue, 05 Sep 2017 13:55:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dpI4S-00014O-Lv
	for qemu-trivial@nongnu.org; Tue, 05 Sep 2017 13:55:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dpI4N-0001Ca-VG
	for qemu-trivial@nongnu.org; Tue, 05 Sep 2017 13:55:32 -0400
Received: from mail-wr0-x231.google.com ([2a00:1450:400c:c0c::231]:37334)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dpI4N-0001C1-Ls
	for qemu-trivial@nongnu.org; Tue, 05 Sep 2017 13:55:27 -0400
Received: by mail-wr0-x231.google.com with SMTP id k20so1332935wre.4
	for <qemu-trivial@nongnu.org>; Tue, 05 Sep 2017 10:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=UaOx/Ow5eZIHuYgzsSWaBlVNdj2laG2MyLR75bR9rbo=;
	b=I0NSPbnPn3folEHUoAeH6CWgMv1ndsKYb0XujHFfp6dlYXKNf3FtIVsBRxksvC06sU
	84LXfSY5Yl/w+48iwtq3rzbbaf7pqW+kmu4dKxnA3z9NvdkF1i5wIzgATWT37xCqivva
	a5Uvm1/7JBB4pvGA2jvmxL0rFGRvRdHZiccpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=UaOx/Ow5eZIHuYgzsSWaBlVNdj2laG2MyLR75bR9rbo=;
	b=N5QqhLicekgZHKP6W0rE8TWGMY2veIgcZWv9V+OKtzDlHtP7+zKEvud6N0xIKbG970
	75pocXld7FS1irFjekT3JQLN6Q7BiekJtHx3x5t/Rdq+Qwd+00AQR4SqQERp3vPn+mml
	XX4CfWQzF2rV5rNF3q17vMWToVfK3zbDB9O0Lf4nC3jnVTS3J15ABGDLdK1VDkWsYqqx
	ZI4E5+EJZSEJb1JcjtrwhY768Jhj7VbrSU904M/W8JkGzrl2V3ydb+CTTGlb/+wWUcv5
	q55roxqQWrc07VCL2CRA1P3k0WgqD/2ZMftmo2yBgEURbOh4wRYpFzMyEn8pJKjqWai3
	3d9Q==
X-Gm-Message-State: AHPjjUhEKGOTOBz7zSg+ni4NGDyipIjS7rxB4q2ZqIFhBW7Qstepvwv2
	oFfqICJmZe98Hu6Jxba9osVVgMPcH7wl
X-Google-Smtp-Source: ADKCNb7w2Ta8B2kclVaXyiUi5du3FhG5twwXCwqEsQYQURTfx32mTv+EEWj/hcB6LS/wMFuq20URy/KagZjyV1A0oMU=
X-Received: by 10.223.130.21 with SMTP id 21mr2801630wrb.196.1504634126517;
	Tue, 05 Sep 2017 10:55:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.159.68 with HTTP; Tue, 5 Sep 2017 10:55:06 -0700 (PDT)
In-Reply-To: <20170831103432.6007-25-marcandre.lureau@redhat.com>
References: <20170831103432.6007-1-marcandre.lureau@redhat.com>
	<20170831103432.6007-25-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Sep 2017 18:55:06 +0100
Message-ID: <CAFEAcA-BcuFQcw3gnotbN=Km7RWNr5=AwBRb2VUAsD7xkaTqhQ@mail.gmail.com>
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::231
Subject: Re: [Qemu-trivial] [PULL 24/29] kvm: use DIV_ROUND_UP
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
X-List-Received-Date: Tue, 05 Sep 2017 17:55:37 -0000

On 31 August 2017 at 11:34, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
> I used the clang-tidy qemu-round check to generate the fix:
> https://github.com/elmarco/clang-tools-extra
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Richard Henderson <rth@twiddle.net>
> ---
>  linux-headers/asm-x86/kvm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/linux-headers/asm-x86/kvm.h b/linux-headers/asm-x86/kvm.h
> index c2824d02ba..1930b95bcb 100644
> --- a/linux-headers/asm-x86/kvm.h
> +++ b/linux-headers/asm-x86/kvm.h
> @@ -153,7 +153,7 @@ struct kvm_sregs {
>         __u64 cr0, cr2, cr3, cr4, cr8;
>         __u64 efer;
>         __u64 apic_base;
> -       __u64 interrupt_bitmap[(KVM_NR_INTERRUPTS + 63) / 64];
> +       __u64 interrupt_bitmap[DIV_ROUND_UP(KVM_NR_INTERRUPTS, 64)];
>  };
>
>  /* for KVM_GET_FPU and KVM_SET_FPU */

Hi -- I just noticed that this commit makes a change to linux-headers/.
This directory is for kernel headers which we keep in sync with the
upstream kernel via scripts/update-linux-headers.sh, so we shouldn't
be applying our code cleanups to it.

I'm going to revert it (206a0fc75d5f54886c1b3f3a65782a75e36b6b97).

thanks
-- PMM

