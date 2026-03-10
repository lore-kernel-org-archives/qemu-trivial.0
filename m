Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA18FD4F03
	for <qemu-trivial@archiver.kernel.org>; Tue, 10 Mar 2026 16:33:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1w001j-0006jz-JS; Tue, 10 Mar 2026 12:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1w001J-0006VQ-Bw
 for qemu-trivial@nongnu.org; Tue, 10 Mar 2026 12:33:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1w001G-0002iP-2A
 for qemu-trivial@nongnu.org; Tue, 10 Mar 2026 12:33:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773160397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lHK2oj7ebPOCZS8OLmlG+rqQcYiZuzCdGTzZEjr3ts8=;
 b=e45yR4wS2C071OzPCGOtzfUW42vVwisdliB52MvuE1xdreyxTeDYoet3mxe25rKOQYfMbp
 2y9af1XB5yQayzxjMFRlXwEZbfvbFmN3vP1cTa5+wHYywemcQ/dznoGHdGPOt+uN2rm//f
 uy3cA4uIu1XJkwzm3O/h4ja1tQ5BDcQ=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-VVLlGedFO0aoPKiq_30xsw-1; Tue, 10 Mar 2026 12:33:16 -0400
X-MC-Unique: VVLlGedFO0aoPKiq_30xsw-1
X-Mimecast-MFC-AGG-ID: VVLlGedFO0aoPKiq_30xsw_1773160395
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-509114d7418so22981411cf.1
 for <qemu-trivial@nongnu.org>; Tue, 10 Mar 2026 09:33:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773160395; x=1773765195;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lHK2oj7ebPOCZS8OLmlG+rqQcYiZuzCdGTzZEjr3ts8=;
 b=FxYI6aAliVEsjn9M03W5GzPb8y5xuhOshO3I1fOjtlxP5arHQRG2OopyRUGb07iXUE
 BDfnMYJsOM+CwvCkxfFxynsPW/vWzeyB2zsEECvVFlgb28HPPwc6E/EdbMez0UPFCRuT
 j94OszjzGkQL34Fzv0vup/ZcAAeVHM83jU0FW578abrdq3Mr5YEN/r7JhKg7L/tof2xQ
 67jcVwRMTNekUUVm71OeiUndLBF5hiDNLqy2OUhtafqXIIyU+M5XFkhXFUAPIfTqiZ4x
 VHyeaxQ1UB+ESlegDF0LmuShfm8uLhOVe7RlKc6ilP7+R0rSQznbAsoWV4tBNbzyKIhQ
 IuwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsc6TIAo5fjW90K82VEVBPzBJEBNuUeglR3HNgMDWjQ28Qxy2Ju6TcHTjSB5BZrZu/cEU5CPQg/jJDK/o=@nongnu.org
X-Gm-Message-State: AOJu0YwKMMRE/z2ZsvrJ/hmn3cDm1J6GGNKa62MZK9202BJtCDYPvkNO
 NJQHQsrgOItsz09XW7NmVWd4TN7jmmuGn/s4jCSFzGZokjp3twQU22/x/dVcQnayqNcwiC8cobO
 IQxJ4UPhQtpuLIL46kfDQbD2jOb+fSnK9Ia8LfZkAhrUpuV0odymDSxF3KqM=
X-Gm-Gg: ATEYQzyeV7kemqeOR54umWkYElje+CuadkN0W8+M64KK/42U+/z4zqU3W5fGGe96TXA
 XBQQ6vfxh8xB5NQITu/M9CWhcS2p+n1sT3EaYPo/rbFldEvpnytZOfKVG46kJm1c7/nSPq0gQue
 +qDCReF5l6yM7gHXVcnXR78FHRQ6XraVt5DJHUg/BfTMvA9oijCHP3BOq4x9xTV3WoX8nXXpGET
 F9P2iUNZDnC4/cWztpNy4/sLAKrfQkFk7IGfWwNpn8OKl+lYnLusrZMbgR+dHxrnQRLrMteoF/Q
 5aV82xtpYqQuQHm7uXEUpdF2Wb5ZJz25hRmrmgPnkzfyeslFr87TBe7jmPEc5ZCd9hygUoco9wR
 vP17TAA88xi2IMA==
X-Received: by 2002:ac8:5815:0:b0:509:2ce4:28d5 with SMTP id
 d75a77b69052e-5092ce43323mr28157321cf.72.1773160395307; 
 Tue, 10 Mar 2026 09:33:15 -0700 (PDT)
X-Received: by 2002:ac8:5815:0:b0:509:2ce4:28d5 with SMTP id
 d75a77b69052e-5092ce43323mr28156891cf.72.1773160394737; 
 Tue, 10 Mar 2026 09:33:14 -0700 (PDT)
Received: from x1.local ([142.189.10.167]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-508fcd9e5c8sm80213331cf.26.2026.03.10.09.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 09:33:14 -0700 (PDT)
Date: Tue, 10 Mar 2026 12:33:12 -0400
From: Peter Xu <peterx@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 qemu-trivial@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH] docs: Move xbzrle.txt into the migration folder and
 convert to rst
Message-ID: <abBHyNfxF2zSRhCJ@x1.local>
References: <20260310092822.21232-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20260310092822.21232-1-thuth@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -_wsfxrfeJ4c8finmX-qOLT3t9de9fevLdrTrpqcwbc_1773160395
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.819, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.903,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On Tue, Mar 10, 2026 at 10:28:22AM +0100, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> xbzrle is a feature of migration and thus this file should go
> into the docs/devel/migration/ folder. While we're at it, turn
> it into proper .rst format, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Thanks!

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


