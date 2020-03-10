Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jBdYn-0003v9-EL
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2020 08:00:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36290)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jBdYg-0003qS-8I
 for qemu-trivial@nongnu.org; Tue, 10 Mar 2020 08:00:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jBdYe-0004iA-7X
 for qemu-trivial@nongnu.org; Tue, 10 Mar 2020 08:00:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28920
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jBdYc-0004dF-AF
 for qemu-trivial@nongnu.org; Tue, 10 Mar 2020 08:00:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583841620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5dqdZodhtruS33yIfsVAQ2EvYwwPKsiH4qtRU837xkE=;
 b=QVJgJTVWxMdb834dRyLPmNtF0gHr/coi0bcahTwgrCG+CaBRhDK6dr8m3jwwwXOaknhRsi
 ahokthT1yA9r/4BAEIQ2uFJ+Y6Zp8klXJcFDg+JQuqp7Z32L9YuEJUCS+NRVxUlGrbKDGb
 zLlyDmlpWDozzACtvAZTxS8awSRV5As=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-OlgjFDKhOBKm9e3U_nJ4Rg-1; Tue, 10 Mar 2020 08:00:17 -0400
X-MC-Unique: OlgjFDKhOBKm9e3U_nJ4Rg-1
Received: by mail-wr1-f72.google.com with SMTP id p5so6619714wrj.17
 for <qemu-trivial@nongnu.org>; Tue, 10 Mar 2020 05:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7RD8yJxjCiupv/XrS76fvkYC+KM/an7NRp3tjWahsjc=;
 b=CMdN22/7WbFqsMwcWG98xBNJpDg4ijPFmpykGi8VvcxGlBq2zIm3PAjYP8oPe1z2P6
 HDu/ygW+MnqTsU2d70/soFhnPXEectjmV0c25Pzx8hcVJ3wd8AEQhP6ckFF+CjPQSXPK
 3dveVRIUxUA88iEt3p5ej8OFg0spFQmPnAiZdPXXmXw2urCRtH+aIPNyXWm6vMf+yYl+
 eI3TVRUfVus9BxazNMCSJAZrFNeN1uYhU8XRB7QKBBJrm9J8ylWg9UVeT4XMjbc8UKUP
 z6MAsLp7xQ4Bo87NxqeVetlaO42V3jesOSprTA8w7yit3adCbzH/WjEV6QeMYfntBEyz
 O/kQ==
X-Gm-Message-State: ANhLgQ00NGJ5eMlGbwBTUF1yF/5eRZe2tXvj4QeMannKqAETITJ9w/hr
 CcnMHhkczwUIJuFEsZZIPaMrd6+Fwb0L6wlOZLVCZQl5FtvY1Co5YSHyqLvQWQARmivNNhKV9e4
 6qP0A2xqn6lFYyk4f0w==
X-Received: by 2002:a1c:7e08:: with SMTP id z8mr1761810wmc.166.1583841616561; 
 Tue, 10 Mar 2020 05:00:16 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs2fYSTSDGOKjPlxF9zaftKQTk1E/jQ7VGgMfO8MMiB3//I0Jhxtp9o3TQZLEAniXrtCArEvA==
X-Received: by 2002:a1c:7e08:: with SMTP id z8mr1761752wmc.166.1583841616158; 
 Tue, 10 Mar 2020 05:00:16 -0700 (PDT)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id c26sm3775280wmb.8.2020.03.10.05.00.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2020 05:00:14 -0700 (PDT)
Subject: Re: [PULL 00/33] Trivial branch patches
To: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Greg Kurz <groug@kaod.org>, qemu-block@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <rth@twiddle.net>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Max Reitz <mreitz@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Fam Zheng <fam@euphon.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Helge Deller <deller@gmx.de>,
 qemu-trivial@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, John Snow <jsnow@redhat.com>
References: <20200309150837.3193387-1-laurent@vivier.eu>
 <20200309151621-mutt-send-email-mst@kernel.org>
 <8db36062-b45d-6c2e-c7d8-98dd2b9db06f@redhat.com>
 <0bb2eac1-74ab-bee8-e8d0-bac542562cdd@vivier.eu>
 <20200310114548.GA6926@linux.fritz.box>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ced636a7-dbda-9247-5dd7-37e8c2ccabce@redhat.com>
Date: Tue, 10 Mar 2020 13:00:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200310114548.GA6926@linux.fritz.box>
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
X-List-Received-Date: Tue, 10 Mar 2020 12:00:31 -0000

On 3/10/20 12:45 PM, Kevin Wolf wrote:
> Am 10.03.2020 um 09:02 hat Laurent Vivier geschrieben:
>> Le 09/03/2020 =C3=A0 20:30, Philippe Mathieu-Daud=C3=A9 a =C3=A9crit=C2=
=A0:
>>> On 3/9/20 8:17 PM, Michael S. Tsirkin wrote:
>>>> On Mon, Mar 09, 2020 at 04:08:04PM +0100, Laurent Vivier wrote:
>>>>> The following changes since commit
>>>>> 7a5853cec479a448edae0fb2aaf4e2f78c9c774d:
>>>>>
>>>>>  =C2=A0=C2=A0 Merge remote-tracking branch 'remotes/mst/tags/for_upst=
ream' into
>>>>> staging (2020-03-09 10:32:53 +0000)
>>>>>
>>>>> are available in the Git repository at:
>>>>>
>>>>>  =C2=A0=C2=A0 git://github.com/vivier/qemu.git tags/trivial-branch-pu=
ll-request
>>>>>
>>>>> for you to fetch changes up to 916c92503bd5348a33e561db600d8894bde636=
bb:
>>>>>
>>>>>  =C2=A0=C2=A0 monitor/hmp-cmds: Remove redundant statement in
>>>>> hmp_rocker_of_dpa_groups() (2020-03-09 15:59:31 +0100)
>>>>
>>>>
>>>> Could you avoid CC everyone involved on the whole PULL req?
>>>> I was involved in a patch or two and don't really need to see
>>>> the whole series. Just the cover and the relevant patches
>>>> would be enough - if I do want it there's always lore.
>>>
>>> I suppose Laurent used git-publish, which has this limitation.
>>>
>>
>> Yes, I use git publish and CC are automatically added.
>>
>> Philippe, you told me some time ago you have a patch to fix this
>> behaviour and only CC people on a patch base. Is it available?

I guess you mean=20
https://github.com/philmd/git-publish/commit/5bab6e2cc77, I haven't=20
improved it but plan to spend time on it during my next holidays.

> Actually, I don't think it's even necessary to CC anyone at all (except
> the relevant lists) for pull requests. These patches were already
> reviewed.

Well as a contributor I find useful to get notified when patches are merged=
.

I guess remember some time ago patchew (or another bot?) was sending a=20
notification on pull request merged, this was even more useful than=20
Cc'ing ppl on pull-req. It is also helpful when you track someone else=20
patch on the list.
Since most of the maintainers now include the patch RFC822 Message-Id,=20
it is now easy for a bot to reply to patch taken from the last.

>=20
> Kevin
>=20


