Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jBe2U-0004RO-FK
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2020 08:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56672)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jBe2R-0004MS-3x
 for qemu-trivial@nongnu.org; Tue, 10 Mar 2020 08:31:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jBe2O-0002Yd-K5
 for qemu-trivial@nongnu.org; Tue, 10 Mar 2020 08:31:10 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23277
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jBe2O-0002Ul-G4
 for qemu-trivial@nongnu.org; Tue, 10 Mar 2020 08:31:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583843467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xOwO2YXdH+QvHbL2qyd10FO3LzcScH2SAVUNvz7Za8Q=;
 b=i4C7AGCRytty0UScqXGI5/gb2T3nrM15VqiVW4PUAhR/SOInlUWJjvjv1QIaSHZ/ZHNGSE
 BQTTJ/HYLzEyLwx8YvWSL3DLTOs699sNw1al7c6F7fJeZ3+FoB/CUzLtykZG+G+njG8lDP
 NtbC7aAHodB35JJLm2XFq3ajx2INj1o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-z1oRe9ldNLSUv8QVJdzq8g-1; Tue, 10 Mar 2020 08:31:04 -0400
X-MC-Unique: z1oRe9ldNLSUv8QVJdzq8g-1
Received: by mail-wm1-f70.google.com with SMTP id y7so319333wmd.4
 for <qemu-trivial@nongnu.org>; Tue, 10 Mar 2020 05:31:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iMi2LQegoQJUKCWNKL2j3KU0cs10q1dTpEGC+G4E+5o=;
 b=C8+2jNZv4PikEX7ETAjKzq4qKr4ZZjOuPGM/gIb0tBFobzBe8KUjPjvmd3jgVIirTg
 CNSq+035wlemRmiG2ALWZZQK8fLBVqwJ69eZe3pQKsm1Og6GC/goD7Ex7qFMWIsZpHdq
 wDigQThws6vF8uglMMsOv8gyuB/FXnhj1h699qxx+0L7Pi/bbbxXHQFaTbEIUJ19/Djd
 ovfVXMYreRTpJobJBWwDiom+4xAnaPV44/agl2nmc0/a2gRRGCFHYfCB3g+/w7GIeEr0
 pwA9gZD8+/ybYDa584DUMKLZmVEAg5UtfzrN4MIXrlO6+9l+hnyLE0x/x9JYR1I94K4B
 AxzQ==
X-Gm-Message-State: ANhLgQ0Y+C78z8Yv+a6o3smmf8OOr6NxHZJvAo2Idm37gRH9omOQ4h/u
 ++7O1J4GjKqCmWH2yjoy66sQ7GPCzwY+evFPjBGVjfiZHu/+K7IZKBd/aCncGukYWBjqFkuyBgF
 LDNd56EfxNjLpA9zMJw==
X-Received: by 2002:a05:600c:350:: with SMTP id
 u16mr1964942wmd.168.1583843463489; 
 Tue, 10 Mar 2020 05:31:03 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvVk7mnQFPtlPZ+dwL+Bo64WlqHv7uQcbw8y4ZdyLv1AxEjLBb3HDx3sfIEYpmR7oHgjnwI2g==
X-Received: by 2002:a05:600c:350:: with SMTP id
 u16mr1964886wmd.168.1583843463149; 
 Tue, 10 Mar 2020 05:31:03 -0700 (PDT)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id w9sm28221874wrn.35.2020.03.10.05.31.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2020 05:31:02 -0700 (PDT)
Subject: Re: [PULL 00/33] Trivial branch patches
To: Kevin Wolf <kwolf@redhat.com>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Helge Deller <deller@gmx.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20200309150837.3193387-1-laurent@vivier.eu>
 <20200309151621-mutt-send-email-mst@kernel.org>
 <8db36062-b45d-6c2e-c7d8-98dd2b9db06f@redhat.com>
 <0bb2eac1-74ab-bee8-e8d0-bac542562cdd@vivier.eu>
 <20200310114548.GA6926@linux.fritz.box>
 <ced636a7-dbda-9247-5dd7-37e8c2ccabce@redhat.com>
 <20200310121300.GD6926@linux.fritz.box>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <76fb6e75-6c62-8dd4-e135-ac6c2bdc154d@redhat.com>
Date: Tue, 10 Mar 2020 13:31:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200310121300.GD6926@linux.fritz.box>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
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
X-List-Received-Date: Tue, 10 Mar 2020 12:31:12 -0000

On 3/10/20 1:13 PM, Kevin Wolf wrote:
> Am 10.03.2020 um 13:00 hat Philippe Mathieu-Daud=C3=A9 geschrieben:
>> On 3/10/20 12:45 PM, Kevin Wolf wrote:
>>> Am 10.03.2020 um 09:02 hat Laurent Vivier geschrieben:
>>>> Le 09/03/2020 =C3=A0 20:30, Philippe Mathieu-Daud=C3=A9 a =C3=A9crit=
=C2=A0:
>>>>> On 3/9/20 8:17 PM, Michael S. Tsirkin wrote:
>>>>>> On Mon, Mar 09, 2020 at 04:08:04PM +0100, Laurent Vivier wrote:
>>>>>>> The following changes since commit
>>>>>>> 7a5853cec479a448edae0fb2aaf4e2f78c9c774d:
>>>>>>>
>>>>>>>   =C2=A0=C2=A0 Merge remote-tracking branch 'remotes/mst/tags/for_u=
pstream' into
>>>>>>> staging (2020-03-09 10:32:53 +0000)
>>>>>>>
>>>>>>> are available in the Git repository at:
>>>>>>>
>>>>>>>   =C2=A0=C2=A0 git://github.com/vivier/qemu.git tags/trivial-branch=
-pull-request
>>>>>>>
>>>>>>> for you to fetch changes up to 916c92503bd5348a33e561db600d8894bde6=
36bb:
>>>>>>>
>>>>>>>   =C2=A0=C2=A0 monitor/hmp-cmds: Remove redundant statement in
>>>>>>> hmp_rocker_of_dpa_groups() (2020-03-09 15:59:31 +0100)
>>>>>>
>>>>>>
>>>>>> Could you avoid CC everyone involved on the whole PULL req?
>>>>>> I was involved in a patch or two and don't really need to see
>>>>>> the whole series. Just the cover and the relevant patches
>>>>>> would be enough - if I do want it there's always lore.
>>>>>
>>>>> I suppose Laurent used git-publish, which has this limitation.
>>>>>
>>>>
>>>> Yes, I use git publish and CC are automatically added.
>>>>
>>>> Philippe, you told me some time ago you have a patch to fix this
>>>> behaviour and only CC people on a patch base. Is it available?
>>
>> I guess you mean https://github.com/philmd/git-publish/commit/5bab6e2cc7=
7, I
>> haven't improved it but plan to spend time on it during my next holidays=
.
>>
>>> Actually, I don't think it's even necessary to CC anyone at all (except
>>> the relevant lists) for pull requests. These patches were already
>>> reviewed.
>>
>> Well as a contributor I find useful to get notified when patches are mer=
ged.
>=20
> Hm, I guess a matter of different preferences then.
>=20
>> I guess remember some time ago patchew (or another bot?) was sending a
>> notification on pull request merged, this was even more useful than Cc'i=
ng
>> ppl on pull-req. It is also helpful when you track someone else patch on=
 the
>> list.
>> Since most of the maintainers now include the patch RFC822 Message-Id, i=
t is
>> now easy for a bot to reply to patch taken from the last.
>=20
> I don't remember anything like this, but having an automatic reply to
> the email thread of each merged patch series might be a good idea.

It was patchew:=20
https://www.mail-archive.com/qemu-devel@nongnu.org/msg623861.html

   From: no-reply@patchew.org

   Subject: A patch has been merged in QEMU: $PatchSubject

   Congratulations, $PatchSubject was merged by the QEMU maintainers.

>=20
> Kevin
>=20
>=20


