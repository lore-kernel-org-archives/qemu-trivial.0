Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k90yY-0004pM-NJ
	for mharc-qemu-trivial@gnu.org; Fri, 21 Aug 2020 02:56:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k90yX-0004p9-Ak
 for qemu-trivial@nongnu.org; Fri, 21 Aug 2020 02:56:33 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20096
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k90yV-0002zq-48
 for qemu-trivial@nongnu.org; Fri, 21 Aug 2020 02:56:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597992990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eplYnJPmrBJeua4GuNUO+w+oSFMM2xUFoSfOU+C1uJY=;
 b=gcGJy2FP3LL1lG6hF3ahW5WIK0NlynfAvIcHh45Gv2rWIjlUZ01k7fAe7YQ9Uz5RIb+1uX
 PNydN4zP5EmhFmd26080qdik5fhEgUFH/eP+nRJ3tUHdUGfTWD8gKk3QTd660Q5Dbj38Ur
 DJjOQATPCcm1/c8W6zgzNis3MFD9Ivk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-uzojvARaN7iF9EjTX1FXkA-1; Fri, 21 Aug 2020 02:56:26 -0400
X-MC-Unique: uzojvARaN7iF9EjTX1FXkA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFC24107464D;
 Fri, 21 Aug 2020 06:56:25 +0000 (UTC)
Received: from gondolin (ovpn-113-4.ams2.redhat.com [10.36.113.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA15119C78;
 Fri, 21 Aug 2020 06:56:21 +0000 (UTC)
Date: Fri, 21 Aug 2020 08:56:19 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Stefan Hajnoczi
 <stefanha@redhat.com>
Subject: Re: [PATCH] util/vfio-helpers: Unify trace-events size format
Message-ID: <20200821085619.030d496f.cohuck@redhat.com>
In-Reply-To: <20200820171006.1140228-1-philmd@redhat.com>
References: <20200820171006.1140228-1-philmd@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=cohuck@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 23:41:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Fri, 21 Aug 2020 06:56:33 -0000

On Thu, 20 Aug 2020 19:10:06 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Some 'qemu_vfio_*' trace events sizes are displayed using
> decimal notation, other using hexadecimal notation:
>=20
>   qemu_vfio_ram_block_added s 0xaaaaf2448d90 host 0xffff5bc00000 size 0x4=
000000
>   qemu_vfio_dma_map s 0xaaaaf2448d90 host 0xffff5bc00000 size 67108864 te=
mporary 0 iova (nil)
>   qemu_vfio_find_mapping s 0xaaaaf2448d90 host 0xffff5bc00000
>   qemu_vfio_new_mapping s 0xaaaaf2448d90 host 0xffff5bc00000 size 6710886=
4 index 4 iova 0x114000
>   qemu_vfio_do_mapping s 0xaaaaf2448d90 host 0xffff5bc00000 size 67108864=
 iova 0x114000
>=20
> As it is hard to follow, unify using hexadecimal for all sizes:
>=20
>   qemu_vfio_ram_block_added s 0xaaaaf1c60d90 host 0xffff2bc00000 size 0x4=
000000
>   qemu_vfio_dma_map s 0xaaaaf1c60d90 host 0xffff2bc00000 size 0x4000000 t=
emporary 0 iova (nil)
>   qemu_vfio_find_mapping s 0xaaaaf1c60d90 host 0xffff2bc00000
>   qemu_vfio_new_mapping s 0xaaaaf1c60d90 host 0xffff2bc00000 size 0x40000=
00 index 4 iova 0x114000
>   qemu_vfio_do_mapping s 0xaaaaf1c60d90 host 0xffff2bc00000 size 0x400000=
0 iova 0x114000
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  util/trace-events | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


