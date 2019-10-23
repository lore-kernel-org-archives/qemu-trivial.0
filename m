Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iNHyt-0000Hg-GD
	for mharc-qemu-trivial@gnu.org; Wed, 23 Oct 2019 10:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60923)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iNHyp-0000Gk-QV
 for qemu-trivial@nongnu.org; Wed, 23 Oct 2019 10:51:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iNHyn-0003NO-P9
 for qemu-trivial@nongnu.org; Wed, 23 Oct 2019 10:51:19 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:53837
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iNHyn-0003Lu-Lt
 for qemu-trivial@nongnu.org; Wed, 23 Oct 2019 10:51:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571842275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pCMoXQ7OJjpHyk+0rDRRwwMxrzJAWRebvQFF9/clXKk=;
 b=B//re6iNN3SsfLNqzuK9sjy9JIEfwLAww0Qds8i5JuktmdJwD3/6AjaxzkpkPi7Ezpjv1R
 QeW3yWkL+2iHyvu+UVDoYCzVoZxI5jDGSc/RLsFzLcVoOWWCZeec8UeXux16t2943HwUA6
 IcxXjzDnnX+bxLKq9uGxL/D/xyYNs7Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-_3NY9hfeODO19g51Locnhw-1; Wed, 23 Oct 2019 10:51:12 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC7FF800D57;
 Wed, 23 Oct 2019 14:51:10 +0000 (UTC)
Received: from [10.3.117.0] (ovpn-117-0.phx2.redhat.com [10.3.117.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 54F8C60852;
 Wed, 23 Oct 2019 14:51:10 +0000 (UTC)
Subject: Re: [PATCH 3/3] qemu-timer: reuse MIN macro in qemu_timeout_ns_to_ms
To: Laurent Vivier <laurent@vivier.eu>, Frediano Ziglio <fziglio@redhat.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
References: <20191023122652.2999-1-fziglio@redhat.com>
 <20191023122652.2999-3-fziglio@redhat.com>
 <5f20705e-60bc-08d5-8b6e-72438afabefe@vivier.eu>
 <c2836c58-5a3c-2356-6e94-9b2341ab2194@redhat.com>
 <1860840671.8198083.1571840126307.JavaMail.zimbra@redhat.com>
 <21fd3aa0-232c-06e8-1e20-b5c98f125468@redhat.com>
 <8b52c02c-1e26-4ac7-3f79-db4459f9c178@vivier.eu>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <173d8641-ff6b-adc4-b0d4-f4dd5909f87c@redhat.com>
Date: Wed, 23 Oct 2019 09:51:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <8b52c02c-1e26-4ac7-3f79-db4459f9c178@vivier.eu>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: _3NY9hfeODO19g51Locnhw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Wed, 23 Oct 2019 14:51:21 -0000

On 10/23/19 9:45 AM, Laurent Vivier wrote:

>> The C rules for ternary type promotion guarantee that the MIN macro
>> produces the correct type without the cast ('cond ? int64_t : int32_t'
>> produces int64_t).
>=20
> gdb seems to disagree with that:
>=20
> (gdb) whatis l
> type =3D long long
> (gdb) whatis i
> type =3D int
> (gdb) whatis 1 ? l : i
> type =3D long long
> (gdb) whatis 0 ? l : i
> type =3D int

It looks like you've found a gdb bug.

C99 6.5.15 p5 states:
"If both the second and third operands have arithmetic type, the result=20
type that would be determined by the usual arithmetic conversions, were=20
they applied to those two operands, is the type of the result."

and the usual arithmetic conversion of 'long long OP int' is 'long=20
long', per 6.3.1.8.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


