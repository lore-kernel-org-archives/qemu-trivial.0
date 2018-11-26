Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRF2l-0003sj-A0
	for mharc-qemu-trivial@gnu.org; Mon, 26 Nov 2018 06:27:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52634)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1gRF2i-0003rJ-To
	for qemu-trivial@nongnu.org; Mon, 26 Nov 2018 06:27:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1gRF2d-0003NV-4z
	for qemu-trivial@nongnu.org; Mon, 26 Nov 2018 06:27:08 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:38935)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1gRF2c-0003N2-UX
	for qemu-trivial@nongnu.org; Mon, 26 Nov 2018 06:27:03 -0500
Received: by mail-wm1-x342.google.com with SMTP id n133so1208129wmd.4
	for <qemu-trivial@nongnu.org>; Mon, 26 Nov 2018 03:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=itpzmSsZaDNftI+1H8wgmrZg6DBpTFpKM9oy4r8VGNo=;
	b=iQ3aHmIHaJgFooCfeIxIWyj7Adbu5Ji9Pba3C1wq2zhR1jCBp4eeI/pMhPJBPXM7FH
	wy7erdzunR5KdORVBJ2rlON5wMBTtqC7FFAjXnqcDsQ24j+jNH651hGBso7tpV7X1Mxg
	5L5BJIl/5AeQXosi7ShM3Mp/ApQM0rGT1sU5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=itpzmSsZaDNftI+1H8wgmrZg6DBpTFpKM9oy4r8VGNo=;
	b=DSnFQ05yTTC8nO0xHhjzhnuZ7U8ggJOPJuDqwB8Q2/1ivGizSuDfXzaWpNBBbYHpP9
	QEGpNWdp3RUDe1W3YJSrl4GmL8bNTIGCVf43KLPuD6ks8LN0EoMRR4oyvorQJiOq6KVj
	+Kl6OXVhAmlSUOvaPSTH12/aKy5wZH4ySk4LOb+9BiJGrK5OKYbmX2EhOXEErRIsRNIZ
	4ayLsiT7+faVaApzCMd7h8Nl5zCybiImUzSfjVNfKZtmM7C6l1UGUCaP1BXaPXP31cEO
	tz+H7FBpS2VOR8Ecd35jJuSt5Gp7bZAynfa+QLeuijO7X2WJPDX5xyCn1RP4rXM1xrLM
	uOAg==
X-Gm-Message-State: AA+aEWZX23j/tQzA6HLNs0KsJFboxe+loVxm3XlNgPMq+vqiD4EX1MMz
	Qnw9rCsTg2E9D8YgAgH58xI7JQ==
X-Google-Smtp-Source: AFSGD/VnM7C+SMLatUX+kNvpwudlqBrG34weElCMf1Au8Hw4S5ThvNiUPUWrdSUURaTZsoQTC1uhxw==
X-Received: by 2002:a1c:ed18:: with SMTP id l24mr22084904wmh.12.1543231621809; 
	Mon, 26 Nov 2018 03:27:01 -0800 (PST)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	r76-v6sm599191wmb.21.2018.11.26.03.27.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 26 Nov 2018 03:27:01 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 835523E053E;
	Mon, 26 Nov 2018 11:27:00 +0000 (GMT)
References: <1543226179-5135-1-git-send-email-liq3ea@gmail.com>
User-agent: mu4e 1.1.0; emacs 26.1.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Li Qiang <liq3ea@gmail.com>
Cc: pbonzini@redhat.com, rth@twiddle.net, ehabkost@redhat.com,
	laurent@vivier.eu, philmd@redhat.com, armbru@redhat.com,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org
In-reply-to: <1543226179-5135-1-git-send-email-liq3ea@gmail.com>
Date: Mon, 26 Nov 2018 11:27:00 +0000
Message-ID: <87pnus3wqj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: Re: [Qemu-trivial] [PATCH] target: hax: replace g_malloc with g_new0
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
X-List-Received-Date: Mon, 26 Nov 2018 11:27:09 -0000


Li Qiang <liq3ea@gmail.com> writes:

> And also the g_malloc doesn't need check return value,
> remove it.
>
> Cc: qemu-trivial@nongnu.org
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Li Qiang <liq3ea@gmail.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/i386/hax-all.c | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
>
> diff --git a/target/i386/hax-all.c b/target/i386/hax-all.c
> index d2e512856b..502ce6f0af 100644
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
> +    vcpu =3D g_new0(struct hax_vcpu_state, 1);
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
> +    vm =3D g_new0(struct hax_vm, 1);
> +
>      ret =3D hax_host_create_vm(hax, &vm_id);
>      if (ret) {
>          fprintf(stderr, "Failed to create vm %x\n", ret);


--
Alex Benn=C3=A9e

