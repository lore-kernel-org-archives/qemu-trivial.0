Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rfl5p-0007ff-BS
	for mharc-qemu-trivial@gnu.org; Thu, 29 Feb 2024 13:25:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rfl5n-0007df-3n
 for qemu-trivial@nongnu.org; Thu, 29 Feb 2024 13:25:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rfl5l-0004XF-Fl
 for qemu-trivial@nongnu.org; Thu, 29 Feb 2024 13:25:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709231112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jwWTqwix/dFR+GhOL3Z3zoL9KBd9h+uQgpNcgqh5go8=;
 b=IRJqpQBEYOx1ZznTxiIJ/DCirr/MWdZY0ltW7UPXrmxr+Pq1qGCAqXLJrYLEcMLQ86b0jr
 k9FRzd0JcOiB2KY8vGVxUHjSIOOtVl+djy0xSfoetjLKqV8XF/zAHiWQPgMi248z0xj9Ft
 3xwbR3K6v2EhW24rfqwi/LneGPOsXZM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-HMBkH7LxMx-qDuACTyHUyw-1; Thu, 29 Feb 2024 13:25:10 -0500
X-MC-Unique: HMBkH7LxMx-qDuACTyHUyw-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-42ea7bcb203so13509031cf.0
 for <qemu-trivial@nongnu.org>; Thu, 29 Feb 2024 10:25:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709231110; x=1709835910;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jwWTqwix/dFR+GhOL3Z3zoL9KBd9h+uQgpNcgqh5go8=;
 b=PP6yppMn3Of0OXQ0iTqfvZCq3lw2Z4Ql0Sg3/rRCQ9y4RbXnRo3VcLVgocoUC04e5n
 NpG8W2K8dmZ3a4e9MCrsMG5n0qSSELnkXtHS5CAU/gkhbeKEW5Qd5lGv7vBMrZbKepyy
 mRc2MU2r65dXxECY6+cB038UrtW+9xdx1xWs220F/CHnue24buYBFaogI8UUg/FjEQ5C
 tgMkf+O5+rBLBSdnuyv7IlLnInIdBL4I+MMbIOOMjYLax/GZOxxAWuZgE4q1kvzZt0ls
 5o9rXIDDkYbwVBrQvfO+ndAsP7Ap7QcRfTlg9M61XV8utSxrRLhNp0HnEsGfkcngFcpE
 zcxw==
X-Gm-Message-State: AOJu0YwntnZUZylzCIgQ7Txm1vhZSpEQqrR7W/KsjcQMslAQwr4a3ZCr
 yIGfZO2Za2tsW3OjL8SEebvETahtCVDufRUvBe2DZQoGDgEl+j5Z0yKzwYUMPPn17vd3NiZy7+m
 Jl3jTBkXYG4f7aryBmHsazgDbLaPspdwJGrzKdz4JJ1LQdSnPxPyrUL0=
X-Received: by 2002:a05:6214:933:b0:68f:b7f0:65f4 with SMTP id
 dk19-20020a056214093300b0068fb7f065f4mr2641453qvb.63.1709231110490; 
 Thu, 29 Feb 2024 10:25:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnDTDQ8T5NIqsStFVR9MOaiFxAe7TdccdaUpHay9XrVf5JETTqV2Q0p2kYTczMMRnp/eaiXQ==
X-Received: by 2002:a05:6214:933:b0:68f:b7f0:65f4 with SMTP id
 dk19-20020a056214093300b0068fb7f065f4mr2641439qvb.63.1709231110208; 
 Thu, 29 Feb 2024 10:25:10 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 qp11-20020a056214598b00b0068fef74fdb3sm994819qvb.59.2024.02.29.10.25.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 10:25:09 -0800 (PST)
Message-ID: <2b516b6f-e655-4895-a82f-7d7ff11ce63d@redhat.com>
Date: Thu, 29 Feb 2024 19:25:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/17] hw/vfio/pci: Fix missing ERRP_GUARD() for
 error_prepend()
To: Zhao Liu <zhao1.liu@linux.intel.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Michael Tokarev <mjt@tls.msk.ru>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>
References: <20240229143914.1977550-1-zhao1.liu@linux.intel.com>
 <20240229143914.1977550-11-zhao1.liu@linux.intel.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20240229143914.1977550-11-zhao1.liu@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.096,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 29 Feb 2024 18:25:16 -0000

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
> In hw/vfio/pci.c, there're 2 functions passing @errp to error_prepend()
> without ERRP_GUARD():
> - vfio_add_std_cap()
> - vfio_realize()
> 
> The @errp of vfio_add_std_cap() is also from vfio_realize(). And
> vfio_realize(), as a PCIDeviceClass.realize method, its @errp is from
> DeviceClass.realize so that there is no guarantee that the @errp won't
> point to @error_fatal.
> 
> To avoid the issue like [1] said, add missing ERRP_GUARD() at their
> beginning.
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




