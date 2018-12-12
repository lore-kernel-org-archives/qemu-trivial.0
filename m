Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXBrw-0000b9-L0
	for mharc-qemu-trivial@gnu.org; Wed, 12 Dec 2018 16:16:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45482)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <r.bolshakov@yadro.com>) id 1gXBrq-0000YM-Be
	for qemu-trivial@nongnu.org; Wed, 12 Dec 2018 16:16:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <r.bolshakov@yadro.com>) id 1gXBro-0003l2-7U
	for qemu-trivial@nongnu.org; Wed, 12 Dec 2018 16:16:30 -0500
Received: from mta-01.yadro.com ([89.207.88.251]:48844)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <r.bolshakov@yadro.com>)
	id 1gXBrf-0003gh-Mg; Wed, 12 Dec 2018 16:16:19 -0500
Received: from localhost (unknown [127.0.0.1])
	by mta-01.yadro.com (Postfix) with ESMTP id 93BA541950;
	Wed, 12 Dec 2018 21:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
	user-agent:in-reply-to:content-disposition:content-type
	:content-type:mime-version:references:message-id:subject:subject
	:from:from:date:date:received:received:received; s=mta-01; t=
	1544649377; x=1546463778; bh=N8c8KSw7+vUqHhEWyHPwwaCrWM2MfNDgyWT
	Cpj6wBYA=; b=ImRwH05is1m5MwVhgLCMCkvHAyRDV5ROZAPZaT8nb7fDtU36Hsr
	6AO4WuCt4+jvJ3cBvyF6BSUltepSuSkxXKkRB9RZtDquAYKJxHIRvW+yEfYBh1mz
	QwM1oUU44bia7KkE2lJ1pjaikVFPY/GVAZDnhBVL+vsv3bz56X+B/CIY=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
	by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FbB3xtOOhGjE; Thu, 13 Dec 2018 00:16:17 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
	[172.17.10.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Postfix) with ESMTPS id B1BFC41943;
	Thu, 13 Dec 2018 00:16:17 +0300 (MSK)
Received: from localhost (172.17.128.60) by T-EXCH-02.corp.yadro.com
	(172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32;
	Thu, 13 Dec 2018 00:16:17 +0300
Date: Thu, 13 Dec 2018 00:16:46 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, Richard
	Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20181212211646.vem27l5pe6pzujd4@SPB-NB-133.local>
References: <20181203100415.53027-1-r.bolshakov@yadro.com>
	<20181203100415.53027-2-r.bolshakov@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20181203100415.53027-2-r.bolshakov@yadro.com>
User-Agent: NeoMutt/20180716
X-Originating-IP: [172.17.128.60]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
	T-EXCH-02.corp.yadro.com (172.17.10.102)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 89.207.88.251
Subject: Re: [Qemu-trivial] [PATCH for-3.1 2/2] i386: hvf: drop debug printf
 in decode_sldtgroup
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
X-List-Received-Date: Wed, 12 Dec 2018 21:16:35 -0000

On Mon, Dec 03, 2018 at 01:04:15PM +0300, Roman Bolshakov wrote:
> It's going to clutter QEMU logs if 0x0f00 is trapped.
> 
> Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> ---
>  target/i386/hvf/x86_decode.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/target/i386/hvf/x86_decode.c b/target/i386/hvf/x86_decode.c
> index d125a6ef83..5f513c5563 100644
> --- a/target/i386/hvf/x86_decode.c
> +++ b/target/i386/hvf/x86_decode.c
> @@ -525,8 +525,6 @@ static void decode_sldtgroup(CPUX86State *env, struct x86_decode *decode)
>          X86_DECODE_CMD_INVL
>      };
>      decode->cmd = group[decode->modrm.reg];
> -    printf("%llx: decode_sldtgroup: %d\n", env->hvf_emul->fetch_rip,
> -            decode->modrm.reg);
>  }
>  
>  static void decode_lidtgroup(CPUX86State *env, struct x86_decode *decode)
> -- 
> 2.17.2 (Apple Git-113)
> 

Could you please apply to trivial queue?

Thank you,
Roman

