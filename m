Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iNHYD-00025L-Rj
	for mharc-qemu-trivial@gnu.org; Wed, 23 Oct 2019 10:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55748)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iNHYA-00024N-DD
 for qemu-trivial@nongnu.org; Wed, 23 Oct 2019 10:23:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iNHY8-0005J9-Rl
 for qemu-trivial@nongnu.org; Wed, 23 Oct 2019 10:23:46 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:36758
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iNHY5-0005Ff-31
 for qemu-trivial@nongnu.org; Wed, 23 Oct 2019 10:23:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571840619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=852MNNpWoxzU+vbzauULoBdshCgX7n7YuDCoOQFJXo8=;
 b=Crd4dzak8ZoDPT66saIO0pZ9rWk4igeUKFtW+JGEExVymLxkkffFNG4aO6Y4e/G727MZYx
 z2rvjKDasS6Z6ZdvrPZFBKgIOJa+sDdjfFb86Gg0vsDa+jNTjiKX2gYRlScEyakSYgfujD
 dUStvwrN1ZD5iZbax2uPc7zcwbbMXgI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-rI9CsMl8OG2w6m6zMy4OlQ-1; Wed, 23 Oct 2019 10:23:35 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08BFC80183D;
 Wed, 23 Oct 2019 14:23:34 +0000 (UTC)
Received: from [10.3.117.0] (ovpn-117-0.phx2.redhat.com [10.3.117.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AA311001DC0;
 Wed, 23 Oct 2019 14:23:33 +0000 (UTC)
Subject: Re: [PATCH 3/3] qemu-timer: reuse MIN macro in qemu_timeout_ns_to_ms
To: Frediano Ziglio <fziglio@redhat.com>
Cc: Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20191023122652.2999-1-fziglio@redhat.com>
 <20191023122652.2999-3-fziglio@redhat.com>
 <5f20705e-60bc-08d5-8b6e-72438afabefe@vivier.eu>
 <c2836c58-5a3c-2356-6e94-9b2341ab2194@redhat.com>
 <1860840671.8198083.1571840126307.JavaMail.zimbra@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <21fd3aa0-232c-06e8-1e20-b5c98f125468@redhat.com>
Date: Wed, 23 Oct 2019 09:23:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <1860840671.8198083.1571840126307.JavaMail.zimbra@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: rI9CsMl8OG2w6m6zMy4OlQ-1
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
X-List-Received-Date: Wed, 23 Oct 2019 14:23:48 -0000

On 10/23/19 9:15 AM, Frediano Ziglio wrote:
>>
>> On 10/23/19 8:42 AM, Laurent Vivier wrote:
>>> Le 23/10/2019 =C3=A0 14:26, Frediano Ziglio a =C3=A9crit=C2=A0:
>>>> Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
>>>> ---
>>>>    util/qemu-timer.c | 6 +-----
>>>>    1 file changed, 1 insertion(+), 5 deletions(-)
>>>>
>>>> diff --git a/util/qemu-timer.c b/util/qemu-timer.c
>>>> index d428fec567..094a20a05a 100644
>>>> --- a/util/qemu-timer.c
>>>> +++ b/util/qemu-timer.c
>>>> @@ -322,11 +322,7 @@ int qemu_timeout_ns_to_ms(int64_t ns)
>>>>        ms =3D DIV_ROUND_UP(ns, SCALE_MS);
>>>>   =20
>>>>        /* To avoid overflow problems, limit this to 2^31, i.e. approx =
25
>>>>        days */
>>>> -    if (ms > (int64_t) INT32_MAX) {
>>>> -        ms =3D INT32_MAX;
>>>> -    }
>>>> -
>>>> -    return (int) ms;
>>>> +    return (int) MIN(ms, (int64_t) INT32_MAX);
>>>>    }
>>
>> Why so many casts?  It should also work as:
>>
>> return MIN(ms, INT32_MAX);
>>
>=20
> This was former version. Laurent pointed out that MIN macro
> is using ternary operator which is expected to find the same time
> on second and third part so the cast inside the MIN macro.
> The cast before MIN was kept from previous code.

The C rules for ternary type promotion guarantee that the MIN macro=20
produces the correct type without the cast ('cond ? int64_t : int32_t'=20
produces int64_t).  I agree that the (int) cast was pre-existing, but as=20
long as we are cleaning up useless casts, we might as well clean up both.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


