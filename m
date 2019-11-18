Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iWoRb-0005Qm-RS
	for mharc-qemu-trivial@gnu.org; Mon, 18 Nov 2019 16:20:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36532)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iWoRV-0005Gc-Kx
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 16:20:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iWoRS-0000nf-3o
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 16:20:17 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:23395
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iWoRS-0000nP-0T
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 16:20:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574112013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XEQc9GGzVfCgyalPiZuLfcDhEacdHWuMQLAmd9twLL0=;
 b=XDWRway6gs62PB7VbldBxVS9bMrVDPkIBo72CIxovzOr8Rmz3DpulbKDX4npUDX/BvbfAY
 vFvxphTZllUauOoP57NINp93JKYLAfrOQtkZ/UP+ed5YrwynEPM9+CbNYP3jLgpeBzdqU5
 DuKgFqB80AfhSYnEPdiWwjGyHfD6P0Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-16rw_HdCPp2DkY3U-Vr-DA-1; Mon, 18 Nov 2019 16:20:09 -0500
Received: by mail-wr1-f70.google.com with SMTP id x8so7322651wrr.13
 for <qemu-trivial@nongnu.org>; Mon, 18 Nov 2019 13:20:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UE6EDNxk6yJJwC1ODVz8xYg0z0mT9tmWkRSkmchqceI=;
 b=tC4tj2gZK4KQYGE3Unj4GMgpRzFUiHOaL4+r9hDFQaGtMSUJI7Zoxq48ngYbluJNUS
 Xdy56TQO8rWbHZ9/I01Mc4UOr3nq+0ZTjI4yyP66x57f1NL6EYWv1qUdoB0AuFcb8imo
 pNl+FV0KA4FdvV+3my2pZ41LzigTsnRrvf0Yj51UIkxgkPw/WZ0nzLPk/ArG9LjdACHI
 +G0AMOHvTL6AhHmQfipbrupwEeT5Kn36kEHKWHNmB47O5cO1O1uIFPdPW3dnGIYcuYGj
 w1V+Ux7i0C5vZMbWe6dsFPs9t2Ppvb561ix6aRamL4GKx557eX3PfIxNj+LhQUnshomO
 SpoQ==
X-Gm-Message-State: APjAAAWBH6BNYU5pInNWKxEz+VTN3XRpzZHLvB/UtY0l2SKuNKlqiPHh
 hUTye5Y5QpiDIeH+dMnf5NHrGMLzNPXDH4NKZIzVJ6+kWYoz6V0Bwv1mIcah17Z2YqeeSDctLFL
 fVNAWIwj2j8UncNWhSg==
X-Received: by 2002:a5d:558e:: with SMTP id i14mr32392312wrv.140.1574112007989; 
 Mon, 18 Nov 2019 13:20:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqwcXhU9edVPeNF/1OGXCQZgO02XAnD+EBjs31Ku5IKPG7GjUemOTZtDBiR6qhu3IDqtZXFjmg==
X-Received: by 2002:a5d:558e:: with SMTP id i14mr32392291wrv.140.1574112007809; 
 Mon, 18 Nov 2019 13:20:07 -0800 (PST)
Received: from [192.168.1.35] (131.red-88-21-102.staticip.rima-tde.net.
 [88.21.102.131])
 by smtp.gmail.com with ESMTPSA id c4sm24623432wrp.86.2019.11.18.13.20.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Nov 2019 13:20:07 -0800 (PST)
Subject: Re: [PATCH-for-4.2 v3 1/3] hw/block/pflash: Remove dynamic field
 width from trace events
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org, Max Reitz
 <mreitz@redhat.com>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20191118210458.11959-1-philmd@redhat.com>
 <20191118210458.11959-2-philmd@redhat.com>
 <833a3e22-2bbb-f646-eb9b-5c56dfeb43e6@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4a859ab8-a717-6b92-fb63-92ac6bb19fe8@redhat.com>
Date: Mon, 18 Nov 2019 22:20:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <833a3e22-2bbb-f646-eb9b-5c56dfeb43e6@redhat.com>
Content-Language: en-US
X-MC-Unique: 16rw_HdCPp2DkY3U-Vr-DA-1
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
X-List-Received-Date: Mon, 18 Nov 2019 21:20:22 -0000

On 11/18/19 10:15 PM, Eric Blake wrote:
> On 11/18/19 3:04 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>> Since not all trace backends support dynamic field width in
>> format (dtrace via stap does not), replace by a static field
>> width instead.
>>
>> We previously passed to the trace API 'width << 1' as the number
>> of hex characters to display (the dynamic field width). We don't
>> need this anymore. Instead, display the size of bytes accessed.
>>
>> Reported-by: Eric Blake <eblake@redhat.com>
>> Buglink: https://bugs.launchpad.net/qemu/+bug/1844817
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>=20
> Is it worth a Fixes: XXX calling out the commit that introduced the '*'?

Yes, good idea.

>=20
> /me goes and searches
>=20
> Fixes: e8aa2d95ea
> Fixes: c1474acd5d

Similarly the next patch (hw/mips/gt64xxx_pci.c) fixes ab6bff424f4.

> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!


