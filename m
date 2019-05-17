Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hRYcA-0006V0-Fg
	for mharc-qemu-trivial@gnu.org; Fri, 17 May 2019 04:53:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hRYc8-0006Tf-FR
	for qemu-trivial@nongnu.org; Fri, 17 May 2019 04:53:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hRYc6-0004KU-F2
	for qemu-trivial@nongnu.org; Fri, 17 May 2019 04:53:16 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38821)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1hRYc4-0004Gt-FK
	for qemu-trivial@nongnu.org; Fri, 17 May 2019 04:53:12 -0400
Received: by mail-wm1-f66.google.com with SMTP id t5so4586415wmh.3
	for <qemu-trivial@nongnu.org>; Fri, 17 May 2019 01:53:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=oOd5lsW+s33mNgpgerYCMx4ubO3sCKAzqMa2TV10bNU=;
	b=hiEtC+Odc/t+p9wH+HcVi4xqkYbVFEhPBcxI3hA1ROCtkfUhdqVAfPB3MWFK+4mstL
	5Mx1J6dAZ7tNwU0IH7gkqU08k7AnRvmCtGlV6e66fUPNYNQTTBCHmKJ4RzN0Aq2aevMc
	23euJJEUa+FWA2r5wppzAkn5w0B+pttz0rhn4W3STDO27gFp+nfz+7A6ztvwnyUbaSCq
	ibcCDgr1f4J2TO9+ocXAL0iLGM62pC8FxPfCn5EIci9s5uryQrNnyBOFsoJ01o9PfNp4
	sluONGPjLom0Yn/OW+BaoZ3SIEXGDm3tZPgHfj4uYBdIZwUN/+FOrmzwgvvIF5BFtRjh
	W4jQ==
X-Gm-Message-State: APjAAAXJQJwu8HS2H3pTr5LPXbRqm8dYJAiPUxHwSsK48PQDZpgzd0mU
	Iqw20uzgDzQUlQESxpCUrNt8DA==
X-Google-Smtp-Source: APXvYqyjVqz2FfzbmCAlv/7tKNJa/P9Q0tGUzW+xTFHy7vQPGLlpX6QkqqT559R09cHQAEn2tXBHYg==
X-Received: by 2002:a1c:1d09:: with SMTP id d9mr1420480wmd.55.1558083188151;
	Fri, 17 May 2019 01:53:08 -0700 (PDT)
Received: from steredhat (host151-251-static.12-87-b.business.telecomitalia.it.
	[87.12.251.151]) by smtp.gmail.com with ESMTPSA id
	y132sm12976137wmd.35.2019.05.17.01.53.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 17 May 2019 01:53:07 -0700 (PDT)
Date: Fri, 17 May 2019 10:53:05 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Greg Kurz <groug@kaod.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Juan Quintela <quintela@redhat.com>
Message-ID: <20190517085305.l5hjm4zd5qys3grs@steredhat>
References: <155800428514.543845.17558475870097990036.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <155800428514.543845.17558475870097990036.stgit@bahia.lan>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] migration: Fix typo in
 migrate_add_blocker() error message
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
X-List-Received-Date: Fri, 17 May 2019 08:53:17 -0000

On Thu, May 16, 2019 at 12:58:05PM +0200, Greg Kurz wrote:
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  migration/migration.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 609e0df5d0c0..c15e75e0eebe 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1714,7 +1714,7 @@ int migrate_add_blocker(Error *reason, Error **errp)
>      if (only_migratable) {
>          error_propagate_prepend(errp, error_copy(reason),
>                                  "disallowing migration blocker "
> -                                "(--only_migratable) for: ");
> +                                "(--only-migratable) for: ");
>          return -EACCES;
>      }

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

