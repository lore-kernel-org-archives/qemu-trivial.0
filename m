Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRX2y-0005nP-Vs
	for mharc-qemu-trivial@gnu.org; Tue, 27 Nov 2018 01:40:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36905)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gRX2w-0005m6-R9
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 01:40:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gRX2w-0005OT-AW
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 01:40:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33634)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1gRX2s-0005J8-9M; Tue, 27 Nov 2018 01:40:30 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F37BDB4CA;
	Tue, 27 Nov 2018 06:40:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-104.ams2.redhat.com
	[10.36.116.104])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A93EF1062220;
	Tue, 27 Nov 2018 06:40:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 3F0461132928; Tue, 27 Nov 2018 07:40:23 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Li Qiang <liq3ea@gmail.com>
Cc: pbonzini@redhat.com, rth@twiddle.net, ehabkost@redhat.com,
	laurent@vivier.eu, alex.bennee@linaro.org, philmd@redhat.com,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <1543295605-2709-1-git-send-email-liq3ea@gmail.com>
Date: Tue, 27 Nov 2018 07:40:23 +0100
In-Reply-To: <1543295605-2709-1-git-send-email-liq3ea@gmail.com> (Li Qiang's
	message of "Mon, 26 Nov 2018 21:13:25 -0800")
Message-ID: <878t1ff2g8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 27 Nov 2018 06:40:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target: hax: fix errors in
 comment
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
X-List-Received-Date: Tue, 27 Nov 2018 06:40:35 -0000

Li Qiang <liq3ea@gmail.com> writes:

> Cc: qemu-trivial@nongnu.org
>
> Signed-off-by: Li Qiang <liq3ea@gmail.com>
> ---
>  target/i386/hax-all.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/i386/hax-all.c b/target/i386/hax-all.c
> index 502ce6f0af..70213ebcf5 100644
> --- a/target/i386/hax-all.c
> +++ b/target/i386/hax-all.c
> @@ -205,7 +205,7 @@ int hax_vcpu_destroy(CPUState *cpu)
>      }
>  
>      /*
> -     * 1. The hax_tunnel is also destroied when vcpu destroy
> +     * 1. The hax_tunnel is also destroyed when vcpu is destroy

when vcpu is destroyed

>       * 2. close fd will cause hax module vcpu be cleaned
>       */
>      hax_close_fd(vcpu->fd);

