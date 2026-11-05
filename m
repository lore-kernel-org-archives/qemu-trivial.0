Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623A3606A32F
	for <qemu-trivial@archiver.kernel.org>; Thu,  5 Nov 2026 21:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZrhLQ7Up
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1xP4bH-0003Hi-Dq; Thu, 05 Nov 2026 16:02:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@redhat.com>)
 id 1xP0qr-0002s1-HS
 for qemu-trivial@nongnu.org; Thu, 05 Nov 2026 12:02:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@redhat.com>)
 id 1xP0qq-0005Fx-3H
 for qemu-trivial@nongnu.org; Thu, 05 Nov 2026 12:02:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793898129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DeNRUymI+hhBlFBMHfet6Gh/vOYYrettb5uGMGfK+2Y=;
 b=ZrhLQ7UpZ3pAP0EtcpqU/F092miZsoVK0pvs89eS332eeyp+5I+OEn5nHYDO606B7EeoDE
 6pezPNH6X/ggsLjsZ3Lu/KCxFJX6UWS5sl+Qkg+2Cibbp58rGK3UnPF9uV9G7WE/7EYOVM
 grlMkCwHenJ0GdCcwwknArt4YXYc4+8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-oLH8v1B1P5KOBuwsvCWfrA-1; Thu, 05 Nov 2026 12:02:07 -0500
X-MC-Unique: oLH8v1B1P5KOBuwsvCWfrA-1
X-Mimecast-MFC-AGG-ID: oLH8v1B1P5KOBuwsvCWfrA_1793898126
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4a1fdde384cso13285055e9.3
 for <qemu-trivial@nongnu.org>; Thu, 05 Nov 2026 09:02:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793898126; x=1794502926;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=DeNRUymI+hhBlFBMHfet6Gh/vOYYrettb5uGMGfK+2Y=;
 b=ecyNFuF0m9jKatEOHoYkiISEFjzPY0CG8p7W71JkmtSf1wgn3R0X2yDBHN/lguKCtN
 0mWhbm6tRSPMvLtkFubxgV3bQqcdqbBMliSrZZ3jIwUr7lb05zGZzmtIAa31bmB3y1OO
 lMcga8clB5eD/CnY+iiU1Q3yKdCLLKq+Q2TMPmhMM+RBhTEJ0LASGDRwbEZKudY3j+GE
 ioHoZL41IK+R1QyQAEeRUbCehxLodU6CrxKDcDcm7YpQUl3YTwth8km3fys8+ixtN9pH
 Zcr8Ip3duVSURN4616EiBszpn7HNNly9bCG6TH4MjkVatzhe/XjMTHtU5EUHuPyXxHK3
 ji7g==
X-Gm-Message-State: APuU4Z8WeF8rNhZy5SgnfiWse7FRVxm7/M5osUGOlXB3S8OFpH1cGBC8
 0ir2/sYenphiEfJZ2bYNHSx4v/rZIm15nLsbyxXexDu+9r0la10yZpm6/5ZmDIJAUjLgzw2onbe
 P2x0XiPRU0WxP5o4C9aICQ29oW1F/fMu9d7fCH/TQqSq7VGRKxvYwhDR3JKM=
X-Gm-Gg: AYBFou25CHqk5B6Lk81HxZi1tMzfrEFMFzEXrC6sQSbvOWvbnmqMdTLixF6H84oeUeY
 b2e4QX1yb3XeLNGv7C40iCTQLKLf4CQcvIEXXvETj7KhuAAeEeRKXCdaTxZxPgAmjoKFP5+hxWs
 /6KxLV/OEyJv0LU+Tr60ydhbxJr6M5fTpCSI8xrD1J7Dc6rSEH1t+9856I3cV3MGolnQxS4FRvV
 HjCWbA1rwk3wAEi/5WFm9PNIWeqP6L1JB+jUJz80KArGEJuSSWtktrk+omte2iaXPTXufzJ/NTt
 T5DFWPs0ji1e5AKglTrTCq/n0n4lUIUvCLy6hV9SqU3qjhc3swgN3UA6J3Le+Yrd9udAIG6jE35
 M87oDkBwtH7s8ivmqU0CSkS1Y3v0lmUln
X-Received: by 2002:a05:600c:5249:b0:4a7:7f3f:6f8e with SMTP id
 5b1f17b1804b1-4ac1228b5bfmr436963295e9.0.1793898125709; 
 Thu, 05 Nov 2026 09:02:05 -0800 (PST)
X-Received: by 2002:a05:600c:5249:b0:4a7:7f3f:6f8e with SMTP id
 5b1f17b1804b1-4ac1228b5bfmr436962615e9.0.1793898125252; 
 Thu, 05 Nov 2026 09:02:05 -0800 (PST)
Received: from x1 ([151.41.153.165]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b571f46538sm73142785e9.5.2026.11.05.09.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 09:02:04 -0800 (PST)
Date: Thu, 5 Nov 2026 18:02:02 +0100
From: Gustavo Romero <gromero@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-trivial@nongnu.org, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Subject: Re: [PATCH] MAINTAINERS: fix typo in Gerd's name
Message-ID: <rrbbem53a4ssa5prqyuhz5jrwp523r3qipjanyp2zvly5x4uap@m2udisuzncf5>
References: <20261105152647.2458298-1-alex.bennee@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261105152647.2458298-1-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: knsKRCR66VWM94Nb_6r6ZFejLwu_ED_pOW6nYNR5VXs_1793898126
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gromero@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 05 Nov 2026 16:02:18 -0500
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Alex,

On Thu, Nov 05, 2026 at 03:26:46PM +0000, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 198ed583650..3fac3e0f99e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2945,7 +2945,7 @@ F: tests/qtest/vmgenid-test.c
>  
>  VM Launch Update
>  M: Ani Sinha <anisinha@redhat.com>
> -M: Gerd Hoffman <kraxel@redhat.com>
> +M: Gerd Hoffmann <kraxel@redhat.com>
>  S: Maintained
>  F: hw/misc/vmlaunchupdate.c
>  F: include/hw/misc/vmlaunchupdate.h
> -- 
> 2.47.3
> 
> 

Reviewed-by: Gustavo Romero <gromero@redhat.com>


Cheers,
Gustavo


