Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hVW7F-0006na-3V
	for mharc-qemu-trivial@gnu.org; Tue, 28 May 2019 03:01:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38642)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hVW7C-0006m6-6H
	for qemu-trivial@nongnu.org; Tue, 28 May 2019 03:01:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hVW7B-0007wD-Ay
	for qemu-trivial@nongnu.org; Tue, 28 May 2019 03:01:42 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:42655)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hVW79-0007rY-8A; Tue, 28 May 2019 03:01:39 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
	1N5W0q-1gYTUc23re-016suf; Tue, 28 May 2019 09:01:08 +0200
To: Li Qiang <liq3ea@163.com>, quintela@redhat.com, dgilbert@redhat.com
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20190525062832.18009-1-liq3ea@163.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <04f4d19e-1669-35f0-52b3-44124c862913@vivier.eu>
Date: Tue, 28 May 2019 09:01:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190525062832.18009-1-liq3ea@163.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:CsbRl4/qJYgj5NSlcEl/uC14OenYdpvSxvdGrK9M2RZGD0OhWcU
	BEP/FdMOBz3KAo3/spAGpQMSkSlelAXjrR/NjB8aXMBnN3iOtCjQ6VQ3ADupsL4pcxwHPqT
	UyG/S2SiNL7UEwzwCwYD1TZIn3xniCsB+Jc8KV5XoI3URPbSFgr7XDFs0y1WgOaO3Nthkyo
	nermMcK2+seOFxBYvGsoQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DKYLav02uDk=:QQGDN4cOjbwHGq+Xby65eJ
	lx7+GjV+1/hWmhTYKPjYKSlAu9eUHE3aoDXK+vFZOImcYG181U036OvCe8ojk7QsTHmuXFwys
	BXXvB9nzriYOiNVgzUH6DhYEF6Jo+FprmtY/DOdlQ+GTIx5zz33C7M4fB0fSpXQx4BbO3Zbbq
	T9INgHpXMq69kPAJEL/+F4UMOWP9/4C0GwTqydviAoEdddci6jbY4tyLkrBhgRMl+s+p+fVfS
	7MYKpH9OabP6GHNqpZAyTpXtAQDi6WEZmclKxUFsjhXZtWAjXrf92vvuk7spg9KW6YW0d95oA
	61kCuAHyCGS+LvLV4gF+BFBo4ICwHW80LqFm00wf1JT2+snbgAZa7oNL19pHItHqRq1AwVQKn
	DrNpsK6wsojyqWAGq2MeeaVJ3KAeK+/XyeEqsdfEu9Oc4QGLcj5C1TCWNyzPw/etaEVgE0gP9
	tAhcKHp9IulDcEMarSfbZ234rqozkZE/O4TtlreqvcOsSDc8ymNTuaVdrETwCtvCigXuuwq8L
	EfQNCDI64Z1ah6FLwt9eZuRUv2sv7eR6PrSbbfbroKgcPJdOB8tmmJWlMqZyIRktBY5y5FkXS
	tnahyx6Fq0UlghvoNAizZB6QYVp0mbG2+IsDFtp8onxxI1xLK1nJkjX+uopiRTMhDjfuICfP+
	KTYfSdZNDqN+GM8uG1dVoXg6Dhx62wdGICyEL/jiLK40wZ/KOvKoWUeGsNnY9b0qXW0YirpVu
	ib+0mjksawTWYQyyPGJ91mwir/P9F3HuTDjh+a4I0mfu+raCkL0YoNfdhaE=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
Subject: Re: [Qemu-trivial] [PATCH] migration: fix a typo
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
X-List-Received-Date: Tue, 28 May 2019 07:01:43 -0000

On 25/05/2019 08:28, Li Qiang wrote:
> 'postocpy' should be 'postcopy'.
> 
> CC: qemu-trivial@nongnu.org
> Signed-off-by: Li Qiang <liq3ea@163.com>
> ---
>   migration/ram.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 4c60869226..359dc8f1bc 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2236,7 +2236,7 @@ static RAMBlock *unqueue_page(RAMState *rs, ram_addr_t *offset)
>   }
>   
>   /**
> - * get_queued_page: unqueue a page from the postocpy requests
> + * get_queued_page: unqueue a page from the postcopy requests
>    *
>    * Skips pages that are already sent (!dirty)
>    *
>
Applied to my trivial-patches branch.

Thanks,
Laurent

