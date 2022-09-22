Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1obOGs-0002AJ-TA
	for mharc-qemu-trivial@gnu.org; Thu, 22 Sep 2022 11:37:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1obOGh-00022V-NS
 for qemu-trivial@nongnu.org; Thu, 22 Sep 2022 11:37:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1obOGc-00018S-18
 for qemu-trivial@nongnu.org; Thu, 22 Sep 2022 11:37:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663861052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ITKm2bQwYtn3Eacqn/yPvepVgtjVsnnfD/bbbRmj20M=;
 b=WUne2QCFIse08PRR/nExvFCpguuI29vgVooWvRewcRC4UeOj1epdJcaGC6CJ9BJjtNU7Yt
 3sD7DmBYu11OhTRUuaxHEH/sOA7+PoLt9x5hlLJuDxyZDFd8GZjTDRAP+8ebRwWnydEKZA
 Sh29MnqQ5ZPiM68vNcpWDjl7tgNuLRc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-139-optX-UEaMhaWk8ZZjlj9LQ-1; Thu, 22 Sep 2022 11:37:29 -0400
X-MC-Unique: optX-UEaMhaWk8ZZjlj9LQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D08B185A792;
 Thu, 22 Sep 2022 15:37:28 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 33F6F47505E;
 Thu, 22 Sep 2022 15:37:23 +0000 (UTC)
Date: Thu, 22 Sep 2022 17:37:21 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH] block/qcow2-bitmap: Add missing cast to silent GCC error
Message-ID: <YyyBMe72wjTK3l0x@redhat.com>
References: <20220919182755.51967-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220919182755.51967-1-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 22 Sep 2022 15:37:47 -0000

Am 19.09.2022 um 20:27 hat Philippe Mathieu-Daudé geschrieben:
> Commit d1258dd0c8 ("qcow2: autoloading dirty bitmaps") added the
> set_readonly_helper() GFunc handler, correctly casting the gpointer
> user_data in both the g_slist_foreach() caller and the handler.
> Few commits later (commit 1b6b0562db), the handler is reused in
> qcow2_reopen_bitmaps_rw() but missing the gpointer cast, resulting
> in the following error when using Homebrew GCC 12.2.0:
> 
>   [2/658] Compiling C object libblock.fa.p/block_qcow2-bitmap.c.o
>   ../../block/qcow2-bitmap.c: In function 'qcow2_reopen_bitmaps_rw':
>   ../../block/qcow2-bitmap.c:1211:60: error: incompatible type for argument 3 of 'g_slist_foreach'
>    1211 |     g_slist_foreach(ro_dirty_bitmaps, set_readonly_helper, false);
>         |                                                            ^~~~~
>         |                                                            |
>         |                                                            _Bool
>   In file included from /opt/homebrew/Cellar/glib/2.72.3_1/include/glib-2.0/glib/gmain.h:26,
>                    from /opt/homebrew/Cellar/glib/2.72.3_1/include/glib-2.0/glib/giochannel.h:33,
>                    from /opt/homebrew/Cellar/glib/2.72.3_1/include/glib-2.0/glib.h:54,
>                    from /Users/philmd/source/qemu/include/glib-compat.h:32,
>                    from /Users/philmd/source/qemu/include/qemu/osdep.h:144,
>                    from ../../block/qcow2-bitmap.c:28:
>   /opt/homebrew/Cellar/glib/2.72.3_1/include/glib-2.0/glib/gslist.h:127:61: note: expected 'gpointer' {aka 'void *'} but argument is of type '_Bool'
>     127 |                                           gpointer          user_data);
>         |                                           ~~~~~~~~~~~~~~~~~~^~~~~~~~~
>   At top level:
>   FAILED: libblock.fa.p/block_qcow2-bitmap.c.o
> 
> Fix by adding the missing gpointer cast.
> 
> Fixes: 1b6b0562db ("qcow2: support .bdrv_reopen_bitmaps_rw")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Thanks, applied to the block branch. And in case qemu-trivial picks it
up anyway:

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


