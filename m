Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jHXYM-0005db-39
	for mharc-qemu-trivial@gnu.org; Thu, 26 Mar 2020 14:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52334)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jHXYG-0005ZJ-7a
 for qemu-trivial@nongnu.org; Thu, 26 Mar 2020 14:48:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1jHXYD-0002e4-AS
 for qemu-trivial@nongnu.org; Thu, 26 Mar 2020 14:48:23 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:42924)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1jHXYC-0002dg-8p
 for qemu-trivial@nongnu.org; Thu, 26 Mar 2020 14:48:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585248499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2BOe9Mky1sHd/AxUSvoEQSW5fOlSSXd4c12oRfsY5jA=;
 b=YcitMga8h46UhJ2T6ynohlh8mBHg0PN5L/r2oJw3CLDLJxtXAnICHS44IRPwXGtYm1koR8
 mbluXKvRASxDiWZ5mab/RPlPEc5eyLx4fRxcn1EIiBYyo9zvyEZrpUgDvMJeOvGHrAscE7
 tdHgd988ZpLbh5U4xRJ/zzouEAp36uw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-xcu-vacfMy2907DDRo2H0w-1; Thu, 26 Mar 2020 14:48:17 -0400
X-MC-Unique: xcu-vacfMy2907DDRo2H0w-1
Received: by mail-wr1-f69.google.com with SMTP id m15so3576787wrb.0
 for <qemu-trivial@nongnu.org>; Thu, 26 Mar 2020 11:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2BOe9Mky1sHd/AxUSvoEQSW5fOlSSXd4c12oRfsY5jA=;
 b=nRZ9CBfss3eEj83JGGfh62BoeuG7TF81pBJ0CL9hPBCHqx7uuq0Guh7oFtLT8u3E7d
 zkhYlphvaZZnTUrtKXTwmetZv8QzX6jyCH5xtiq9R9M3s5hjc5fbn5tIQXpfyk7F7WtK
 02rHxjry049O0wXnR2lWK9y3nVSUU+9LTN3AoDBF31/ub0H3cspKSxR9HK6J8cJwbmhp
 oiEzGAx2AZsY/pnRIDo9KMxA6vrXq02WTQwNck4q4V1Fif6GZnsQ0ss6jrghrK2A28my
 CNOD4b4MlZlPH/5dseMTVQFDHW4WsED9BH0qErqhqHM1YG7OdAwkyiaDhcQGTeGf8Il7
 MJsA==
X-Gm-Message-State: ANhLgQ0qcjix0zKIV02P9RjEQHE7D0WsI/GpWv3DwShFc1xbgDI+rZC9
 8w5IQq3KajHcXudYzKu8R7ozwSupNX4K5nE4LUh3QXrP+Y+EwycZNEn5x5bMR+QjEE5DnJeHNNp
 d/DE0AfkqpTZwJ81SRw==
X-Received: by 2002:a1c:23d5:: with SMTP id j204mr1411480wmj.59.1585248495889; 
 Thu, 26 Mar 2020 11:48:15 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsoAaIf+cenjr5d5sdALqsGvAKAb/+Y2Fyxjb6gV1sieW64ySCM677S/v07UCbd001Hz3dmOQ==
X-Received: by 2002:a1c:23d5:: with SMTP id j204mr1411460wmj.59.1585248495638; 
 Thu, 26 Mar 2020 11:48:15 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:ac:65bc:cc13:a014?
 ([2001:b07:6468:f312:ac:65bc:cc13:a014])
 by smtp.gmail.com with ESMTPSA id t193sm4836783wmt.14.2020.03.26.11.48.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2020 11:48:15 -0700 (PDT)
Subject: Re: [PATCH] i386/cpu: Expand MAX_FIXED_COUNTERS from 3 to 4 to for
 Icelake
To: Like Xu <like.xu@linux.intel.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20200317055413.66404-1-like.xu@linux.intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b536e5e3-d102-ff82-4ebc-01114b9a1b7f@redhat.com>
Date: Thu, 26 Mar 2020 19:48:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200317055413.66404-1-like.xu@linux.intel.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Mar 2020 18:48:25 -0000

On 17/03/20 06:54, Like Xu wrote:
> In the Intel SDM, "Table 18-2. Association of Fixed-Function
> Performance Counters with Architectural Performance Events",
> we may have a new fixed counter 'TOPDOWN.SLOTS' (since Icelake),
> which counts the number of available slots for an unhalted
> logical processor. Check commit 6017608936 in the kernel tree.
> 
> Signed-off-by: Like Xu <like.xu@linux.intel.com>
> ---
>  target/i386/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 576f309bbf..ec2b67d425 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1185,7 +1185,7 @@ typedef struct {
>  #define CPU_NB_REGS CPU_NB_REGS32
>  #endif
>  
> -#define MAX_FIXED_COUNTERS 3
> +#define MAX_FIXED_COUNTERS 4
>  #define MAX_GP_COUNTERS    (MSR_IA32_PERF_STATUS - MSR_P6_EVNTSEL0)
>  
>  #define TARGET_INSN_START_EXTRA_WORDS 1
> 

Hi Like, the problem with this patch is that it breaks live migration;
the vmstate_msr_architectural_pmu record hardcodes MAX_FIXED_COUNTERS as
the number of registers.

So it's more complicated, you need to add a new subsection (following
vmstate_msr_architectural_pmu) and transmit it only if the 4th counter
is nonzero (instead of the more complicated check in pmu_enable_needed).
 Just to be safe, I'd make the new subsection hold 16 counters and bump
MAX_FIXED_COUNTERS to 16.

Thanks,

Paolo


