Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rfl2b-0003gD-GX
	for mharc-qemu-trivial@gnu.org; Thu, 29 Feb 2024 13:21:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rfl2a-0003fv-Jy
 for qemu-trivial@nongnu.org; Thu, 29 Feb 2024 13:21:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rfl2Y-0003fY-70
 for qemu-trivial@nongnu.org; Thu, 29 Feb 2024 13:21:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709230911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RbMWHEYWHtVmlvSOvu966micuAkdr7/UpmcVXaQJzMo=;
 b=Q8QllwHHcx5tXdCVyNOqfMpz1J534PGr1O0ApSWWXTRM6a6RHW8fj3vNkPIFajO81OFMWq
 La1YGq+wxuJSzTEO1HWlUw6KTSAzmpApGE2K9e518yLSbMnzQXLDHKv2V4H9js6vIdpM07
 Ns+wXPWUw4W33PkVGqorpetoQgIhOVE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-h2xTAVr6N6GdTHynDgxwvw-1; Thu, 29 Feb 2024 13:21:47 -0500
X-MC-Unique: h2xTAVr6N6GdTHynDgxwvw-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-68f75cca6aaso12214566d6.1
 for <qemu-trivial@nongnu.org>; Thu, 29 Feb 2024 10:21:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709230907; x=1709835707;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RbMWHEYWHtVmlvSOvu966micuAkdr7/UpmcVXaQJzMo=;
 b=sJowxYteLdsAXpieGzgfy44KpPJT3Lkv9le2zUAiaxKKCf5s9LYxrRiHdjNOwjjQkM
 lhTBk83VRWW+YszoGhkTeBUoJRKrn28H76b3b/XdVz5VGh9PHYCgP2YQGf/myqxGwEGI
 loXG3bGiF1TVSrITKcKqtHMT7QFPaQNpgDqGXZ4sJjEoJsjklkwpXoXQ9/497GEDE+iK
 K36ZSiaO7aH19LvwQcEuL8L2KBweRpQYDcoP2ziYr9hMKC5xj128hvlcpDOmfSYGjtsd
 aSkVl8UH3rOofiulIPAFmNNeyLJYUoFqtwU7bDsZeI0v9xou8jgqPpYkzwmN/xI63DgU
 DvXA==
X-Gm-Message-State: AOJu0YyDehmblS0coPtSHVZxT4dpkzKoVx+oY6r7CiZ/NVUapaitKrMN
 YdHf+4i3VI/q/azoyyUcLRtQwEX5ZlKyJU+mtzYIkm7zYwWHnPDYmQCCd/704jl1w6gWDjXH2HS
 A1GSIn2tQ5OCgTH/il0vgI6Psa6e6cwypqhqh1L9vOm7odxbEmXH43TI=
X-Received: by 2002:a0c:ca86:0:b0:690:2f5c:f0ce with SMTP id
 a6-20020a0cca86000000b006902f5cf0cemr3196697qvk.24.1709230907009; 
 Thu, 29 Feb 2024 10:21:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElb3G+f3YJZitPdHbC7Mf21S763T133zK3rE7+5zBIEC9pU5FNT6kLUx/lsAJEvKMPQeCnFw==
X-Received: by 2002:a0c:ca86:0:b0:690:2f5c:f0ce with SMTP id
 a6-20020a0cca86000000b006902f5cf0cemr3196672qvk.24.1709230906726; 
 Thu, 29 Feb 2024 10:21:46 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 qp11-20020a056214598b00b0068fef74fdb3sm994819qvb.59.2024.02.29.10.21.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 10:21:46 -0800 (PST)
Message-ID: <f085db0b-a174-4c51-bc4a-db8dbd2f28f9@redhat.com>
Date: Thu, 29 Feb 2024 19:21:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/17] hw/vfio/container: Fix missing ERRP_GUARD() for
 error_prepend()
To: Zhao Liu <zhao1.liu@linux.intel.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Michael Tokarev <mjt@tls.msk.ru>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>
References: <20240229143914.1977550-1-zhao1.liu@linux.intel.com>
 <20240229143914.1977550-7-zhao1.liu@linux.intel.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20240229143914.1977550-7-zhao1.liu@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.096,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 29 Feb 2024 18:21:56 -0000

Hello,

On 2/29/24 15:39, Zhao Liu wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
> 
> As the comment in qapi/error, passing @errp to error_prepend() requires
> ERRP_GUARD():
> 
> * = Why, when and how to use ERRP_GUARD() =
> *
> * Without ERRP_GUARD(), use of the @errp parameter is restricted:
> ...
> * - It should not be passed to error_prepend(), error_vprepend() or
> *   error_append_hint(), because that doesn't work with &error_fatal.
> * ERRP_GUARD() lifts these restrictions.
> *
> * To use ERRP_GUARD(), add it right at the beginning of the function.
> * @errp can then be used without worrying about the argument being
> * NULL or &error_fatal.
> 
> ERRP_GUARD() could avoid the case when @errp is the pointer of
> error_fatal, the user can't see this additional information, because
> exit() happens in error_setg earlier than information is added [1].
> 
> The vfio_get_group() passes @errp to error_prepend(). Its @errp is
> from vfio_attach_device(), which @errp parameter is so widely sourced
> that it is necessary to protect it with ERRP_GUARD().
> 
> To avoid the issue like [1] said, add missing ERRP_GUARD() at the
> beginning of this function.
> 
> [1]: Issue description in the commit message of commit ae7c80a7bd73
>       ("error: New macro ERRP_GUARD()").
> 
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: "Cédric Le Goater" <clg@redhat.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


