Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nKN8b-0003rr-V5
	for mharc-qemu-trivial@gnu.org; Wed, 16 Feb 2022 11:26:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nKN8X-0003mK-MF
 for qemu-trivial@nongnu.org; Wed, 16 Feb 2022 11:26:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nKN8U-0001k9-U7
 for qemu-trivial@nongnu.org; Wed, 16 Feb 2022 11:26:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645028793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dcPGgfoMcu0RQ4ibYM9fG7IkgtZ/NhmDBpyzd/EnPAw=;
 b=emoRyvtH2sGrfn+zOEj1WPHdqGPL4y6eCjWkskU0ff8LhEz6ZLhfZNfkKuaqxPJWqc6T9g
 gBIw8+MDN4f5vhamIymTXXH57+QhrWQZuUdW5tMAo0v0l87lQQV1r7l6obwOGos5mE2clm
 xiHZ/BBRRotNGxzrXbtvrvSipwlnLgY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-X88y8XTCM5a53S78vhp4yg-1; Wed, 16 Feb 2022 11:26:23 -0500
X-MC-Unique: X88y8XTCM5a53S78vhp4yg-1
Received: by mail-wr1-f69.google.com with SMTP id
 v17-20020adfc5d1000000b001e6405c2b56so1282712wrg.7
 for <qemu-trivial@nongnu.org>; Wed, 16 Feb 2022 08:26:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=dcPGgfoMcu0RQ4ibYM9fG7IkgtZ/NhmDBpyzd/EnPAw=;
 b=zOFj1gOPhRDn0x7jKufewRIBfWPXIsI4pXtP9HDGeR7h29Bwr0VyYJz1UAfOoxcZ27
 5yNwInYr7EM/w7UX01HK94t5lTXXNomxo+INl3DtjLiuMLgFn8hjTlNBwaYSDHM8+Tsg
 DpPwjRB06n/2ExW8GuDxH1cjPql8g74EK0Hx6N0wjLZ1p6U6QDXnDa2tXriMEeH8MF1d
 behbifKqlBplhn3PjoWXNDhq8oSUTLdzmDJebi5NP5h5kt7xweXMnqH6c1dYMAPHGAN0
 R4yrt233ZWtkK6H5t/ZshzKEmr+5FM2HLEHa984HTqxx6UG/GNEQLFVdurKI1K110+m8
 9JPA==
X-Gm-Message-State: AOAM530C/0g1uOXTDm8UwYWXXOgUjeAinUyqidcmgWIuohFsT0lvwIa9
 0N0rzjQM38CRCSneljJCPk0nrOtP66ds0+9JNkstmo2nHT9k4/G+Qxs01Ry5Z6JWuTafy09kvBs
 IBZZgf7TYr9q8+g/xNg==
X-Received: by 2002:a5d:5887:0:b0:1d7:36e4:e40f with SMTP id
 n7-20020a5d5887000000b001d736e4e40fmr2990816wrf.298.1645028782268; 
 Wed, 16 Feb 2022 08:26:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzSikIXUpjA64AhaCYLMHaLRWluSWDn29vlTdihC5Qw3eSTtjfs4Ejq8gGhu/XTVpMz5sq3cA==
X-Received: by 2002:a5d:5887:0:b0:1d7:36e4:e40f with SMTP id
 n7-20020a5d5887000000b001d736e4e40fmr2990796wrf.298.1645028781960; 
 Wed, 16 Feb 2022 08:26:21 -0800 (PST)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218])
 by smtp.gmail.com with ESMTPSA id i3sm38731734wrq.72.2022.02.16.08.26.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 08:26:21 -0800 (PST)
Message-ID: <2d597b24-2b00-3e4c-27ed-3265a38a48a6@redhat.com>
Date: Wed, 16 Feb 2022 17:26:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] tests/vm: Update haiku test vm to R1/Beta3
To: Alexander von Gluck IV <kallisti5@unixzen.com>, qemu-devel@nongnu.org
References: <20220216154208.2985103-1-kallisti5@unixzen.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220216154208.2985103-1-kallisti5@unixzen.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 16 Feb 2022 16:26:38 -0000

On 16/02/2022 16.42, Alexander von Gluck IV wrote:
> ---
>   tests/vm/haiku.x86_64 | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/vm/haiku.x86_64 b/tests/vm/haiku.x86_64
> index 2eb736dae1..936f7d2ae2 100755
> --- a/tests/vm/haiku.x86_64
> +++ b/tests/vm/haiku.x86_64
> @@ -2,7 +2,7 @@
>   #
>   # Haiku VM image
>   #
> -# Copyright 2020 Haiku, Inc.
> +# Copyright 2020-2022 Haiku, Inc.
>   #
>   # Authors:
>   #  Alexander von Gluck IV <kallisti5@unixzen.com>
> @@ -48,8 +48,8 @@ class HaikuVM(basevm.BaseVM):
>       name = "haiku"
>       arch = "x86_64"
>   
> -    link = "https://app.vagrantup.com/haiku-os/boxes/r1beta2-x86_64/versions/20200702/providers/libvirt.box"
> -    csum = "41c38b316e0cbdbc66b5dbaf3612b866700a4f35807cb1eb266a5bf83e9e68d5"
> +    link = "https://app.vagrantup.com/haiku-os/boxes/r1beta3-x86_64/versions/20220216/providers/libvirt.box"
> +    csum = "e67d4aacbcc687013d5cc91990ddd86cc5d70a5d28432ae2691944f8ce5d5041"
>   
>       poweroff = "shutdown"
>   
> @@ -99,7 +99,7 @@ class HaikuVM(basevm.BaseVM):
>   
>           self.print_step("Extracting disk image")
>   
> -        subprocess.check_call(["tar", "xzf", tarball, "./box.img", "-O"],
> +        subprocess.check_call(["tar", "xzf", tarball, "box.img", "-O"],
>                                 stdout=open(img, 'wb'))
>   
>           self.print_step("Preparing disk image")

Thank you very much for the quick fix, that indeed helps to compile-test 
Haiku again! (the unit tests are failing, though, but IIRC that was already 
the case before)

Tested-by: Thomas Huth <thuth@redhat.com>



