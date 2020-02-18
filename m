Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j3zOK-0007oy-8b
	for mharc-qemu-trivial@gnu.org; Tue, 18 Feb 2020 04:42:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42773)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zOI-0007md-4G
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:42:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zOH-0004nK-1c
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:42:06 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27489
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zOG-0004n5-UY
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:42:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582018924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2lRg00utCoXLvEMHvhnMiAsgpOV7NsemGMGxrPmPJgc=;
 b=WMDSd3sVa4X9pwXcxIPXDtzVYNOmFa/06yFu0TsZor56ONVKc+R1M/Uw0pw3n1/3n2XsFE
 eHkaNF+/Pi2JtePREBgnJAj4s8/zSjn9zGlq/ZvM58kSr5RkmKU6uMjEevSbCIWTvdxmqs
 daBU/lvW9QIErGzrfy65Hzg5ilfS5Ao=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-8n4nVSj5PmihozmFGusuQg-1; Tue, 18 Feb 2020 04:42:02 -0500
Received: by mail-wm1-f72.google.com with SMTP id g138so228257wmg.8
 for <qemu-trivial@nongnu.org>; Tue, 18 Feb 2020 01:42:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=66Ntbv0X0m09s77Ux7unmL4nTH6VUea47MP7vHegJxA=;
 b=X9OeYCgnenLIPG/6KXq/iCfm8vbtQdz6u7qX+V9FXfFu6foHgi0+atCC3yY/2bQ2rY
 8PjjritTYKCLgB0X3fWToQAmXlIzhE6ejP/VIQHHAjcADVPY3TON/fK8MR0rU2OzyVB6
 WxJsLZtIJFOly6f1BC4kUPHwGn/SB+wrJcG6bDX+9Nv2Tt/Xu7vKpHP9L8rM9xbskU6X
 PfdSJyCVaZQ1LB7gHZ4O6tdCdKiLjwehHbDXYx4rmai/uMaSwWjW3pSEX4R0M3d7H142
 RT50TPU4m7eZXVexUAT3J2UeONCVnTloQoBIkK1iW227RdztTWACeMJZ9pvbRzkMPDWe
 6ZeQ==
X-Gm-Message-State: APjAAAWf83iMrWJtK4LZS4bKohFfmGZsNpI9luXOVJT7ddJ1y7Vilye1
 JfTo+YGuq/Lm5mxDl8RkR+mEz68nPCguHIlmdsSeu2jB5Lh0s4/BXkSqKwpuGoPzbqbc6O68JIU
 px4rTnrlSC2FdE+qIuQ==
X-Received: by 2002:adf:e2cf:: with SMTP id d15mr28157524wrj.225.1582018921240; 
 Tue, 18 Feb 2020 01:42:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqw2AXJ0thpIvO2iOxXU/Y1Ab6veD5kV027akG5IebpocALy21A7cS6wXnpbaAx2Ep9UdEk3dw==
X-Received: by 2002:adf:e2cf:: with SMTP id d15mr28157498wrj.225.1582018921011; 
 Tue, 18 Feb 2020 01:42:01 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id g21sm2788515wmh.17.2020.02.18.01.41.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2020 01:42:00 -0800 (PST)
Subject: Re: [PATCH 00/13] trivial: Detect and remove superfluous semicolons
 in C code
To: qemu-devel@nongnu.org
Cc: Thomas Huth <huth@tuxfamily.org>, Julia Suvorova <jusual@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Luc Michel <luc.michel@greensocs.com>,
 Laurent Vivier <lvivier@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <rth@twiddle.net>, qemu-block@nongnu.org,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
References: <20200218093720.25640-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f4133050-49ad-f517-740b-1460e88ed79e@redhat.com>
Date: Tue, 18 Feb 2020 10:41:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200218093720.25640-1-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: 8n4nVSj5PmihozmFGusuQg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
X-List-Received-Date: Tue, 18 Feb 2020 09:42:07 -0000

On 2/18/20 10:37 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> Luc noticed a superfluous trailing semicolon:
> https://lists.gnu.org/archive/html/qemu-devel/2020-02/msg04593.html
>=20
> Prevent that by modifying checkpatch.pl and clean the codebase.
>=20
> Philippe Mathieu-Daud=C3=A9 (13):
>    scripts/checkpatch.pl: Detect superfluous semicolon in C code
>    audio/alsaaudio: Remove superfluous semicolons
>    block: Remove superfluous semicolons
>    block/io_uring: Remove superfluous semicolon
>    hw/arm/xlnx-versal: Remove superfluous semicolon
>    hw/m68k/next-cube: Remove superfluous semicolon
>    hw/scsi/esp: Remove superfluous semicolon
>    hw/vfio/display: Remove superfluous semicolon
>    migration/multifd: Remove superfluous semicolon
>    ui/input-barrier: Remove superfluous semicolon
>    target/i386/whpx: Remove superfluous semicolon
>    tests/qtest/libqos/qgraph: Remove superfluous semicolons
>    contrib/rdmacm-mux: Remove superfluous semicolon

Please ignore this incomplete series, git-send-email aborted again:

Sent [PATCH 00/13] trivial: Detect and remove superfluous semicolons in=20
C code
Sent [PATCH 01/13] scripts/checkpatch.pl: Detect superfluous semicolon=20
in C code
5.5.2 Syntax error. v8sm5146891wrw.2 - gsmtp

Offending recipient is: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <DirtY.iCE.hu@gm=
ail.com> which=20
probably needs quoting.


