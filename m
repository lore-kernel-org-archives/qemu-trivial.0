Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1myXgq-00022A-I3
	for mharc-qemu-trivial@gnu.org; Sat, 18 Dec 2021 06:15:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myXgp-00021m-AX
 for qemu-trivial@nongnu.org; Sat, 18 Dec 2021 06:15:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myXgn-0000FM-5B
 for qemu-trivial@nongnu.org; Sat, 18 Dec 2021 06:15:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639826144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CzMCg3fOAziUVxgFfEfEzVqkdelPYpEAoyxOKdlb80o=;
 b=UjFMlNkK+aT4mO0ypCLbhz0hR7npogbnEhFt3TEqbppyHBkTyl+0KHlJ3X1jQPHJP9wx5f
 dVwBR3NxhXRGVv3yEmASSqdIuWqAEWgZBL+1A3WMN8xGpBT+b1HJIf3FG3fdYJwGUX1BW9
 QZeWxt5vlkEAJKBEXncnMWzNKWkwo+k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-gxD1lvGYNKC3DfS7-7-BCQ-1; Sat, 18 Dec 2021 06:15:42 -0500
X-MC-Unique: gxD1lvGYNKC3DfS7-7-BCQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 bi14-20020a05600c3d8e00b00345787d3177so2251720wmb.0
 for <qemu-trivial@nongnu.org>; Sat, 18 Dec 2021 03:15:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CzMCg3fOAziUVxgFfEfEzVqkdelPYpEAoyxOKdlb80o=;
 b=wnf+tX639fejBa9ilCwQYa51tLgD/JHbhELi4ZCENaj6xH7qAU6ivfUToN0mQJ6p7z
 qMEUQvEVUN3PTPpCJdR1EjpdQar8Q1pI2CiEp8WzNn24lmsZYIkNTLJXabL1OVCLsCrV
 4JVlz/O4Pjr4IPK8ctM2BaGkjEn/Wt3lgE13LyHC82Pl9gad7m0Na2ApxgYchrrVlDvv
 pnOkVdiNWVlXH/VL+0pBOmrcfESdALIQuMtw76ze5BVIApJNYlBazaF7uqAR/IQYdmL/
 5xVAbUg47xUTsPbSwrYm8dfdiCBx4N4UboZce9LNpLo2O3ab+wG+G3FyynMEO7YKZ1Oy
 UhSw==
X-Gm-Message-State: AOAM531Cq21t3i8cttXNV98qzRnuDhXlhCbgKyFjYlFCHkwRLcPVPa0g
 ESwK5kNl/2DbmAU/q4S4t57uYaOPLzub2SumKWSsAF/39ZV3nqKEFW7/r/a5NrhpQSO0kUqCMin
 WKB9Qj95J4oTmUdtEjg==
X-Received: by 2002:a1c:9856:: with SMTP id a83mr6285128wme.157.1639826141671; 
 Sat, 18 Dec 2021 03:15:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6nP5zHnrOZCX97fWYh2Qc7vpQeF8KcSCAIMRyAZS5J9Qa55kOWUSVubZmrKMSrl59KNZoCg==
X-Received: by 2002:a1c:9856:: with SMTP id a83mr6285113wme.157.1639826141438; 
 Sat, 18 Dec 2021 03:15:41 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id i17sm11144254wmq.48.2021.12.18.03.15.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Dec 2021 03:15:40 -0800 (PST)
Message-ID: <6cdce8f1-859c-9504-3158-cea7e30bdda9@redhat.com>
Date: Sat, 18 Dec 2021 12:15:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] hw/scsi/megasas: Simplify using the ldst API
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20211217231542.1461286-1-philmd@redhat.com>
 <32549938-46c1-94d0-dc3a-3a722d4fc31d@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <32549938-46c1-94d0-dc3a-3a722d4fc31d@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 18 Dec 2021 11:15:47 -0000

On 12/18/21 01:36, Richard Henderson wrote:
> On 12/17/21 3:15 PM, Philippe Mathieu-Daudé wrote:
>> -    cdb[3] = (len >> 8) & 0xff;
>> -    cdb[4] = (len & 0xff);
>> +    stw_be_p(&cdb[2], len);
> 
> Wrong offset.  Otherwise,

>_<

> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thank you.


