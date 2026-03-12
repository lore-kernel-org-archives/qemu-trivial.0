Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4315105A58E
	for <qemu-trivial@archiver.kernel.org>; Thu, 12 Mar 2026 11:44:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1w0eSQ-00025o-F2; Thu, 12 Mar 2026 07:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1w0eSG-00024a-6f
 for qemu-trivial@nongnu.org; Thu, 12 Mar 2026 07:43:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1w0eSD-0007Bq-KU
 for qemu-trivial@nongnu.org; Thu, 12 Mar 2026 07:43:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773315827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VX11yaZ16tzpEGmn6Qq2B8zfb3xH1l4QnXeKAzAzb4c=;
 b=I0mw07LIaGD0EH8O41PJVSFAe964phwJmA9cn3frejiKb8Kehjwgxt0xpW87xtwlgpy1wT
 rz/rAWhDDOFnYcS7brD65SklEbmXpd5DRZ//rHGrRsG9n7yMp7RpDUbr2LBOdaJNT18/hJ
 XQK5+PlAwKZY1xaob8Mok7W8muer4Yk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-FSiINqJ9OdKR7GrmPD5eqQ-1; Thu, 12 Mar 2026 07:43:46 -0400
X-MC-Unique: FSiINqJ9OdKR7GrmPD5eqQ-1
X-Mimecast-MFC-AGG-ID: FSiINqJ9OdKR7GrmPD5eqQ_1773315825
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-485355493aeso6187465e9.1
 for <qemu-trivial@nongnu.org>; Thu, 12 Mar 2026 04:43:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773315825; x=1773920625;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VX11yaZ16tzpEGmn6Qq2B8zfb3xH1l4QnXeKAzAzb4c=;
 b=d3Ovu3djDjYZTlMj2jginauJM1foBX9WTda4xkMCtmVV9W+F1pXJd4itP11AzFPDN5
 w/5ZxIGGTdeJHHJMBIAwaJEtCN4P+3QnHowP79IrqR7zPurHsatyZDsRglhsny0R25sm
 micEhM8RsNdI5OzAbf6Knp1flGQInf74lDDgLgpwipZq+xyH9vD4Pbw6qBMlQjpg6B8T
 I4G0/SBUl+3WwLJM198OFfZfOmCddTa3XgLtEecMMYyiGOavhnzLPLunFR88/N4rsly2
 +d+gcJs35qYS7JcZUcWlbelJgQBD8GckxbWgdChbSkjYAvlDSrGe1VsOJbqJAAy39ywe
 mtvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCURfEmbIhhv82huvq4bzBBRxOmgZvyTZAJybsZddvR17l7HG2sizlnQdQr7FxTtd6O4PG2uZGoB9Qf34c8=@nongnu.org
X-Gm-Message-State: AOJu0YxEGVCubFDeITbP5BemQ5yGfRJECSaRKrNTXV8GmDBtbUZW2Cs1
 s8dHC3oJMzu9YcEwMjo5tWhXy4MmclayzDtysDJk2GBb3vxG0Sb8QoKq3oRYpjHDpPXbAZsqyb7
 cJrD7PyfkOrmTP2ozM2eCm8wtMHvfA/5myF9sNN2eJqpRD+DCrzLHrRLmewyMNXD6AXv75s3+LD
 VPRDvmz/XSOz9XC51KK1Kd1TCFO6OiKUuTMA==
X-Gm-Gg: ATEYQzzlMisOOgk+fq1xNjOQqL6o/FIh1qb6SmfWl7HfFQLRSRjOrnrcpOIXyFCtyDX
 9GZyJUDKY1jHm2+fGeZUtMYKEilh8Bvi8/aYQgBFkYTCowsi44LbbnNefEuPmM+P9FIB190q9XA
 9XdJxieL8qT5THR2X5jPTJ/xcvXFvR4KPVgQdtbU1oP1azIPFfMi8YmVYyUceIDDfqPjs1lJPt4
 7/jYwLlHoLHUL1QW3RIvfCOgi0rYv5Ws0rjjJRb7cdFsJ5a4Vo4urF5jOS/efjT+32Z
X-Received: by 2002:a05:600c:630d:b0:485:40fd:8390 with SMTP id
 5b1f17b1804b1-4854b10cdb3mr97265215e9.26.1773315825213; 
 Thu, 12 Mar 2026 04:43:45 -0700 (PDT)
X-Received: by 2002:a05:600c:630d:b0:485:40fd:8390 with SMTP id
 5b1f17b1804b1-4854b10cdb3mr97264805e9.26.1773315824811; Thu, 12 Mar 2026
 04:43:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260311131522.58600-1-heifetz@yandex-team.com>
 <20260311131522.58600-2-heifetz@yandex-team.com>
In-Reply-To: <20260311131522.58600-2-heifetz@yandex-team.com>
From: Prasad Pandit <ppandit@redhat.com>
Date: Thu, 12 Mar 2026 17:13:27 +0530
X-Gm-Features: AaiRm51pVlZmpGRb18wK5WbhHKgGSUJGnc1AVRp--minZf5pKc0pHi9DAArsPMw
Message-ID: <CAE8KmOz-gbY5+6hRBPFmQn_MALdoQuigeoBS5+5deyCvgAosGw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] migration/savevm.c: reorder usage and assertion of
 mis->from_src_file
To: Sergei Heifetz <heifetz@yandex-team.com>
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Peter Xu <peterx@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: I92-wSrS2HdWGgNtnCEuk_c2ukfDjPaAy5B50h_eRr0_1773315825
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ppandit@redhat.com;
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

On Wed, 11 Mar 2026 at 18:47, Sergei Heifetz <heifetz@yandex-team.com> wrote:
> Reorder the code so the assertion of mis->from_src_file occurs before
> the call to migration_ioc_unregister_yank_from_file, which dereferences
> it in qemu_file_get_ioc.
>
> Fixes: 39675ffffb3394 ("migration: Move the yank unregister of channel_close out")
> Signed-off-by: Sergei Heifetz <heifetz@yandex-team.com>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  migration/savevm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 3dc812a7bbb..930a3391e35 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -2885,13 +2885,14 @@ static bool postcopy_pause_incoming(MigrationIncomingState *mis)
>
>      assert(migrate_postcopy_ram());
>
> +    assert(mis->from_src_file);
> +
>      /*
>       * Unregister yank with either from/to src would work, since ioc behind it
>       * is the same
>       */
>      migration_ioc_unregister_yank_from_file(mis->from_src_file);
>
> -    assert(mis->from_src_file);
>      qemu_file_shutdown(mis->from_src_file);
>      qemu_fclose(mis->from_src_file);
>      mis->from_src_file = NULL;

*  Change looks okay. But is it really possible that we reach the
Postcopy pause step with mis->from/to_src_file = NULL?
    Maybe we could move the following 'assert(mis->to_src_file);' to
the top too? Make it fail early before any call(s) further.
===
diff --git a/migration/savevm.c b/migration/savevm.c
index 197c89e0e6..18264feaac 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2874,6 +2874,8 @@ static bool
postcopy_pause_incoming(MigrationIncomingState *mis)
     trace_postcopy_pause_incoming();

     assert(migrate_postcopy_ram());
+    assert(mis->from_src_file);
+    assert(mis->to_src_file);

     /*
      * Unregister yank with either from/to src would work, since ioc behind it
@@ -2881,12 +2883,10 @@ static bool
postcopy_pause_incoming(MigrationIncomingState *mis)
      */
     migration_ioc_unregister_yank_from_file(mis->from_src_file);

-    assert(mis->from_src_file);
     qemu_file_shutdown(mis->from_src_file);
     qemu_fclose(mis->from_src_file);
     mis->from_src_file = NULL;

-    assert(mis->to_src_file);
     qemu_file_shutdown(mis->to_src_file);
     qemu_mutex_lock(&mis->rp_mutex);
     qemu_fclose(mis->to_src_file);
===

Thank you.
---
  - Prasad


