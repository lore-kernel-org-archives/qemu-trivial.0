Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i2wts-0000Md-0q
	for mharc-qemu-trivial@gnu.org; Wed, 28 Aug 2019 08:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49259)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i2wtb-0000Ld-SO
 for qemu-trivial@nongnu.org; Wed, 28 Aug 2019 08:17:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i2wtU-0001DN-UY
 for qemu-trivial@nongnu.org; Wed, 28 Aug 2019 08:17:48 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:54122)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i2wtT-0001AF-Ln
 for qemu-trivial@nongnu.org; Wed, 28 Aug 2019 08:17:44 -0400
Received: by mail-wm1-x32a.google.com with SMTP id 10so2544159wmp.3
 for <qemu-trivial@nongnu.org>; Wed, 28 Aug 2019 05:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=SO/+ZxrrXNaUWmQQTIrNTUOGXFIFu5F/dnetblKU2kE=;
 b=r5Donwk5NZaWRIjw2rihu98vBFVsoAweWLPorPcVsEU5a4hpbhNkTfJ3Dbk6QsVSMV
 JUWLrbVcxVJrVM8vJp4dd+21MI3IY1Bf8wYe5Y38TB5NQcJlXDkDfX7MepYC8T+Rzzyb
 g1z080/EXEtPMsZMI5oWhK+flwrmDx7bE2YXHOKpriTtXNzNMQxb8Gs1YUhaoQ79H8PA
 XyE00jcjBgCiiTxuu+zz3ahihtRb+Wz+TSCjCQiN2x5C/xXo0KubglaHLArys02LbhmK
 RetIgqlfGISUdVDD0wb0hEStq56lNoghtQcoaBmQYsOzhYijCfQRsSw8tuUVo9obzgZX
 fRUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=SO/+ZxrrXNaUWmQQTIrNTUOGXFIFu5F/dnetblKU2kE=;
 b=GCNF0ZA8KqiTGT8YA2zEtILGgPmwqveA6No0g9XCvvMR5hdU3epOAx7qKhoUbR2Vtd
 flRYJb7v5c92mIgG8z0wPmWP+9KeUen2B/bX4BQuSBlST/U01mPQsSgla31uVwR+FIUB
 VQb1DNrySrAiaaDXGx/8e7TBg6zrHR1QrEo5/VnYJHjA3xSQoyCbPcV3TUxshWKlz9+0
 RaM4EuE9DMT+TtmQ5D6ERDg4UpSwxEFAKPzmF0h8xbUPJn9UExONIFtZz9if1EZ+Vbns
 6QXQFSOLEmVx3G9e0AV5zrURVSHgKrADKDzvhREG30qF3aCPE3eqKB4sqNGcGKkKHs8w
 rsGQ==
X-Gm-Message-State: APjAAAV1t4UCufPT54uZ9Y+KUY2wS8TSth5XDQXsGDYvZRgNH+EQzDdm
 F9kQoRj2s1qbS53oBQfoxtYbuDTn9nk=
X-Google-Smtp-Source: APXvYqwnXdmU5BqBMg/mJC9oku4d9bYLA5xPpy9GUU/B+V9N2Aef08vCI6H/nfq0pEg51ct/ovwunA==
X-Received: by 2002:a1c:107:: with SMTP id 7mr4602380wmb.84.1566994661800;
 Wed, 28 Aug 2019 05:17:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s64sm6538507wmf.16.2019.08.28.05.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 05:17:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 695C91FF87;
 Wed, 28 Aug 2019 13:17:40 +0100 (BST)
References: <20190822231231.1306-1-philmd@redhat.com>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
In-reply-to: <20190822231231.1306-1-philmd@redhat.com>
Date: Wed, 28 Aug 2019 13:17:40 +0100
Message-ID: <87ftll5vrv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32a
Subject: Re: [Qemu-trivial] [PATCH] contrib/gitdm: Add RT-RK to the
 domain-map
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
X-List-Received-Date: Wed, 28 Aug 2019 12:18:00 -0000


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> This company has at least 7 contributors, add a domain-map entry.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Opps I missed this one and added my own version this morning.

> ---
>  contrib/gitdm/domain-map | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
> index fa9d454473..9efe066ec9 100644
> --- a/contrib/gitdm/domain-map
> +++ b/contrib/gitdm/domain-map
> @@ -18,6 +18,7 @@ nokia.com       Nokia
>  oracle.com      Oracle
>  proxmox.com     Proxmox
>  redhat.com      Red Hat
> +rt-rk.com       RT-RK
>  siemens.com     Siemens
>  sifive.com      SiFive
>  suse.de         SUSE


--
Alex Benn=C3=A9e

