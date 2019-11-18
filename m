Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iWmak-0006V9-Ex
	for mharc-qemu-trivial@gnu.org; Mon, 18 Nov 2019 14:21:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45700)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iWmai-0006Rl-24
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 14:21:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iWmag-0003Mf-UW
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 14:21:39 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25581
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iWmag-0003MM-Qb
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 14:21:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574104898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IkFQbEAEYaOD0VoNOb7txWkiFxGfNdrovrkqrT1jUIE=;
 b=EBznyDKUKCiCwQOnHa79lFk+f727tn6QNe+sc3Z604MzT64hkjFbc1jc3lDrr/dxYTYXtu
 YQ6bogMuBc+lS3MJzRAf5ana1ThvIHlaJ5NWWSlhZphEEzwKrjUSIfF6CSjmnEpfXuwxdZ
 W3h4kFgHzsVPIeUX1uHpEIxzOgykEdo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-4TZ1eQJ2NXmXreLI8KLLfg-1; Mon, 18 Nov 2019 14:21:35 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B69C7107ACE3;
 Mon, 18 Nov 2019 19:21:33 +0000 (UTC)
Received: from [10.3.116.221] (ovpn-116-221.phx2.redhat.com [10.3.116.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E38E260562;
 Mon, 18 Nov 2019 19:21:27 +0000 (UTC)
Subject: Re: [PATCH v2 1/3] hw/block/pflash: Remove dynamic field width from
 trace events
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Max Reitz <mreitz@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-trivial@nongnu.org
References: <20191108144042.30245-1-philmd@redhat.com>
 <20191108144042.30245-2-philmd@redhat.com>
 <9e7990b7-87ed-84d4-5256-8397bc25a1f4@redhat.com>
 <dd59a9d2-d5c8-b054-191b-bbbfd9d7b7b1@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <159b1679-72cf-bb0d-ca2f-0f626adebaf3@redhat.com>
Date: Mon, 18 Nov 2019 13:21:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <dd59a9d2-d5c8-b054-191b-bbbfd9d7b7b1@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 4TZ1eQJ2NXmXreLI8KLLfg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
X-List-Received-Date: Mon, 18 Nov 2019 19:21:41 -0000

On 11/14/19 3:26 PM, Philippe Mathieu-Daud=C3=A9 wrote:

>>> -=C2=A0=C2=A0=C2=A0 trace_pflash_data_read(offset, width << 1, ret);
>>> +=C2=A0=C2=A0=C2=A0 trace_pflash_data_read(offset, width << 3, ret);
>>
>> Umm, why is width changing?=C2=A0 That's not mentioned in the commit mes=
sage.
>=20
> Previously it was used to set the format width: [1, 2, 4] -> [2, 4, 8].
>=20
> We usually log the width in byte (accessed at memory location) or bits=20
> (used by the bus). When using this device I'm custom to think in bus=20
> access width.
>=20
> Regardless whichever format we prefer, a change is needed.
>=20

>=20
> Do you prefer using a "-bit" suffix? As
>=20
> "offset:0x%04"PRIx64" width:%d-bit value:0x%04x cmd:0x%02x wcycle:%u"
>=20
> I can also simply remove this information. Ideally I'd revert this patch=
=20
> once the we get this format parsable by the SystemTap backend.

Reporting either 'width:8-bit'/'width:16-bit' (explicit bits) or=20
'width:1'/'width:2' (implying byte) is fine by me.  Showing a bus width=20
in bytes adequately explains why you are using <<3 (aka converting bits=20
to bytes), and how it compares to the previous <<1 (converting bits to=20
number of hex characters).  But whichever you pick (tracing bit width=20
vs. byte width, and how it differs from previous usage of width as=20
output-character count), documenting it in the commit message will make=20
life easier to understand the change.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


