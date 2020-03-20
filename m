Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFLTS-0006kW-0i
	for mharc-qemu-trivial@gnu.org; Fri, 20 Mar 2020 13:30:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32945)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsuvorov@redhat.com>) id 1jFLTP-0006iU-MC
 for qemu-trivial@nongnu.org; Fri, 20 Mar 2020 13:30:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsuvorov@redhat.com>) id 1jFLTO-00047T-Nr
 for qemu-trivial@nongnu.org; Fri, 20 Mar 2020 13:30:19 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:56266)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsuvorov@redhat.com>) id 1jFLTO-00047B-Km
 for qemu-trivial@nongnu.org; Fri, 20 Mar 2020 13:30:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584725418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ykXk2E+lWMcuiOhPMluf7qmvakDaNrmcJ7I4Dqdlu7U=;
 b=CdQ6MF1UUVxvIHQLIJHc3LQ/+zsoHcEygo8e/EitRTTWsQcLN+4tDlwlYAC30ioy1BzqDX
 gUdsp2HxpJjNtio6R8N7qL217onZCdTxI2/siLNtttPUh4nXDhOUY1eviboD/Is6pvy9VO
 iKccy2RcduuSdIrstH17v8GSmwRnSuw=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-RQpa6B_CPoyhdcnOyn2D2w-1; Fri, 20 Mar 2020 13:30:15 -0400
X-MC-Unique: RQpa6B_CPoyhdcnOyn2D2w-1
Received: by mail-lj1-f197.google.com with SMTP id e8so1124900ljk.23
 for <qemu-trivial@nongnu.org>; Fri, 20 Mar 2020 10:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GOcoe0J9w1J/GQg4S1bRWkNrGCbJYRtmcESUhZ2BySI=;
 b=QhpVgPJDBCIbtLV/4nzvnB+KFtGvpOA3ru3apigUDN9fwaZxbTttPvuwVhPYOd60Uo
 8m1CCwwzcfEvnW9R9w7sEuSYUC3mhqMuPeYiDv5UN/7rnQQQVdGT/NebZX0OGUans2AF
 mKS+j/7I6TFKXFxRDZR8xMkwVIc7ekIKvqdpwjcLX1i7/zcauX0CKt4jRIOgQhgkvQ5T
 pdHnYzI+Zm/w1VERfRKS0TetTQvMo5pOq4QKTmw7tbDhCDR+M8rGvVPS7UgNlpA5F5HL
 Be6HcxwfYvAr70aJcQ966vNtcKEoHiwxcj0O30KwvJMMBkI+lkzVs8/R37ls8h8fRAPu
 Y30w==
X-Gm-Message-State: ANhLgQ15GT/ygaDezv4HAhDhZln5Ctp9Nr1sTzIq7MJmBuCKg85ZKs4e
 DX14OLJCBS3+xLMdeEFFLywR01r6Tmf+umijf5NLa9/syeCawy3ovsTJBrhGZowywIcQYfxxBWq
 8JEw2GUAKtxqQSuiEIqYXMUJce7npny3FpA==
X-Received: by 2002:a19:f008:: with SMTP id p8mr5886137lfc.217.1584725413705; 
 Fri, 20 Mar 2020 10:30:13 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvmbmm10XxnYGNsEhCnO3kX0zteatMw5OcwiFwCzctx21ktliZUKd51vUCSPoHJWyQQwcf9mbEv1rB/N83dYR0=
X-Received: by 2002:a19:f008:: with SMTP id p8mr5886120lfc.217.1584725413269; 
 Fri, 20 Mar 2020 10:30:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200318134849.237011-1-jusual@redhat.com>
 <20200320152022.GC138042@stefanha-x1.localdomain>
In-Reply-To: <20200320152022.GC138042@stefanha-x1.localdomain>
From: Julia Suvorova <jusual@redhat.com>
Date: Fri, 20 Mar 2020 18:30:02 +0100
Message-ID: <CAMDeoFX2D-c03PHcfiQ_ub4GMptjdUkUozZ53P4a-Vd_eNw86g@mail.gmail.com>
Subject: Re: [PATCH] hw/rdma/vmw/pvrdma_dev_ring: Replace strncpy with pstrcpy
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org, 
 Yuval Shaia <yuval.shaia.ml@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
X-List-Received-Date: Fri, 20 Mar 2020 17:30:20 -0000

On Fri, Mar 20, 2020 at 4:20 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Wed, Mar 18, 2020 at 02:48:49PM +0100, Julia Suvorova wrote:
> > ring->name is defined as 'char name[MAX_RING_NAME_SZ]'. Replace untrunc=
ated
> > strncpy with QEMU function.
> > This case prevented QEMU from compiling with --enable-sanitizers.
> >
> > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > ---
> >  hw/rdma/vmw/pvrdma_dev_ring.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Here is my equivalent patch
> <20200316160702.478964-3-stefanha@redhat.com> but feel free to merge
> this.

Oops, sorry, I guess I didn't search carefully enough for the solution.

> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>


