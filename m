Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9qzg-0007kO-Sy
	for mharc-qemu-trivial@gnu.org; Thu, 05 Mar 2020 08:56:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56738)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9qzb-0007jp-02
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 08:56:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9qzZ-0007Gw-Ii
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 08:56:50 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56117
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9qzZ-0007G5-Ff
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 08:56:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583416608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7yigmOQa9DI9TPrmsm3DEmE73TVT1ssI3xO1ksupQ/8=;
 b=Ag2EoZ1LDqpFggbkukoqxdwU9icKu88et6iLx9AcrTGSOqrwQ1NGEFThbKoxHgq7RczNGb
 4zzdY6ShhwVK9dRw6y+4XARaas/E6RJZC8UecqgdSV96eJzA9JGiwLc9c3ojTB44GsknnS
 WY5v8Lmzxrr0NbF6cKoeh+n3KEWfqew=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-cGPGfcY2M_mE2cTyjwtFzg-1; Thu, 05 Mar 2020 08:56:44 -0500
X-MC-Unique: cGPGfcY2M_mE2cTyjwtFzg-1
Received: by mail-ed1-f72.google.com with SMTP id f13so4398533edy.21
 for <qemu-trivial@nongnu.org>; Thu, 05 Mar 2020 05:56:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BT0xpPCdR65KjGNsmgchdcJ4FdBWwWQ/DO/4FT9eI68=;
 b=IMH3YhAn0sHg7p5xU0zVHhqEwT6E3vOYoRnNOKGTPbGXhsWTEhICYFx7WhUc6v823b
 TGfiinF0BkW010kmZ0iSMiEIzBmLPOtvqkyhcjDLsRL41WZMOl/sH7JyWgc/sK9/EE1+
 3MXVLID9AzB/A5EBmCtqj7m5oVWQoUrdaN2vg63VbGSBVqir4LY06VIgBWyEPLYrLjGa
 taCMJNTQvZHfchyqp2qc+X/jtK/e7/s75Z13qNWkmay8/Uad+mdTzq7kFfPD9m3+omV1
 7tzbrxxgvo2+2VRx4tUs89zNromv9SBXa7oTOm8QBrbnaq2pjb2SeHWvFNGAR2QhVw5d
 +N2g==
X-Gm-Message-State: ANhLgQ2rBS+kZ+BF7RjjpcXp1Iqwlb8bBta6b6KiYnAUKKxXVVCW/QEA
 dnzkew3kxNBNi/0Ag4mq7Xvn6cMKbmtbWcJs0l7NVVe7UqE8H95M2JwYYTBpOz6fJXokKMoozr9
 w6b6rWPMYAYBi45ToTw==
X-Received: by 2002:aa7:df0a:: with SMTP id c10mr199711edy.238.1583416603048; 
 Thu, 05 Mar 2020 05:56:43 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtMMuF3NHZ3FPPsEJfWj8F0do5cjsNbDycTdIV5G5zj17Wgb1Bw9frPEDlvl7f2owEbYi0Daw==
X-Received: by 2002:aa7:df0a:: with SMTP id c10mr199683edy.238.1583416602766; 
 Thu, 05 Mar 2020 05:56:42 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id ss15sm1567041ejb.10.2020.03.05.05.56.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2020 05:56:41 -0800 (PST)
Subject: Re: [PATCH v2 0/9] hw, ui, virtfs-proxy-helper: Reduce QEMU
 .data/.rodata/.bss footprint
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang
 <jasowang@redhat.com>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Greg Kurz <groug@kaod.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <20200305124525.14555-1-philmd@redhat.com>
 <20200305134229.GB2112347@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a7c0746f-75dc-99ed-62df-26f26cf23ec0@redhat.com>
Date: Thu, 5 Mar 2020 14:56:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200305134229.GB2112347@redhat.com>
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
X-List-Received-Date: Thu, 05 Mar 2020 13:56:52 -0000

On 3/5/20 2:42 PM, Daniel P. Berrang=C3=A9 wrote:
> On Thu, Mar 05, 2020 at 01:45:16PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
>> Since v1:
>> - merged 2 series
>> - reworked hw/usb/quirks
>> - added R-b/A-b tags
>>
>> This series reduce the footprint of the QEMU binary:
>> .bss: 106KiB (moved to .heap)
>=20
> Did this actually have an impact on the binary size, or just on the
> size the elf-dissector reports ?  I'm not very familiar with ELF,
> but Wikipedia's description of BSS makes me question it...
>=20
>    "Typically only the length of the bss section, but no data,
>     is stored in the object file. The program loader allocates
>     memory for the bss section when it loads the program. On
>     some platforms, some or all of the bss section is initialized
>     to zeroes. Unix-like systems and Windows initialize the bss
>     section to zero"
>=20
> This suggests .bss has no on-disk overhead, only runtime overhead,
> which is presumably going to be the same with heap allocations.

IIUC when stored in the .bss, the buffer are always allocated in memory,=20
even if not used. By moving them to the .heap, we only allocate them=20
when using either the adlib audio device or curses.

>=20
>> .data: 1MiB
>> .rodata: 4.34MiB
>=20
> These looks useful though in terms of disk footprint.

Memory footprint is more important than disk footprint, but harder to=20
track/manage.

>=20
>> (sizes on x86_64 building with -Os)
>>
>> The elf-dissector tool [1] [2] helped to notice the big array.
>>
>> [1] https://phabricator.kde.org/source/elf-dissector/
>> [2] https://www.volkerkrause.eu/2019/06/22/elf-dissector-aarch64-support=
.html
>> [heap equivalent tool working with QEMU: https://github.com/KDE/heaptrac=
k]
>>
>> Supersedes: <20200304221807.25212-1-philmd@redhat.com>
>> Supersedes: <20200305010446.17029-1-philmd@redhat.com>
>>
>> Philippe Mathieu-Daud=C3=A9 (9):
>>    hw/audio/fmopl: Fix a typo twice
>>    hw/audio/fmopl: Move ENV_CURVE to .heap to save 32KiB of .bss
>>    hw/audio/intel-hda: Use memory region alias to reduce .rodata by
>>      4.34MB
>>    hw/net/e1000: Add readops/writeops typedefs
>>    hw/net/e1000: Move macreg[] arrays to .rodata to save 1MiB of .data
>>    hw/usb/quirks: Use smaller types to reduce .rodata by 10KiB
>>    ui/curses: Make control_characters[] array const
>>    ui/curses: Move arrays to .heap to save 74KiB of .bss
>>    virtfs-proxy-helper: Make the helper_opts[] array const
>>
>>   hw/usb/quirks.h             | 22 +++++++++++++---------
>>   fsdev/virtfs-proxy-helper.c |  2 +-
>>   hw/audio/fmopl.c            |  8 +++++---
>>   hw/audio/intel-hda.c        | 24 ++++++++++--------------
>>   hw/net/e1000.c              |  6 ++++--
>>   hw/net/e1000e_core.c        |  6 ++++--
>>   hw/usb/quirks.c             |  4 ++--
>>   ui/curses.c                 | 10 +++++++---
>>   8 files changed, 46 insertions(+), 36 deletions(-)
>>
>> --=20
>> 2.21.1
>>
>>
>=20
> Regards,
> Daniel
>=20


