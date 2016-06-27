Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bHcXO-0001F9-N5
	for mharc-qemu-trivial@gnu.org; Mon, 27 Jun 2016 15:49:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43861)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <samuel.thibault@ens-lyon.org>) id 1bHcXL-0001Bl-NK
	for qemu-trivial@nongnu.org; Mon, 27 Jun 2016 15:49:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <samuel.thibault@ens-lyon.org>) id 1bHcXJ-0003Da-Pu
	for qemu-trivial@nongnu.org; Mon, 27 Jun 2016 15:49:38 -0400
Received: from hera.aquilenet.fr ([141.255.128.1]:58052)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <samuel.thibault@ens-lyon.org>)
	id 1bHcXE-0003CO-3U; Mon, 27 Jun 2016 15:49:32 -0400
Received: from localhost (localhost [127.0.0.1])
	by hera.aquilenet.fr (Postfix) with ESMTP id 440787D3F;
	Mon, 27 Jun 2016 21:49:25 +0200 (CEST)
Received: from hera.aquilenet.fr ([127.0.0.1])
	by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xVIu9d0okigl; Mon, 27 Jun 2016 21:49:25 +0200 (CEST)
Received: from var.youpi.perso.aquilenet.fr (unknown
	[IPv6:2a01:cb19:1af:4600:3602:86ff:fe2c:6a19])
	by hera.aquilenet.fr (Postfix) with ESMTPSA id 0A4BD47C;
	Mon, 27 Jun 2016 21:49:25 +0200 (CEST)
Received: from samy by var.youpi.perso.aquilenet.fr with local (Exim 4.87)
	(envelope-from <samuel.thibault@ens-lyon.org>)
	id 1bHcXA-0004vk-2m; Mon, 27 Jun 2016 21:49:28 +0200
Date: Mon, 27 Jun 2016 21:49:28 +0200
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>,
	qemu-trivial@nongnu.org
Message-ID: <20160627194928.GI3403@var.home>
References: <1467024096-17942-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1467024096-17942-1-git-send-email-thuth@redhat.com>
User-Agent: Mutt/1.5.21+34 (58baf7c9f32f) (2010-12-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 141.255.128.1
Subject: Re: [Qemu-trivial] [PATCH] slirp: Remove superfluous memset() calls
 from the TFTP code
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
X-List-Received-Date: Mon, 27 Jun 2016 19:49:40 -0000

Thomas Huth, on Mon 27 Jun 2016 12:41:36 +0200, wrote:
> Commit fad7fb9ccd8013ea03  ("Add IPv6 support to the TFTP code")
> refactored some common code for preparing the mbuf into a new
> function called tftp_prep_mbuf_data(). One part of this common
> code is to do a "memset(m->m_data, 0, m->m_size);" for the related
> buffer first. However, at two spots, the memset() was not removed
> from the calling function, so it currently done twice in these code
> paths. Thus let's delete these superfluous memsets in the calling
> functions now.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Thanks!

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  slirp/tftp.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/slirp/tftp.c b/slirp/tftp.c
> index 12b5ff6..3673402 100644
> --- a/slirp/tftp.c
> +++ b/slirp/tftp.c
> @@ -208,8 +208,6 @@ static void tftp_send_error(struct tftp_session *spt,
>      goto out;
>    }
>  
> -  memset(m->m_data, 0, m->m_size);
> -
>    tp = tftp_prep_mbuf_data(spt, m);
>  
>    tp->tp_op = htons(TFTP_ERROR);
> @@ -237,8 +235,6 @@ static void tftp_send_next_block(struct tftp_session *spt,
>      return;
>    }
>  
> -  memset(m->m_data, 0, m->m_size);
> -
>    tp = tftp_prep_mbuf_data(spt, m);
>  
>    tp->tp_op = htons(TFTP_DATA);
> -- 
> 1.8.3.1
> 

-- 
Samuel
<macavity> bash: ls: Computer bought the farm
<macavity> THAT frightens ppl! :P
<macavity> id rather see: "bash: ls: Initialization of googol(AWAX)
        disengaged in HYPER32/64 mode due to faulty page request at
        AX:12A34F84B"
<macavity> at least that would give me the feeling that the
        *programmers* knows what is going on :P
(lovely Hurd...)

