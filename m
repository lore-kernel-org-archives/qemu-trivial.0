Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ihY1G-0004nD-Ci
	for mharc-qemu-trivial@gnu.org; Wed, 18 Dec 2019 07:01:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59244)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1ihY1E-0004my-KL
 for qemu-trivial@nongnu.org; Wed, 18 Dec 2019 07:01:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1ihY19-0002LT-52
 for qemu-trivial@nongnu.org; Wed, 18 Dec 2019 07:01:31 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52143
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1ihY19-0002Hg-0X
 for qemu-trivial@nongnu.org; Wed, 18 Dec 2019 07:01:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576670486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nnTOVHuW87Jr/QF5nTyCZsFNBa9WxSkLxkS3rc7V324=;
 b=eVXDmNMqNrvB1pMGEleu/ZM7gl6DbJG69NoRRtu6zL1jsc47kChzu4ddPqaPSeshxUnfGI
 J3WbV933NQ0kI8OyQx6DmRQGmJ5jA7OzbhWSxJzPrK4D40vH37afYqWBnMz9kx0sRhmMeE
 IlS9S2INg1kAAEGNV+a5dLXIt3lQqTo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-4c3vft3oN4S_M2Ep26SH7w-1; Wed, 18 Dec 2019 07:01:23 -0500
Received: by mail-wm1-f71.google.com with SMTP id s25so437270wmj.3
 for <qemu-trivial@nongnu.org>; Wed, 18 Dec 2019 04:01:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vtprSGYHU4j197Ob5MFH6FDAhj99Ty+47OcaF4TZslQ=;
 b=HiVzaS1xu8ZScJZQNitdUqYMfr9Bg/RakrZq7x5c0qz4BeMQBUiTS/H+Em6CrNpVKl
 FKHtW03/tvUyLKaHrr2wkdP2ID7jLFWYSirohAtCTGB888Wr9+SFtRtP43PWt+dCI4UD
 o33pfUi9QJOhShoUoIE0OLWuViUaxPSZ697xVlBrV8p7KeZ7B/Qp/v9CPGWX203kL5FO
 gOCy9+W9LI4GfG1Yec3jQDJ9bH2hZbs5W77gb1eojsO+PW2/neQ6/ByqGoAmecEmEqRg
 YCHvRN3GukMDOq9Kt0/RpSduG6kV7x1KAyWWeq0Pb6fpAZP5n8Xfb+8/XHTIV4LJoyHa
 Jyxg==
X-Gm-Message-State: APjAAAX4X0G5vIVI+xaNH77OFG/8QPDy5RnwVEaKl9vqYuYRPXFbCvEC
 LO1V9AP+yTgVu3IgaPU3Cn2ecMl/J5+MpRVExOic3n85Jyk2n7+8VqE7BTHRYArXJNveCNAbxZy
 HSncUXlkvZmQ5XecXnA==
X-Received: by 2002:a05:6000:50:: with SMTP id
 k16mr2402942wrx.145.1576670482493; 
 Wed, 18 Dec 2019 04:01:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqzP+Fh3tnwzAq8B8UcmM2mVBYjuJtoDSV8sbDFanUFk2f/c6bgGmh1sUtNsOgYBEFE0wS3EXA==
X-Received: by 2002:a05:6000:50:: with SMTP id
 k16mr2402888wrx.145.1576670482076; 
 Wed, 18 Dec 2019 04:01:22 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:ac09:bce1:1c26:264c?
 ([2001:b07:6468:f312:ac09:bce1:1c26:264c])
 by smtp.gmail.com with ESMTPSA id s8sm2242512wrt.57.2019.12.18.04.01.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2019 04:01:21 -0800 (PST)
Subject: Re: [PATCH-for-5.0 v3 3/6] hw/pci-host/i440fx: Use size_t to iterate
 over ARRAY_SIZE()
To: Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Trivial
 <qemu-trivial@nongnu.org>, Paul Durrant <paul@xen.org>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20191209095002.32194-1-philmd@redhat.com>
 <20191209095002.32194-4-philmd@redhat.com>
 <a4745134-47dc-ab8a-6009-69fcc9dfbb02@redhat.com>
 <46339299-e45b-79a3-5b45-f62fb5c7b26f@vivier.eu>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b629cd94-95e9-d351-6e80-23594c2b6245@redhat.com>
Date: Wed, 18 Dec 2019 13:01:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <46339299-e45b-79a3-5b45-f62fb5c7b26f@vivier.eu>
Content-Language: en-US
X-MC-Unique: 4c3vft3oN4S_M2Ep26SH7w-1
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
X-List-Received-Date: Wed, 18 Dec 2019 12:01:34 -0000

On 18/12/19 12:57, Laurent Vivier wrote:
> Le 09/12/2019 =C3=A0 11:05, Thomas Huth a =C3=A9crit=C2=A0:
>> On 09/12/2019 10.49, Philippe Mathieu-Daud=C3=A9 wrote:
>>> We don't enforce the -Wsign-conversion CPPFLAG, but it doesn't hurt
>>> to avoid this warning:
>>>
>>>   warning: implicit conversion changes signedness: 'int' to 'size_t' (a=
ka 'unsigned long') [-Wsign-conversion]
>>>
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>> ---
>>>  hw/pci-host/i440fx.c | 5 ++---
>>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
>>> index fbdc563599..0cc80b276d 100644
>>> --- a/hw/pci-host/i440fx.c
>>> +++ b/hw/pci-host/i440fx.c
>>> @@ -419,12 +419,11 @@ out:
>>>  static void igd_pt_i440fx_realize(PCIDevice *pci_dev, Error **errp)
>>>  {
>>>      uint32_t val =3D 0;
>>> -    int i, num;
>>> +    size_t i;
>>>      int pos, len;
>>>      Error *local_err =3D NULL;
>>> =20
>>> -    num =3D ARRAY_SIZE(igd_host_bridge_infos);
>>> -    for (i =3D 0; i < num; i++) {
>>> +    for (i =3D 0; i < ARRAY_SIZE(igd_host_bridge_infos); i++) {
>>>          pos =3D igd_host_bridge_infos[i].offset;
>>>          len =3D igd_host_bridge_infos[i].len;
>>>          host_pci_config_read(pos, len, &val, &local_err);
>>>
>>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>
>>
>=20
> Applied to my trivial-patches branch.

No need to, I've already queued the whole series.

Paolo


