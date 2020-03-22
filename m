Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFxUz-0007ZZ-Am
	for mharc-qemu-trivial@gnu.org; Sun, 22 Mar 2020 06:06:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60313)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jFxUx-0007ZH-8A
 for qemu-trivial@nongnu.org; Sun, 22 Mar 2020 06:06:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jFxUv-0000KV-W9
 for qemu-trivial@nongnu.org; Sun, 22 Mar 2020 06:06:26 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:36522)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jFxUv-0000KA-Qh
 for qemu-trivial@nongnu.org; Sun, 22 Mar 2020 06:06:25 -0400
Received: by mail-ot1-x344.google.com with SMTP id l23so373574otf.3
 for <qemu-trivial@nongnu.org>; Sun, 22 Mar 2020 03:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ryzb8jsMV/qdGmn+hrgo/gcbGJo4ASGPLNLkL8no564=;
 b=vIKlVQ8Oy+dRcEuCUppjO0yTQji57IE4tafgPNj0yxJIbO/jfVhiI1H5X4fMbWiGYZ
 K9wl7dbTgPJj4JrnEknjWMGO+47NhT+bE4pl8FRDNVpYihAcBWqDvjC2ZwoCOhQfD5ar
 MWgpk4NhFUeIGU68+emRwkDtrzGJr5bi1him+RqWvh0PCKCCaEouH3uVB7NJxwJtOUkG
 ukDiuCP6wv99gMLW5q3dC+WIdqJ1JWUPHIqRAQ+ql9WVqRNLNDUX+fGRR7LSnBdk4epv
 NkmJjnmvwYofiAKIwAh8FH1p1C5z3/q7mURKf7gL0c0EZza/Kq/k5E5ZJ+kJ2M+UNed3
 MXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ryzb8jsMV/qdGmn+hrgo/gcbGJo4ASGPLNLkL8no564=;
 b=Nyw0uV+jq5OfUw3meHwu4uXU9c0HXX2lfqa8pM2aagx/3FEgSQlI5pzU+YcloLW8Lt
 uPH6IJeIyZVl0MzukP5tyHymyxy00DrWT2jdFund5T6aZmyddVHR56oi9JMPdidE75zJ
 usJLnHbOWQ1MUfWxVCwVg0xz2IbNQl1ZnP8fb+aNJ2zmt40R2rtJyGn1xpezeA2dhlHY
 mvwVEGn9TOuwoOAGAV6m4uKGuMKJF2ashxQimafvfvxw2oqB/jy6whzCY1K5IwUeMIp7
 ozHfIYTTdUlSp34PG+sNzF0O6LRygxGkvmglZBmYtLijLEWXuI9nt5HbJHqOfouwXHow
 On/w==
X-Gm-Message-State: ANhLgQ3A6sKqTO5AndOddPF4pxmw83DjJVi7qgBn3FoY1/fmtzWD8t/R
 Jj5RHg9o7KDwJ9KAJF17qkM/ojiVD0XapKgLnsKtJg==
X-Google-Smtp-Source: ADFU+vuEgVqPXo1eIWrGVx4TuDXYSOm0lUGe+Xpk8ug6wb5T4BnGOradRSTddq6tql84H0rVSSKkKS4wUm1fnQj3RfI=
X-Received: by 2002:a9d:1920:: with SMTP id j32mr13144887ota.221.1584871584821; 
 Sun, 22 Mar 2020 03:06:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200320155740.5342-1-philmd@redhat.com>
 <20200322084608.GI781112@umbus.fritz.box>
In-Reply-To: <20200322084608.GI781112@umbus.fritz.box>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 22 Mar 2020 10:06:13 +0000
Message-ID: <CAFEAcA-TPqVN98T=tYAOyQ4JPj8iu+eB3Zi-txgV+GUgcHNjCQ@mail.gmail.com>
Subject: Re: [PATCH] ppc/ppc405_boards: Remove unnecessary NULL check
To: David Gibson <david@gibson.dropbear.id.au>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 QEMU Developers <qemu-devel@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>, 
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
X-List-Received-Date: Sun, 22 Mar 2020 10:06:28 -0000

On Sun, 22 Mar 2020 at 08:50, David Gibson <david@gibson.dropbear.id.au> wr=
ote:
>
> On Fri, Mar 20, 2020 at 04:57:40PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > This code is inside the "if (dinfo)" condition, so testing
> > again here whether it is NULL is unnecessary.
> >
> > Fixes: dd59bcae7 (Don't size flash memory to match backing image)
> > Reported-by: Coverity (CID 1421917)
> > Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> Applied to ppc-for-5.1.

This would be OK for 5.0 too at this stage.

thanks
-- PMM

