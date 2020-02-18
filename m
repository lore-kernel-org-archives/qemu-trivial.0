Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j3zMA-0005Rw-6b
	for mharc-qemu-trivial@gnu.org; Tue, 18 Feb 2020 04:39:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42538)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zM4-0005Ir-Dy
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:39:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zM2-0003qQ-4u
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:39:48 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:59516
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zM2-0003py-1t
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:39:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582018785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SDpZh9t8LLET6RXRGhAckHvfEVt6l0LA4TOOOjdMTRY=;
 b=NFQjUDO2hrSCp8d61qyir9k38i/wqhJIIYyJDMecN91E8D/npsFXZSsL1K7H/3J59O5hAN
 7IBMRbQmoLysa/R0dHCueWRfIFK8Pf8EC51qG9VQlFJYi+XA2V0NJMIN1QnrLxcMXBC99N
 4Ls/r7rXBcljOe0pDvPDQ5X0wgZkckQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-Q7Q2eYkuM8a1_t1HGmzOCA-1; Tue, 18 Feb 2020 04:39:40 -0500
Received: by mail-wm1-f71.google.com with SMTP id y7so875220wmd.4
 for <qemu-trivial@nongnu.org>; Tue, 18 Feb 2020 01:39:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1g/C6QYaKp+orHyEvN3jLzhLeWKUCNsgpCmrU0OhnIk=;
 b=dChoVh1tZ6FZjeJvYV62rorQbSFWw4vjMg0RTnyf1oMu7fguc5iMaPkcCWp2cp9EF9
 HhIDcRShZXLyMIY/viVQaG+5LpUee7zfmYxRxyn55gXUExv3gqeQeyKr0uFi99LkMWAF
 MXRNVxnkF937V0dcly3yQQLtVPrUB8Em9bVIN2AUWhaSXjnDQWMTAKDOLYeqYGZbmykH
 Bcg98jKZHG8OAPCCojkgG7DjTkwrXg20uZBUEuWXJnJ1/1Wd4hocrvQKXaKIlRFhoBHM
 wcA+hejWTV7+OYzl2bx1J/q1oVuLvpmujBb01yBMFV8+Jiqx7og+xHfmjPde6bUzneQX
 WP8A==
X-Gm-Message-State: APjAAAXNfHC12tQ8DzozUbUWHxxWTPFiNuH3EZD9Qpeca1yxzO2Y7BbW
 IggTUq0+0joquOYZ7XSl+b/27kQmN0YMTqR4uCFQywKmI+t2aspvAeDEhfibZkbed6i+k115eEE
 YdF1Y6ZJROs2KT3cUsA==
X-Received: by 2002:adf:e3cd:: with SMTP id k13mr1489917wrm.302.1582018779821; 
 Tue, 18 Feb 2020 01:39:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqzOTIhAo2sGoUQNcga8XH3kVCe0py6m2/WE6Df8EmJr/OFkr6cK80YvNJTw2wnEhWmy3WCIWw==
X-Received: by 2002:adf:e3cd:: with SMTP id k13mr1489862wrm.302.1582018779527; 
 Tue, 18 Feb 2020 01:39:39 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id k10sm5362253wrd.68.2020.02.18.01.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2020 01:39:39 -0800 (PST)
Subject: Re: [PATCH 00/13] trivial: Detect and remove superfluous semicolons
 in C code
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Luc Michel <luc.michel@greensocs.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Richard Henderson <rth@twiddle.net>,
 qemu-block@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Thomas Huth <huth@tuxfamily.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Alistair Francis
 <alistair@alistair23.me>, qemu-trivial@nongnu.org,
 Julia Suvorova <jusual@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Fam Zheng <fam@euphon.net>
References: <20200218093217.25156-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <11b9a381-b0c2-1817-bed5-d00f000b5af5@redhat.com>
Date: Tue, 18 Feb 2020 10:39:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200218093217.25156-1-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: Q7Q2eYkuM8a1_t1HGmzOCA-1
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
X-List-Received-Date: Tue, 18 Feb 2020 09:39:49 -0000

On 2/18/20 10:32 AM, Philippe Mathieu-Daud=C3=A9 wrote:
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

Series incomplete, git-send-email aborted:

Sent [PATCH 00/13] trivial: Detect and remove superfluous semicolons in=20
C code
Sent [PATCH 01/13] scripts/checkpatch.pl: Detect superfluous semicolon=20
in C code
5.5.2 Syntax error. v8sm5146891wrw.2 - gsmtp


