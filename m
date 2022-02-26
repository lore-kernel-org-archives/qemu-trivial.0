Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nNsXp-0001xa-Nr
	for mharc-qemu-trivial@gnu.org; Sat, 26 Feb 2022 03:35:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nNsXi-0001xE-Lj
 for qemu-trivial@nongnu.org; Sat, 26 Feb 2022 03:35:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nNsXd-0004qw-Bd
 for qemu-trivial@nongnu.org; Sat, 26 Feb 2022 03:35:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645864499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zx1MDNCki9QgHAlHiOHMlKCP7Q0rLpXPf8IxnRZydxc=;
 b=TKvXbL4P3o0NhfRTchns7dyWEF88xwW6AkiQKyGjnSVcM0vWS5RowfoJJhz9bv70keHEnF
 IvDCm3HUqqUlROgk5hG+5cfu9ys1UcIjsf/JxyFMkAEBoGPSZdkVrYr0uW5bDd7WNFj1YR
 VvNY5NWa+ut/4AxQRITyQkdB/A4g9Cw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-81-o7DPr_TPOe6io70h8SbMtw-1; Sat, 26 Feb 2022 03:34:56 -0500
X-MC-Unique: o7DPr_TPOe6io70h8SbMtw-1
Received: by mail-wm1-f72.google.com with SMTP id
 l31-20020a05600c1d1f00b00380e3425ba7so2684949wms.9
 for <qemu-trivial@nongnu.org>; Sat, 26 Feb 2022 00:34:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zx1MDNCki9QgHAlHiOHMlKCP7Q0rLpXPf8IxnRZydxc=;
 b=nqQhPaTcvm/VgpgNnuBqRzdZ3z1/N5F7fsFt57npS6CrMjTUg/dsc1PN70pZqKY1SO
 BeJ8lfLBSnLT9D5y1lmD4q+3eGr3oJgxbB3VyF4XvwL2+llC84ZaUC9mSV28US3hg486
 Zho5lkoCfU9b9HKzax6R+GdxHtOyeDMXc3P6mO9CjCtUZAWmtMRy6HvJQliFHKukZT3L
 fkjid3depHaHXby1siot0oMN1FhXdvd/1zvvFPkPVo2MrKFEjag37yaE38j/TU2JVTGf
 NPrt4rityUrOuzraHahqQYTAQWm6bGmRMV0RWj/xOUN7QXLVVgMMpUAu7PlsLF23LdaV
 7s7w==
X-Gm-Message-State: AOAM530a0l9DuUkIsB3j1nrpTBmsAygFrj42SpdQrFhQ6sGi8+jRWf/t
 C1oeZjRhtEDxwNQp5bSUzU83NCQd8+C9TsEoP8a1OuCyL27VtFlPICu9IK2cEotpHIJeW3ani5F
 koA6vFAdBR5JuWWrijg==
X-Received: by 2002:a05:600c:4b87:b0:381:fe:3c5e with SMTP id
 e7-20020a05600c4b8700b0038100fe3c5emr5810718wmp.47.1645864495060; 
 Sat, 26 Feb 2022 00:34:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmNosbwkzaY2C7fc/V+akSUPbWM66dt52dlY0y6eLfqFB4e5g8SuAWDOq6norVsRplrDcGfQ==
X-Received: by 2002:a05:600c:4b87:b0:381:fe:3c5e with SMTP id
 e7-20020a05600c4b8700b0038100fe3c5emr5810704wmp.47.1645864494834; 
 Sat, 26 Feb 2022 00:34:54 -0800 (PST)
Received: from ?IPV6:2003:cb:c71e:7200:b047:4385:f064:3dcc?
 (p200300cbc71e7200b0474385f0643dcc.dip0.t-ipconnect.de.
 [2003:cb:c71e:7200:b047:4385:f064:3dcc])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a5d5006000000b001e75916a7c2sm4408563wrt.84.2022.02.26.00.34.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Feb 2022 00:34:54 -0800 (PST)
Message-ID: <a4ab4f8a-dd0f-6b6a-9b42-16d20604f646@redhat.com>
Date: Sat, 26 Feb 2022 09:34:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] virtio-mem: fix typo virito
To: Joel Nider <joel@nider.org>, qemu-trivial@nongnu.org
References: <20220225231700.1360270-1-joel@nider.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220225231700.1360270-1-joel@nider.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 26 Feb 2022 08:35:07 -0000

On 26.02.22 00:17, Joel Nider wrote:
> Replace 'virito' with 'virtio'. No functional change.
> 
> Signed-off-by: Joel Nider <joel@nider.org>
> ---

Thanks Joel. I'm already carrying such a fix along in the context of a
bigger series:

https://lkml.kernel.org/r/20211027124531.57561-11-david@redhat.com


-- 
Thanks,

David / dhildenb


