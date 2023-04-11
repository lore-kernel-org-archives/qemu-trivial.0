Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm87Y-0002a0-L9
	for mharc-qemu-trivial@gnu.org; Tue, 11 Apr 2023 03:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pm87X-0002ZW-7C
 for qemu-trivial@nongnu.org; Tue, 11 Apr 2023 03:08:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pm87U-0000GS-RP
 for qemu-trivial@nongnu.org; Tue, 11 Apr 2023 03:08:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681196928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mKVL0P97a2Ex71G2V5nN0kOi4VmfioIilnRQP2T3SO4=;
 b=LM1XKYWAsKDH174cbjoJ2xcL8ccOQ9+x/KdsPnKZQxBpNk6DClN9bsTVFc35LeJ1BFXBxm
 KSBKHLRjNZ71FJCYs6o4bGCEuH/jqAfjBmOXQrx6soKQxYh57q+hU185cjJmr5fyWCblbx
 zW/KvST7S/BJz2GYdbkuWC7UPu1rWvQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-qMeCMNcZNhCSh_Ne_Qs2kg-1; Tue, 11 Apr 2023 03:08:46 -0400
X-MC-Unique: qMeCMNcZNhCSh_Ne_Qs2kg-1
Received: by mail-wm1-f70.google.com with SMTP id
 w16-20020a05600c475000b003f082eecdcaso2040238wmo.6
 for <qemu-trivial@nongnu.org>; Tue, 11 Apr 2023 00:08:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681196925;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mKVL0P97a2Ex71G2V5nN0kOi4VmfioIilnRQP2T3SO4=;
 b=x0f+nH/Z+WCa1IrY557nW9c38SV3Zk5yEWMSeh3O1jsKRTVW2YvD8XYh29elIhqxsO
 aDkNKNM/4mlBpa30qqYI4IEaCDJ2/SOxAxwC4r7HxUtSlZA6iIc3ohGriNnKmCah0x8N
 EYpnsWPBluRql4zaE7WpVEyryi76P2PyGjIBW5j3jWuId4rlCF9SBf83woOqN6ztIq0d
 D1fPz95rHhzmJsw0YJREgq21vAWBwdT030K7HJFWFEwjYgbgUR0995uM3JMmvzCZB+nm
 +Ys6xpT0JwA6cWdOs6N8Jlcs0/AcVR48O8/t+v1ZZXZN36PDXPsPRtEXfRfhhBe12ENd
 GbAg==
X-Gm-Message-State: AAQBX9fCTIymcZ17qMBHK+g7jm7H4MWS4dUUOUy+TQk95UUCTTiYveAZ
 YLPrfeYgHP9M4wtmL0RqApVv+zac3Y/msocqVFersUW4BErmAfoawwKQNHMym1kqEquj9D2M3Wm
 eNMJqYO7OuSEwUKw1YA==
X-Received: by 2002:a7b:c4da:0:b0:3ee:19b4:a2e6 with SMTP id
 g26-20020a7bc4da000000b003ee19b4a2e6mr1240777wmk.19.1681196924046; 
 Tue, 11 Apr 2023 00:08:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350YROxWlsaN0dkvRYbexETJkDO0siHcl1gzb7s3pP5sA2MtLum7s7lsVPr03cm1FUQtvAcPgGA==
X-Received: by 2002:a7b:c4da:0:b0:3ee:19b4:a2e6 with SMTP id
 g26-20020a7bc4da000000b003ee19b4a2e6mr1240757wmk.19.1681196923564; 
 Tue, 11 Apr 2023 00:08:43 -0700 (PDT)
Received: from redhat.com ([2.52.10.80]) by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c378800b003edff838723sm16043078wmr.3.2023.04.11.00.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 00:08:43 -0700 (PDT)
Date: Tue, 11 Apr 2023 03:08:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-8.0] docs/cxl: Fix sentence
Message-ID: <20230411030721-mutt-send-email-mst@kernel.org>
References: <20230409201828.1159568-1-sw@weilnetz.de>
MIME-Version: 1.0
In-Reply-To: <20230409201828.1159568-1-sw@weilnetz.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 11 Apr 2023 07:08:51 -0000

On Sun, Apr 09, 2023 at 10:18:28PM +0200, Stefan Weil wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> If my change is okay I suggest to apply the patch for 8.0
> because it fixes documentation.
> 
> Regards,
> Stefan W.

It does but I don't think we should bother for 8.0. Nothing
bad will happen if we defer this, we need to focus on
kicking the release out of the door.

>  docs/system/devices/cxl.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/system/devices/cxl.rst b/docs/system/devices/cxl.rst
> index f25783a4ec..4c38223069 100644
> --- a/docs/system/devices/cxl.rst
> +++ b/docs/system/devices/cxl.rst
> @@ -111,7 +111,7 @@ Interfaces provided include:
>  
>  CXL Root Ports (CXL RP)
>  ~~~~~~~~~~~~~~~~~~~~~~~
> -A CXL Root Port servers te same purpose as a PCIe Root Port.
> +A CXL Root Port serves the same purpose as a PCIe Root Port.
>  There are a number of CXL specific Designated Vendor Specific
>  Extended Capabilities (DVSEC) in PCIe Configuration Space
>  and associated component register access via PCI bars.
> -- 
> 2.39.2


