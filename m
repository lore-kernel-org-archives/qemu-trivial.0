Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1if3Zw-0001er-U7
	for mharc-qemu-trivial@gnu.org; Wed, 11 Dec 2019 10:07:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50870)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1if3Zu-0001bc-Kj
 for qemu-trivial@nongnu.org; Wed, 11 Dec 2019 10:07:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1if3Zt-0002pH-3K
 for qemu-trivial@nongnu.org; Wed, 11 Dec 2019 10:07:02 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:45588
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1if3Zs-0002oQ-W3
 for qemu-trivial@nongnu.org; Wed, 11 Dec 2019 10:07:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576076820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IOCUVHiwbRRSxonJiaLVp/nyDhsQwBM7qpLWA2sm4EE=;
 b=DtYowGiJ5+t7Q2McnjAWtIlWCLshzuKBYFTt9Yc7PsYKpnzH7hL+V8XLY8jmS8/IftJ5Ir
 7/c3GaT6w8FnSoY8obY+ZVE5oRsELL4opi/yJWhR2T8JYQjPrPGcElf5a4JwW1Eer/K5Eh
 XHtmx0dLIO5B7PPy/8JAfcz1ope7RJE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-YYjNWx3PNDuurzz5ycluaA-1; Wed, 11 Dec 2019 10:06:55 -0500
Received: by mail-wm1-f70.google.com with SMTP id y125so694926wmg.1
 for <qemu-trivial@nongnu.org>; Wed, 11 Dec 2019 07:06:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2fX08xYAujcxdg2yTAv/a6NcZVRY2wBEL3Fj4xtuYqQ=;
 b=eL+Mo95jw8pco5f+2r4nuQ9NI0uv5b7TKGi5Expm3NeMFe6JBB+u5IlahCfsMsXA+f
 qlJ5BaOB62xtLlxSK13q32UH74//ehhZWE3Fafp09GpArN3eW4cYQxZ0iaZ0+w3G6San
 Aa11buLBkmIMnpacgAuagj2txkgCKxeNv9S9QgChWhZP75JhuLJYUHAwBVv/Y4WjmrKI
 dITa+Vu/wl6Su4ybPoTlweLZdRBfmKTg634mEO512ugNjBrVEpKPSypiNiPgX/AXWDIw
 KHpHDX19yp8B0kRGwwfKX13nvLGx8RzAevJnQZssZfk0EovaxbX+mPcGPDXJhPyoQCp4
 bPpg==
X-Gm-Message-State: APjAAAWWKf1tEJFXpW0cmeDDyrRA5of5wLkOSx00l03ikOy+xvy7b8mT
 oEVW0m/hNpl/Hnb4mz/sBG5tmUFxzreg4ygvbpq5aMlFeuaGa1KqxUyYYj3IoERLO1j3tfBpezG
 C7GV5pYy/2gkxf7lPkA==
X-Received: by 2002:a1c:5451:: with SMTP id p17mr252346wmi.57.1576076814631;
 Wed, 11 Dec 2019 07:06:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqyivH70pAdc03UL33RQQXzdiX+EMpl/0pXjgYTqr0KmdkR5sdjkfaKKrQx4xKGjj9NZU7DHLQ==
X-Received: by 2002:a1c:5451:: with SMTP id p17mr252326wmi.57.1576076814334;
 Wed, 11 Dec 2019 07:06:54 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:e9bb:92e9:fcc3:7ba9?
 ([2001:b07:6468:f312:e9bb:92e9:fcc3:7ba9])
 by smtp.gmail.com with ESMTPSA id z12sm2577734wmd.16.2019.12.11.07.06.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2019 07:06:53 -0800 (PST)
Subject: Re: [PATCH] build-sys: do not include Windows SLIRP dependencies in
 $LIBS
To: Samuel Thibault <samuel.thibault@gnu.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <1576074210-52834-2-git-send-email-pbonzini@redhat.com>
 <20191211143722.a4co5wi53gylo2sr@function>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <81150fb4-5a6b-d27d-ee6f-53fcdc5b93d0@redhat.com>
Date: Wed, 11 Dec 2019 16:06:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191211143722.a4co5wi53gylo2sr@function>
Content-Language: en-US
X-MC-Unique: YYjNWx3PNDuurzz5ycluaA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
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
X-List-Received-Date: Wed, 11 Dec 2019 15:07:04 -0000

On 11/12/19 15:37, Samuel Thibault wrote:
> Paolo Bonzini, le mer. 11 d=C3=A9c. 2019 15:23:23 +0100, a ecrit:
>> When including the internal SLIRP library, we should add all the librari=
es that
>> it needs for the build.  Right now they are all included by QEMU, but -l=
iphlpapi
>> is not needed without slirp.  Move it from LIBS to slirp_libs.
>>
>> Based on a patch by Marc-Andr=C3=A9 Lureau.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>=20
> Acked-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Ok, I'll queue it.  But you could use "make docker-test-mingw@fedora". :)

Paolo

> (I don't have a win environment to test this)
>=20
>> ---
>>  configure | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/configure b/configure
>> index 6099be1..d16dad2 100755
>> --- a/configure
>> +++ b/configure
>> @@ -926,7 +926,7 @@ if test "$mingw32" =3D "yes" ; then
>>    DSOSUF=3D".dll"
>>    # MinGW needs -mthreads for TLS and macro _MT.
>>    QEMU_CFLAGS=3D"-mthreads $QEMU_CFLAGS"
>> -  LIBS=3D"-lwinmm -lws2_32 -liphlpapi $LIBS"
>> +  LIBS=3D"-lwinmm -lws2_32 $LIBS"
>>    write_c_skeleton;
>>    if compile_prog "" "-liberty" ; then
>>      LIBS=3D"-liberty $LIBS"
>> @@ -6069,6 +6069,9 @@ case "$slirp" in
>>      mkdir -p slirp
>>      slirp_cflags=3D"-I\$(SRC_PATH)/slirp/src -I\$(BUILD_DIR)/slirp/src"
>>      slirp_libs=3D"-L\$(BUILD_DIR)/slirp -lslirp"
>> +    if test "$mingw32" =3D "yes" ; then
>> +      slirp_libs=3D"$slirp_libs -lws2_32 -liphlpapi"
>> +    fi
>>      ;;
>> =20
>>    system)
>> --=20
>> 1.8.3.1
>>
>>
>=20


