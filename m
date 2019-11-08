Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iT2uQ-0004Ex-Re
	for mharc-qemu-trivial@gnu.org; Fri, 08 Nov 2019 06:58:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38264)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iT2uL-000482-AT
 for qemu-trivial@nongnu.org; Fri, 08 Nov 2019 06:58:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iT2uK-0002K5-3d
 for qemu-trivial@nongnu.org; Fri, 08 Nov 2019 06:58:29 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34400)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iT2uJ-0002IX-Qa
 for qemu-trivial@nongnu.org; Fri, 08 Nov 2019 06:58:28 -0500
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7444E821CC
 for <qemu-trivial@nongnu.org>; Fri,  8 Nov 2019 11:58:26 +0000 (UTC)
Received: by mail-wm1-f71.google.com with SMTP id g17so2255950wmc.4
 for <qemu-trivial@nongnu.org>; Fri, 08 Nov 2019 03:58:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lDtcoNA1YcT/e930WhhoooBJnhMqdakwlIvwoyvGyf4=;
 b=cSmoN9fXtHxDpEvHHY73J2wVz6eK9phNZMq25VBDzd4gCqULcpoJOgF3PgP9J/UjKP
 VknqllLygSCklBO0dz1ubv8FQ2Qf1MpCxCWzWMVOAYBp9wRfQn8wepDLjgcmwurkNQzU
 bYEn+40V7qSJR2880qAoEPf+5+zMXnFWBJreXtEwaDkvVRQi38ff8gVajz9+wFRKXRTU
 mPcWmT2PTdRnfTTbhLJnRRDvonCoEDoMMVQ6Ge4CKR0D0r+BWran7VeVr/j0ltV1boGj
 A3SQIvIpn1sFCJ6oSHwpWUv3mAe3O+zucmeLWwizcaYbOYvJp42a4rlcG/vu+yeEUFU1
 f0Ig==
X-Gm-Message-State: APjAAAXcBE4f74KmDYcA1QKb194WBXiOuqR4UEqAtuyIWz+fYDAmDtJu
 fU110ITvtwY+AKrIkyX2oYXyNkzyzyjawtkbwwKR8T5LmByaJDFtqza9F9TUzzPM1ZY6LuaBh4/
 z4BGJWkeC4IFnRprCZg==
X-Received: by 2002:a5d:5586:: with SMTP id i6mr7821488wrv.81.1573214305140;
 Fri, 08 Nov 2019 03:58:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqzxu60k3M8WiCj+qcPI/SYkIPeRvALpvUWWa0AWVcQogHC3KEFEHQ/T1bMEtSd4k1qBMpCpCA==
X-Received: by 2002:a5d:5586:: with SMTP id i6mr7821468wrv.81.1573214304878;
 Fri, 08 Nov 2019 03:58:24 -0800 (PST)
Received: from [192.168.1.33] (62.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.62])
 by smtp.gmail.com with ESMTPSA id l2sm6274980wrt.15.2019.11.08.03.58.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Nov 2019 03:58:24 -0800 (PST)
Subject: Re: [PATCH] configure: Check bzip2 is available
To: Laszlo Ersek <lersek@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>, qemu-trivial@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20191108102805.8258-1-philmd@redhat.com>
 <b6005d59-c5d2-1844-db94-a67e258c2867@redhat.com>
 <d0cf0f78-a0c9-e0fa-7959-ecdebf27f912@redhat.com>
 <f688cac2-d370-23af-27fd-fa1f3c3637f9@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <55f259eb-aaf9-75ce-5346-9d33f8d2464f@redhat.com>
Date: Fri, 8 Nov 2019 12:58:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <f688cac2-d370-23af-27fd-fa1f3c3637f9@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Fri, 08 Nov 2019 11:58:30 -0000

On 11/8/19 12:39 PM, Laszlo Ersek wrote:
> On 11/08/19 11:42, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 11/8/19 11:34 AM, Thomas Huth wrote:
>>> On 08/11/2019 11.28, Philippe Mathieu-Daud=C3=A9 wrote:
>>>> The bzip2 tool is not included in default installations.
>>>> On freshly installed systems, ./configure succeeds but 'make'
>>>> might fail later:
>>>>
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 BUNZIP2 pc-bios/edk2-i386-secure-code.fd.b=
z2
>>>>  =C2=A0=C2=A0 /bin/sh: bzip2: command not found
>>>>  =C2=A0=C2=A0 make: *** [Makefile:305: pc-bios/edk2-i386-secure-code=
.fd] Error 127
>>>>  =C2=A0=C2=A0 make: *** Deleting file 'pc-bios/edk2-i386-secure-code=
.fd'
>>>>  =C2=A0=C2=A0 make: *** Waiting for unfinished jobs....
>>>>
>>>> Add a check in ./configure to warn the user if bzip2 is missing.
>>>>
>>>> Fixes: 536d2173b2b
>>>> Reported-by: Thomas Huth <thuth@redhat.com>
>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>>> ---
>>>>  =C2=A0 configure | 7 +++++++
>>>>  =C2=A0 1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/configure b/configure
>>>> index efe165edf9..9957e913e8 100755
>>>> --- a/configure
>>>> +++ b/configure
>>>> @@ -1851,6 +1851,13 @@ python_version=3D$($python -c 'import sys;
>>>> print("%d.%d.%d" % (sys.version_info[0]
>>>>  =C2=A0 # Suppress writing compiled files
>>>>  =C2=A0 python=3D"$python -B"
>>>> +# Some firmware binaries are compressed with bzip2
>>>> +if has bzip2; then
>>>> +=C2=A0 :
>>>> +else
>>>> +=C2=A0 error_exit "bzip2 program not found. Please install it"
>>>> +fi
>>>
>>> It's only required for the edk2 binaries, isn't it? So should this
>>> maybe also check whether we build any of the i386-softmmu,
>>> x86_64-softmmu arm-softmmu or aarch64-softmmu targets and pass otherw=
ise?
>>
>> I have this on my TODO somewhere, because we extract the edk2 firmware=
s
>> even if we only build MIPS/PowerPC.
>=20
> But that applies to all of "BLOBS" in the root-level Makefile, doesn't
> it? We also install, say, "vgabios-qxl.bin", when only the MIPS/PowerPC
> system emulators are built. The only aspect that's specific to edk2
> binaries is that they are kept compressed until installation time, to
> save space in the git repo and in the source tarball.

You are right, other targets could improve this too.
Since this add quite complexity to the buildsys and nobody complained=20
about that previously, I suggest we clean that *after* we switch the=20
build machinery to Meson.

> I'm reminded of the "external QEMU blob / firmware repo" idea.

Do you mind starting a new thread asking about it? It would be nice we=20
clear this during the next dev cycle.

Regards,

Phil.

