Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eYeVK-00083f-F4
	for mharc-qemu-trivial@gnu.org; Mon, 08 Jan 2018 15:58:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55314)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYeVI-00083O-Ge
	for qemu-trivial@nongnu.org; Mon, 08 Jan 2018 15:58:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYeVE-0000Xc-Vi
	for qemu-trivial@nongnu.org; Mon, 08 Jan 2018 15:58:44 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:41517)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYeVE-0000XI-NN
	for qemu-trivial@nongnu.org; Mon, 08 Jan 2018 15:58:40 -0500
Received: by mail-qt0-x243.google.com with SMTP id i40so15322535qti.8
	for <qemu-trivial@nongnu.org>; Mon, 08 Jan 2018 12:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=zet7nOb0Ix3ayADkN+mOpD0nsKL7ayPw7Y7Rl3C0E8k=;
	b=gHJcWji7iAQ5t16vEMJeGgDPJHiphdEVjYhcQq1DhaREDUuQk+KPAYqlGaqrLmDsRu
	wE4vtI9v5pXu5kNVPuBsdxMS+I7gIO9U07tlmDPXheVjoLoQfJrTRJPU+KZX0mH43yxN
	hWWC8QRE7+TyeCPxKaSHko1szXtDhvDx6gNycFOhjNo4WPqgeE2O2PvkvNYgn6AL/Bat
	t/WwBorBC+0HMIcrOAtZPFgw7TQtgaOfdNffScdgpSp+K4vCb0w1aL3kQIUsvL96ChMO
	ZsxEGCx51CQGWWf+96X6mnTfTSIKo6Pv0IL7/LX6EysE2MVMvhDTrZwP/5DPpEt3mxr5
	lNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=zet7nOb0Ix3ayADkN+mOpD0nsKL7ayPw7Y7Rl3C0E8k=;
	b=r2OoUbcg35XTI5B72/fu7IGU8L/entRueR092kVppmgawBG8fXFCaaYIiq4/WQRQer
	2HDKVBd7KIpPAMFEfF4c7xmpWjA7G7OX20Il6kcgvqRRrx/yE0BUuvZAvfLdU7ZlvmXv
	US+GO82NRWIXjUZqjKdZljugODTNhm5QsF1ghshrPqllnyxOXEPfyFfCVqVI7qqXNHvT
	B736tIOTC864hKxkadujSUWR2FLhmtzj6nuKcOYORuwMb27hHIV2GwJq8/aKmI0PcOam
	ORJ1Z0cmHnvK6bJGG3bERrPrw/lDyGdRlOGJtlbmHHSP48IIx/id/F6pZBDWlm11c+qc
	fNGw==
X-Gm-Message-State: AKwxytf0DhC3ege/HNO2E+fPF5ccKgVl4B7/WwClXxoueqS2kVECFOnz
	dX4hN7/d8mP6bafYPfvK+TrtipEwRQ8=
X-Google-Smtp-Source: ACJfBovh49WlxfXwhmujW28/MHBrLY6UnXofZhYRnB9gmcLQiyh20TGhblUHLZFa6VnUD0Y3XbnrMg==
X-Received: by 10.237.46.228 with SMTP id k91mr17689830qtd.104.1515445119933; 
	Mon, 08 Jan 2018 12:58:39 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	e56sm8097918qtc.46.2018.01.08.12.58.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 12:58:39 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20171218151510.2901-1-dmitry.fleytman@gmail.com>
Cc: qemu-trivial@nongnu.org
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <104f4f90-6735-1dd6-de0f-2396de18089c@amsat.org>
Date: Mon, 8 Jan 2018 17:58:36 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20171218151510.2901-1-dmitry.fleytman@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-trivial] [PATCH] MAINTAINERS: Update e-mail address
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
X-List-Received-Date: Mon, 08 Jan 2018 20:58:45 -0000

Also Cc'ing Jason (Network devices) & Paolo (Misc) in case they are
preparing some PR.

On 12/18/2017 12:15 PM, Dmitry Fleytman wrote:
> Updating MAINTAINERS with my current e-mail address.
> 
> Signed-off-by: Dmitry Fleytman <dmitry.fleytman@gmail.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  MAINTAINERS | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 45e2e2009b..d51273e656 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1145,7 +1145,7 @@ F: hw/scsi/mfi.h
>  F: tests/megasas-test.c
>  
>  Network packet abstractions
> -M: Dmitry Fleytman <dmitry@daynix.com>
> +M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
>  S: Maintained
>  F: include/net/eth.h
>  F: net/eth.c
> @@ -1153,7 +1153,7 @@ F: hw/net/net_rx_pkt*
>  F: hw/net/net_tx_pkt*
>  
>  Vmware
> -M: Dmitry Fleytman <dmitry@daynix.com>
> +M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
>  S: Maintained
>  F: hw/net/vmxnet*
>  F: hw/scsi/vmw_pvscsi*
> @@ -1174,12 +1174,12 @@ F: hw/mem/nvdimm.c
>  F: include/hw/mem/nvdimm.h
>  
>  e1000x
> -M: Dmitry Fleytman <dmitry@daynix.com>
> +M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
>  S: Maintained
>  F: hw/net/e1000x*
>  
>  e1000e
> -M: Dmitry Fleytman <dmitry@daynix.com>
> +M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
>  S: Maintained
>  F: hw/net/e1000e*
>  
> 

