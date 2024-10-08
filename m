Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sy4HD-0007cJ-63
	for mharc-qemu-trivial@gnu.org; Tue, 08 Oct 2024 03:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1sy4HB-0007bt-UA
 for qemu-trivial@nongnu.org; Tue, 08 Oct 2024 03:04:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1sy4HA-0007gX-Gm
 for qemu-trivial@nongnu.org; Tue, 08 Oct 2024 03:04:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728371092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jXwqRO0NTyj9sOVfKvzCyYwSHnYuCAvLKJEYmldNc8Q=;
 b=a4Ohjg00g07IT4IUlsr+cjFO8zuAoVWcoXktUg1N1KHGN6uo1aqn0tj1UnPM1T3Z2Va7jA
 VxdCloaETqi83Gf5ZIzSoOEixDU/+6e8m+bV4aIPwn1081aq2cyQ4iRBNgn8cLxhxNJJfh
 g5KWenTVXxKliJPbok8gvMTD+14ytRI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-2aA5SKyiOaO6wmyQ0RwIwA-1; Tue, 08 Oct 2024 03:04:50 -0400
X-MC-Unique: 2aA5SKyiOaO6wmyQ0RwIwA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42caf073db8so46424585e9.3
 for <qemu-trivial@nongnu.org>; Tue, 08 Oct 2024 00:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728371089; x=1728975889;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jXwqRO0NTyj9sOVfKvzCyYwSHnYuCAvLKJEYmldNc8Q=;
 b=jJIJHRXHV8oaADRpVeMA42Yfjns5G4Gas4PxGw28uZiIU8Ey9Z83D11Y3GSNn/GZIG
 Sxw6S4qkX78hPCEE4HMY/IfnK6np/PRQHcnNcFB1+y+bRBIb/0upwiPCACSw4lgAXTJI
 qXr4Iqrqd/g3aJkoOxenTB4/6s6cL6vGnOprJi+dAPtUVpR831pGPlzPCxiTXu0wTu3w
 eTlFGRkFOMBiRZBOFH1kk1M7oMKfEIjPPJINEjCVlbILGjoSxnwRGl+NA+r07pxQMctO
 ehB6jDbKAVxUogrNnQjqoFo44CBTLhVWS4gGw2GxFvHrOO6Wjz57aLQDx5as9B7WDxPq
 DAGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9xsSzEXKERFVpIQTxK7nePibkPThoZ3l/XvJMC3NJfmPfcL/VjV37o7xqweAjZ8GtGyFt0azmRTLJaHM=@nongnu.org
X-Gm-Message-State: AOJu0YxEIILNdz+u/p/Ap45YHtkicYx0LOH8gIGp6tLDIqKd1RtzH/N/
 OSKqanlbxJDMEx4SeuA9orqhYhv1oCdids8lfbRLbIatjQe3LHJBc6p083xobEQeIaCywz40Uro
 VWV8WSxijHhS4QD04SYaVtKuJv+9Tm9gwIYYU6YmyOhN/AXG3T1dkslA=
X-Received: by 2002:a05:600c:35c3:b0:428:f0c2:ef4a with SMTP id
 5b1f17b1804b1-42f85aa817emr104824085e9.13.1728371089636; 
 Tue, 08 Oct 2024 00:04:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQZIxHoz/ksAvG9XNUtt8i1Rkd9MhHrJCLwsovKOI+xLGtK+qoRQNrhZunbkhJqx4jkxolPA==
X-Received: by 2002:a05:600c:35c3:b0:428:f0c2:ef4a with SMTP id
 5b1f17b1804b1-42f85aa817emr104823845e9.13.1728371089245; 
 Tue, 08 Oct 2024 00:04:49 -0700 (PDT)
Received: from [10.33.192.239] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f89ec61ecsm98548505e9.29.2024.10.08.00.04.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 00:04:48 -0700 (PDT)
Message-ID: <71387c81-b0ef-44c8-8f94-9a9db4af5a0d@redhat.com>
Date: Tue, 8 Oct 2024 09:04:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] replace error_setg(&error_fatal, ...) with error_report()
To: Tudor Gheorghiu <tudor.reda@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <ZwRgbNs4Hz-Drt2V@redaops>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <ZwRgbNs4Hz-Drt2V@redaops>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.153,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-List-Received-Date: Tue, 08 Oct 2024 07:04:58 -0000

On 08/10/2024 00.27, Tudor Gheorghiu wrote:
> According to include/qapi/error.h:
> * Please don't error_setg(&error_fatal, ...), use error_report() and
> * exit(), because that's more obvious.
> 
> Patch updates all instances of error_setg(&error_fatal, ...) with
> error_report(...), adds the explicit exit(1) and removes redundant
> return statements.
> 
> Signed-off-by: Tudor Gheorghiu <tudor.reda@gmail.com>
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2587
> ---
>   hw/arm/allwinner-a10.c    | 5 +++--
>   hw/arm/allwinner-h3.c     | 4 ++--
>   hw/arm/allwinner-r40.c    | 4 ++--
>   hw/arm/xlnx-versal-virt.c | 4 ++--
>   hw/audio/soundhw.c        | 3 ++-
>   system/vl.c               | 3 ++-
>   6 files changed, 13 insertions(+), 10 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


