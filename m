Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRaZh-0008IJ-6n
	for mharc-qemu-trivial@gnu.org; Tue, 27 Nov 2018 05:26:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36576)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gRaZf-0008HD-NY
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 05:26:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gRaZa-0007dj-Qi
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 05:26:34 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45355)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gRaZY-0007cS-Qi
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 05:26:30 -0500
Received: by mail-wr1-f66.google.com with SMTP id v6so22067024wrr.12
	for <qemu-trivial@nongnu.org>; Tue, 27 Nov 2018 02:26:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Nf9EDFBSpae8Qb8mNhKZQfTtxkOvMeySRroC/J8hVQo=;
	b=iKZsIefhd5ejZxNALp9Vwr79SUQFcUbMASsuhU0Tm8CKgaM38H6G9hCC1Z8YbrJXF3
	NaFeWRxXaUHuEg5Mp/usUjMlJSkNNVgqpafb51tBCvunt1NHmt2GqGPzSid+8/bM1E56
	SJ2h0OV8CL1nd4mf5sgNUoy08+BYnW5mh/mWbuSk0xPZVrct/mSPBykTvbgIxc3zwQUH
	UZKo6rSk8vtKxYKfeYnol6biIHRNVLPifBdnTvezeu8319ltHGWRD040a51I6b/FGYon
	ES/XI1R2la1xL9g7quyG3oZzO/P/SPe/9sJ7AOvOHeSDATF9Ok2sAz27TyVaLbov1k31
	eTpA==
X-Gm-Message-State: AA+aEWYldHwRYYIPZPa0hepAWZbbpwO0hj/Rdepr7cFHZU4Txc0nnWqe
	T2ThzJHEmeJBnJDJZ/y/UIUSgw==
X-Google-Smtp-Source: AFSGD/XMMlF5pc5kd6z971cIJ81Pe+LyQvU97BCE+LJuGg6jlCHk15oddxGdDIhOmXpWDGzVkTMSRQ==
X-Received: by 2002:a05:6000:1287:: with SMTP id
	f7mr28477602wrx.302.1543314387731; 
	Tue, 27 Nov 2018 02:26:27 -0800 (PST)
Received: from ?IPv6:2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9?
	([2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9])
	by smtp.gmail.com with ESMTPSA id 14sm6419695wmv.36.2018.11.27.02.26.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Nov 2018 02:26:27 -0800 (PST)
To: Li Qiang <liq3ea@gmail.com>, rth@twiddle.net, ehabkost@redhat.com,
	laurent@vivier.eu, alex.bennee@linaro.org
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <1543312812-2929-1-git-send-email-liq3ea@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <95ebd5ea-2178-adc6-2733-67712406cb43@redhat.com>
Date: Tue, 27 Nov 2018 11:26:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <1543312812-2929-1-git-send-email-liq3ea@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-trivial] [PATCH v2] target: hax: fix errors in comment
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
X-List-Received-Date: Tue, 27 Nov 2018 10:26:36 -0000

On 27/11/18 11:00, Li Qiang wrote:
> Cc: qemu-trivial@nongnu.org
> 
> Signed-off-by: Li Qiang <liq3ea@gmail.com>
> ---
>  target/i386/hax-all.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/i386/hax-all.c b/target/i386/hax-all.c
> index 502ce6f0af..b978a9b821 100644
> --- a/target/i386/hax-all.c
> +++ b/target/i386/hax-all.c
> @@ -205,7 +205,7 @@ int hax_vcpu_destroy(CPUState *cpu)
>      }
>  
>      /*
> -     * 1. The hax_tunnel is also destroied when vcpu destroy
> +     * 1. The hax_tunnel is also destroyed when vcpu is destroyed
>       * 2. close fd will cause hax module vcpu be cleaned
>       */
>      hax_close_fd(vcpu->fd);
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

