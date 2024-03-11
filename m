Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rjaJi-0007jt-HB
	for mharc-qemu-trivial@gnu.org; Mon, 11 Mar 2024 03:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rjaJR-0007Gf-5K
 for qemu-trivial@nongnu.org; Mon, 11 Mar 2024 03:43:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rjaJK-0006Ry-Ly
 for qemu-trivial@nongnu.org; Mon, 11 Mar 2024 03:43:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710142980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4ndLsTUJdWXeHBwCp7awI2MLMa+us9lOQ7mqsN4q6v0=;
 b=iETt2xw3NX0gJaT922WrmQ6kzxqK6paMK1a++hGi4gTBdLOXhYbs5zPdlKoWX+UlPNc5Vi
 XMK2mfciCWJE84ucR3dEWTg2hbo8/FsIzSoHRUOMof/7gkadVvg7zO9UAgz5mDGSEBsVVU
 yRtlhHwE3ktcQr4BsOWYY0IR8LoRXYc=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-o5SPurzSO0ql3vhhAnuMOg-1; Mon, 11 Mar 2024 03:42:59 -0400
X-MC-Unique: o5SPurzSO0ql3vhhAnuMOg-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2d341464ebdso31200661fa.0
 for <qemu-trivial@nongnu.org>; Mon, 11 Mar 2024 00:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710142977; x=1710747777;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4ndLsTUJdWXeHBwCp7awI2MLMa+us9lOQ7mqsN4q6v0=;
 b=TpUD5575CZS1mOtV5eLEecowvS4y+fOY5dgQN4JlAqAhzcQeDx8zFtBOeCSMAf06Ra
 FAHa6eDCc/5NqzW1KNTAS7lXciF0Q/3wmboPBbsB/mqIVF3lntci7GNygOVp3EP90koq
 tEXge//Fqa1yND9WbxrWoOF7vzUHkEF/G2luDUUkR4DVtiirtqMJAUwqJt+7RQSMVP3s
 cNczvdmfNhoQ0CkrI2md4u0np+LvUH2V8OxWwGr93V2xNeSwN5yF+5fd9meJz/20l3fC
 07sL0oqJPAsjY+/BgyJEQyEhUFlSk8G3r+bfpwN1rhDUSQovZRBtKnSoDh61RhWHBD1Z
 PpqA==
X-Gm-Message-State: AOJu0YyPCOH5coR3xaZvRszGmc3CpxyJJw+5W/nm0F/vpsct3zmGV3g4
 /8d/7fBfj1QvUsq9tGnkmUsitryAu4VLNpJuWfDB5MvOyqopfttWISY/pjnnC2ck3gxpbMrViOP
 cWvvwPP9Uboz4w7Q5uyJT1ukW4riNlFa/RDkIztUbYlFCH+VZBc/r7tk=
X-Received: by 2002:a2e:3e15:0:b0:2d3:fa9a:a905 with SMTP id
 l21-20020a2e3e15000000b002d3fa9aa905mr2841592lja.30.1710142977698; 
 Mon, 11 Mar 2024 00:42:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyYZbaGlKEpKfI0Crnx9FMSVeh+1jbr0qIs22OTVttem2B9uAv8A0FKkNn/HVXZpgB2zsNgg==
X-Received: by 2002:a2e:3e15:0:b0:2d3:fa9a:a905 with SMTP id
 l21-20020a2e3e15000000b002d3fa9aa905mr2841584lja.30.1710142977364; 
 Mon, 11 Mar 2024 00:42:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 m38-20020a05600c3b2600b00412b6fbb9b5sm14797294wms.8.2024.03.11.00.42.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Mar 2024 00:42:56 -0700 (PDT)
Message-ID: <6ccb8dc6-8870-4f70-9c3f-fd2601651938@redhat.com>
Date: Mon, 11 Mar 2024 08:42:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/29] hw/vfio/ap: Fix missing ERRP_GUARD() for
 error_prepend()
To: Zhao Liu <zhao1.liu@linux.intel.com>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Michael Tokarev <mjt@tls.msk.ru>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>, qemu-s390x@nongnu.org
References: <20240311033822.3142585-1-zhao1.liu@linux.intel.com>
 <20240311033822.3142585-19-zhao1.liu@linux.intel.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20240311033822.3142585-19-zhao1.liu@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.945,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 11 Mar 2024 07:43:18 -0000

On 3/11/24 04:38, Zhao Liu wrote:
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
> ERRP_GUARD() could avoid the case when @errp is &error_fatal, the user
> can't see this additional information, because exit() happens in
> error_setg earlier than information is added [1].
> 
> The vfio_ap_realize() passes @errp to error_prepend(), and as a
> DeviceClass.realize method, there are too many possible callers to check
> the impact of this defect; it may or may not be harmless. Thus it is
> necessary to protect @errp with ERRP_GUARD().
> 
> To avoid the issue like [1] said, add missing ERRP_GUARD() at the
> beginning of this function.
> 
> [1]: Issue description in the commit message of commit ae7c80a7bd73
>       ("error: New macro ERRP_GUARD()").
> 
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: "Cédric Le Goater" <clg@redhat.com>
> Cc: Tony Krowiak <akrowiak@linux.ibm.com>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Jason Herne <jjherne@linux.ibm.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: qemu-s390x@nongnu.org
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
> v2: Use Markus' sentence to polish commit message. (Markus)
> ---
>   hw/vfio/ap.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/vfio/ap.c b/hw/vfio/ap.c
> index e157aa1ff79c..7c4caa593863 100644
> --- a/hw/vfio/ap.c
> +++ b/hw/vfio/ap.c
> @@ -155,6 +155,7 @@ static void vfio_ap_unregister_irq_notifier(VFIOAPDevice *vapdev,
>   
>   static void vfio_ap_realize(DeviceState *dev, Error **errp)
>   {
> +    ERRP_GUARD();
>       int ret;
>       Error *err = NULL;
>       VFIOAPDevice *vapdev = VFIO_AP_DEVICE(dev);


