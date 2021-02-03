Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l7L0s-0003X1-8q
	for mharc-qemu-trivial@gnu.org; Wed, 03 Feb 2021 11:28:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7L0m-0003Ui-Ib
 for qemu-trivial@nongnu.org; Wed, 03 Feb 2021 11:28:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7L0l-0003Ir-5q
 for qemu-trivial@nongnu.org; Wed, 03 Feb 2021 11:28:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612369690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ffZYgMc721BhEE82tvIKaTbgMxEMJ9iMOqLFCcKCNsI=;
 b=aU7Ux3tnGxOBADbtZyMnuGz5ylf50rTmdqBNqMMasH+TNYPeJGchRF7ytSzatRFV60cwXs
 IWXfo1wiYIQ03FyeTp/9zvNLisp7gwGXAYElGC/MhZolcUjXCJ+uf/iGz+ooabklX02RUA
 xSsN2GD2Cbu0EyHCbl4BHjSnpTR0ZjU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-5DZ87FIgPQmEGVFgH04qjg-1; Wed, 03 Feb 2021 11:28:07 -0500
X-MC-Unique: 5DZ87FIgPQmEGVFgH04qjg-1
Received: by mail-ej1-f72.google.com with SMTP id dc21so9305ejb.19
 for <qemu-trivial@nongnu.org>; Wed, 03 Feb 2021 08:28:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ffZYgMc721BhEE82tvIKaTbgMxEMJ9iMOqLFCcKCNsI=;
 b=hDFK0wF4HxmFy8LN7vqLUgUF7DCvt9I7dfs74cNx/ugegYKeVbQrCVQCkC3bfyhRXX
 jHXslvwjUvLK9UPfZDLHDPE12CGg0mgeYpy+cO6wxur/jOHo5C7okuC+JGcgdozyDkKL
 04x+GuaQAYORADMglLlT9v7sNeaMpv/4wE25reFNhBOm8V7jjV15j28Kq4YbUNMsqz6Q
 CVlLp2Bx25L4lMDUVeNprT4+dvd8kovN+8HsmwkTJo+AilMOHAW1FufWeiPkk6dofpwP
 NBuL6fKMKmhnZvBKRzT01sZfH4HqSdF/PKbVMMm8iYKjIwmSP+j3apvlp7OdBcVXsgkl
 xhvQ==
X-Gm-Message-State: AOAM531ljwCUJSYBf7n9A4Rcaq/WzhdBsfGizvGu54o6vLaBH7b+DR6b
 jMji46tXaZLH5jZcQltPi9G5B6JobGuOitVeqOiGI79qGbnbtMImvLQVYi0omD7W75oQg/ALehv
 3tBH+9frvMnfiqFgu3g==
X-Received: by 2002:a17:906:e15:: with SMTP id
 l21mr3924950eji.376.1612369685531; 
 Wed, 03 Feb 2021 08:28:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwtzlR7BEidRap/6LPx22dNVdd2wH3qULRc44GLZghFPjPWMaP2A1b2ejBOJX9QoMkbyxzXNg==
X-Received: by 2002:a17:906:e15:: with SMTP id
 l21mr3924925eji.376.1612369685310; 
 Wed, 03 Feb 2021 08:28:05 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id p15sm1221945eja.61.2021.02.03.08.28.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 08:28:04 -0800 (PST)
Subject: Re: [PATCH 0/1] target/arm: Fix SCR_EL3 migration issue
To: avocado-devel <avocado-devel@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-trivial@nongnu.org, peter.maydell@linaro.org,
 Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>, qemu-devel@nongnu.org
References: <20210128143102.7834-1-michael.nawrocki@gtri.gatech.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <309537bf-6d2a-d004-4aa5-720982d944ff@redhat.com>
Date: Wed, 3 Feb 2021 17:28:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210128143102.7834-1-michael.nawrocki@gtri.gatech.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 03 Feb 2021 16:28:15 -0000

Cc'ing avocado-devel for test idea.

On 1/28/21 3:31 PM, michael.nawrocki--- via wrote:
> The SCR_EL3 register reset value (0)  and the value produced when
> writing 0 via the scr_write function (set as writefn in the register
> struct) differ. This causes migration to fail.
> 
> I believe the solution is to specify a raw_writefn for that register.
> 
> Failing invocation:
> $ qemu-system-arm -machine vexpress-a9 -cpu cortex-a9 -nographic
> QEMU 5.2.0 monitor - type 'help' for more information
> (qemu) migrate "exec:cat > img"
> (qemu) q
> $ qemu-system-arm -machine vexpress-a9 -cpu cortex-a9 -nographic -incoming "exec:cat img"
> qemu-system-arm: error while loading state for instance 0x0 of device 'cpu'
> qemu-system-arm: load of migration failed: Operation not permitted
> 
> 
> Mike Nawrocki (1):
>   target/arm: Add raw_writefn to SCR_EL3 register
> 
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 


