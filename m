Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iNhSE-0008Af-08
	for mharc-qemu-trivial@gnu.org; Thu, 24 Oct 2019 14:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46367)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iNhS9-0007sn-4b
 for qemu-trivial@nongnu.org; Thu, 24 Oct 2019 14:03:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iNhS6-0005Ao-8n
 for qemu-trivial@nongnu.org; Thu, 24 Oct 2019 14:03:16 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51357
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iNhS6-00058S-2d
 for qemu-trivial@nongnu.org; Thu, 24 Oct 2019 14:03:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571940193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OFF5khIuDao9hL/f1BnhJNYgdnoQSJ/M6H99J1hL2VQ=;
 b=SHKhbkbkJt7Vt+Bs9DhCf+7FgxHYljdnvRLFYcgsQ0Mx/Clpq4sPQiMGiTd0SOaOoXtOqU
 6QW1wozS8oGwQbAqEZEHxQJt3Li9xZTWQZG3L0OXCyzhRiGBGkd81O5aJatrEleFbrqmC5
 J7VNnBrX5EAQIeINbxrw9FUdF4xwmVw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-OUzDT4rhNq2ZzounqvuBPg-1; Thu, 24 Oct 2019 14:03:09 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1657C1005516;
 Thu, 24 Oct 2019 18:03:08 +0000 (UTC)
Received: from [10.3.117.0] (ovpn-117-0.phx2.redhat.com [10.3.117.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED37D600C8;
 Thu, 24 Oct 2019 18:03:06 +0000 (UTC)
Subject: Re: [PATCH 3/3] qemu-timer: reuse MIN macro in qemu_timeout_ns_to_ms
To: Laurent Vivier <laurent@vivier.eu>, Frediano Ziglio <fziglio@redhat.com>, 
 Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20191023122652.2999-1-fziglio@redhat.com>
 <20191023122652.2999-3-fziglio@redhat.com>
 <ac0dbd04-c594-0904-020c-ab6384153997@vivier.eu>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <45775e9d-5d7d-74b4-8eee-1813b080c2da@redhat.com>
Date: Thu, 24 Oct 2019 13:03:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <ac0dbd04-c594-0904-020c-ab6384153997@vivier.eu>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: OUzDT4rhNq2ZzounqvuBPg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Thu, 24 Oct 2019 18:03:19 -0000

On 10/24/19 12:31 PM, Laurent Vivier wrote:
> Le 23/10/2019 =C3=A0 14:26, Frediano Ziglio a =C3=A9crit=C2=A0:
>> Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
>> ---
>>   util/qemu-timer.c | 6 +-----
>>   1 file changed, 1 insertion(+), 5 deletions(-)
>>

>>
>=20
> Applied to my trivial-patches branch.
>=20
> I've updated the patch to remove the two useless casts.
>=20
> Eric, if you want to add your R-b, I can add it to the queued patch.

I don't see it queued on https://github.com/vivier/qemu/branches yet,=20
but if removing the two casts is the only difference from the original:

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


