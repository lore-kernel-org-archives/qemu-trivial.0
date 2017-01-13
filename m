Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cSINK-0001t3-4f
	for mharc-qemu-trivial@gnu.org; Sat, 14 Jan 2017 02:03:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36150)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shorne@gmail.com>) id 1cS9w3-0004wI-CC
	for qemu-trivial@nongnu.org; Fri, 13 Jan 2017 17:03:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shorne@gmail.com>) id 1cS9vz-0005jU-Ej
	for qemu-trivial@nongnu.org; Fri, 13 Jan 2017 17:02:59 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:36552)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <shorne@gmail.com>) id 1cS9vz-0005jQ-8B
	for qemu-trivial@nongnu.org; Fri, 13 Jan 2017 17:02:55 -0500
Received: by mail-pf0-x241.google.com with SMTP id b22so9921317pfd.3
	for <qemu-trivial@nongnu.org>; Fri, 13 Jan 2017 14:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=atw1PLBdPWGFW7lU9iWr2mj5g4dM++vzbO6oP0qBdTE=;
	b=hzF527hAq0cI6In14nVLeKjJgKS6yatt0ZnxCuTkzP29VYppC67kPm7D55c3n43hVV
	8NfokvwX5jm71RpxSxwXz2U/r5oJH21CHt8zS5ZzLrigv99wzcA981BQ71EvRkYQJ8EM
	wIV3XmMsMf66tCcJLl6QODDnnCIMiBJG/fmR0sYKxc3Kz74YMKqoXVyiKkNR4Sqpjk/7
	vMmb5x6XJxOX32FaNT0B8im2+//1U7zdILEJy0ROpbATyBBcNfs463FkT/8zrW3wh+RV
	DBSKMMf9l32L7oGRqdXpJugN5o1l1XfTVgthJKDjigwZXlt22yUMrWrRM8gm9HCOOx6Z
	3EWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=atw1PLBdPWGFW7lU9iWr2mj5g4dM++vzbO6oP0qBdTE=;
	b=bUC+KNYsUNNbmAnBYNEqRtvBn12xbLDO9VGnoLKkyDOng8+lcz/S+xkmN3Wx1eB+qN
	gKnI+m/m+7hDZdQXrvCpG6337PBI/r3Bp4bVzJPOrXt1Qp7xQUx5R3klsLyJzf6BL6cf
	GzRs/79tuHTmDBO4i0oqzYIxr8J1h7RfjB+yH+VOf4nbxLAYT6S/8vcq16P/zOxJtGnT
	nx0WbTfuV6boIfTxXXllz2tFHBqa+d6rvnv5noxJTwlHtBrOvEVy/aPVNmsuKG91RQrV
	jC9F7OZjgtmKrxXOJDcXKdtB6cjjtgwJj5Mpla3d+ndbI4J9GS1YwbyDL1XE+x79nhmV
	bAXA==
X-Gm-Message-State: AIkVDXLT/4p6+PPknvvgpJ0qhzcvhGOVXW6O9+wOs8EhMfqEYpO4Khi5O8AyXvZGb9MKcA==
X-Received: by 10.84.225.133 with SMTP id u5mr32188046plj.76.1484344974174;
	Fri, 13 Jan 2017 14:02:54 -0800 (PST)
Received: from localhost (z192.220-213-15.ppp.wakwak.ne.jp. [220.213.15.192])
	by smtp.gmail.com with ESMTPSA id
	66sm31395471pfx.29.2017.01.13.14.02.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 13 Jan 2017 14:02:53 -0800 (PST)
Date: Sat, 14 Jan 2017 07:02:52 +0900
From: Stafford Horne <shorne@gmail.com>
To: Jia Liu <proljc@gmail.com>
Cc: qemu-trivial@nongnu.org, openrisc@lists.librecores.org
Message-ID: <20170113220252.GE25986@lianli.shorne-pla.net>
References: <20170113215720.29598-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170113215720.29598-1-shorne@gmail.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::241
X-Mailman-Approved-At: Sat, 14 Jan 2017 02:03:41 -0500
Subject: Re: [Qemu-trivial] [PATCH] target-openrisc: Fix exception handling
 status registers
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
X-List-Received-Date: Fri, 13 Jan 2017 22:03:00 -0000

Hello,

Sorry for the duplicate. There was an issue with my copy to qemu-devel
group.  Resent to everyone with proper cc to qemu-devel.

Please ignore this one.

-Stafford

On Sat, Jan 14, 2017 at 06:57:20AM +0900, Stafford Horne wrote:
> I am working on testing instruction emulation patches for the linux
> kernel. During testing I found these 2 issues:
> 
>  - sets DSX (delay slot exception) but never clears it
>  - EEAR for illegal insns should point to the bad exception (as per
>    openrisc spec) but its not
> 
> This patch fixes these two issues by clearing the DSX flag when not in a
> delay slot and by setting EEAR to exception PC when handling illegal
> instruction exceptions.
> 
> After this patch the openrisc kernel with latest patches boots great on
> qemu and instruction emulation works.
> 
> Cc: qemu-trivial@nongnu.org
> Cc: openrisc@lists.librecores.org
> Signed-off-by: Stafford Horne <shorne@gmail.com>
> ---
>  target/openrisc/interrupt.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/target/openrisc/interrupt.c b/target/openrisc/interrupt.c
> index 5fe3f11..e1b0142 100644
> --- a/target/openrisc/interrupt.c
> +++ b/target/openrisc/interrupt.c
> @@ -38,10 +38,17 @@ void openrisc_cpu_do_interrupt(CPUState *cs)
>          env->flags &= ~D_FLAG;
>          env->sr |= SR_DSX;
>          env->epcr -= 4;
> +    } else {
> +        env->sr &= ~SR_DSX;
>      }
>      if (cs->exception_index == EXCP_SYSCALL) {
>          env->epcr += 4;
>      }
> +    /* When we have an illegal instruction the error effective address
> +       shall be set to the illegal instruction address.  */
> +    if (cs->exception_index == EXCP_ILLEGAL) {
> +        env->eear = env->pc;
> +    }
>  
>      /* For machine-state changed between user-mode and supervisor mode,
>         we need flush TLB when we enter&exit EXCP.  */
> -- 
> 2.9.3
> 

