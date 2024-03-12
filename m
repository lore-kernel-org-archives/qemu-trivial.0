Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rk5EY-0003Xv-Fy
	for mharc-qemu-trivial@gnu.org; Tue, 12 Mar 2024 12:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1rk5EW-0003XJ-R0
 for qemu-trivial@nongnu.org; Tue, 12 Mar 2024 12:44:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1rk5EV-0004mh-ES
 for qemu-trivial@nongnu.org; Tue, 12 Mar 2024 12:44:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710261846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NFZpIIaHFLHWQ3CKSA+QU16wLiPBEnVumhahukR4YQk=;
 b=RitF5zOUl+OervKkXYMwbohCeYROzo+X2TVrM24JA5nOXwuIQr3+U7KF7y90etEhmYXSkv
 wNQkDI1T+GNU0t35WKmzsz7o7wFqu+RRCnwAKeWN+PidVaIxzhLG/Xgh3V1dnRberujjf3
 MpB3rBanUZ1ab4fWQAcsQ6D0ItcYezA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-1-UQ6PoANDGbFrprQyXmEw-1; Tue, 12 Mar 2024 12:44:03 -0400
X-MC-Unique: 1-UQ6PoANDGbFrprQyXmEw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-412eeb789d9so740345e9.3
 for <qemu-trivial@nongnu.org>; Tue, 12 Mar 2024 09:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710261842; x=1710866642;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NFZpIIaHFLHWQ3CKSA+QU16wLiPBEnVumhahukR4YQk=;
 b=a0/xOYzZ7S1KVvQzZv12LxBHOJma7B8bavs46AlL4xhUWSdP6Mi7s6hiL73PFOGTvS
 VDyjmK6V4fL9HLmTseGbXM9I8b/0uKwMEUBA0mq+U9wsGfdn+9XpU0ITdOXSjsd8VTVw
 6D/pHyinY7gTmXtmvzxKbZDkwVGKN7P8SDOEPPOifeHpsxh3tQ/JNpLT3IyvMSxmkfNx
 FxdHT2c7FqI1iGyJ7AwoXy1Q1RW1WQSYdUY7+U3qw0hYuYoPQEeKtcCo/Di8sKsMcbwp
 wVko7fyGBTg1hNsglsEek5xkKVGD6gWFZ9OH4HyEyhbRJI3nmYO6of/urHejzXIOwz4j
 RElg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4hrPbI9HR/YwRWqW71mwiven2uTiDeeGBZ29af2qisIkHrO8klufdizGb9jjeBlRh3TXRT5CguivzAJ3rqAnCJbwTJTAzXA==
X-Gm-Message-State: AOJu0Yw85AbASz3JY3XM7gx5PifPzRwkdy75RWKNqywG1u18o+YA3tbF
 SmRrbl+M0drUDB70MDNiFIgaf0j70mY1SSSJS23AfdMsC6Gdfe6utaBNuuaJBPPubfMXPl6KXgN
 ipAD6XEhix4tvgKkyJjQUZogoMSlW6Kw7KpgiYqh8TsKKddV+dp+rdpk=
X-Received: by 2002:a05:600c:35cc:b0:412:ed3f:1b4b with SMTP id
 r12-20020a05600c35cc00b00412ed3f1b4bmr3005411wmq.11.1710261842190; 
 Tue, 12 Mar 2024 09:44:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxsOyypDT7GZSd0ybfIpycv9ghyUGncGhAHWtortRBN3JIB5fiFFpykMr0RcUvegM/mxzTZQ==
X-Received: by 2002:a05:600c:35cc:b0:412:ed3f:1b4b with SMTP id
 r12-20020a05600c35cc00b00412ed3f1b4bmr3005387wmq.11.1710261841695; 
 Tue, 12 Mar 2024 09:44:01 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1f0:532c:5ae4:fce6:76e1:fa1a])
 by smtp.gmail.com with ESMTPSA id
 bh25-20020a05600c3d1900b004133365bbc6sm2840627wmb.19.2024.03.12.09.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 09:44:01 -0700 (PDT)
Date: Tue, 12 Mar 2024 12:43:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhao Liu <zhao1.liu@linux.intel.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Fan Ni <fan.ni@samsung.com>, Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [PATCH v2 0/7] Cleanup and fix @errp dereference
Message-ID: <20240312124339-mutt-send-email-mst@kernel.org>
References: <20240223085653.1255438-1-zhao1.liu@linux.intel.com>
 <Ze5/r5EW9YsqVwtS@intel.com>
MIME-Version: 1.0
In-Reply-To: <Ze5/r5EW9YsqVwtS@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 12 Mar 2024 16:44:09 -0000

On Mon, Mar 11, 2024 at 11:51:11AM +0800, Zhao Liu wrote:
> Hi Michael & Philippe,
> 
> Could this series catch the last train of next releases? ;-)
> 
> Thanks,
> Zhao

yes it will be in subject to last minute testing.


