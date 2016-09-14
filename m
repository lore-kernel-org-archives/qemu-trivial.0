Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk4T1-0002wh-4W
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 03:18:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46298)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk4Sz-0002vt-A9
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 03:18:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk4Sy-0008A2-GA
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 03:18:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46991)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bk4St-00087g-RQ; Wed, 14 Sep 2016 03:18:40 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0CE0F417FF;
	Wed, 14 Sep 2016 10:18:36 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 8DA8CAAB;
	Wed, 14 Sep 2016 10:18:35 +0300 (MSK)
To: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
References: <1466007277-17525-1-git-send-email-lvivier@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <aa9df512-bd17-0462-04d2-dd520f817acc@msgid.tls.msk.ru>
Date: Wed, 14 Sep 2016 10:18:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <1466007277-17525-1-git-send-email-lvivier@redhat.com>
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH 0/7] Remove useless casts
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
X-List-Received-Date: Wed, 14 Sep 2016 07:18:46 -0000

15.06.2016 19:14, Laurent Vivier wrote:
> This series is the result of the following coccinelle script:
>
>     @@
>     type T;
>     T v;
>     @@
>     -       (T *)&v
>     +       &v
>
> This script removes the cast of a variable when the variable
> is already of the casting type.
>
> The script is added in scripts/coccinelle by the first patch.
>
> Laurent Vivier (7):
>   coccinelle: add a script to remove useless casts
>   linux-user,s390x: remove useless cast
>   s390x: remove useless cast
>   tricore: remove useless cast
>   fw_cfg: remove useless casts
>   crypto: remove useless casts
>   sheepdog: remove useless casts
>
>  block/sheepdog.c                  | 4 ++--
>  crypto/cipher-builtin.c           | 4 ++--
>  hw/nvram/fw_cfg.c                 | 4 ++--
>  hw/s390x/sclp.c                   | 2 +-
>  hw/tricore/tricore_testboard.c    | 2 +-
>  linux-user/signal.c               | 2 +-
>  scripts/coccinelle/typecast.cocci | 7 +++++++
>  7 files changed, 16 insertions(+), 9 deletions(-)
>  create mode 100644 scripts/coccinelle/typecast.cocci

Applied all 7 to -trivial, thank you!

/mjt


