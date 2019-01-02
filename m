Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1geeBb-0003Bz-8t
	for mharc-qemu-trivial@gnu.org; Wed, 02 Jan 2019 05:55:43 -0500
Received: from eggs.gnu.org ([208.118.235.92]:33352)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yuchenlin@synology.com>) id 1gecE5-0007Zp-Bv
	for qemu-trivial@nongnu.org; Wed, 02 Jan 2019 03:50:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yuchenlin@synology.com>) id 1gecDz-0003q1-Ub
	for qemu-trivial@nongnu.org; Wed, 02 Jan 2019 03:50:06 -0500
Received: from mail.synology.com ([211.23.38.101]:58141 helo=synology.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <yuchenlin@synology.com>)
	id 1gecDi-0003Vc-L0; Wed, 02 Jan 2019 03:49:48 -0500
Received: from _ (localhost [127.0.0.1])
	by synology.com (Postfix) with ESMTPA id 563D31924922;
	Wed,  2 Jan 2019 16:49:30 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synology.com; s=123;
	t=1546418970; bh=A1urnavRRpkYXt3jt/bipEr1PL9svbHk9zQFacPethA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Bh54S1xThyVVLhSEA/Npgetvy3xIXKFA/dvyb6NSPjalEaNAGfOrL5QdH0yAf6LDu
	EQVJAOEjx6tlpb86eRutobSFQPOjhNIvjbbh35I3RJVOfvSgAFnDkw1J2Jz8rjrTH9
	eDZbiM1Jua/huIDFFgvsFD044jS1v0Arxg4psvIU=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 02 Jan 2019 16:49:30 +0800
From: yuchenlin <yuchenlin@synology.com>
To: Julio Faracco <jcfaracco@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, kwolf@redhat.com,
	qemu-block@nongnu.org, stefanha@redhat.com, mreitz@redhat.com, Qemu-block
	<qemu-block-bounces+yuchenlin=synology.com@nongnu.org>
In-Reply-To: <20181228145055.18039-1-jcfaracco@gmail.com>
References: <20181228145055.18039-1-jcfaracco@gmail.com>
Message-ID: <ed671ae893c52d3ff94c849ab18f2857@synology.com>
X-Sender: yuchenlin@synology.com
User-Agent: Roundcube Webmail/1.1.2
X-Synology-MCP-Status: no
X-Synology-Spam-Flag: no
X-Synology-Spam-Status: score=0, required 6, WHITELIST_FROM_ADDRESS 0
X-Synology-Virus-Status: no
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 211.23.38.101
X-Mailman-Approved-At: Wed, 02 Jan 2019 05:55:42 -0500
Subject: Re: [Qemu-trivial] [Qemu-block] [PATCH] dmg: Fixing wrong dmg block
 type value for block terminator.
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
X-List-Received-Date: Wed, 02 Jan 2019 08:50:12 -0000

On 2018-12-28 22:50, Julio Faracco wrote:
> This is a trivial patch to fix a wrong value for block terminator.
> The old value was 0x7fffffff which is wrong. It was not affecting the
> code because QEMU dmg block is not handling block terminator right now.
> Neverthless, it should be fixed.
> 
> Signed-off-by: Julio Faracco <jcfaracco@gmail.com>

Reviewed-by: yuchenlin <yuchenlin@synology.com>

> ---
>  block/dmg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/block/dmg.c b/block/dmg.c
> index 50e91aef6d..2c806e3389 100644
> --- a/block/dmg.c
> +++ b/block/dmg.c
> @@ -54,7 +54,7 @@ enum {
>      UDBZ,
>      ULFO,
>      UDCM = 0x7ffffffe, /* Comments */
> -    UDLE               /* Last Entry */
> +    UDLE = 0xffffffff  /* Last Entry */
>  };
> 
>  static int dmg_probe(const uint8_t *buf, int buf_size, const char 
> *filename)


