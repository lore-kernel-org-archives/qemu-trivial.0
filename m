Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iRkJO-0001Yn-JP
	for mharc-qemu-trivial@gnu.org; Mon, 04 Nov 2019 16:54:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38393)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iRkJM-0001YC-4d
 for qemu-trivial@nongnu.org; Mon, 04 Nov 2019 16:54:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iRkJK-0007NK-3r
 for qemu-trivial@nongnu.org; Mon, 04 Nov 2019 16:54:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49656)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iRkJJ-0007KW-SU
 for qemu-trivial@nongnu.org; Mon, 04 Nov 2019 16:54:54 -0500
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 903FA5AFD5
 for <qemu-trivial@nongnu.org>; Mon,  4 Nov 2019 21:54:51 +0000 (UTC)
Received: by mail-wr1-f69.google.com with SMTP id g17so6355338wru.4
 for <qemu-trivial@nongnu.org>; Mon, 04 Nov 2019 13:54:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BqaclnhIeRZoAy2jktmnNSt0bRyebT0TfIUREC2+X6A=;
 b=CCr4WzUbp2zt+u199wmf4+YFSvyf2uIRbfIdDp1JQImbo0Dlj4ZIa+VX0YQVXyY7Tk
 3tLVVvIces/iJ7zJh4Ef91S90NrvCNMQn3r7uLKLaLmZaUzAjoRzfanWyJaqg7suvgV+
 o4njaxQtTMe9/9e1OM6WRCojPGeAekQXuYUseTh3OgzJENkXOe3wzE6HNAqt+tGjFH0a
 X4GWWTg1u4R2jQbnS7ozj2oDclY0TfH6CVt/aksdidCnLmBE8nAat8vS3hb/I10jY6fi
 UbGoR4a/pPAYSDeEtO/AUnAfzw4VoYTJmUZIbnxAFr8R3JEpWgfxc7u1kFgP5wbPi8pX
 uvMw==
X-Gm-Message-State: APjAAAWGArKKje/c/94VZNJhrYDJXYPC+kHGCoTZsNVUwyaHRSECqe8s
 E7Pb4FVmY9o4pfSXBWp/xPJVq60mR97iZfVhK238K7Rx/wIpIBrHwDgvYhbnMDVxxHSMeTpsKor
 gjZhpxaf1NqbSIoZTRw==
X-Received: by 2002:a5d:4701:: with SMTP id y1mr26555471wrq.385.1572904490338; 
 Mon, 04 Nov 2019 13:54:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqx7f2zV4SdY2c+gEBBIJpCpf6DV8UgIFOhKqNLS7hdKEuSAg8vepnEeet1BiaUN2V+cG+9Paw==
X-Received: by 2002:a5d:4701:: with SMTP id y1mr26555460wrq.385.1572904490148; 
 Mon, 04 Nov 2019 13:54:50 -0800 (PST)
Received: from [192.168.1.24] (lfbn-1-7864-228.w92-167.abo.wanadoo.fr.
 [92.167.33.228])
 by smtp.gmail.com with ESMTPSA id l5sm16340582wmj.44.2019.11.04.13.54.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2019 13:54:49 -0800 (PST)
Subject: Re: [PATCH] global: Squash 'the the'
To: qemu-devel@nongnu.org, no-reply@patchew.org, dgilbert@redhat.com
Cc: peter.maydell@linaro.org, sstabellini@kernel.org,
 qemu-trivial@nongnu.org, mjt@tls.msk.ru, laurent@vivier.eu,
 marcandre.lureau@redhat.com, david@gibson.dropbear.id.au
References: <157290359988.27285.16497763825853147226@37313f22b938>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <86ede4a8-caf7-70b9-367b-9821373aa0f3@redhat.com>
Date: Mon, 4 Nov 2019 22:54:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <157290359988.27285.16497763825853147226@37313f22b938>
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
X-List-Received-Date: Mon, 04 Nov 2019 21:54:57 -0000

On 11/4/19 10:40 PM, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20191104185202.102504-1-dgilbert@=
redhat.com/
>=20
> Hi,
>=20
> This series failed the docker-quick@centos7 build test. Please find the=
 testing commands and
> their output below. If you have Docker installed, you can probably repr=
oduce it
> locally.
>=20
> =3D=3D=3D TEST SCRIPT BEGIN =3D=3D=3D
> #!/bin/bash
> make docker-image-centos7 V=3D1 NETWORK=3D1
> time make docker-test-quick@centos7 SHOW_ENV=3D1 J=3D14 NETWORK=3D1
> =3D=3D=3D TEST SCRIPT END =3D=3D=3D
>=20
>    TEST    iotest-qcow2: 009
>    TEST    iotest-qcow2: 010
> **
> ERROR:/tmp/qemu-test/src/tests/migration-test.c:903:wait_for_migration_=
fail: assertion failed: (!strcmp(status, "setup") || !strcmp(status, "fai=
led") || (allow_active && !strcmp(status, "active")))
> ERROR - Bail out! ERROR:/tmp/qemu-test/src/tests/migration-test.c:903:w=
ait_for_migration_fail: assertion failed: (!strcmp(status, "setup") || !s=
trcmp(status, "failed") || (allow_active && !strcmp(status, "active")))
> make: *** [check-qtest-aarch64] Error 1
> make: *** Waiting for unfinished jobs....

=3D)

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

