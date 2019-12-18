Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ihQZ9-0007XT-01
	for mharc-qemu-trivial@gnu.org; Tue, 17 Dec 2019 23:04:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46378)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ihQZ5-0007Wz-Pb
 for qemu-trivial@nongnu.org; Tue, 17 Dec 2019 23:04:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ihQZ4-0006pc-F1
 for qemu-trivial@nongnu.org; Tue, 17 Dec 2019 23:03:59 -0500
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:38124)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ihQZ4-0006nq-7g
 for qemu-trivial@nongnu.org; Tue, 17 Dec 2019 23:03:58 -0500
Received: by mail-pj1-x1043.google.com with SMTP id l35so238876pje.3
 for <qemu-trivial@nongnu.org>; Tue, 17 Dec 2019 20:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OJ8QuLvs50xb7QgUuuJ4JMKlcPCnwdM0tzFnyDlzGtE=;
 b=YkkX46yTtwelnAvSrtVq4PHU4JjhrCnXLwfY6sTMYSIJhevuoY4msW9HOuh+UzmeWf
 AOnUOkOvfjmJfZ9ggKJkSpWZYQTDM+muLjN7DNYKgkNMnqAbp0PWoCh14RBniIk7C1Pm
 TPF/IhQyzPyAjfHVzUbeZs6tciyr2P/Q/dLyqbfexcXJ3IE+hQEKEFSvPWEi1Rz1uFdr
 honrVN/LZHGilMYicUWqzQPIocPehFWozrc4FuaO1aONgf7prkb1jAsfO03uGpeV8IFc
 5ZKZXbis2K3DTolLDPGNWK0i7qbN5NkgcLgajVKyjPf6yi1PPgrcnKCN8w3TPMtBsj4m
 ptIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OJ8QuLvs50xb7QgUuuJ4JMKlcPCnwdM0tzFnyDlzGtE=;
 b=CGglJg9dItS1SHXsk1ORg+ympTCO8Gfpv3jf/xm971MTRTQ6QxcN3aQi7watICKsvP
 ob+0BCC4t/uE6emglHYn4FNGr4i8p7eYbW2rOB5WPdJ/JuBHHRLTEUSYzw4Z8uWH3AFn
 7KlGEmULIfSxqZ9N+e2aThgh/jtMUc1j/pa7yqz9jAlTq4Wdz1Y9V7UXLZ4DbnGNhtcL
 pGsdhPGGCfJQB/zfzSq/mOjILMKJkmLhaPjBfQacgBlcbOgpuL8tD6Fee5VICAEdLK1f
 W5N6A/gFTArp8GrUY5O5uTssLSci8TOfrthSxOuUptScb3jtmATGHPn/zYJPkMItYXJR
 J5ow==
X-Gm-Message-State: APjAAAWQTSQLaWSqhDpIeHqLy6tF69xF98/nfaImZ7BvpHpyjh7+yb+z
 rkfuTuulgBLn1XitWqV4oSLTHQ==
X-Google-Smtp-Source: APXvYqwDC1aBsDv77pimjQ44fUO/B2pO+POoQ+E72MmFV745VdZtDthWHS+H30uK4dy8VJhTZo/ZFA==
X-Received: by 2002:a17:902:9682:: with SMTP id
 n2mr317283plp.336.1576641837137; 
 Tue, 17 Dec 2019 20:03:57 -0800 (PST)
Received: from ?IPv6:2605:e000:c74f:dc00:6838:d2b2:17e2:8445?
 ([2605:e000:c74f:dc00:6838:d2b2:17e2:8445])
 by smtp.gmail.com with ESMTPSA id u127sm706957pfc.95.2019.12.17.20.03.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2019 20:03:56 -0800 (PST)
Subject: Re: [PATCH 5/6] hw/scsi/megasas: Silent GCC9 duplicated-cond warning
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20191217173425.5082-1-philmd@redhat.com>
 <20191217173425.5082-6-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b29f856a-5199-6f62-4aee-5a2cfc9f05a3@linaro.org>
Date: Tue, 17 Dec 2019 18:03:53 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191217173425.5082-6-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1043
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
X-List-Received-Date: Wed, 18 Dec 2019 04:04:01 -0000

On 12/17/19 7:34 AM, Philippe Mathieu-Daudé wrote:
> GCC9 is confused when building with CFLAG -O3:
> 
>   hw/scsi/megasas.c: In function ‘megasas_scsi_realize’:
>   hw/scsi/megasas.c:2387:26: error: duplicated ‘if’ condition [-Werror=duplicated-cond]
>    2387 |     } else if (s->fw_sge >= 128 - MFI_PASS_FRAME_SIZE) {
>   hw/scsi/megasas.c:2385:19: note: previously used here
>    2385 |     if (s->fw_sge >= MEGASAS_MAX_SGE - MFI_PASS_FRAME_SIZE) {
>   cc1: all warnings being treated as errors
> 
> When this device was introduced in commit e8f943c3bcc, the author
> cared about modularity, using a definition for the firmware limit.
> If we modify the limit, the code is valid. Add a check if the
> definition got modified to a bigger limit.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Cc: Hannes Reinecke <hare@suse.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Fam Zheng <fam@euphon.net>
> Cc: qemu-block@nongnu.org
> ---
>  hw/scsi/megasas.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
> index de9bd20887..ece1601b66 100644
> --- a/hw/scsi/megasas.c
> +++ b/hw/scsi/megasas.c
> @@ -2382,7 +2382,8 @@ static void megasas_scsi_realize(PCIDevice *dev, Error **errp)
>      if (!s->hba_serial) {
>          s->hba_serial = g_strdup(MEGASAS_HBA_SERIAL);
>      }
> -    if (s->fw_sge >= MEGASAS_MAX_SGE - MFI_PASS_FRAME_SIZE) {
> +    if (MEGASAS_MAX_SGE > 128
> +        && s->fw_sge >= MEGASAS_MAX_SGE - MFI_PASS_FRAME_SIZE) {
>          s->fw_sge = MEGASAS_MAX_SGE - MFI_PASS_FRAME_SIZE;
>      } else if (s->fw_sge >= 128 - MFI_PASS_FRAME_SIZE) {
>          s->fw_sge = 128 - MFI_PASS_FRAME_SIZE;
> 

I'm not keen on this.  It looks to me like the raw 128 case should be removed
-- surely that's the point of the symbolic constant.  But I'll defer if a
maintainer disagrees.


r~

