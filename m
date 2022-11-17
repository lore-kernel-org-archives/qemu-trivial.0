Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ovZoE-0001Bt-KJ
	for mharc-qemu-trivial@gnu.org; Thu, 17 Nov 2022 02:59:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ovZoD-0001BW-QS
 for qemu-trivial@nongnu.org; Thu, 17 Nov 2022 02:59:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ovZoC-00041E-Be
 for qemu-trivial@nongnu.org; Thu, 17 Nov 2022 02:59:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668671979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dyA421Tvv3Oyb9M+FFZH3DI5Jt12pXv59WnDZRJFImY=;
 b=hwWK4g48mX6bnxbNktmjVr2ULHJG/N0c0ubnze5aWDl0OkakVmVb8nGx69OszKYgv/9f5r
 RV3vxYYQ40NuSJ/13YsFU1NgrazP9diq/BS18bwAhhdClXlyxY5dnwMjnRrLW+dKC4ZQlk
 AT59C2oS35dVNZB6i3ixMpDVmHPCO6s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-349-BOQHlqjhO8GDyk2QxqNtew-1; Thu, 17 Nov 2022 02:59:38 -0500
X-MC-Unique: BOQHlqjhO8GDyk2QxqNtew-1
Received: by mail-wr1-f72.google.com with SMTP id
 d10-20020adfa34a000000b00236616a168bso360137wrb.18
 for <qemu-trivial@nongnu.org>; Wed, 16 Nov 2022 23:59:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dyA421Tvv3Oyb9M+FFZH3DI5Jt12pXv59WnDZRJFImY=;
 b=NZoloUc1Ciw8qTAP+4jip7mwP46xHOYVeQH/r0oWiOX3ISTWpAnYc3btiQVttg8OtR
 3j0s/xBQOvJ+ZOrrp7hUghNonMHkUAi2l/IsMGFBmDMuisBnaqCcR9YeclmIa73097EF
 3XuzbHAktRjz++O3I4PtYL6AlHOziBuXQRffHhZg5U4OGD8DRblskr+Qq9iVDYMhilcH
 zhUZhlvLC22t+MMQRu9Yx2Tyc/8x7HT5o/o3JITw9R96nekgRM5ZqIDdy1hBHbZ7lbxE
 yLpA2W2SsNN1/4x+9Okat2MDzASXQdUSpfQCn+CysY6K/0O+5IrCkRmDKWK1uNiUi6d1
 2uTA==
X-Gm-Message-State: ANoB5pmHwk1vDOVA8mZ4dw5vlAfho3c9mFyW6V64+esuuHUZB5Hfk7bv
 rWCReKPFc0ovM6rWbLt0Q5kXGF4lso2FiXgv9CJrQeTVyTTczyKCGaRjJfsIuzoLFMOLkBxjnTH
 fS0kg+9k1eX6wRiP+1w==
X-Received: by 2002:a05:600c:3d08:b0:3cf:e84d:6010 with SMTP id
 bh8-20020a05600c3d0800b003cfe84d6010mr796711wmb.197.1668671977001; 
 Wed, 16 Nov 2022 23:59:37 -0800 (PST)
X-Google-Smtp-Source: AA0mqf481+uDpiPsnHUvdX8H2mnAUVwmMxO+QKHZsZy5L4lyKxscxztZIiMawc9LowqAjCOsQS985A==
X-Received: by 2002:a05:600c:3d08:b0:3cf:e84d:6010 with SMTP id
 bh8-20020a05600c3d0800b003cfe84d6010mr796696wmb.197.1668671976726; 
 Wed, 16 Nov 2022 23:59:36 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-4.web.vodafone.de. [109.43.177.4])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a5d4dc8000000b002366c3eefccsm178153wru.109.2022.11.16.23.59.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Nov 2022 23:59:36 -0800 (PST)
Message-ID: <640d43d0-f39b-af8b-697c-117451fda0d3@redhat.com>
Date: Thu, 17 Nov 2022 08:59:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5] acpi/tests/avocado/bits: some misc fixes
To: Ani Sinha <ani@anisinha.ca>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
References: <20221117053644.516649-1-ani@anisinha.ca>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221117053644.516649-1-ani@anisinha.ca>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 17 Nov 2022 07:59:42 -0000

On 17/11/2022 06.36, Ani Sinha wrote:
> Most of the changes are trivial. The bits test timeout has now been increased
> to 200 seconds in order to accommodate slower systems and fewer unnecessary
> failures. Removed of the reference to non-existent README file in docs. Some
> minor corrections in the doc file.
> 
> CC: Thomas Huth <thuth@redhat.com>
> CC: Michael S. Tsirkin <mst@redhat.com>
> CC: qemu-trivial@nongnu.org
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>   docs/devel/acpi-bits.rst   | 12 ++++--------
>   tests/avocado/acpi-bits.py |  3 +++
>   2 files changed, 7 insertions(+), 8 deletions(-)

Look fine to me ... if nobody else is planning to pick this up, I can put 
this into my next pull request (I'm planning one for later today or tomorrow).

  Thomas


