Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F793D3B98E
	for <qemu-trivial@archiver.kernel.org>; Tue,  9 Dec 2025 19:04:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vT30R-0003eu-Hn; Tue, 09 Dec 2025 14:04:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vT30M-0003dX-Pp
 for qemu-trivial@nongnu.org; Tue, 09 Dec 2025 14:04:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vT30K-0004h4-Jg
 for qemu-trivial@nongnu.org; Tue, 09 Dec 2025 14:04:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765307040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xOrX4uL+eGBTHZAlSDaFSqaCxK70jPEUj6inO1aBNTA=;
 b=gFsGgWDbRakIcLCdglyT6p2Yu+lx3ztUMwAj6aJQUBwD4PN4FXVmzMcSgOTdH2ed9uGTAA
 92QwpBfE1FHGfUNB/xJyVsyV+p2qzVTMoPQfS+bytsPvWs1s9txIgPoEp/wQtBjJx82AVo
 QHxTSyaQuyWOJHY/TJUzZC/P1DJsjA8=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-VjVihSwkPv2xcS4zYROTiw-1; Tue, 09 Dec 2025 14:03:59 -0500
X-MC-Unique: VjVihSwkPv2xcS4zYROTiw-1
X-Mimecast-MFC-AGG-ID: VjVihSwkPv2xcS4zYROTiw_1765307039
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ed6e701d26so127717511cf.1
 for <qemu-trivial@nongnu.org>; Tue, 09 Dec 2025 11:03:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765307039; x=1765911839;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xOrX4uL+eGBTHZAlSDaFSqaCxK70jPEUj6inO1aBNTA=;
 b=j3249XznN5YW4GqLJDTw5UyRdsJ5LqvYSKuXzcnoIIdfKBOKuytuYrVyoPg3SvmiYI
 MVSuQF++70SffaElYgt/rL9PBQRdhd8A9uAYb0vzZeY2icq492sIH/7jah4rf6icy/V2
 NM26/tS6Sx3ygZhlFNJFjR5+T0ZiY74GelD+DN3Z4Gy8Rf3VSX70JV7KGZFbrfNnka7J
 lCUdRpIAIPa5MJpraulpOtAFdOU07uw7/kQUldGDGFMFTbDft1VKqlL5lZhzl+nzc/dJ
 1fx/f561hCDjfHrNCBDXiNHnUIudY/zYKIMcloSQsbjpRmaWdpec7KYPqfPt3oVbGv/J
 pmLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK4Rp7VYKhjZ3qYUPb4EOQssgleEqSZjUgkN2QAO7Kusdsv8Hz7xou8JCwJ6HrN1HaCWfULkjzfO3E4pQ=@nongnu.org
X-Gm-Message-State: AOJu0YxbMudxPF5thqGkxuD3L76F+aMoMR17SRvKwZm+UKnhoeL4dsZm
 944j4IFZA5+JZvc0yRa/6GIGLN8b9UOueZO2w13M3DM+T5NcnunOU16su18v6LZJlSnkObYWk+K
 /fqeuh5G4MoRGHo0BVhfuSTQtDd1NwzS6mbxWdvBU8HDzrm2TLTiDetEBCJU=
X-Gm-Gg: ASbGncuO39T7zX2iJ25xQNUSQUQISScLfReDphvWVofFMyOrDhPOYcYuo+1ZkCViOOi
 fvlE8QIZD7rRTeksvko3XUwQwwHzKioDx8c71PR3LQLAhVLdrofDH/GlcHjdCRDHByew3vhFg4+
 4axbN+98KNZ0cmhR9QPtm3t6reXUZivOvekuMpATFfU/R/1lg/t5sagq78oYPmWd5c7+YlZCR+Y
 wplpJhqPcddXpJ6kSE0If1YDmuWHsjVVVZkBbudeNRV/NVfIhnTufMsDJBb2lBBLhY6QFxk4ajQ
 h6YlwcotGbkZB9W6VMwatL2RkUz84i8UIlz+gHkhil6WZrZdjBLL2ItubB5VypUW+BZuEXP0Jz+
 d5lc=
X-Received: by 2002:a05:622a:164d:b0:4ee:1d76:7341 with SMTP id
 d75a77b69052e-4f03fc83d56mr175194321cf.0.1765307038706; 
 Tue, 09 Dec 2025 11:03:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOOmWl52iI+s6TTGdqpdPNWWNGEcmAa845KK+fvqfcuBfIdDluwtK1pmzmWryy31zYVI0DHQ==
X-Received: by 2002:a05:622a:164d:b0:4ee:1d76:7341 with SMTP id
 d75a77b69052e-4f03fc83d56mr175193881cf.0.1765307038279; 
 Tue, 09 Dec 2025 11:03:58 -0800 (PST)
Received: from x1.local ([142.188.210.156]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f0276b060asm104130481cf.10.2025.12.09.11.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Dec 2025 11:03:57 -0800 (PST)
Date: Tue, 9 Dec 2025 14:03:56 -0500
From: Peter Xu <peterx@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH-for-10.2] Fix order of function arguments
Message-ID: <aThynO5EgO_YF7Pz@x1.local>
References: <20251209125049.764095-1-sw@weilnetz.de>
MIME-Version: 1.0
In-Reply-To: <20251209125049.764095-1-sw@weilnetz.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: m3jBnYuXEtd5zr98myt9L-t41Cx8lxiToL8rQAhNsik_1765307039
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Dec 09, 2025 at 01:50:49PM +0100, Stefan Weil via wrote:
> This fixes a compiler error when higher warning levels are enabled:
> 
> ../migration/postcopy-ram.c: In function ‘postcopy_temp_pages_setup’:
> ../migration/postcopy-ram.c:1483:50: error: ‘g_malloc0_n’ sizes specified with ‘sizeof’ in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
>  1483 |     mis->postcopy_tmp_pages = g_malloc0_n(sizeof(PostcopyTmpPage), channels);
>       |                                                  ^~~~~~~~~~~~~~~
> ../migration/postcopy-ram.c:1483:50: note: earlier argument should specify number of elements, later size of each element
> 
> Avoid also a related int/unsigned mismatch by fixing the type of
> two local variables.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  migration/postcopy-ram.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> index 3f98dcb6fd..8bef0192aa 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -1467,7 +1467,8 @@ retry:
>  static int postcopy_temp_pages_setup(MigrationIncomingState *mis)
>  {
>      PostcopyTmpPage *tmp_page;
> -    int err, i, channels;
> +    int err;
> +    unsigned i, channels;
>      void *temp_page;
>  
>      if (migrate_postcopy_preempt()) {
> @@ -1479,7 +1480,7 @@ static int postcopy_temp_pages_setup(MigrationIncomingState *mis)
>      }
>  
>      channels = mis->postcopy_channels;
> -    mis->postcopy_tmp_pages = g_malloc0_n(sizeof(PostcopyTmpPage), channels);
> +    mis->postcopy_tmp_pages = g_malloc0_n(channels, sizeof(PostcopyTmpPage));
>  
>      for (i = 0; i < channels; i++) {
>          tmp_page = &mis->postcopy_tmp_pages[i];
> -- 
> 2.47.3
> 

Thanks for the patch, I'll wait for v2 per others' comments (or if Laurent
would pick it up).

Please also consider adding a prefix ("migration:") the subject.

-- 
Peter Xu


