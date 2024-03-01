Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rfrqW-00072n-P8
	for mharc-qemu-trivial@gnu.org; Thu, 29 Feb 2024 20:37:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1rfrqV-00072e-9v
 for qemu-trivial@nongnu.org; Thu, 29 Feb 2024 20:37:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1rfrqT-00042n-Ty
 for qemu-trivial@nongnu.org; Thu, 29 Feb 2024 20:37:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709257072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=63oYsEAvNqcByuDthn6v74H3iZYFylwDOaegU5/e6ro=;
 b=UVYFKz0xt9GQmA+W7QaGcYEdpEIYGeCRXVZdXzdHQRXtLqJdrWm52UXqpRW4/Iz2vx/5td
 JUFRi/Zi0WZpCnZIbWaTtwuiJFRGGkNYqx5OCnoEYu5BPaEv6yq8Z9jzAD+uNEry2Z2ezN
 95iXh92Ky2La7djt5gTVd3J4vThUM7Y=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-yOhAFSreNBOf8sB08iAOkg-1; Thu, 29 Feb 2024 20:37:49 -0500
X-MC-Unique: yOhAFSreNBOf8sB08iAOkg-1
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-299180d546bso338418a91.0
 for <qemu-trivial@nongnu.org>; Thu, 29 Feb 2024 17:37:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709257068; x=1709861868;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=63oYsEAvNqcByuDthn6v74H3iZYFylwDOaegU5/e6ro=;
 b=UU/36Py5xz+Y8qvUMBW+GedzENpIIt26xhodIHSVJhORmUtjdG6YmgkIa2hllae6U5
 DVZdiQl96P5f3boteNvKToiQ+zznQD87Y94SrEzu/eGeYqYIuTURmoeWTj7fBrV40Wox
 slXAV4zOZk9doZmG2jyFrZVXvPVSyaGv2lgxp3xpw7x8ZkKj9gsV27wfAdKKBWNeNNDU
 o8w/2XuIOPBNqlBJ/NPPjzSsEAXhHSlLLkQMds0FNOgNKmOt4pVO7vGNadkWjS3sT221
 8xsh1kKn9HpgaNV++xh4y4QD6/CL8UTJNACqEAxNmHLpfxVN9TFT9gwlQfvkQAjkblQx
 +ZeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwicEdGC0Unxmh/uZ4A59NuXwFG2wpkN9GiK4Bvngpi4ZVM8Aa1s/qWa34QczFFc+Oxwuo1jtYXgdZsI+WlKjq2PhVeeWjQA==
X-Gm-Message-State: AOJu0Yw8OtIfbkBCM+OcheEX1ANDaQtYwcDd1gEchFRrETksfoAtMXn3
 9TjO6DrGsQDrZPv76bRtxSYUEYK+r8lTK6QTy1d8oa4jiAB3BwQ95StKqT8IjVFoG7hXthlMk79
 WFv97DVx1n8+Ed56OloONNCcrj7tUqFxvAod2lLrmFiIDNJ5R0fN6Bho=
X-Received: by 2002:a17:903:22c6:b0:1dc:6208:2e5a with SMTP id
 y6-20020a17090322c600b001dc62082e5amr277365plg.3.1709257068100; 
 Thu, 29 Feb 2024 17:37:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzJj/cjoaVrLoEFuuCrBTcHzmFa6dyu8L1NlwPUQWSQclmcTpNINf/LMdWTd0sGvjyfz4p1g==
X-Received: by 2002:a17:903:22c6:b0:1dc:6208:2e5a with SMTP id
 y6-20020a17090322c600b001dc62082e5amr277350plg.3.1709257067665; 
 Thu, 29 Feb 2024 17:37:47 -0800 (PST)
Received: from x1n ([43.228.180.230]) by smtp.gmail.com with ESMTPSA id
 h12-20020a170902f7cc00b001dcac08a360sm2177494plw.175.2024.02.29.17.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 17:37:47 -0800 (PST)
Date: Fri, 1 Mar 2024 09:37:38 +0800
From: Peter Xu <peterx@redhat.com>
To: Zhao Liu <zhao1.liu@linux.intel.com>
Cc: Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, Fabiano Rosas <farosas@suse.de>
Subject: Re: [PATCH 14/17] migration/option: Fix missing ERRP_GUARD() for
 error_prepend()
Message-ID: <ZeExYtPjZWAdaJup@x1n>
References: <20240229143914.1977550-1-zhao1.liu@linux.intel.com>
 <20240229143914.1977550-15-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20240229143914.1977550-15-zhao1.liu@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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
X-List-Received-Date: Fri, 01 Mar 2024 01:37:55 -0000

On Thu, Feb 29, 2024 at 10:39:11PM +0800, Zhao Liu wrote:
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
> The migrate_params_check() passes @errp to error_prepend() without
> ERRP_GUARD(), and it could be called from migration_object_init(),
> where the passed @errp points to @error_fatal.
> 
> Therefore, the error message echoed in error_prepend() will be lost
> because of the above issue.
> 
> To fix this, add missing ERRP_GUARD() at the beginning of this function.
> 
> [1]: Issue description in the commit message of commit ae7c80a7bd73
>      ("error: New macro ERRP_GUARD()").
> 
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Fabiano Rosas <farosas@suse.de>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


