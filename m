Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jWite-0005MC-IU
	for mharc-qemu-trivial@gnu.org; Thu, 07 May 2020 11:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jWitd-0005L7-By
 for qemu-trivial@nongnu.org; Thu, 07 May 2020 11:57:13 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:20198
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jWitb-0001QO-Vc
 for qemu-trivial@nongnu.org; Thu, 07 May 2020 11:57:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588867031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=346PQ8E1QbOv6V25nMYzOV257SQXFBHA2If1FR1Wu64=;
 b=BFKvTeSAwA1coq5PhnF2GdTwS9zdd/VYlgYI98sB6iD2F6wbelxdiJ4D4Cvd9KpsWqneqt
 J7nmFx3srzckd4Me1y8KmCjqSPIAU/t8ZIzZZbtzUk0hm6n66EdUiqrqRu2/VCTH71kCId
 7CY9yNQTPjKndiNTuixIWgDaYOXv5mY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-pi89rYjPN8qo5MGpsTsoKg-1; Thu, 07 May 2020 11:57:09 -0400
X-MC-Unique: pi89rYjPN8qo5MGpsTsoKg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69F42461;
 Thu,  7 May 2020 15:57:08 +0000 (UTC)
Received: from [10.3.114.73] (ovpn-114-73.phx2.redhat.com [10.3.114.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9AFF60C47;
 Thu,  7 May 2020 15:57:07 +0000 (UTC)
Subject: Re: [PATCH 1/2] block/block-copy: Fix uninitialized variable in
 block_copy_task_entry
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial@nongnu.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
References: <20200507121129.29760-1-philmd@redhat.com>
 <20200507121129.29760-2-philmd@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <b39d671f-f399-c482-851e-c6c77cab94de@redhat.com>
Date: Thu, 7 May 2020 10:57:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200507121129.29760-2-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 00:55:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 07 May 2020 15:57:13 -0000

On 5/7/20 7:11 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> Fix when building with -Os:
>=20
>      CC      block/block-copy.o
>    block/block-copy.c: In function =E2=80=98block_copy_task_entry=E2=80=
=99:
>    block/block-copy.c:428:38: error: =E2=80=98error_is_read=E2=80=99 may =
be used uninitialized in this function [-Werror=3Dmaybe-uninitialized]
>      428 |         t->call_state->error_is_read =3D error_is_read;
>          |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
>=20

Looks like -Os triggered different inlining of block_copy_do_copy().  I=20
confirm that block_copy_do_copy does NOT initialize error_is_read except=20
when returning < 0, but similarly block_copy_task_entry() does not read=20
error_is_read except in the same setups.  So it looks like no actual bug=20
was triggered, but we can definitely aid the compiler's analysis by=20
initializing.

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>   block/block-copy.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


