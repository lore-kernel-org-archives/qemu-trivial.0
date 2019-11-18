Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iWpX3-0003IZ-UH
	for mharc-qemu-trivial@gnu.org; Mon, 18 Nov 2019 17:30:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44837)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iWpWy-0003HL-1v
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 17:30:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iWpWw-0007c4-1q
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 17:29:59 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22022
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iWpWv-0007bM-Tv
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 17:29:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574116195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0zgYrd1RDY7yMbwX/8pum+cR7F3LacLrQiBELhZA6OY=;
 b=a/uArqz+F+NOBSGmiHvn5pNcqWuD6azK9jHFhe1I1jn4yMqjf/EN37j6ieabTDztcqUjX5
 sixnamJ4WbAYimVDL//0trbIJRMXzbDsukMUns+piSn6qw6Mfszku7gYt1yJu4+vJn3hk5
 pOf/RwajSBazA8LAnwW22ygCGNp44v4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-M9HOmM2SPBe7wpil1oYVpg-1; Mon, 18 Nov 2019 17:29:54 -0500
Received: by mail-wm1-f72.google.com with SMTP id 2so1138231wmd.3
 for <qemu-trivial@nongnu.org>; Mon, 18 Nov 2019 14:29:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zvJkwaO2rd0InAQv7m0WZmhIMtP3vXxJWq90jY36iXU=;
 b=QImvxEK0iHu/fMkg+mguZq07NdoC9F1+kevZxbGjGOz2vLDBNeRBQHHL/LeOwyqltH
 JwMMVb+u6pdVsVIWdVTB44UClUV+yk1Em9bnaW18TlOc3LWP/E59eYBPcox0zkOtvVzd
 Nxiz3DUOyZ2fdoSzduzGJydzrEEH6yXLVYi9nbbw+aZavLyol43r6LERP6EUNhC8ksNE
 vetFhBYywmOOiwqP+ZHjQSfdQNV3iMCkAACM+8WZh2+W/MBxlnmRYcv6Zi6YkI9fAwTs
 NcH1LUPoweqpgfkSk/GdwSvHHSb+QbFhKRRZmI52UToePphBWVJ+gkNt/mvgBSo8W3Zj
 RqOQ==
X-Gm-Message-State: APjAAAWiaFUg0gzB9OowwO8oSamXCnA+HL3U/iITfOQu67h8iOG5xbWt
 /wY3tLHiUjmnvKln2xzW0BSSWitCCubfHVrvtJAuhayYsTtEbr7LVrJYUn465v3bXLvX5gFcQso
 qQdez6hxZaEzHzJLgrg==
X-Received: by 2002:adf:f0c4:: with SMTP id x4mr30497880wro.217.1574116193202; 
 Mon, 18 Nov 2019 14:29:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqxv9c3H4HrbTHwa8NiCvBiAo/ZvHo/HkJVQI2Z9P78wyZiutj2x7zs+AP6SIEGPZfDBpMiP+w==
X-Received: by 2002:adf:f0c4:: with SMTP id x4mr30497857wro.217.1574116192939; 
 Mon, 18 Nov 2019 14:29:52 -0800 (PST)
Received: from [192.168.1.35] (131.red-88-21-102.staticip.rima-tde.net.
 [88.21.102.131])
 by smtp.gmail.com with ESMTPSA id k1sm25206184wrp.29.2019.11.18.14.29.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Nov 2019 14:29:52 -0800 (PST)
Subject: Re: [PATCH-for-4.2 v4 0/2] hw: Remove dynamic field width from trace
 events
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, qemu-trivial@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20191118222746.31467-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7b8db299-0d00-d8d2-8612-7f7beccb84bb@redhat.com>
Date: Mon, 18 Nov 2019 23:29:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191118222746.31467-1-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: M9HOmM2SPBe7wpil1oYVpg-1
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
X-List-Received-Date: Mon, 18 Nov 2019 22:30:02 -0000

This is material for 4.2-rc2.

On 11/18/19 11:27 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> This series fixes LP#1844817 [2].
>=20
> (Eric noted in [1] the dtrace via stap backend can not support
> the dynamic '*' width format.)
>=20
> If they are trivial/block/tracing pull in preparation, this
> series will be happy to be taken, else it will go via mips-next.
>=20
> Thanks,
>=20
> Phil.
>=20
> [1] https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg04720.html
> [2] https://bugs.launchpad.net/qemu/+bug/1844817


