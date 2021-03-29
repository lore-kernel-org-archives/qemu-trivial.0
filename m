Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lQoQL-00056J-VX
	for mharc-qemu-trivial@gnu.org; Mon, 29 Mar 2021 05:43:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lQoQK-00053R-Kk
 for qemu-trivial@nongnu.org; Mon, 29 Mar 2021 05:43:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lQoQI-0007XT-VU
 for qemu-trivial@nongnu.org; Mon, 29 Mar 2021 05:43:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617010982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bs/r4zd2ylX4UjGQaGbxb25IDG0R9Zti9hD76pgbGJs=;
 b=e5SAx91+stZE9PK/QU//t0IVL7oJ9w/6C3jvF7zwCv9ucLVc6qMX3d6jFSkZjI4y47qrv9
 3KpzoV3wtlEgGwRU4PeIVpDJw+SAPm4SLC8x2SlUZ7wSMdbakIHLjeQT9/RDCSLzRSgYh/
 3wwsjXEVBl0Tq6mH1VGoHD4Ss1VCfLY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159--zWBpsC_N0W_A0FeRm_PbQ-1; Mon, 29 Mar 2021 05:42:58 -0400
X-MC-Unique: -zWBpsC_N0W_A0FeRm_PbQ-1
Received: by mail-wm1-f70.google.com with SMTP id c9so1412835wme.5
 for <qemu-trivial@nongnu.org>; Mon, 29 Mar 2021 02:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bs/r4zd2ylX4UjGQaGbxb25IDG0R9Zti9hD76pgbGJs=;
 b=Db/9DEM3hrdgfwMHpAii40MX3GPSzM5dHLvi96EGU/C4BVQH6AMtZMabh1lQpOGy+X
 XC5q3uhzKTLqClTSIKAPyiAJ9X1V/dmTGsnXOYfsw2K5NviHeh5U8+FOrNCriKZseJEH
 7t8aD7W8HiF9cnk5BW34z007Jg1KaolDKTTiWtMelFcYgyaXyaaDYJIv/e8zkUd2FqNS
 YiMs+y98JpyTwk1ijLvLpfIHAS9jXJkiBPhYTr04lcfgfoZJcWqqZzFLzFVSiJbBFc5g
 tcumqsrxtG+OJAeUrbLWZPle7CTWQnTmeujG1EzcNhOSWCzyg0HvOew9H9RwPZtt0TKY
 2UtA==
X-Gm-Message-State: AOAM530KDv7w98oQ/K+6zzpCaEohtyzV+2+QYyEpSk+PFuO97F20sdjB
 RMhQqVm9DXsqtH7025CCtjaGEBnH5AjwFNYYjUSO5AjrGg1smaC1HsZQm0Aiich6EtBWdRt2MFB
 SlLOS8Y5VfRfGkND0yw==
X-Received: by 2002:adf:eec9:: with SMTP id a9mr27513305wrp.252.1617010976922; 
 Mon, 29 Mar 2021 02:42:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUMTmruQOVR0o4dkHXvIY5UplgY4WhtwE+X1yCst/7+LboQJEqKdS0vicYeZDQG12s4G9iEQ==
X-Received: by 2002:adf:eec9:: with SMTP id a9mr27513280wrp.252.1617010976719; 
 Mon, 29 Mar 2021 02:42:56 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id n1sm33083433wro.36.2021.03.29.02.42.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 02:42:55 -0700 (PDT)
Subject: Re: [PATCH] Revert "qom: use qemu_printf to print help for
 user-creatable objects"
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20210328054758.2351461-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <cc229c1d-09b8-387f-6dbf-68eaa12e1538@redhat.com>
Date: Mon, 29 Mar 2021 11:42:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210328054758.2351461-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 29 Mar 2021 09:43:04 -0000

On 28/03/21 07:47, Thomas Huth wrote:
> This reverts commit 6d9abb6de9cc53a508823db0283061824f2f98a2.
> 
> The real code change had already been added by Kevin's commit da0a932bbf
> ("hmp: QAPIfy object_add") and commit 6d9abb6d just added a duplicated
> include statement as a left-over of a rebase.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   qom/object_interfaces.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
> index c3324b0f86..b17aa57de1 100644
> --- a/qom/object_interfaces.c
> +++ b/qom/object_interfaces.c
> @@ -17,7 +17,6 @@
>   #include "qemu/qemu-print.h"
>   #include "qapi/opts-visitor.h"
>   #include "qemu/config-file.h"
> -#include "qemu/qemu-print.h"
>   
>   bool user_creatable_complete(UserCreatable *uc, Error **errp)
>   {
> 

Queued, thanks.

Paolo


