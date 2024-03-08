Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ridE4-0001Bw-QQ
	for mharc-qemu-trivial@gnu.org; Fri, 08 Mar 2024 11:37:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@cloud.com>)
 id 1ricBo-0001ac-J7
 for qemu-trivial@nongnu.org; Fri, 08 Mar 2024 10:31:21 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anthony.perard@cloud.com>)
 id 1ricBi-00008j-Aj
 for qemu-trivial@nongnu.org; Fri, 08 Mar 2024 10:31:16 -0500
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a45bdf6e9c2so269487866b.0
 for <qemu-trivial@nongnu.org>; Fri, 08 Mar 2024 07:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.com; s=cloud; t=1709911867; x=1710516667; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YH6MlDPdnoLWWPXoTTEpelfujeDTtrM788RsOZVvSv0=;
 b=WONxwXMDk6E7LCigw/BR3neWahDiERIgQTCKucCQmcOoSSm3N3tGw1L8iZE6/pi1eo
 7BV+OcC3HMQ8eelVEwRq7QS7+fdzrhPFfZm/wTupXI6YdOmv509yO2dNR/hOfDPDqmOh
 yODEWQd0IvtTp26K98q9jZ6Sy7XRS16ekijWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709911867; x=1710516667;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YH6MlDPdnoLWWPXoTTEpelfujeDTtrM788RsOZVvSv0=;
 b=W5bPisuCK9EGm5WIoXJVDdWlpkvrDJxF3tBhHYZxi3X28YQWBtFNrYOb+GIUM87ENk
 c7NB8LI4rDGcZF0LSE6OIK+NFbSNMYWh3/BHUWnFnmQ0QyYHD3xeMmWvmO96Kee0A6aU
 BRv9QF13MBLQFRgY0dL0QdwdWVP2ZmaQH/WFCVSBqWfJyTFH/T2E+BBMceEjQhApzoTx
 oOW13bKcYitOLmjWyrEagAI3Puw2AuJ20BU+FBwoxmu8y0imqc6KQKrxww6038WjhPSB
 x8YaVksywdcfXCiaX/YuHlllmI4NY5/L3sdmOsiBJ9SaOPRy42AIEv+kUTcBNpy5X13+
 3KOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAMY5ivsoYvXBCzzAs2vMbWv9a+730j4IQK/AoY+y9k8q1QVVdvVObfBHk4LzO0EDeXLHc2r01cuJlkHwreBXYl+0YEjKzGw==
X-Gm-Message-State: AOJu0YxLAOZ+G4EEyH4ZLoGxnxJCtQah4hUlGVWIS44K5bKk3LweK3tA
 RPcvc4nKQrjZthNIx830FltJ/iIgQMQXbtEd3h2XO2NKng3MK9AEYKrZFciL3Es=
X-Google-Smtp-Source: AGHT+IEBfIxsts55MLYdgyvsm2syWKaIzZJ/gQRQnI55gvIt3Qc/sVGj1iaCCCcqY8M5YHKD4JUpqQ==
X-Received: by 2002:a17:906:84e:b0:a43:b269:d27f with SMTP id
 f14-20020a170906084e00b00a43b269d27fmr13273755ejd.64.1709911867295; 
 Fri, 08 Mar 2024 07:31:07 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 js18-20020a170906ca9200b00a45be04f00fsm2848497ejb.171.2024.03.08.07.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Mar 2024 07:31:06 -0800 (PST)
Date: Fri, 8 Mar 2024 15:31:06 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Zhao Liu <zhao1.liu@linux.intel.com>
Cc: Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 14/16] hw/char/xen_console: Fix missing ERRP_GUARD() for
 error_prepend()
Message-ID: <521de725-5d13-46ff-94d9-29e09fb90210@perard>
References: <20240228163723.1775791-1-zhao1.liu@linux.intel.com>
 <20240228163723.1775791-15-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240228163723.1775791-15-zhao1.liu@linux.intel.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=anthony.perard@cloud.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 08 Mar 2024 11:37:35 -0500
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
X-List-Received-Date: Fri, 08 Mar 2024 15:31:21 -0000

On Thu, Feb 29, 2024 at 12:37:21AM +0800, Zhao Liu wrote:
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
> The xen_console_connect() passes @errp to error_prepend() without
> ERRP_GUARD().
> 
> There're 2 places will call xen_console_connect():
>  - xen_console_realize(): the @errp is from DeviceClass.realize()'s
> 			  parameter.
>  - xen_console_frontend_changed(): the @errp points its caller's
>                                    @local_err.
> 
> To avoid the issue like [1] said, add missing ERRP_GUARD() at the
> beginning of xen_console_connect().
> 
> [1]: Issue description in the commit message of commit ae7c80a7bd73
>      ("error: New macro ERRP_GUARD()").
> 
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony Perard <anthony.perard@citrix.com>
> Cc: Paul Durrant <paul@xen.org>
> Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

