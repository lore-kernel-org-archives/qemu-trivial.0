Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fLEIG-0001mq-ON
	for mharc-qemu-trivial@gnu.org; Tue, 22 May 2018 16:54:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55492)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fLEIB-0001im-Ul
	for qemu-trivial@nongnu.org; Tue, 22 May 2018 16:54:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fLEI8-0001e4-SR
	for qemu-trivial@nongnu.org; Tue, 22 May 2018 16:54:00 -0400
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:46477)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fLEI8-0001dS-Ma
	for qemu-trivial@nongnu.org; Tue, 22 May 2018 16:53:56 -0400
Received: by mail-pg0-x244.google.com with SMTP id a3-v6so3445104pgt.13
	for <qemu-trivial@nongnu.org>; Tue, 22 May 2018 13:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=27FzTotgLwEHtt7HuLA3e5Vg+krMvLbE/NFKjoQXCgI=;
	b=a5ZgRy3pz5dCmqZUW2s9KL2mOS9xYAmTDtVD+9NtbFtZLrAf4OxY7v9xsO1WjTLhjR
	spFXT56KSvbdwbKKDC0lyJYoPmiMEwcZvJAMM6aMhwF0hyHsQvs+Miw5YHvYsMU2wCDt
	qldzqMCSkpoWh1jFhDc+N5/6RZPXENLobSHhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=27FzTotgLwEHtt7HuLA3e5Vg+krMvLbE/NFKjoQXCgI=;
	b=dIOF6+5s3/oQbz6bF79CRUpNLRa+sT1P04Gi9jyIaBUB3BE1Z7HDqpbuuwS9Aevipz
	xBPFY+7zui/htDJ/d/c0a+t1WIr4tDlaPdI6oOj2z+SZvkNO+F9bzlbsHdx2mB2c63j+
	euOIRjMU2krEnisqAhKD4oMUJN1vZhJthrSPEvsi8OtZvBTtP/Cck9nIvSKVc0i30XK2
	K1Rspfdf4WOWcYpWtbJQRrrI22Em+mN8IrBkIJ1MNCxGF2bITyGfjn3PJDZrE02UFt0c
	ujUgczK2bCI9hrxz0h6Owkb4+sxOn4VDTCIxmVlnkVtj7oTYvy9pmHsmX9Jj4F6y67n+
	Hqgw==
X-Gm-Message-State: ALKqPweAL+jpOs1xdlPY1OtfFkMpV92rDjoBMgqvzMvGW1Gl5INsqSlK
	1v6HUsaX69GeyjlI8uL50IspRw==
X-Google-Smtp-Source: AB8JxZoJHONIts7hIT41QDUf2urE7SQ6q39tnVyiGFXSxcJUF89fo9KMj9pOEJXJNvPnfBheZ86QGA==
X-Received: by 2002:a62:1306:: with SMTP id b6-v6mr59651pfj.58.1527022435012; 
	Tue, 22 May 2018 13:53:55 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-173-254.tukw.qwest.net.
	[97.113.173.254]) by smtp.gmail.com with ESMTPSA id
	m72-v6sm39994842pfk.110.2018.05.22.13.53.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 May 2018 13:53:54 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, thuth@redhat.com, david@redhat.com
References: <20180522192034.13318-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <724510e7-e739-5f88-b20b-9e27376a3438@linaro.org>
Date: Tue, 22 May 2018 13:53:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180522192034.13318-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tcg: remove softfloat from
 --disable-tcg builds
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
X-List-Received-Date: Tue, 22 May 2018 20:54:01 -0000

On 05/22/2018 12:20 PM, Paolo Bonzini wrote:
> Even though the presence of softfloat does not cause --disable-tcg builds to fail,
> it is the single largest .o file in them.  Remove it, since TCG is the only client.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  Makefile.target          |   2 +-
>  hw/i386/x86-iommu-stub.c | 132 +++++++++++++++++++++++++++++++++++++++

Assuming this wasn't supposed to be here.

>  2 files changed, 133 insertions(+), 1 deletion(-)
>  create mode 100644 hw/i386/x86-iommu-stub.c
> 
> diff --git a/Makefile.target b/Makefile.target
> index d0ec77a307..dad2cf8778 100644
> --- a/Makefile.target
> +++ b/Makefile.target
> @@ -97,7 +97,7 @@ obj-$(CONFIG_TCG) += tcg/tcg.o tcg/tcg-op.o tcg/tcg-op-vec.o tcg/tcg-op-gvec.o
>  obj-$(CONFIG_TCG) += tcg/tcg-common.o tcg/optimize.o
>  obj-$(CONFIG_TCG_INTERPRETER) += tcg/tci.o
>  obj-$(CONFIG_TCG_INTERPRETER) += disas/tci.o
> -obj-y += fpu/softfloat.o
> +obj-$(CONFIG_TCG) += fpu/softfloat.o

But for this change alone,
Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

