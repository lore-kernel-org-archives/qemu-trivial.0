Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lt5Xw-0006Y5-OK
	for mharc-qemu-trivial@gnu.org; Tue, 15 Jun 2021 05:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt5Xv-0006X5-7P
 for qemu-trivial@nongnu.org; Tue, 15 Jun 2021 05:39:47 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:36472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt5Xs-0007oe-Ok
 for qemu-trivial@nongnu.org; Tue, 15 Jun 2021 05:39:47 -0400
Received: by mail-ed1-x52d.google.com with SMTP id w21so50134776edv.3
 for <qemu-trivial@nongnu.org>; Tue, 15 Jun 2021 02:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pulNoykRMx+z3icLctvOAVQt/tn9x/G9PH4lXKSPJ4w=;
 b=QSAlwC3RKE+NEaMuvht6sStMRShZQOLJivqB/E3LrR96AhJjTg0SSawzJTti9sVCcK
 mUAgyqDhkGaYfZ+PvJJYFvQzRaYI28A9AeOHgCxVmYzywqKu2mK7Scl3RxxJzWb+oflL
 N72B3n1jTaCq/xLQuIYNj6IBkXTWCLEzxNuykR7LVxaUsSHQKyOFVkHRpbYvd1+SwTht
 HNPgDGTSSRaEw5j+lWWd7WHPP8oF+XDmBVIxtYQWWDTRCldRjTizvWs2HjIgYTQZsZom
 MDJRQb5IsRoIBDLafcwqpwQMSrEMAfgtZECxwQQqaDj28tSeTw0P+9qDhO0EtGy+Sbjz
 9ziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pulNoykRMx+z3icLctvOAVQt/tn9x/G9PH4lXKSPJ4w=;
 b=rN99cPPat+344S0aTDOUHObYjBm3yZ5d+LgT2CFQ3ALdaj5rJfo4iiy/VNpnsyG1c8
 hNExftoFdQxZqZEGjFAOJ6NnGZIJTXRqz1HS5dzduxph81jLtuCMRPr+UhX49NxRYhd0
 EY3uDyhnnYwsCMOzaNJwZmTsWAcYxJVyt+KlTS4j136sY8etXQ/dxYRY4gjeCbsKHY3e
 nCy4BBP9E5wWbo256m9NxswgUx50XIs5G4Vjbji9hieS19mfgPkgyZjRkst/2Lyg+ugw
 qUbe8UBAFG9aICXfc87E7sqpEvhc93imfWaSlNmTVu95CIPdeq7yanCwQ4T3RAKYqPvy
 teKg==
X-Gm-Message-State: AOAM530Xnif4Bc2s9Di3dajFlzRR7WZ13te0LGOuTfXKg7YyQGzW9dzf
 D6UnwEd7o1cUHNNQdUe4e3Wj0x5ZZSpww270d9qq6g==
X-Google-Smtp-Source: ABdhPJw4BtgHZRPaJkPaAK0URY5kK0+LgXahi8e9eo52CNWKnHCq7NO1dRKCMJGnbqdpoZ3FqyCd4j1/1/j87f+H1Fw=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr21847236edt.100.1623749982990; 
 Tue, 15 Jun 2021 02:39:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210614052623.1657103-1-f4bug@amsat.org>
In-Reply-To: <20210614052623.1657103-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Jun 2021 10:39:08 +0100
Message-ID: <CAFEAcA9HCGizgTFNMZ3N2xECYgGmwxFhg=T_oGTdC=xULcwFZQ@mail.gmail.com>
Subject: Re: [RFC PATCH] migration: Add missing dependency on GNUTLS
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Leonardo Bras <leobras.c@gmail.com>, 
 Lukas Straub <lukasstraub2@web.de>, "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>, 
 Stefan Weil <sw@weilnetz.de>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Tue, 15 Jun 2021 09:39:47 -0000

On Mon, 14 Jun 2021 at 06:28, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Commit 7de2e856533 made migration/qemu-file-channel.c include
> "io/channel-tls.h" but forgot to add the new GNUTLS dependency
> on Meson, leading to build failure on OSX:
>
>   [2/35] Compiling C object libmigration.fa.p/migration_qemu-file-channel=
.c.o
>   FAILED: libmigration.fa.p/migration_qemu-file-channel.c.o
>   cc -Ilibmigration.fa.p -I. -I.. -Iqapi [ ... ] -o libmigration.fa.p/mig=
ration_qemu-file-channel.c.o -c ../migration/qemu-file-channel.c
>   In file included from ../migration/qemu-file-channel.c:29:
>   In file included from include/io/channel-tls.h:26:
>   In file included from include/crypto/tlssession.h:24:
>   include/crypto/tlscreds.h:28:10: fatal error: 'gnutls/gnutls.h' file no=
t found
>   #include <gnutls/gnutls.h>
>            ^~~~~~~~~~~~~~~~~
>   1 error generated.
>
> Reported-by: Stefan Weil <sw@weilnetz.de>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/407
> Fixes: 7de2e856533 ("yank: Unregister function when using TLS migration")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Is there really no way to get Meson to handle this kind
of thing properly (ie "just put all the include paths in the CFLAGS
for every compilation") rather than requiring us to add dependency
markers all over the meson.build files every time we add some
extra #include somewhere ? This is demonstrably horribly fragile
the way we have it at the moment :-(

-- PMM

