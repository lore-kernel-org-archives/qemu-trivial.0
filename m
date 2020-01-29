Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iwvbB-0007y8-1K
	for mharc-qemu-trivial@gnu.org; Wed, 29 Jan 2020 17:14:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46131)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iwvb8-0007xf-Pq
 for qemu-trivial@nongnu.org; Wed, 29 Jan 2020 17:14:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iwvb6-0004Pk-Sc
 for qemu-trivial@nongnu.org; Wed, 29 Jan 2020 17:14:09 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:37423
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iwvb6-0004OL-JA
 for qemu-trivial@nongnu.org; Wed, 29 Jan 2020 17:14:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580336047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Orkb16fzFt+j8LRSI2l+x3fXuu8vaiTa5Sl14qGMEAU=;
 b=FqFKAphbCTgwwUY6XXIYSP75N2BAOiXS0cE4gnv9TWnSnV8RkYhH8Z+I+jLhXay6iHyWpr
 d/pcFEI3kA3DfGJ8z2Q58QioOWdpeBLvxPJt/gAe/fay3DfvSreAsBlitfowYrjR6u8lj9
 ZFpwg9lThHRUM8xs804i6lIGLEchAns=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-Ipb4DERnMjaR0jT-ZIyJwA-1; Wed, 29 Jan 2020 17:14:02 -0500
Received: by mail-wr1-f69.google.com with SMTP id f15so690669wrr.2
 for <qemu-trivial@nongnu.org>; Wed, 29 Jan 2020 14:14:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V95vDayRoYJudj08dD6qnS3E+E6e/23z05vYjRc/ESY=;
 b=e+iZvWu22Zo2/v+MeFgFGqrDPtXc+3/XqBn/yY/kUq6/ZzP8d9Z8YEsSDX3+3YN+26
 FoAecKw/AKMh/cuE/ryt3WimTv5+POxuS4WdWx14sZEribpwWaQBFZaJVMgqVIDJv1b0
 BULpmGD1uMrJFI3zXk1K2JPHDKXbLILPK3G7+h1R009WG8YaIcI0FT5uZxz0sOhJ/cUK
 +sfYGnMhrrABniWyJ6kB/IOjKco5ovev41UKcobw9kVpAXf4shqr15u1gdYIdVgAHEHH
 hBS6BNuyFKZWA3rUANwQ/XXSRF8d5EsHXoutlM+i46hVWrkBglC8vXImFnsW0c42jJvk
 es1A==
X-Gm-Message-State: APjAAAX+aXLzV4ovQ5aMsjk2BRizlTvPIGvVjpfVRJtBDcJldbUBN4LV
 Ods/mBSWpJFV1eRXofRg1MyZ0oMkSexSnf9z6FKTFvTdvQRGxm0OLmCc/wqn+aUvci/cKIYuDvi
 T8xYKKonVgBvr7x6jTA==
X-Received: by 2002:a05:600c:cd:: with SMTP id
 u13mr1333171wmm.24.1580336041812; 
 Wed, 29 Jan 2020 14:14:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqwwu454lGtIW+yLCvB9ZtcoMDdALZU13ybLWplCL68F56CgpKffFI4zKOsx07IUmwY7C2LMrw==
X-Received: by 2002:a05:600c:cd:: with SMTP id
 u13mr1333157wmm.24.1580336041562; 
 Wed, 29 Jan 2020 14:14:01 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id a6sm4668650wrm.69.2020.01.29.14.14.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2020 14:14:00 -0800 (PST)
Subject: Re: [PATCH] qemu-deprecated: Remove text about Python 2
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>,
 Thomas Huth <thuth@redhat.com>
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, John Snow <jsnow@redhat.com>
References: <20200109095116.18201-1-thuth@redhat.com>
 <CAL1e-=jnAMtpNNHO1rqG-63K_5uM-QfVYoMcj0NZeHwKCWG4uQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <af4485d4-1706-c464-2320-dff3b5f29fd7@redhat.com>
Date: Wed, 29 Jan 2020 23:13:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAL1e-=jnAMtpNNHO1rqG-63K_5uM-QfVYoMcj0NZeHwKCWG4uQ@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: Ipb4DERnMjaR0jT-ZIyJwA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
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
X-List-Received-Date: Wed, 29 Jan 2020 22:14:12 -0000

Hi Aleksandar,

On 1/9/20 1:49 PM, Aleksandar Markovic wrote:
>=20
>=20
> On Thursday, January 9, 2020, Thomas Huth <thuth@redhat.com=20
> <mailto:thuth@redhat.com>> wrote:
>=20
>     Python 2 support has been removed, so we should now also remove
>     the announcement text for the deprecation.
>=20
>     Signed-off-by: Thomas Huth <thuth@redhat.com <mailto:thuth@redhat.com=
>>
>     ---
>      =C2=A0qemu-deprecated.texi | 8 --------
>      =C2=A01 file changed, 8 deletions(-)
>=20
>=20
> Reviewed by: Aleksandar Markovic <amarkovic@wavecomp.com=20
> <mailto:amarkovic@wavecomp.com>>

I use pwclient to collect patchwork patches, this one is:
https://patchwork.kernel.org/patch/11325373/
Your comment is listed, but your tag is ignored... I am not sure why.

John used:
Content-Transfer-Encoding: 7bit

You:
Content-Transfer-Encoding: quoted-printable

This might be why? I have no clue.

>=20
>     diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
>     index 7033e531de..8b23e98474 100644
>     --- a/qemu-deprecated.texi
>     +++ b/qemu-deprecated.texi
>     @@ -341,14 +341,6 @@ they have no effect when used with @option{-n}
>     to skip image creation.
>      =C2=A0Silently ignored options can be confusing, so this combination=
 of
>      =C2=A0options will be made an error in future versions.
>=20
>     -@section Build system
>     -
>     -@subsection Python 2 support (since 4.1.0)
>     -
>     -In the future, QEMU will require Python 3 to be available at
>     -build time.=C2=A0 Support for Python 2 in scripts shipped with QEMU
>     -is deprecated.
>     -
>      =C2=A0@section Backwards compatibility
>=20
>      =C2=A0@subsection Runnability guarantee of CPU models (since 4.1.0)
>     --=20
>     2.18.1
>=20
>=20


