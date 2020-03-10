Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jBfq1-000515-5e
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2020 10:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54956)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jBfpy-0004zT-6W
 for qemu-trivial@nongnu.org; Tue, 10 Mar 2020 10:26:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jBfpx-0004zR-5k
 for qemu-trivial@nongnu.org; Tue, 10 Mar 2020 10:26:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21265
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jBfpx-0004xG-1c
 for qemu-trivial@nongnu.org; Tue, 10 Mar 2020 10:26:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583850384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/fUZDLqvneGWKJ8CIVbMKBmTsOXTVU5yYM1ftKRO0XA=;
 b=Be4MXLhnesfRx5EbBW4qAflo9Iw1yqJknAsuhjPxwr8PT31siLtZBerAnI7isANGfFvOvC
 Kxa3NLvnZpArj+I5juL6Lr5OXejss7f2PBlSBzLkewjhTL9vG3GdDp/MI2nZIa927Ol2PK
 hB7RHsWvHQWCa8h7Jm/VxpJwSA/h04c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-RqgAFTPTPpC-Yyz-HGakYg-1; Tue, 10 Mar 2020 10:26:20 -0400
X-MC-Unique: RqgAFTPTPpC-Yyz-HGakYg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0926B18C8C25;
 Tue, 10 Mar 2020 14:26:19 +0000 (UTC)
Received: from linux.fritz.box (unknown [10.36.118.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A9D019C6A;
 Tue, 10 Mar 2020 14:26:15 +0000 (UTC)
Date: Tue, 10 Mar 2020 15:26:14 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Chen Qun <kuhn.chenqun@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 Euler Robot <euler.robot@huawei.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Lieven <pl@kamp.de>,
 Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v3 02/12] block/iscsi:Remove redundant statement in
 iscsi_open()
Message-ID: <20200310142614.GF6926@linux.fritz.box>
References: <20200302130715.29440-1-kuhn.chenqun@huawei.com>
 <20200302130715.29440-4-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200302130715.29440-4-kuhn.chenqun@huawei.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Tue, 10 Mar 2020 14:26:27 -0000

Am 02.03.2020 um 14:07 hat Chen Qun geschrieben:
> Clang static code analyzer show warning:
>   block/iscsi.c:1920:9: warning: Value stored to 'flags' is never read
>         flags &=3D ~BDRV_O_RDWR;
>         ^        ~~~~~~~~~~~~
>=20
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
> Cc: Ronnie Sahlberg <ronniesahlberg@gmail.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Lieven <pl@kamp.de>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Max Reitz <mreitz@redhat.com>
>=20
> v1->v2:
>  Keep the 'flags' then use it(Base on Kevin's comments).

I think this patch wants a different subject line now.

> diff --git a/block/iscsi.c b/block/iscsi.c
> index 682abd8e09..50bae51700 100644
> --- a/block/iscsi.c
> +++ b/block/iscsi.c
> @@ -2002,7 +2002,7 @@ static int iscsi_open(BlockDriverState *bs, QDict *=
options, int flags,
>          iscsilun->cluster_size =3D iscsilun->bl.opt_unmap_gran *
>              iscsilun->block_size;
>          if (iscsilun->lbprz) {
> -            ret =3D iscsi_allocmap_init(iscsilun, bs->open_flags);
> +            ret =3D iscsi_allocmap_init(iscsilun, flags);
>          }
>      }

The code looks good.

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


