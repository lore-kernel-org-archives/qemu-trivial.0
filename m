Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kRxzG-0000gz-31
	for mharc-qemu-trivial@gnu.org; Mon, 12 Oct 2020 09:35:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kRxzD-0000cR-Kw
 for qemu-trivial@nongnu.org; Mon, 12 Oct 2020 09:35:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kRxzB-0007H4-CI
 for qemu-trivial@nongnu.org; Mon, 12 Oct 2020 09:35:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602509731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NvbXSClYIzwj2r2gYxWjlhXEfDIn1+3uI+VyMvrDSfU=;
 b=TZe22/SQ9bexk9Znv0L8j3iH/bqiR0g3QIFADAdmX7OTsV0fGqqP7XH/ABfscHuQ5LBRdf
 Z6l1+XkDhmWhLJhzi1OV9NkOJ2dNlICk1mMmV31/qZSN8db4A1etRAESjk1/u0ZaaeFseh
 6Dfb78bMIRBxn5Oht8cj7NKXNEG+MWU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-9pxV_L3DPYurhWnTX7qiIQ-1; Mon, 12 Oct 2020 09:35:29 -0400
X-MC-Unique: 9pxV_L3DPYurhWnTX7qiIQ-1
Received: by mail-wm1-f70.google.com with SMTP id w23so5217961wmi.1
 for <qemu-trivial@nongnu.org>; Mon, 12 Oct 2020 06:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NvbXSClYIzwj2r2gYxWjlhXEfDIn1+3uI+VyMvrDSfU=;
 b=Tgarxaq6xejAga7BWYjJ5C6x3HIKuLrhjA+w4WStc/4LTih9XcEqJRLH4ZZyBOYkXn
 KouJZ8TGyJz1QoNn5Jjm27OUaFkSHoYjLWRSO1A5odhus6h8MzyzHiBtSyM21z5MOupq
 l8S7tuRfAa3hc6s9xU7gQdf0jDeWlokYlqxU5YaZy+eC2++FxTXLmBxcKK8DvofpLi9+
 hTAYXPRIrr3TdNEZNWd0NTaAuCo5xvC0bhG10HZ4gAvkxmzsC33RXGGR2DXXxIrQcVg6
 TP2ivKs0uCZR2AP77Bwdb8tlMRZ2Lu7uZ3nsV8YrRz4JbtKEaApnSzahXSpMCTzceXhM
 40fw==
X-Gm-Message-State: AOAM5314sc2bd3kXZHAIr9m4xDmgSxiEIMTmoAcpYLhtVlQzg8yEmNth
 WgAzaEbBIOmSOgWxdDVnwmJWf8l8BsZNKHuhWzlR7wLsCCZf5M0YLh2dd2f4rGeQmxi0/qLpdGV
 DDCTKgR1siVZ2knZIWA==
X-Received: by 2002:a1c:dcc3:: with SMTP id t186mr10880184wmg.70.1602509728216; 
 Mon, 12 Oct 2020 06:35:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXYbZ7OWNFRh5uWxEQRMW1SSndZfMjlaf+bg5jNDDFFbVuwnCdtfm+p0KnqZFK2n3vX1vcEw==
X-Received: by 2002:a1c:dcc3:: with SMTP id t186mr10880172wmg.70.1602509728024; 
 Mon, 12 Oct 2020 06:35:28 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id o4sm6560487wrv.8.2020.10.12.06.35.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2020 06:35:27 -0700 (PDT)
Subject: Re: [PATCH] hw/scsi: remove dead code
To: Elena Afanasova <eafanasova@gmail.com>, hare@suse.com,
 pbonzini@redhat.com, fam@euphon.net, qemu-block@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <ea41618a040224242fced25fc3d09d3b1f75a06a.camel@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <98c5390e-aabd-82e8-e596-a53c90754ccf@redhat.com>
Date: Mon, 12 Oct 2020 15:35:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <ea41618a040224242fced25fc3d09d3b1f75a06a.camel@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/11 23:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 12 Oct 2020 13:35:35 -0000

Hi Elena,

On 10/12/20 3:32 PM, Elena Afanasova wrote:
> Since MEGASAS_MAX_SGE is defined to be 128 the following if statement can be removed.
> Spotted by PVS-Studio.
> 
> Signed-off-by: Elena Afanasova <eafanasova@gmail.com>
> ---
>   hw/scsi/megasas.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
> index e24c12d7ee..6dcaad55fa 100644
> --- a/hw/scsi/megasas.c
> +++ b/hw/scsi/megasas.c
> @@ -2393,8 +2393,6 @@ static void megasas_scsi_realize(PCIDevice *dev, Error **errp)
>       }
>       if (s->fw_sge >= MEGASAS_MAX_SGE - MFI_PASS_FRAME_SIZE) {
>           s->fw_sge = MEGASAS_MAX_SGE - MFI_PASS_FRAME_SIZE;
> -    } else if (s->fw_sge >= 128 - MFI_PASS_FRAME_SIZE) {
> -        s->fw_sge = 128 - MFI_PASS_FRAME_SIZE;

See previous discussion:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg668850.html

>       } else {
>           s->fw_sge = 64 - MFI_PASS_FRAME_SIZE;
>       }
> 


