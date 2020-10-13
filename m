Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kSHde-0001Q3-Al
	for mharc-qemu-trivial@gnu.org; Tue, 13 Oct 2020 06:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kSHdc-0001Po-Dm
 for qemu-trivial@nongnu.org; Tue, 13 Oct 2020 06:34:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kSHda-0003ko-5B
 for qemu-trivial@nongnu.org; Tue, 13 Oct 2020 06:34:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602585272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VoguNjI7oBCF4ito9ca0lw6czC+f+FC3PWqdy4LBhOk=;
 b=Hxu1984y0DUREdigJPb6qDJWNKQQGyEffDzsCwZFlSvwvf+LvLInEw4JUUyXkF3psh7Zh0
 5zff5D0VzCLWVJH3wdoE34lvsAwRyPlgeuTrJo3xla838+rk4U0Ooiz66M3Z+XXD9CSysF
 aZwMxWJFBVxZlav728ibs4JujYOMW1o=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-tq68Z_dDNPWvUjW4N0kg6Q-1; Tue, 13 Oct 2020 06:34:29 -0400
X-MC-Unique: tq68Z_dDNPWvUjW4N0kg6Q-1
Received: by mail-wr1-f69.google.com with SMTP id 2so1531310wrd.14
 for <qemu-trivial@nongnu.org>; Tue, 13 Oct 2020 03:34:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VoguNjI7oBCF4ito9ca0lw6czC+f+FC3PWqdy4LBhOk=;
 b=COnmdnV2ARsxO1wCPh05+x12Mkj0UV5f6paXcloWuf67IF5NQYej6g+58Z4igMCbea
 AaOMq1glh/T4jtLidRYqoEBBgatylxBrU2vmDSwtQMOxIevHG2PDXXJDyEs4U/Lk0K0y
 6oHPfCyEnl2b6jXsCkvh/9DHuo6RZPdcce7KHI10FPtzXBWwFDD/Q8zcZ6x2uYM/ElqI
 kf5QAsne3nkpHd0Zj04l3jEDj9UhbMchpD1kErTiEklSd/32skglIewknGopfGdftvRM
 jMCPFCJEu7FhD6Nt9mVBaDYF67RDBAwD6VdSkciboAZD3OCzdy8EZYFx7Gtwc/B7RPZN
 SFZg==
X-Gm-Message-State: AOAM530fAuW7laSYqnY9en7T9RQTGgMMTfjpUraifJRuSF0R8OO1CoSS
 pCcqa/fByRxWics+KqpMRIrpbHT6f4Y7M3yiQcDOk27n6Jr29nKLknh74fh8BcgrcTL0VbYWfH2
 sNYYmxukRK9k5GZuizg==
X-Received: by 2002:a1c:bd43:: with SMTP id n64mr14194481wmf.113.1602585268719; 
 Tue, 13 Oct 2020 03:34:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXxAhYHpQXHMAHqMNLnEgFO7iGslPWdKPALdTKqMPOCyGzdTryyT9Cc7ETObocvJFFMa7KbQ==
X-Received: by 2002:a1c:bd43:: with SMTP id n64mr14194463wmf.113.1602585268523; 
 Tue, 13 Oct 2020 03:34:28 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id p4sm22652218wrf.67.2020.10.13.03.34.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2020 03:34:27 -0700 (PDT)
Subject: Re: [PATCH v3] hw/core/qdev-properties-system: Fix pci bus range in
 set_pci_host_devaddr()
To: Klaus Herman <kherman@inbox.lv>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20201013092014.34059-1-kherman@inbox.lv>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9f1303e7-90f4-aeb4-a7e9-0088b9f3c741@redhat.com>
Date: Tue, 13 Oct 2020 12:34:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201013092014.34059-1-kherman@inbox.lv>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 02:06:42
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
X-List-Received-Date: Tue, 13 Oct 2020 10:34:36 -0000

On 10/13/20 11:20 AM, Klaus Herman wrote:
> Fixes: bccb20c49df ("hw/core/qdev-properties: Use qemu_strtoul() in set_pci_host_devaddr()")
> Signed-off-by: Klaus Herman <kherman@inbox.lv>
> ---
>   hw/core/qdev-properties-system.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
> index 49bdd12..e3dca56 100644
> --- a/hw/core/qdev-properties-system.c
> +++ b/hw/core/qdev-properties-system.c
> @@ -903,7 +903,7 @@ static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
>       bus = val;
>   
>       p = (char *)e + 1;
> -    if (qemu_strtoul(p, &e, 16, &val) < 0 || val > 0x1f || e == p) {
> +    if (qemu_strtoul(p, &e, 16, &val) < 0 || val > 0xff || e == p) {

As this is used to check both bus/slot range, I sent a different
approach to fix this issue:
https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg03604.html

>           goto inval;
>       }
>       if (*e == ':') {
> 


