Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6w7n-0003JU-OL
	for mharc-qemu-trivial@gnu.org; Wed, 26 Feb 2020 07:49:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42059)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1j6w7l-0003JC-PX
 for qemu-trivial@nongnu.org; Wed, 26 Feb 2020 07:49:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1j6w7k-0001qf-CH
 for qemu-trivial@nongnu.org; Wed, 26 Feb 2020 07:49:13 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20322
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1j6w7k-0001qH-8X
 for qemu-trivial@nongnu.org; Wed, 26 Feb 2020 07:49:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582721351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bRyGkK/CrkeYoqJ1WgOBtP3V7MvLai0QK0NfAkqvHdU=;
 b=A1FNs6K1BSrq2+yCG57uIeEI93LPotLo7ObLSkldJpXiEbkPrePMEi2I8C3D00AL3wysiV
 jtH7vsIxEKCloxbCoavOxQTFtWq2AVgd9L8LSnwKSPooqg4j0KN++gKmEdpTDQMwIFlYD3
 M7FGQgF+lDrdJTzVCLS/zDlYNp40EXI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-D6PwVNRYOy2ki0BK6UFOuA-1; Wed, 26 Feb 2020 07:49:09 -0500
X-MC-Unique: D6PwVNRYOy2ki0BK6UFOuA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6881018A8C81;
 Wed, 26 Feb 2020 12:49:08 +0000 (UTC)
Received: from [10.3.116.57] (ovpn-116-57.phx2.redhat.com [10.3.116.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D7C692966;
 Wed, 26 Feb 2020 12:49:05 +0000 (UTC)
Subject: Re: [PATCH] iotests: Fix nonportable use of od --endian
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 andrey.shinkevich@virtuozzo.com, Kevin Wolf <kwolf@redhat.com>
References: <20200219144103.2919292-1-eblake@redhat.com>
 <4a50da40-5a01-e597-b136-1be62994b2a2@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <a4b352d5-e05f-885d-705e-b4b28a43518f@redhat.com>
Date: Wed, 26 Feb 2020 06:49:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <4a50da40-5a01-e597-b136-1be62994b2a2@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Wed, 26 Feb 2020 12:49:14 -0000

On 2/25/20 11:43 AM, Max Reitz wrote:
> On 19.02.20 15:41, Eric Blake wrote:
>> Tests 261 and 272 fail on RHEL 7 with coreutils 8.22, since od
>> --endian was not added until coreutils 8.23.  Fix this by manually
>> constructing the final value one byte at a time.
>>
>> Fixes: fc8ba423
>> Reported-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> ---
>>   tests/qemu-iotests/common.rc | 22 +++++++++++++++++-----
>>   1 file changed, 17 insertions(+), 5 deletions(-)
>>
>> diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
>> index 8a6366c09daf..b77ef3d22cd1 100644
>> --- a/tests/qemu-iotests/common.rc
>> +++ b/tests/qemu-iotests/common.rc
>> @@ -56,6 +56,12 @@ poke_file()
>=20
> I don=E2=80=99t know how you did it, but something in your workflow broke=
 this
> patch.  This should be -56,18 +56,30.

I'm not sure, either.  Would me sending a v2 make it easier?

>=20
> (Note that git accepts this patch without error, but it drops everything
> after the first part.  I noticed because your squash-in failed to apply.
>   I suppose I might have noticed later when reviewing, because only
> peek_file_le() was touched, but who knows.)
>=20

>=20
> With the patch format fixed, and your proposed to-be-squashed patch
> squashed in, there isn=E2=80=99t anything wrong, so:
>=20
> Reviewed-by: Max Reitz <mreitz@redhat.com>
>=20
> But if I=E2=80=99m already about to squash something in, would you allow =
me to
> rename all instances of =E2=80=9Ci=E2=80=9D to e.g. =E2=80=9Cbyte=E2=80=
=9D?

I'll do that on a v2.


--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


