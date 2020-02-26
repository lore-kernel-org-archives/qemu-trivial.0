Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6u4Y-00023N-8s
	for mharc-qemu-trivial@gnu.org; Wed, 26 Feb 2020 05:37:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58508)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1j6u4W-00021I-AI
 for qemu-trivial@nongnu.org; Wed, 26 Feb 2020 05:37:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1j6u4V-0005W2-AA
 for qemu-trivial@nongnu.org; Wed, 26 Feb 2020 05:37:44 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55427
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1j6u4V-0005UA-5k
 for qemu-trivial@nongnu.org; Wed, 26 Feb 2020 05:37:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582713462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GSrt+wsCwr+Z1oSW3pPS8cnoNQwJTnGW1E41pZcz65M=;
 b=aM3sMMuSgdjT0fprQ4dz+sCBgcOc3Jv9OHvpr8FH39SKFSKk9YMeybcXLnTmB0gY3XALmY
 jzFLxcc2sum8LloMJzWTqI8O4h1fBd4gyF2ICESOEqmZatRaEZOT5i6XBP6QWMW+6EtuBN
 Wu092H24+mgc6uNZll6DRNIOtWRDiWY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-p9-0q3nHOR27i7LoFdgkmA-1; Wed, 26 Feb 2020 05:37:40 -0500
X-MC-Unique: p9-0q3nHOR27i7LoFdgkmA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58235800D53;
 Wed, 26 Feb 2020 10:37:39 +0000 (UTC)
Received: from linux.fritz.box (ovpn-117-170.ams2.redhat.com [10.36.117.170])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A7BF78681F;
 Wed, 26 Feb 2020 10:37:37 +0000 (UTC)
Date: Wed, 26 Feb 2020 11:37:36 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: kuhn.chenqun@huawei.com
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 Euler Robot <euler.robot@huawei.com>, Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v2 03/13] block/file-posix: Remove redundant statement in
 raw_handle_perm_lock()
Message-ID: <20200226103736.GD6096@linux.fritz.box>
References: <20200226084647.20636-1-kuhn.chenqun@huawei.com>
 <20200226084647.20636-4-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200226084647.20636-4-kuhn.chenqun@huawei.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-List-Received-Date: Wed, 26 Feb 2020 10:37:45 -0000

Am 26.02.2020 um 09:46 hat kuhn.chenqun@huawei.com geschrieben:
> From: Chen Qun <kuhn.chenqun@huawei.com>
>=20
> Clang static code analyzer show warning:
>   block/file-posix.c:891:9: warning: Value stored to 'op' is never read
>         op =3D RAW_PL_ABORT;
>         ^    ~~~~~~~~~~~~
>=20
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


