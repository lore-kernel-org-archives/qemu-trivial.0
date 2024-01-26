Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rTOIT-0002rM-32
	for mharc-qemu-trivial@gnu.org; Fri, 26 Jan 2024 10:39:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rTOIR-0002i7-Iw
 for qemu-trivial@nongnu.org; Fri, 26 Jan 2024 10:39:11 -0500
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rTOIP-0007ng-SI
 for qemu-trivial@nongnu.org; Fri, 26 Jan 2024 10:39:11 -0500
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2cc9fa5e8e1so5149051fa.3
 for <qemu-trivial@nongnu.org>; Fri, 26 Jan 2024 07:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706283547; x=1706888347; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KgFBM226wXASqzVFP2tWEDF0GEwEPS14SZjGnM7W1U8=;
 b=GTWPDIKHT02dT5cvU1Gqua7j+/dSqZV92WrgLgxsXPyCD58xv4GdksZF+TJEaf+i4u
 VvFbhDzz5JH3UHvei5FoSYrxBpDDxG9YBIxCDkkxC2DNP9LChKZEpUhg5eESEgsgs9RG
 AFC58N/yr3mD8sPUhLBkVAFVGxPaQEXf979bRxno229wOlD4D+OG9GGM87GgQgKP68fp
 g57mTXOHNZWuAAhgc8YKUs3UYFm84kNxPwCbPR7zJj6awT70KTWQy0152wOA9nrBD+xp
 w0vGTc3DgiXG7laF7yGizYIY9PnKvm5ak9djvKT4dt3VQhqO9ABc7/+7iKdfgHjz8Ga9
 KcEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706283547; x=1706888347;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KgFBM226wXASqzVFP2tWEDF0GEwEPS14SZjGnM7W1U8=;
 b=JtAvE1qq4KavJs8NH1frc+HjNXLWFTPEwuhx0tBYbElafZp3WSYzQCVk7azy2txBU/
 7fA/ywV2a/s50JOOeJ6yJZdMBucAJktXIwXK4oCv8Iw8AFb+bIQlAyXTgXc/O7050VCM
 05h1QAxe1dA9tN2vyn9PPMDzyocspltPtRNDlT6gqSB1sG+EOi2CxeYePi8pFVjDPtvB
 WpMYoy3Fu/XxlwQS7/pv436JJfUO2so41EEOxS7FK1oDkPTg/y28L+IM4T1Ns3BKT6f+
 lh0Ol09T2RGnDjJwEBVoH5ld1DicZNcE0C5l2uDYeUw0JOlNbH1fb5xvj6vT5pXrLRBl
 Vv5w==
X-Gm-Message-State: AOJu0YwmAu+xfUQWx/nZkfBX/rvoIoMLXRVyGB4yScA1WMaGWvG+1FA0
 nSejRzIyaNqr64YEoAqH1cUDEkePPbRSmWJ9EN33/pUL+EWcp9LiqOT3ej6Ti+mj5QgR6S9JkA4
 OOozW/QU4K6JMYOSm0AUGjcdRjkYN6tzdrsu6DA==
X-Google-Smtp-Source: AGHT+IHGU/QlYzUZxb44eWShd620rBao9XgACHHt5E87FXbH3yWyUSsiER+nVvCJIe59ovS52owS5eo2pNlwJOhpPSI=
X-Received: by 2002:a05:651c:204d:b0:2cf:2ba3:e3d1 with SMTP id
 t13-20020a05651c204d00b002cf2ba3e3d1mr930943ljo.38.1706283547433; Fri, 26 Jan
 2024 07:39:07 -0800 (PST)
MIME-Version: 1.0
References: <20240125163408.1595135-1-peter.maydell@linaro.org>
 <20240125163408.1595135-5-peter.maydell@linaro.org>
 <ZbPSQUQ2UXhLQbRN@intel.com>
In-Reply-To: <ZbPSQUQ2UXhLQbRN@intel.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jan 2024 15:38:56 +0000
Message-ID: <CAFEAcA9aiYeYRyw68Kh0if+q0__MR6HTUBuDRRuPoEbB54xg3g@mail.gmail.com>
Subject: Re: [PATCH 04/10] aspeed: Clean up includes
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Jan 2024 15:39:11 -0000

On Fri, 26 Jan 2024 at 15:26, Zhao Liu <zhao1.liu@intel.com> wrote:
>
> On Thu, Jan 25, 2024 at 04:34:02PM +0000, Peter Maydell wrote:
> > Date: Thu, 25 Jan 2024 16:34:02 +0000
> > From: Peter Maydell <peter.maydell@linaro.org>
> > Subject: [PATCH 04/10] aspeed: Clean up includes
> > X-Mailer: git-send-email 2.34.1
> >
> > This commit was created with scripts/clean-includes.
> >
> > All .c should include qemu/osdep.h first.  The script performs three
> > related cleanups:
> >
> > * Ensure .c files include qemu/osdep.h first.
> > * Including it in a .h is redundant, since the .c  already includes
> >   it.  Drop such inclusions.
> > * Likewise, including headers qemu/osdep.h includes is redundant.
> >   Drop these, too.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  hw/arm/aspeed_eeprom.h     | 1 -
> >  tests/qtest/qtest_aspeed.h | 2 --
> >  hw/arm/aspeed_eeprom.c     | 1 +
> >  3 files changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/hw/arm/aspeed_eeprom.h b/hw/arm/aspeed_eeprom.h
> > index bbf9e54365b..f08c16ef506 100644
> > --- a/hw/arm/aspeed_eeprom.h
> > +++ b/hw/arm/aspeed_eeprom.h
> > @@ -7,7 +7,6 @@
> >  #ifndef ASPEED_EEPROM_H
> >  #define ASPEED_EEPROM_H
> >
> > -#include "qemu/osdep.h"
> >
> >  extern const uint8_t tiogapass_bmc_fruid[];
> >  extern const size_t tiogapass_bmc_fruid_len;
> > diff --git a/tests/qtest/qtest_aspeed.h b/tests/qtest/qtest_aspeed.h
> > index 235dfaa186a..d35b0c7cba5 100644
> > --- a/tests/qtest/qtest_aspeed.h
> > +++ b/tests/qtest/qtest_aspeed.h
> > @@ -12,8 +12,6 @@
> >  #ifndef QTEST_ASPEED_H
> >  #define QTEST_ASPEED_H
> >
> > -#include <stdint.h>
> > -
> >  #include "libqtest.h"
> >
> >  #define AST2600_ASPEED_I2C_BASE_ADDR 0x1e78a000
> > diff --git a/hw/arm/aspeed_eeprom.c b/hw/arm/aspeed_eeprom.c
> > index ace5266cec9..daa3d329d10 100644
> > --- a/hw/arm/aspeed_eeprom.c
> > +++ b/hw/arm/aspeed_eeprom.c
> > @@ -4,6 +4,7 @@
> >   * SPDX-License-Identifier: GPL-2.0-only
> >   */
> >
> > +#include "qemu/osdep.h"
>
> Just a question, as the code style, should we add a blank line after
> this header?

No, we don't generally include blank lines in the #include
block. (But all these patches are autogenerated, so you get
what the script generates :-))

thanks
-- PMM

