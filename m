Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNEFx-0003Pv-Mo
	for mharc-qemu-trivial@gnu.org; Thu, 15 Nov 2018 04:48:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41561)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1gNEFv-0003OQ-6O
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2018 04:48:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1gNEFq-000874-7u
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2018 04:48:10 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:36813)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1gNEFp-00084T-EV
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2018 04:48:05 -0500
Received: by mail-wr1-x443.google.com with SMTP id z13-v6so20451778wrs.3
	for <qemu-trivial@nongnu.org>; Thu, 15 Nov 2018 01:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=yjGjWPQkNWq1saZuegqRFL20RYSD0D45JjBc+Va6maI=;
	b=jA2eDZnrHmIoOpLBYktDMnmAbcwqdolvYuC1OARimlCsHOU/s2pJy7XRCjFnZ/ch03
	a9s6griIvfYhpOgwSUVul4hWxskfiWSkiVNWTV6ANdES8YSuXC07QXSL0y7o6MrBwrFL
	+tW2R11x+pOje68CH6ICivlX+lVYvyXIShNX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=yjGjWPQkNWq1saZuegqRFL20RYSD0D45JjBc+Va6maI=;
	b=eqc4REiUgrN9g0knlc6XGJAFPXiszoGUYISUFV5BqwjVF9TkWmJN64b4WYmAPtMgnH
	itmFxXrgB88/J2fTwzp5IJFYhfNfyjDO91M8QKrOkEled1BT3mrIVwyNqIMST4AMALxX
	HzAZ5+JsFipEmt4LCvg8nl/+e101lUKIxR65xRXUQnFOb6rpT7vcuGQ1manu1ZSJ6as7
	AYmtWijwKm425F5JdAA8tOEIeQ7Li+rpY9HuXonYcprkMEInU78z7qn8+bxFe09PkhgX
	Z6K/zPwx4sVcfKPVX5bm53iIh27eMBbEhh885aPFSVBA9S35K8Yfm6ek+GBRke14H20D
	5t1g==
X-Gm-Message-State: AGRZ1gJGNfIws8ZAri+do1lZ9UBMshEQj1MnEkgQHJffp+GpcW44D6O7
	OJJ6/SYvWRFjEHGNRw6HRBPpow==
X-Google-Smtp-Source: AJdET5fKp645XVtoUoQw5mrSdbfN3lZ5lpkL0jfZQy9YFRKkGqa2WDJQ6PzFYeKDtc2HzyOTGreH9w==
X-Received: by 2002:adf:f1c2:: with SMTP id z2mr5227669wro.218.1542275283857; 
	Thu, 15 Nov 2018 01:48:03 -0800 (PST)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id q2sm4188454wru.56.2018.11.15.01.48.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 15 Nov 2018 01:48:03 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 8CC253E0494;
	Thu, 15 Nov 2018 09:48:02 +0000 (GMT)
References: <1542261954-4060-1-git-send-email-liq3ea@gmail.com>
User-agent: mu4e 1.1.0; emacs 26.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, rth@twiddle.net, ehabkost@redhat.com,
	laurent@vivier.eu, qemu-trivial@nongnu.org, Li Qiang <liq3ea@gmail.com>
In-reply-to: <1542261954-4060-1-git-send-email-liq3ea@gmail.com>
Date: Thu, 15 Nov 2018 09:48:02 +0000
Message-ID: <87muqad63x.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target: hax: replace
 g_malloc with g_malloc0
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
X-List-Received-Date: Thu, 15 Nov 2018 09:48:12 -0000


Li Qiang <liq3ea@gmail.com> writes:

> And also the g_malloc doesn't need check return value,
> remove it.
>
> Cc: qemu-trivial@nongnu.org
>
> Signed-off-by: Li Qiang <liq3ea@gmail.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/i386/hax-all.c | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
>
> diff --git a/target/i386/hax-all.c b/target/i386/hax-all.c
> index d2e512856b..a460c605af 100644
> --- a/target/i386/hax-all.c
> +++ b/target/i386/hax-all.c
> @@ -154,13 +154,7 @@ int hax_vcpu_create(int id)
>          return 0;
>      }
>
> -    vcpu =3D g_malloc(sizeof(struct hax_vcpu_state));
> -    if (!vcpu) {
> -        fprintf(stderr, "Failed to alloc vcpu state\n");
> -        return -ENOMEM;
> -    }
> -
> -    memset(vcpu, 0, sizeof(struct hax_vcpu_state));
> +    vcpu =3D g_malloc0(sizeof(struct hax_vcpu_state));
>
>      ret =3D hax_host_create_vcpu(hax_global.vm->fd, id);
>      if (ret) {
> @@ -250,11 +244,8 @@ struct hax_vm *hax_vm_create(struct hax_state *hax)
>          return hax->vm;
>      }
>
> -    vm =3D g_malloc(sizeof(struct hax_vm));
> -    if (!vm) {
> -        return NULL;
> -    }
> -    memset(vm, 0, sizeof(struct hax_vm));
> +    vm =3D g_malloc0(sizeof(struct hax_vm));
> +
>      ret =3D hax_host_create_vm(hax, &vm_id);
>      if (ret) {
>          fprintf(stderr, "Failed to create vm %x\n", ret);


--
Alex Benn=C3=A9e

