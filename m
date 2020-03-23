Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jGQPY-0006Te-7v
	for mharc-qemu-trivial@gnu.org; Mon, 23 Mar 2020 12:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44190)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jGQPV-0006Qj-VC
 for qemu-trivial@nongnu.org; Mon, 23 Mar 2020 12:58:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jGQPU-0005G9-74
 for qemu-trivial@nongnu.org; Mon, 23 Mar 2020 12:58:45 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:21357)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jGQPT-0005F4-Vc
 for qemu-trivial@nongnu.org; Mon, 23 Mar 2020 12:58:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584982723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0zh/3RA5d1WqX2AO38T5+TftwgyCnqytpYntcHMRogU=;
 b=P9kjxijlM86Chl8ljkb/D3SLloRVm19FAIbc8tg1q5oIerXVNKf+9SVQBgZb7YBjBvu71Y
 SsUCJri7c5soeN5tlik1BnMS9jKRTRT6/i1JjffrZjstXCH7BXSY0zFfx5IPEOeIv7LwJk
 TL6RW24rrG7KFLmbtf9bDHsJuE7zNgM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-HLIzCtxxNhiVjDXp0y0_2w-1; Mon, 23 Mar 2020 12:58:39 -0400
X-MC-Unique: HLIzCtxxNhiVjDXp0y0_2w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BD81107ACCA;
 Mon, 23 Mar 2020 16:58:38 +0000 (UTC)
Received: from linux.fritz.box (ovpn-114-85.ams2.redhat.com [10.36.114.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78A839B92F;
 Mon, 23 Mar 2020 16:58:35 +0000 (UTC)
Date: Mon, 23 Mar 2020 17:58:34 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Chen Qun <kuhn.chenqun@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 zhang.zhanghailiang@huawei.com, Euler Robot <euler.robot@huawei.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Lieven <pl@kamp.de>,
 Max Reitz <mreitz@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v3] block/iscsi:use the flags in iscsi_open() prevent
 Clang warning
Message-ID: <20200323165834.GB8049@linux.fritz.box>
References: <20200311032927.35092-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200311032927.35092-1-kuhn.chenqun@huawei.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
X-List-Received-Date: Mon, 23 Mar 2020 16:58:47 -0000

Am 11.03.2020 um 04:29 hat Chen Qun geschrieben:
> Clang static code analyzer show warning:
>   block/iscsi.c:1920:9: warning: Value stored to 'flags' is never read
>         flags &=3D ~BDRV_O_RDWR;
>         ^        ~~~~~~~~~~~~
>=20
> In iscsi_allocmap_init() only checks BDRV_O_NOCACHE, which
> is the same in both of flags and bs->open_flags.
> We can use the flags instead bs->open_flags to prevent Clang warning.
>=20
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> Reviewed-by: Kevin Wolf <kwolf@redhat.com>

Thanks, applied to the block branch.

Kevin


