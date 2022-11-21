Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ox9Uz-0004SR-Rk
	for mharc-qemu-trivial@gnu.org; Mon, 21 Nov 2022 11:18:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ox9Uv-0004RF-34
 for qemu-trivial@nongnu.org; Mon, 21 Nov 2022 11:18:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ox9Ut-0007cp-2j
 for qemu-trivial@nongnu.org; Mon, 21 Nov 2022 11:18:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669047492;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ETzG5NiBaxztGPuhC/VPplUI9WEkw79/a1Nmk6TI7ck=;
 b=SHCGEyUc7skQWo3Cv1iBkyr8XWixBxn98jvaARSqqA89MYl3KHjgo/02RKtVJiGrAjHx7Q
 /496Ab4S0Dt+cn+6LtHOorBG0Ut+u3k7UyN0YWWcbMDXRm8pLxuRANWJvITcBrsMDA52hC
 2UGBGLB7YU9B0VjoGtse6alOqFqGdh8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-201-fPWlBQMGPQKFSIL3XkjtEQ-1; Mon, 21 Nov 2022 11:18:10 -0500
X-MC-Unique: fPWlBQMGPQKFSIL3XkjtEQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 t12-20020adfa2cc000000b0022adcbb248bso3351461wra.1
 for <qemu-trivial@nongnu.org>; Mon, 21 Nov 2022 08:18:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ETzG5NiBaxztGPuhC/VPplUI9WEkw79/a1Nmk6TI7ck=;
 b=0HB7OKJjS3k8r351Me5mFR/Wh8lEgRi8I6/zr8H9FOkRZ56KNiH2/dBpLL3GyjJ2fp
 hyzfm3sDOd83wuXN4/dyeScfpiZ+MeEd/et/EEOl+pbnD5CAex1mAIGhWCjUP2I0upMp
 LLU8nUiyc4IFrTK8++kPSYIBJaJ9GU3i1U/YHNQQYW99hv7/hsI7de9JOVKt0WMxRpXK
 ICntFrO1LhaXJBE8mBfH5coC1V9mUUkg7k/MuSQ/DLW8NNppeZ1t4T3GKq7CBIOVx0nh
 h/7qOJeHxiMQgaXB+rhSDQYqjExNasPFdPAP5Du+q1O4m6JvOzefirdSPYoCHM23kj7s
 wP5w==
X-Gm-Message-State: ANoB5pk7Krmt1eYfsfGN/tuzut0cpzyCSlMR6MpumuBUdqlvRcVTgbQF
 LxjjYa5XfkV1B+MqNAnmfxn3JuSL88ZrxMyml8vJMKbDpJIYPLGFMe3GF2oYPS8zoe6bSLc2nb6
 0tlAOTCgjhbSKsjqWOg==
X-Received: by 2002:a5d:474c:0:b0:234:d495:d3ae with SMTP id
 o12-20020a5d474c000000b00234d495d3aemr4631674wrs.448.1669047489469; 
 Mon, 21 Nov 2022 08:18:09 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7wcx6jXQZgMzHBKzYPA/BoQ2jrIKgAjQSNF/qvPeVPt6y0z0SjRBJ+CEEPsOy+7rrqI7gwag==
X-Received: by 2002:a5d:474c:0:b0:234:d495:d3ae with SMTP id
 o12-20020a5d474c000000b00234d495d3aemr4631659wrs.448.1669047489216; 
 Mon, 21 Nov 2022 08:18:09 -0800 (PST)
Received: from redhat.com (62.117.240.223.dyn.user.ono.com. [62.117.240.223])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a1c4b0f000000b003cf7292c553sm14115058wma.13.2022.11.21.08.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 08:18:08 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  =?utf-8?Q?Marc-Andr?=
 =?utf-8?Q?=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Fam
 Zheng <fam@euphon.net>,  Peter Xu <peterx@redhat.com>,  Michael Tokarev
 <mjt@tls.msk.ru>,  Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>,  qemu-trivial@nongnu.org,  Laurent
 Vivier <laurent@vivier.eu>
Subject: Re: [PATCH 00/19] Migration patches for 8.8
In-Reply-To: <20221121132717.63070-1-quintela@redhat.com> (Juan Quintela's
 message of "Mon, 21 Nov 2022 14:26:58 +0100")
References: <20221121132717.63070-1-quintela@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Mon, 21 Nov 2022 17:18:07 +0100
Message-ID: <87wn7ol1s0.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 21 Nov 2022 16:18:18 -0000

Juan Quintela <quintela@redhat.com> wrote:
> Hi
>
> Based-on:  <20221121125907.62469-1-quintela@redhat.com>

The subject should put 8.0 not 8.8.

Sorry, Juan.

>
> This are the patches that I had to drop form the last PULL request because they werent fixes:
> - AVX2 is dropped, intel posted a fix, I have to redo it
> - Fix for out of order channels is out
>   Daniel nacked it and I need to redo it
>
> Juan Quintela (4):
>   multifd: Create page_size fields into both MultiFD{Recv,Send}Params
>   multifd: Create page_count fields into both MultiFD{Recv,Send}Params
>   migration: Export ram_transferred_ram()
>   migration: Export ram_release_page()
>
> Peter Xu (15):
>   migration: Take bitmap mutex when completing ram migration
>   migration: Add postcopy_preempt_active()
>   migration: Cleanup xbzrle zero page cache update logic
>   migration: Trivial cleanup save_page_header() on same block check
>   migration: Remove RAMState.f references in compression code
>   migration: Yield bitmap_mutex properly when sending/sleeping
>   migration: Use atomic ops properly for page accountings
>   migration: Teach PSS about host page
>   migration: Introduce pss_channel
>   migration: Add pss_init()
>   migration: Make PageSearchStatus part of RAMState
>   migration: Move last_sent_block into PageSearchStatus
>   migration: Send requested page directly in rp-return thread
>   migration: Remove old preempt code around state maintainance
>   migration: Drop rs->f
>
>  migration/migration.h    |   7 -
>  migration/multifd.h      |   8 +
>  migration/ram.h          |  23 ++
>  migration/migration.c    |  47 +--
>  migration/multifd-zlib.c |  14 +-
>  migration/multifd-zstd.c |  12 +-
>  migration/multifd.c      |  27 +-
>  migration/ram.c          | 735 ++++++++++++++++++---------------------
>  8 files changed, 422 insertions(+), 451 deletions(-)


