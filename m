Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rY5IR-0001OR-NX
	for mharc-qemu-trivial@gnu.org; Thu, 08 Feb 2024 09:22:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1rY5IC-0001MC-40
 for qemu-trivial@nongnu.org; Thu, 08 Feb 2024 09:22:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1rY5IA-0005sX-2d
 for qemu-trivial@nongnu.org; Thu, 08 Feb 2024 09:22:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707402136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gAla9J4PVDqycTuoekfcB6U5If2dSmAvYvLz7BgmNoQ=;
 b=P7atb5quwq73FaFvnahAlgmm86K1YeYFIHIbK4S5tIlNqXSilec8P3h3oBHxongOa7QSty
 NrJ7MVQgh48f0KvcXjIo02G3iCc4o4Mm3UQX4ecKNvgpN/FPOZa1on8suSBs7OFPsXltKy
 rt36uPmCSJtyUf/CR+7WnVxHW/IFdco=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-dlziQXbcOvCOicqYfWWaBw-1; Thu, 08 Feb 2024 09:22:14 -0500
X-MC-Unique: dlziQXbcOvCOicqYfWWaBw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1069185A780;
 Thu,  8 Feb 2024 14:22:13 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.248])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CEAA1C14B0B;
 Thu,  8 Feb 2024 14:22:13 +0000 (UTC)
Date: Thu, 8 Feb 2024 15:22:12 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [PATCH] iothread: Simplify expression in qemu_in_iothread()
Message-ID: <ZcTjlNeibKUnIDcL@redhat.com>
References: <20240208101657.15962-1-kwolf@redhat.com>
 <ffe07fee-0cda-4517-a64b-031cb922d806@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ffe07fee-0cda-4517-a64b-031cb922d806@linaro.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.213,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Feb 2024 14:22:25 -0000

Am 08.02.2024 um 11:48 hat Philippe Mathieu-Daudé geschrieben:
> On 8/2/24 11:16, Kevin Wolf wrote:
> > 'a == b ? false : true' is a rather convoluted way of writing 'a != b'.
> > Use the more obvious way to write it.
> > 
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >   iothread.c | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/iothread.c b/iothread.c
> > index 6c1fc8c856..e1e9e04736 100644
> > --- a/iothread.c
> > +++ b/iothread.c
> > @@ -404,6 +404,5 @@ IOThread *iothread_by_id(const char *id)
> >   bool qemu_in_iothread(void)
> >   {
> > -    return qemu_get_current_aio_context() == qemu_get_aio_context() ?
> > -                    false : true;
> > +    return qemu_get_current_aio_context() != qemu_get_aio_context();
> >   }
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> BTW using the same pattern:
> 
> -- >8 --
> diff --git a/hw/nvram/xlnx-zynqmp-efuse.c b/hw/nvram/xlnx-zynqmp-efuse.c
> index ec98456e5d..d074762a25 100644
> --- a/hw/nvram/xlnx-zynqmp-efuse.c
> +++ b/hw/nvram/xlnx-zynqmp-efuse.c
> @@ -582,7 +582,7 @@ static uint64_t
> zynqmp_efuse_cache_load_prew(RegisterInfo *reg,
> 
>  static uint64_t zynqmp_efuse_wr_lock_prew(RegisterInfo *reg, uint64_t val)
>  {
> -    return val == 0xDF0D ? 0 : 1;
> +    return val != 0xDF0D;
>  }

Maybe. I would have to know that device to tell if this is really meant
as boolean. Or maybe it should be written 0x0 and 0x1 to signify that
it's a register value or something.

> diff --git a/tests/tcg/aarch64/sysregs.c b/tests/tcg/aarch64/sysregs.c
> index 301e61d0dd..bdd73bd181 100644
> --- a/tests/tcg/aarch64/sysregs.c
> +++ b/tests/tcg/aarch64/sysregs.c
> @@ -183,5 +183,5 @@ int main(void)
>          return 1;
>      }
> 
> -    return should_fail_count == 6 ? 0 : 1;
> +    return should_fail_count != 6;
>  }

This one isn't unclear to me, though. This is EXIT_SUCCESS and
EXIT_FAILURE, just open-coded. I think making your change would make it
only more confusing.

Kevin


