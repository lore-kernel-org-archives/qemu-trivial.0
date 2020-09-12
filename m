Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kH8EK-0000Yh-CF
	for mharc-qemu-trivial@gnu.org; Sat, 12 Sep 2020 12:18:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kH8EJ-0000YI-8V
 for qemu-trivial@nongnu.org; Sat, 12 Sep 2020 12:18:23 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:32341
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kH8EH-00060J-At
 for qemu-trivial@nongnu.org; Sat, 12 Sep 2020 12:18:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599927499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F/B/PWzqUW6KvBsejypy1Tw7oHLy21bCgDEqHt5U9Jw=;
 b=ZlsZxW5vjPPFJSFWDCdV2wKMlV6eOuBZ71ScxDj8iva6Yv/MKnM7miy7HvKK6X+ltH+2Wp
 Mu6HkmZjKkSmn/8YXVc7jVqjeIDxvGDhjRI8aEp6TZ0X60C9X0h9WHQNi8Sb054eb/7INR
 jeeF6pSL72wwY1WzWCfu8UIjm51nJ+s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-YK5Mxko5Os2AsmlUCLZmBg-1; Sat, 12 Sep 2020 12:18:17 -0400
X-MC-Unique: YK5Mxko5Os2AsmlUCLZmBg-1
Received: by mail-wr1-f70.google.com with SMTP id l17so4506202wrw.11
 for <qemu-trivial@nongnu.org>; Sat, 12 Sep 2020 09:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F/B/PWzqUW6KvBsejypy1Tw7oHLy21bCgDEqHt5U9Jw=;
 b=Q83/Y85TcsqeKhgwKLKUSDY/zcp8fwIL1dMYVTfJfZdzhllpywWL5bG9hZ0isnr5DV
 P62S4UcFAu4D5gcbg/1roRia9ogAb4GPZi+0oBo3UlZVfk+a2aeOSVPZeCoh4uyQQAS3
 L84K8Oj25T4fwtuMtHFUyk+EsLXBrpm9jZTGj+EYXztGTcj/+iMzdH8nllHwxa4ewgmF
 YH3R5UWVB+MzTQnM6x/7YoR8prB7oqpQi4aoH7/HLfU0SDpVQ1uhZgAFfUqDyc10s0gI
 U61sc6Z9S/EJC/8O+upHx9mZ/pEPWaU+YX6RMP/k/1LXkf8k9U0Zpn1wKMvAPryJ1Ba9
 aWZg==
X-Gm-Message-State: AOAM530Yo3RzhMDxkfwBkD92cn0zXETfS9LRHvGycYai6mjrepyB9afj
 ZX9Vu2RtvcpetVE9fkYqDYy0shUSeyZmadNYLrwNsIMdVyWBgZS1yHeykIaaOwPmzU61dVT06Ar
 gx/XzYsKGtg2PdS/t7g==
X-Received: by 2002:adf:db43:: with SMTP id f3mr7968939wrj.219.1599927496474; 
 Sat, 12 Sep 2020 09:18:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz16b3yWDsZMYkti/ueSynSKRsJ3tN20E4GRrMuFe+R1nVkeZAtbklUr2+W+IACL3IZPwDg5A==
X-Received: by 2002:adf:db43:: with SMTP id f3mr7968931wrj.219.1599927496290; 
 Sat, 12 Sep 2020 09:18:16 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:9fd9:16f2:2095:52d7?
 ([2001:b07:6468:f312:9fd9:16f2:2095:52d7])
 by smtp.gmail.com with ESMTPSA id v204sm10970570wmg.20.2020.09.12.09.18.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Sep 2020 09:18:15 -0700 (PDT)
Subject: Re: [PATCH 7/7] hw/char/serial: Let SerialState have an 'id' field
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20200907015535.827885-1-f4bug@amsat.org>
 <20200907015535.827885-8-f4bug@amsat.org>
 <b6dceab9-d20d-290e-93c5-170a99499da2@redhat.com>
 <9ba2e4c6-859e-0798-c43d-585413864095@amsat.org>
 <c717743f-d43c-1aae-291a-7d050c96b16a@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2e243901-8c12-fa71-022a-d50701a1673b@redhat.com>
Date: Sat, 12 Sep 2020 18:18:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <c717743f-d43c-1aae-291a-7d050c96b16a@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/12 11:38:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.543, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 12 Sep 2020 16:18:23 -0000

On 12/09/20 13:33, Philippe Mathieu-Daudé wrote:
>> I'll send a new patch for the PCI-single device:
> Bah this can simply be squashed into the previous patch.
> 

Yup, done.

Paolo


