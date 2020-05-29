Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jeluB-0002wQ-QF
	for mharc-qemu-trivial@gnu.org; Fri, 29 May 2020 16:47:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1jehmA-0002ed-2I
 for qemu-trivial@nongnu.org; Fri, 29 May 2020 12:22:30 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:40328
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1jehm6-0005OX-LF
 for qemu-trivial@nongnu.org; Fri, 29 May 2020 12:22:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590769343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6LiA7IcTgcwXaLS54JAhevAXGEaouaGh4rapnm2otjE=;
 b=jKoN1AvM5W4CPn3I7Ks0Fjgmc07IK+wSXa1rD5MKBw80JbkwomCD+mrKiuqb+vOktCtXMK
 bmdaOxAuiA5SxZpKk2EiXLJTMBP7JZfXz3BBj7zwJcqR2GayjRSvym+Gv59jGh3cSvv9El
 cQQnbwNZTbxKUCqM508XWHqyMnXG2OE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-IhMZgKo8P2CG_A5usDDPnA-1; Fri, 29 May 2020 12:22:22 -0400
X-MC-Unique: IhMZgKo8P2CG_A5usDDPnA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0F3D1902EA0;
 Fri, 29 May 2020 16:22:20 +0000 (UTC)
Received: from ptitpuce (ovpn-113-93.ams2.redhat.com [10.36.113.93])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EB555D9EF;
 Fri, 29 May 2020 16:22:03 +0000 (UTC)
References: <20200526185132.1652355-1-eblake@redhat.com>
User-agent: mu4e 1.3.9; emacs 26.2
From: Christophe de Dinechin <dinechin@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-trivial@nongnu.org, Stafford Horne <shorne@gmail.com>,
 Jia Liu <proljc@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] or1k: Fix compilation hiccup
In-reply-to: <20200526185132.1652355-1-eblake@redhat.com>
Date: Fri, 29 May 2020 18:21:54 +0200
Message-ID: <m1d06msod9.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=dinechin@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/29 03:05:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 29 May 2020 16:47:03 -0400
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 29 May 2020 16:22:30 -0000


On 2020-05-26 at 20:51 CEST, Eric Blake wrote...
> On my Fedora 32 machine, gcc 10.1.1 at -O2 (the default for a bare
> './configure') has a false-positive complaint:
>
>   CC      or1k-softmmu/hw/openrisc/openrisc_sim.o
> /home/eblake/qemu/hw/openrisc/openrisc_sim.c: In function =E2=80=98openri=
sc_sim_init=E2=80=99:
> /home/eblake/qemu/hw/openrisc/openrisc_sim.c:87:42: error: =E2=80=98cpu_i=
rqs[0]=E2=80=99 may be used uninitialized in this function [-Werror=3Dmaybe=
-uninitialized]
>    87 |         sysbus_connect_irq(s, i, cpu_irqs[i][irq_pin]);
>       |                                  ~~~~~~~~^~~
>
> Initializing both pointers of cpu_irqs[] to NULL is sufficient to shut
> up the compiler, even though they are definitely assigned in
> openrisc_sim_init() prior to the inlined call to
> openrisc_sim_ompic_init() containing the line in question.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  hw/openrisc/openrisc_sim.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
> index d08ce6181199..95011a8015b4 100644
> --- a/hw/openrisc/openrisc_sim.c
> +++ b/hw/openrisc/openrisc_sim.c
> @@ -129,7 +129,7 @@ static void openrisc_sim_init(MachineState *machine)
>      const char *kernel_filename =3D machine->kernel_filename;
>      OpenRISCCPU *cpu =3D NULL;
>      MemoryRegion *ram;
> -    qemu_irq *cpu_irqs[2];
> +    qemu_irq *cpu_irqs[2] =3D {};

Why is the value [2] correct here? The loop that initializes loops over
machine->smp.cpus. Is it always less than 2 on this machine?


>      qemu_irq serial_irq;
>      int n;
>      unsigned int smp_cpus =3D machine->smp.cpus;


--
Cheers,
Christophe de Dinechin (IRC c3d)


