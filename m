Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iwwj0-0008C0-NO
	for mharc-qemu-trivial@gnu.org; Wed, 29 Jan 2020 18:26:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35407)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iwwix-000897-Q7
 for qemu-trivial@nongnu.org; Wed, 29 Jan 2020 18:26:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iwwiv-00042m-Pq
 for qemu-trivial@nongnu.org; Wed, 29 Jan 2020 18:26:18 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:60299
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iwwiv-000427-MZ
 for qemu-trivial@nongnu.org; Wed, 29 Jan 2020 18:26:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580340377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JKsIym+21Q6XwBYINKkF4dvPTUCiZoZDpJo6RCpkqS4=;
 b=CGbu2YHwdJHOH2sH6rTk3Q0IWQCgZz0UqpTsRjNvzGwc7puwVR47d+DdtH5uLPNeQHDYXd
 v10fM9JXqGtEs0S3HxhNCyPElWPG9Td/zamflIC9BYdO6iRxyMPTUehBmmuzsWkwmHgFHk
 IPplyEeZ0vJvFMpEvJCWAnszsqeS0MI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-Ax50NwfAOOmGfi86ZZmsnQ-1; Wed, 29 Jan 2020 18:26:14 -0500
Received: by mail-wr1-f71.google.com with SMTP id x15so772025wrl.15
 for <qemu-trivial@nongnu.org>; Wed, 29 Jan 2020 15:26:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PbrkYSnwiU3DoSTlouGRF5c1IXa/nXTFES9duMFGTrY=;
 b=gUd6X8F3b/WFzv1hbpD7Sn5JWh6QQtFhbdL/ah1+UzCCdeVRhDzz+MqdQ0SdZCvwST
 GEFd37LpipkUeAUessUcljJYPMJ2JOU3x+Z1i/oZ/OKUGq5uNnSiQK/XiKge4Cap93K6
 SbLE7d9wdTyztaYqKyUtwfI7CdkHOeW2tbs2R1kkpr8ef6K37z3zHwtW/H1Pet8IuV9C
 4KChv6C7/hrTyH7KArJmm1bImO725LL7Ht+F5pbINUSETWKYBcMyydQnrUzfBbRaT10n
 P3f1mw1Xws7bw0WxN5T09m38dh88R+BVbnD2h2rxqBoUhCXvdR99nZi3IReb+La2NJKw
 yCnw==
X-Gm-Message-State: APjAAAX7Z50Nh1JkmTrRBw8Xvxu0QJRF961F3PAaAQnPVFIAjtMF7DyW
 jw10G7sFcaonhtE+cJ81iBI3kvivHsy1BGAeYpMTjb7xki7qkJ2ll+9t8twamkAckP7YEOUwX8d
 UQsg7NTHRzgdKo7LsVQ==
X-Received: by 2002:a1c:1fd0:: with SMTP id f199mr1495637wmf.113.1580340373751; 
 Wed, 29 Jan 2020 15:26:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqx1n3IrgMfgqQ1+WQSEwVMHqN3A2wGQOOdLb1aNBc1ubEoCeFvHflpJZ5uUYXoQA2MJVuazzw==
X-Received: by 2002:a1c:1fd0:: with SMTP id f199mr1495613wmf.113.1580340373428; 
 Wed, 29 Jan 2020 15:26:13 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id 5sm5107649wrh.5.2020.01.29.15.26.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2020 15:26:12 -0800 (PST)
Subject: Re: [PATCH] qemu-deprecated: Remove text about Python 2
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Cc: Thomas Huth <thuth@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, John Snow <jsnow@redhat.com>
References: <20200109095116.18201-1-thuth@redhat.com>
 <CAL1e-=jnAMtpNNHO1rqG-63K_5uM-QfVYoMcj0NZeHwKCWG4uQ@mail.gmail.com>
 <af4485d4-1706-c464-2320-dff3b5f29fd7@redhat.com>
 <CAL1e-=iT9Ve7nVFHeMpcfNzwxtLK8Q5C2hbLRSv4PreLfR+3pQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <957baaa5-f160-09de-c101-8873b73aea7b@redhat.com>
Date: Thu, 30 Jan 2020 00:26:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAL1e-=iT9Ve7nVFHeMpcfNzwxtLK8Q5C2hbLRSv4PreLfR+3pQ@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: Ax50NwfAOOmGfi86ZZmsnQ-1
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
X-List-Received-Date: Wed, 29 Jan 2020 23:26:21 -0000

On 1/30/20 12:18 AM, Aleksandar Markovic wrote:
> 23:14 Sre, 29.01.2020. Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=20
> <mailto:philmd@redhat.com>> =D1=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=
=D0=B0=D0=BE/=D0=BB=D0=B0:
>  >
>  > Hi Aleksandar,
>  >
>  > On 1/9/20 1:49 PM, Aleksandar Markovic wrote:
>  > >
>  > >
>  > > On Thursday, January 9, 2020, Thomas Huth <thuth@redhat.com=20
> <mailto:thuth@redhat.com>
>  > > <mailto:thuth@redhat.com <mailto:thuth@redhat.com>>> wrote:
>  > >
>  > >=C2=A0 =C2=A0 =C2=A0Python 2 support has been removed, so we should n=
ow also remove
>  > >=C2=A0 =C2=A0 =C2=A0the announcement text for the deprecation.
>  > >
>  > >=C2=A0 =C2=A0 =C2=A0Signed-off-by: Thomas Huth <thuth@redhat.com=20
> <mailto:thuth@redhat.com> <mailto:thuth@redhat.com=20
> <mailto:thuth@redhat.com>>>
>  > >=C2=A0 =C2=A0 =C2=A0---
>  > >=C2=A0 =C2=A0 =C2=A0 =C2=A0qemu-deprecated.texi | 8 --------
>  > >=C2=A0 =C2=A0 =C2=A0 =C2=A01 file changed, 8 deletions(-)
>  > >
>  > >
>  > > Reviewed by: Aleksandar Markovic <amarkovic@wavecomp.com=20
> <mailto:amarkovic@wavecomp.com>
>  > > <mailto:amarkovic@wavecomp.com <mailto:amarkovic@wavecomp.com>>>
>  >
>  > I use pwclient to collect patchwork patches, this one is:
>  > https://patchwork.kernel.org/patch/11325373/
>  > Your comment is listed, but your tag is ignored... I am not sure why.
>  >
>  > John used:
>  > Content-Transfer-Encoding: 7bit
>  >
>  > You:
>  > Content-Transfer-Encoding: quoted-printable
>  >
>  > This might be why? I have no clue.
>  >
>=20
> It could be. I use a variety of mail clients. Not all provide the same=20
> level of control of sent mails format. Almost sure they have different=20
> settings. I may do some experimentation on a suitable patch series.=20
> Thanks for noticing it.
>=20
> OR: I wrote "Reviewed by:" without hyphen.

Oh you are right, I didn't notice.

>=20
> Reviewed-by: Aleksandar Markovic=C2=A0 <amarkovic@wavecomp.com=20
> <mailto:amarkovic@wavecomp.com>>
>=20
> Is now patchwork picking it up?

Yes (1 extra space after your name).

Thanks.

>=20
>  > >
>  > >=C2=A0 =C2=A0 =C2=A0diff --git a/qemu-deprecated.texi b/qemu-deprecat=
ed.texi
>  > >=C2=A0 =C2=A0 =C2=A0index 7033e531de..8b23e98474 100644
>  > >=C2=A0 =C2=A0 =C2=A0--- a/qemu-deprecated.texi
>  > >=C2=A0 =C2=A0 =C2=A0+++ b/qemu-deprecated.texi
>  > >=C2=A0 =C2=A0 =C2=A0@@ -341,14 +341,6 @@ they have no effect when use=
d with @option{-n}
>  > >=C2=A0 =C2=A0 =C2=A0to skip image creation.
>  > >=C2=A0 =C2=A0 =C2=A0 =C2=A0Silently ignored options can be confusing,=
 so this combination of
>  > >=C2=A0 =C2=A0 =C2=A0 =C2=A0options will be made an error in future ve=
rsions.
>  > >
>  > >=C2=A0 =C2=A0 =C2=A0-@section Build system
>  > >=C2=A0 =C2=A0 =C2=A0-
>  > >=C2=A0 =C2=A0 =C2=A0-@subsection Python 2 support (since 4.1.0)
>  > >=C2=A0 =C2=A0 =C2=A0-
>  > >=C2=A0 =C2=A0 =C2=A0-In the future, QEMU will require Python 3 to be =
available at
>  > >=C2=A0 =C2=A0 =C2=A0-build time.=C2=A0 Support for Python 2 in script=
s shipped with QEMU
>  > >=C2=A0 =C2=A0 =C2=A0-is deprecated.
>  > >=C2=A0 =C2=A0 =C2=A0-
>  > >=C2=A0 =C2=A0 =C2=A0 =C2=A0@section Backwards compatibility
>  > >
>  > >=C2=A0 =C2=A0 =C2=A0 =C2=A0@subsection Runnability guarantee of CPU m=
odels (since 4.1.0)
>  > >=C2=A0 =C2=A0 =C2=A0--
>  > >=C2=A0 =C2=A0 =C2=A02.18.1
>  > >
>  > >
>  >
>=20


