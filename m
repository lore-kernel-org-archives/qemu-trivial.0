Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oaMuy-00024t-Pi
	for mharc-qemu-trivial@gnu.org; Mon, 19 Sep 2022 15:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oaMGz-00060L-Iw
 for qemu-trivial@nongnu.org; Mon, 19 Sep 2022 15:17:41 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:36036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oaMGt-0003We-QL
 for qemu-trivial@nongnu.org; Mon, 19 Sep 2022 15:17:38 -0400
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 931AC2E0C04;
 Mon, 19 Sep 2022 22:10:09 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b505::1:12] (unknown
 [2a02:6b8:b081:b505::1:12])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 VriX36HKTk-A8Pip0hu; Mon, 19 Sep 2022 22:10:08 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1663614608; bh=sDL11noTHSB/eYQcSW/9HHiwh+KmVinjE6CXt7u1mUs=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=kJQxlWt/sjoBOK+db27/eLCm+UpNqTv2MF5RLBd5Z87duvmafRmUuZHT7cj6+Gr/s
 IKlgAlwqA5UPaP3uaxJ4IMSG8PBhO+dBuQmEUgdGDvZU5EGqDduL9LraApyfVctpON
 7TAl+EQMogu0pNl2dtGJPpqITPnhBidsDOKTY+uA=
Authentication-Results: iva8-3a65cceff156.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <50c58db5-59d2-3de5-ad77-06434b8a76fe@yandex-team.ru>
Date: Mon, 19 Sep 2022 22:10:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] block/qcow2-bitmap: Add missing cast to silent GCC error
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Max Reitz <mreitz@redhat.com>
References: <20220919182755.51967-1-f4bug@amsat.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220919182755.51967-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.952,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 19 Sep 2022 15:58:57 -0400
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
X-List-Received-Date: Mon, 19 Sep 2022 19:18:08 -0000

On 9/19/22 21:27, Philippe Mathieu-Daudé wrote:
> Commit d1258dd0c8 ("qcow2: autoloading dirty bitmaps") added the
> set_readonly_helper() GFunc handler, correctly casting the gpointer
> user_data in both the g_slist_foreach() caller and the handler.
> Few commits later (commit 1b6b0562db), the handler is reused in
> qcow2_reopen_bitmaps_rw() but missing the gpointer cast, resulting
> in the following error when using Homebrew GCC 12.2.0:
> 
>    [2/658] Compiling C object libblock.fa.p/block_qcow2-bitmap.c.o
>    ../../block/qcow2-bitmap.c: In function 'qcow2_reopen_bitmaps_rw':
>    ../../block/qcow2-bitmap.c:1211:60: error: incompatible type for argument 3 of 'g_slist_foreach'
>     1211 |     g_slist_foreach(ro_dirty_bitmaps, set_readonly_helper, false);
>          |                                                            ^~~~~
>          |                                                            |
>          |                                                            _Bool
>    In file included from /opt/homebrew/Cellar/glib/2.72.3_1/include/glib-2.0/glib/gmain.h:26,
>                     from /opt/homebrew/Cellar/glib/2.72.3_1/include/glib-2.0/glib/giochannel.h:33,
>                     from /opt/homebrew/Cellar/glib/2.72.3_1/include/glib-2.0/glib.h:54,
>                     from /Users/philmd/source/qemu/include/glib-compat.h:32,
>                     from /Users/philmd/source/qemu/include/qemu/osdep.h:144,
>                     from ../../block/qcow2-bitmap.c:28:
>    /opt/homebrew/Cellar/glib/2.72.3_1/include/glib-2.0/glib/gslist.h:127:61: note: expected 'gpointer' {aka 'void *'} but argument is of type '_Bool'
>      127 |                                           gpointer          user_data);
>          |                                           ~~~~~~~~~~~~~~~~~~^~~~~~~~~
>    At top level:
>    FAILED: libblock.fa.p/block_qcow2-bitmap.c.o
> 
> Fix by adding the missing gpointer cast.
> 
> Fixes: 1b6b0562db ("qcow2: support .bdrv_reopen_bitmaps_rw")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Thanks for fixing! Seems correct for it to go with trivial patches.

-- 
Best regards,
Vladimir

