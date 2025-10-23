Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 097BECCD1BC
	for <qemu-trivial@archiver.kernel.org>; Thu, 23 Oct 2025 14:33:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vBwNc-0000Pw-7x; Thu, 23 Oct 2025 10:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vBwNZ-0000AK-Id
 for qemu-trivial@nongnu.org; Thu, 23 Oct 2025 10:33:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vBwNW-00028u-DM
 for qemu-trivial@nongnu.org; Thu, 23 Oct 2025 10:33:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761229999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g+DEaRGWFavcvPAdzstc9Bst74ovSImAqm6Qi6wTsoE=;
 b=WTbT+zkDXBJiHgDCnBDN/4Sk4PVftORywTWoFmBDxvMmSUoI5neJdn78GsDYxoUfdhAaxg
 SpTUnsJxqt/AM4ACRKf3EOpq4fGazDDjuccmqYSduEEMFkC0lp9VYUKP9WDM9TW6+zfcq3
 IfwkVjcSchXajUJPb5sZ7X/I+ZvkcJY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-ayOgbXp-NHyeSZN1rvLISQ-1; Thu, 23 Oct 2025 10:33:17 -0400
X-MC-Unique: ayOgbXp-NHyeSZN1rvLISQ-1
X-Mimecast-MFC-AGG-ID: ayOgbXp-NHyeSZN1rvLISQ_1761229996
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4e8984d8833so40442961cf.0
 for <qemu-trivial@nongnu.org>; Thu, 23 Oct 2025 07:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761229996; x=1761834796;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g+DEaRGWFavcvPAdzstc9Bst74ovSImAqm6Qi6wTsoE=;
 b=jwRHwuuCoCij5k2rruXjLr+yI/W5rsVG7ZFoeGelhfr2YsN+7QNARkcx5qIuzs0OKe
 Nbo2S2vbwlPiKNW0Fg57204+hVXzb2oQrVdqRQkmEfP+sS0k8n4zGQcEHnQLBV/En9d0
 SAHTG6kIaKIr7OqIUbvY+YiRXblBjNEW626v+H4lnXSBxkXxYUVcqX0aQh9PEYQeYKLJ
 m+rSus2eydxQjLQYs0FIMjSyRA5H1IULvg5T+KTUXHH6Ehq41qaJKd6eRppqCdWOXJsW
 iMzUlq5zjFX5n3yWla2oarC2iM+jK4jS0/kOsmhEFwCbT3Vq6XOwHaOy8l/ccceDhxkg
 R01Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJK62Q57v1FlGYu/eLdSOkpuv9naZVSiXu9i4JH8QFcp1MsCLK7oJ37+dyM52Ln14AuGAmVzxy8+UChsk=@nongnu.org
X-Gm-Message-State: AOJu0Yzl8cuRWw32xpaF3umIeEfM2LSJhnfn3+bJ4SYjA0B6sQZaT3Zm
 80QGg+4vpkDaV2hdp0QT4/WJAygBS8590mwsv/pH7PL4SlgXBK57LNrt8hFy9T4pMTiezNqVnMZ
 LIYBh1dgds3QXJKHNeQTBVgeaWo+X6CaG7qV5cbfDxmdmXcNFi2wKfoE+Fuc=
X-Gm-Gg: ASbGnctk97fSGlC4N1QT2jNxCglQtrLE5YWbaEjpEV1DRJXP/jqDPjwW0Wl4iFWBRJL
 j9matg9ARMpD5esZEiDmd22lDRLY2P49LZ+hWw5o0nnxuMptRTBLfD44SZDzvJOOgJ4vC4D+UgP
 BTDyMcgXWwmGbQwuGnYjhZo3unec2lzWlzbHxUPwFeuZQKieHApZUxmACtJL2VMjKFG0IeRuC2X
 rLT0WVvQw+A9W2EX8/GvIt3I4YOoeX00Ohxq4Z6DKJA/QKqwlYjGq2AzOSckSEV/rqG0JybazeZ
 aa5TncBoxUHuuj00AruZUUd14bg54x6m8zze2PXMleQQDTQzNJpO1MUfk150anqfBUk=
X-Received: by 2002:ac8:5f93:0:b0:4e7:216e:1fcd with SMTP id
 d75a77b69052e-4e89d35c9ebmr317131671cf.54.1761229996568; 
 Thu, 23 Oct 2025 07:33:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHied5OjtwhoYeyIx9Q7nJTiKxElPcQVirOIJ2rszQPPVyavsq0hgJZ2VfT8488dKEtsSlfMw==
X-Received: by 2002:ac8:5f93:0:b0:4e7:216e:1fcd with SMTP id
 d75a77b69052e-4e89d35c9ebmr317131111cf.54.1761229996024; 
 Thu, 23 Oct 2025 07:33:16 -0700 (PDT)
Received: from x1.local ([142.188.210.50]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-87f9e7f6a19sm15982606d6.55.2025.10.23.07.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 07:33:15 -0700 (PDT)
Date: Thu, 23 Oct 2025 10:33:12 -0400
From: Peter Xu <peterx@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Fabiano Rosas <farosas@suse.de>
Subject: Re: [PATCH v2 2/2] migration/vmstate: remove
 VMSTATE_BUFFER_POINTER_UNSAFE macro
Message-ID: <aPo8qL4zg3LEXMpq@x1.local>
References: <20251023135316.31128-1-mjt@tls.msk.ru>
 <20251023135316.31128-3-mjt@tls.msk.ru>
MIME-Version: 1.0
In-Reply-To: <20251023135316.31128-3-mjt@tls.msk.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WFSN4gmDxu2wfk4sPkaJ2ajy7Y5GbqdvxCDT0OCIV8E_1761229996
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Oct 23, 2025 at 04:53:10PM +0300, Michael Tokarev wrote:
> The only user of this macro was VirtIONet.vlans, which has been
> converted to regular VMSTATE_BUFFER.
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


