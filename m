Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1X1M-00019p-A1
	for mharc-qemu-trivial@gnu.org; Thu, 08 Jul 2021 12:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m1X1K-00012x-2p
 for qemu-trivial@nongnu.org; Thu, 08 Jul 2021 12:37:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m1X1F-00076C-OU
 for qemu-trivial@nongnu.org; Thu, 08 Jul 2021 12:37:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625762215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/cDttigQU1L1wgSGMJ7TJIjn/DO7IyQRUfbrAmnZm8k=;
 b=OXx2X90SmUOdXB74kSzax4hGXB7MnxPg3J5/CGJiRjQLwJR3O9NGI+NM/F+/mx0i/qhIDw
 pYxNDvz2Wy0yS2ujiwwqM6BOzPE9hF6jQKBa6/C6ZWE7AdBjpoE/913cVVwAEXGIqjNczD
 XCdqEzoV3BZ5PGmaqoTJTDbE3iMJcx0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-uoXZA8_iPmuzjPcOMrbatA-1; Thu, 08 Jul 2021 12:36:54 -0400
X-MC-Unique: uoXZA8_iPmuzjPcOMrbatA-1
Received: by mail-wr1-f71.google.com with SMTP id
 g4-20020a5d64e40000b029013398ce8904so2188739wri.16
 for <qemu-trivial@nongnu.org>; Thu, 08 Jul 2021 09:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/cDttigQU1L1wgSGMJ7TJIjn/DO7IyQRUfbrAmnZm8k=;
 b=s8Wvzui6WFFmnDEEP49Fi+7SFw5M4Zft8HlFJsC6YILiSwcbytoRuwlQTUTrjz3D3l
 HYbz++/fEecThpaVrWvELuxtqWytKb5ZLgafFsOxwUGyKNSy2AUV2MhlN70KwPjAmAPP
 Rizy+ZmElE0mRuiBzfUaJJ13W0iq7spIwvtoAb5Je3VSU5gEJU7BxmPe6ceAQwJmfQ1c
 5IiSx0xgJGVBxCaQbUDiJecOFZJ9EKpF2VVF+i6uxuj9PPocn+2Bc+uUhDoogdWVNUL5
 A2HqZNQM8KEaxOI4SyQDSWEGiqlUI9L8aK2rI++lkX+nr2+uYMsYJ6Hrl+S68ZLbyq9S
 P9OA==
X-Gm-Message-State: AOAM533b2WaI3o499SKihmXkZ/PaCxxunpnPIEjmLg9RH6TJ/zRnX6c1
 2U91NAevqYaw+FROxgAFbcmhpwgY21r89I/g20vL6plzu+T/j4BWKGi5PfmAci1D/AhO0jir4AC
 TWVwiCQ8JtV9A17Kuew==
X-Received: by 2002:adf:a183:: with SMTP id u3mr16800814wru.175.1625762213413; 
 Thu, 08 Jul 2021 09:36:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzE21FmBQvw7GbrO7sCIdOCJijvwD1g9RcE315RO+JUw+DtZ+P0UrbtpBRyDK6H4CeL3iLZg==
X-Received: by 2002:adf:a183:: with SMTP id u3mr16800788wru.175.1625762213194; 
 Thu, 08 Jul 2021 09:36:53 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id d3sm2662203wrx.77.2021.07.08.09.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 09:36:52 -0700 (PDT)
Date: Thu, 8 Jul 2021 17:36:50 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Olaf Hering <olaf@aepfle.de>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v1] migration: fix typo in mig_throttle_guest_down comment
Message-ID: <YOcpogHz4GMigdwp@work-vm>
References: <20210708162159.18045-1-olaf@aepfle.de>
MIME-Version: 1.0
In-Reply-To: <20210708162159.18045-1-olaf@aepfle.de>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 08 Jul 2021 16:37:02 -0000

* Olaf Hering (olaf@aepfle.de) wrote:
> Fixes commit 3d0684b2ad82a5dde68e3f08b0d7786dccaf619c ("ram: Update
> all functions comments")
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>  migration/ram.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 723af67c2e..88ff34f574 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -600,7 +600,7 @@ static size_t save_page_header(RAMState *rs, QEMUFile *f,  RAMBlock *block,
>  }
>  
>  /**
> - * mig_throttle_guest_down: throotle down the guest
> + * mig_throttle_guest_down: throttle down the guest

Ah yes, Juan frequently throotles.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

>   *
>   * Reduce amount of guest cpu execution to hopefully slow down memory
>   * writes. If guest dirty memory rate is reduced below the rate at
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


