Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dAXHK-00012T-0X
	for mharc-qemu-trivial@gnu.org; Tue, 16 May 2017 03:52:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49668)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1dAXHI-00011F-9v
	for qemu-trivial@nongnu.org; Tue, 16 May 2017 03:52:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1dAXHH-0001ug-Fc
	for qemu-trivial@nongnu.org; Tue, 16 May 2017 03:52:20 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:36046
	helo=v2201612906741603.powersrv.de)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sw@weilnetz.de>)
	id 1dAXHB-0001so-3e; Tue, 16 May 2017 03:52:13 -0400
Received: from localhost (localhost [127.0.0.1])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id 235D3DA0EEB;
	Tue, 16 May 2017 09:52:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
	by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id uNH0mGog7itA; Tue, 16 May 2017 09:52:09 +0200 (CEST)
Received: from edv32.bib.uni-mannheim.de (mobile-203-015.wlan.uni-mannheim.de
	[134.155.203.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 00F94DA05AB; 
	Tue, 16 May 2017 09:52:08 +0200 (CEST)
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20170516074256.24731-1-kraxel@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	"open list:raw" <qemu-block@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Fam Zheng <famz@redhat.com>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <2c224267-32ec-ccf7-ae80-113ebfdce1e2@weilnetz.de>
Date: Tue, 16 May 2017 09:52:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170516074256.24731-1-kraxel@redhat.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 37.120.169.71
Subject: Re: [Qemu-trivial] [PATCH] block/win32: fix 'ret not initialized'
 warning
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 16 May 2017 07:52:21 -0000

Am 16.05.2017 um 09:42 schrieb Gerd Hoffmann:
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  block/file-win32.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/block/file-win32.c b/block/file-win32.c
> index 1a35dbabf2..8f14f0bdcd 100644
> --- a/block/file-win32.c
> +++ b/block/file-win32.c
> @@ -346,6 +346,7 @@ static int raw_open(BlockDriverState *bs, QDict *options, int flags,
>
>      if (qdict_get_try_bool(options, "locking", false)) {
>          error_setg(errp, "locking=on is not supported on Windows");
> +        ret = -EINVAL;
>          goto fail;
>      }


This is a bug fix for commit 1c3a555c.

Reviewed-by: Stefan Weil <sw@weilnetz.de>


