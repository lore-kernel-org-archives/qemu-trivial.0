Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1if7PN-0002Ls-0G
	for mharc-qemu-trivial@gnu.org; Wed, 11 Dec 2019 14:12:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34778)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1if7PI-0002Hz-MC
 for qemu-trivial@nongnu.org; Wed, 11 Dec 2019 14:12:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1if7PG-0004vg-MV
 for qemu-trivial@nongnu.org; Wed, 11 Dec 2019 14:12:20 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:56609
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1if7PG-0004v1-JM
 for qemu-trivial@nongnu.org; Wed, 11 Dec 2019 14:12:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576091538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=t+ARCQSXAZSnVEnpehiQ6sG6BGopBsUfut3mJxLj1yc=;
 b=d3TUDYWCxgdSZbSSMjkry+56jAeS3pBvasze0/jtRX5wfQvzyRAKtcaDKM2yr81etRotxB
 322rjMkyCXWModYWdmjQEZ+aCHzEq/pUGy1ZubCIlDQk9xd3Dms6l9rpSHoBnExqiJAlpf
 QPSwRoTgj7ThMgqf1SlEFV6XVnv1cHM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-IB3UE161OEuWGuetHepJzQ-1; Wed, 11 Dec 2019 14:12:15 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 209AB94E7F;
 Wed, 11 Dec 2019 19:12:14 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-85.ams2.redhat.com [10.36.116.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4394D6062B;
 Wed, 11 Dec 2019 19:12:10 +0000 (UTC)
Subject: Re: [PATCH] tests: fix test-qga on macosx
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>
References: <1576074210-52834-8-git-send-email-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <6738c39d-bab8-fcc8-7508-a9ce90f68d7d@redhat.com>
Date: Wed, 11 Dec 2019 20:12:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1576074210-52834-8-git-send-email-pbonzini@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: IB3UE161OEuWGuetHepJzQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Wed, 11 Dec 2019 19:12:24 -0000

On 11/12/2019 15.23, Paolo Bonzini wrote:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>=20
> Fix Unix socket connection & skip commands that are not implemented.
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  tests/test-qga.c | 25 ++++++++++++++++++-------
>  1 file changed, 18 insertions(+), 7 deletions(-)

Don't you also want to enable it in the tests/Makefile.include ?
It's currently fenced with CONFIG_LINUX...

 Thomas


