Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lfEgF-0001oH-Jw
	for mharc-qemu-trivial@gnu.org; Sat, 08 May 2021 00:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lfEgD-0001nM-Rs
 for qemu-trivial@nongnu.org; Sat, 08 May 2021 00:35:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lfEg6-000723-LD
 for qemu-trivial@nongnu.org; Sat, 08 May 2021 00:35:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620448496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pGxL34WYqN7ryoXkuAYmAHwWfSaKtNMpjVA3PlJ8nwc=;
 b=GcaUenR7nM4t1nX7vhAEfVncuqPpqEmQOQEe0sE2pgSfQbaT2ctWeblA+my2b0uwQPO2Bz
 YGJvEeN0AFCBEgP/yXcKCsrGO7lyw4i5jVkazendYR21zYE44VY4/tuGc8XeNEhG72VkDp
 nLxrwSoIl1b5O9J2YQBdxnc0La9KBAY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-jM0q3MkUOLq9oWs6kQq9_A-1; Sat, 08 May 2021 00:34:53 -0400
X-MC-Unique: jM0q3MkUOLq9oWs6kQq9_A-1
Received: by mail-ed1-f72.google.com with SMTP id
 o12-20020aa7d3cc0000b02903891695ceabso5559773edr.3
 for <qemu-trivial@nongnu.org>; Fri, 07 May 2021 21:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pGxL34WYqN7ryoXkuAYmAHwWfSaKtNMpjVA3PlJ8nwc=;
 b=kVdmtuMZQJZw3WURO4B+AsGBFVAU+nDS3HovvD5W7MqxVXMgtqAIKAl/Apv+SUyrCF
 aJtb/ICxkzLA7QAYhWhC4oJMuSiY6bjlhCplP34gsEDCLt9PJVHIOmKUuUo5JOyJ2o0K
 OlKTM/NXb8e1YhuItLS4eH+NMO3rw+XHXoJ3x7coQMSjFzpgpI3amzorG+JlEPE4YuM5
 c9n9VuEFPTZiFs3PxwW9G54Ulj+9Kalve/Ch+k0p3jkDy2G0BfpcW55/vwWFfUPSDaTz
 lQ5k42TcVFIs1Jxr9+1JxTuSyr3NnnMWj39iRa8vxLD17uqqKBqniqE11NgMf3xbGQDZ
 ofuA==
X-Gm-Message-State: AOAM533J/Cavl18ZTY99KxTq4J5IkEqTu1lfX/FL7VyGLfm0xoZuOHBm
 koaJlp3zaqgpbY0nsuaup9QgiI2ONHQyrsNRJ7Bod/rt8HIWTwCjNQr13JLbYt+A2qspoZmEcGg
 HKySOxDeAG+EeHw0sCfOS0r2OcdMVFnXsyDeRuKy8Ck3QIXkPn8MvZ5lDisU2/yJQIA==
X-Received: by 2002:aa7:c914:: with SMTP id b20mr16385860edt.199.1620448492059; 
 Fri, 07 May 2021 21:34:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyldZyHaKekEi1qBbFOtkflOKzmt6g7FXzSt4KilSEOatQY9R0RNpeVTwtgMQpQwh1aiyPwYQ==
X-Received: by 2002:aa7:c914:: with SMTP id b20mr16385830edt.199.1620448491709; 
 Fri, 07 May 2021 21:34:51 -0700 (PDT)
Received: from thuth.remote.csb (pd9e83d19.dip0.t-ipconnect.de.
 [217.232.61.25])
 by smtp.gmail.com with ESMTPSA id b8sm5781759edu.41.2021.05.07.21.34.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 May 2021 21:34:51 -0700 (PDT)
Subject: Re: [PATCH] multi-process: Avoid logical AND of mutually exclusive
 tests
To: Jagannathan Raman <jag.raman@oracle.com>, qemu-devel@nongnu.org
Cc: stefanha@redhat.com, berrange@redhat.com, john.g.johnson@oracle.com,
 elena.ufimtseva@oracle.com, QEMU Trivial <qemu-trivial@nongnu.org>
References: <1620402803-9237-1-git-send-email-jag.raman@oracle.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <5798d062-ee75-1a71-4ba7-3801ed61beb6@redhat.com>
Date: Sat, 8 May 2021 06:34:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <1620402803-9237-1-git-send-email-jag.raman@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
X-List-Received-Date: Sat, 08 May 2021 04:35:06 -0000

On 07/05/2021 17.53, Jagannathan Raman wrote:
> Fixes an if statement that performs a logical AND of mutually exclusive
> tests
> 
> Reported-by: Thomas Huth <thuth@redhat.com>

I just spotted the bug ticket on Launchpad :-) So whoever picks this patch 
up, please add this instead:

Buglink: https://bugs.launchpad.net/qemu/+bug/1926995
Reviewed-by: Thomas Huth <thuth@redhat.com>

> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>   hw/remote/mpqemu-link.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
> index 9ce3152..e67a5de 100644
> --- a/hw/remote/mpqemu-link.c
> +++ b/hw/remote/mpqemu-link.c
> @@ -218,7 +218,7 @@ uint64_t mpqemu_msg_send_and_await_reply(MPQemuMsg *msg, PCIProxyDev *pdev,
>   
>   bool mpqemu_msg_valid(MPQemuMsg *msg)
>   {
> -    if (msg->cmd >= MPQEMU_CMD_MAX && msg->cmd < 0) {
> +    if (msg->cmd >= MPQEMU_CMD_MAX || msg->cmd < 0) {
>           return false;
>       }


