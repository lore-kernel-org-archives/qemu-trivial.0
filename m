Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bG2Pn-0000UP-QF
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jun 2016 07:03:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57114)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bG2Pm-0000TJ-6f
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2016 07:03:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bG2Pl-0004Ct-B2
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2016 07:03:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34190)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1bG2Pf-0004Ah-3S; Thu, 23 Jun 2016 07:03:11 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6519A3F729;
	Thu, 23 Jun 2016 11:03:09 +0000 (UTC)
Received: from [10.36.112.46] (ovpn-112-46.ams2.redhat.com [10.36.112.46])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5NB36si032210; Thu, 23 Jun 2016 07:03:08 -0400
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <1466007277-17525-1-git-send-email-lvivier@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <2ea3a8f3-087e-4aca-cd22-289b931a1885@redhat.com>
Date: Thu, 23 Jun 2016 13:03:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <1466007277-17525-1-git-send-email-lvivier@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 23 Jun 2016 11:03:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/7] Remove useless casts
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
X-List-Received-Date: Thu, 23 Jun 2016 11:03:19 -0000

Ping?

Laurent

On 15/06/2016 18:14, Laurent Vivier wrote:
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
> 

