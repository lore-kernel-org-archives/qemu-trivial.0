Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mxRcz-0008Sx-Av
	for mharc-qemu-trivial@gnu.org; Wed, 15 Dec 2021 05:35:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxRcq-0008Os-3y
 for qemu-trivial@nongnu.org; Wed, 15 Dec 2021 05:35:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxRcn-0007cD-HH
 for qemu-trivial@nongnu.org; Wed, 15 Dec 2021 05:35:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639564505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nhJFm2bUFYV+oi/iXrA1YnkJNF5uni5a6EZYI/gGQt4=;
 b=JmklONp0fYM14J6CetI0aLqINBSF2TCLEN4YG7AGIljZPr1wlBshu2kX9l/9O81IJM6FXQ
 C4zMyr34kMkHmrw9EQshKwV2XQrR5Ad+hWJCfUmyQxuJPJTMdzWdKiqxHQ2qLVQp3fbqkY
 Ba5LyS/F9F8jKFiF2rKed713PDMT500=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-8DN9Kg8ePlauj6XBfV6qGw-1; Wed, 15 Dec 2021 05:35:03 -0500
X-MC-Unique: 8DN9Kg8ePlauj6XBfV6qGw-1
Received: by mail-wm1-f71.google.com with SMTP id
 j25-20020a05600c1c1900b00332372c252dso8818901wms.1
 for <qemu-trivial@nongnu.org>; Wed, 15 Dec 2021 02:35:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nhJFm2bUFYV+oi/iXrA1YnkJNF5uni5a6EZYI/gGQt4=;
 b=t6/ojoIcJ9xot/B5ljJCaZGtfLwiPsptNP+c+k8zPZUv5qYMUZbZJmplRwTfEzqPKI
 HQvpdC42qCUbKtp4YsI8lFHB4GRTbu7UD8+jQJcXNU3G8OXhqPolJaaE8hS4Tayk50kz
 H2KskwM0jQY9BS68CldJDAT/fZKvl32IVturx098JmFMxMkCN2Pl6kCuKQjS0VXv1fqj
 BBpaiBfNCz60xiuvEV5xBjgtRsc17MQebmtNZDfpog3az3YlCtmDF2C25RbUO2XRTlou
 hVVXUJl5vq4vpNHela5bYHaPoeJ1MF5Ru3RVFTO//gXR7YrqT2f+FoG3OKVnv1iGa2ll
 I6Og==
X-Gm-Message-State: AOAM531/S34l2eKwU06y8rNfRDUS1YuEeF3U+iUniKW6s4u+xFWXyDkH
 T5bzRboQlwbXL44eZSNrzw6W6AxyE7XkUSNSyK4nDXJ/KZZx9de4cya8VwInC0rNXdMIDsw4nC1
 RjQjD783msRIY2BBsTw==
X-Received: by 2002:adf:f68a:: with SMTP id v10mr2721017wrp.212.1639564502697; 
 Wed, 15 Dec 2021 02:35:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygOTndDWKhOXtzIVOMo/JDBY0LqC0pAJXBaasTno+50vdRSssrpNGajMsBN0zVyRp4KAuZpA==
X-Received: by 2002:adf:f68a:: with SMTP id v10mr2721002wrp.212.1639564502532; 
 Wed, 15 Dec 2021 02:35:02 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id r17sm4957250wmq.5.2021.12.15.02.35.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 02:35:02 -0800 (PST)
Message-ID: <2ebb697f-5ee9-24b2-6c80-3156ed8784d6@redhat.com>
Date: Wed, 15 Dec 2021 11:35:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] qemu-keymap: Add license in generated files
To: qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>, qemu-trivial@nongnu.org
References: <20211117174533.1900570-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211117174533.1900570-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 15 Dec 2021 10:35:09 -0000

Hi Laurent,

This patch is reviewed, can it go via your trivial tree?

On 11/17/21 18:45, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  qemu-keymap.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/qemu-keymap.c b/qemu-keymap.c
> index 536e8f2385d..4095b654a60 100644
> --- a/qemu-keymap.c
> +++ b/qemu-keymap.c
> @@ -187,6 +187,7 @@ int main(int argc, char *argv[])
>      }
>  
>      fprintf(outfile,
> +            "# SPDX-License-Identifier: GPL-2.0-or-later\n"
>              "#\n"
>              "# generated by qemu-keymap\n"
>              "#    model   : %s\n"
> 


