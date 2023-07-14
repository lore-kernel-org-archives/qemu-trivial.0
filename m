Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qKI9p-0003gD-Vp
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2023 08:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qKI9o-0003fl-3l
 for qemu-trivial@nongnu.org; Fri, 14 Jul 2023 08:44:24 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qKI9l-00045M-Ib
 for qemu-trivial@nongnu.org; Fri, 14 Jul 2023 08:44:23 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-51e619bcbf9so2383575a12.3
 for <qemu-trivial@nongnu.org>; Fri, 14 Jul 2023 05:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689338659; x=1691930659;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=laZTEGQ5at+TRDg9ZEt2KmGtu2J/rpeFHjN2vms6jL8=;
 b=G8py4Q0XRwl12061AfQ9RGrSK522inpQGWs6Rm/ZRRQaUkufqtcCIOqNL0YZuZNPkV
 2uPzCFoMXC7ETBmL0xJmCgrtmGFRXml7WPrsfPYkFyE5CyAz0tF1oOhow8AyTIrJBkQz
 SKk9W/gjYQ98jSMulE2xg54zo6LxX3JFa88bEtMJirpTtjS/TSRTG05Y+5v5FdZfdKEp
 S8w5tNiV6QlmOrnotpUkT6cDejfikMpFW1mzVezeLTguzmukXP+HxaGp53qcOx4LCtJ0
 pECHSYyZxwGKMTXDx/JioN79KMVZVclxtKFFIo6cX612U14EJ0maqrdTUd7PqupXkSa0
 fPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689338659; x=1691930659;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=laZTEGQ5at+TRDg9ZEt2KmGtu2J/rpeFHjN2vms6jL8=;
 b=c3uRRgOp8O7RNElX7/wwbiVV2/PT/ifYa0hnNcidI7XegVH82KTgYDToM/zsMBuByf
 3EqgC2FN/QKCcd6UYcx8BAQVXpREb5zrTEBMINmdb0O7Ey/FMHNAAv+a+hOegblKYEis
 JT37PbpMJvQxMB9iNhjeg800w5KLXYG57jRMxAcwU5FXSocafui6IztzdHy2rHaQGWvy
 4yjkQ3FygsG84cEFvAqoCWRjiSF+LPRb/XfdLe0wlVpe4FskIYapdS4DqWA8HjObs5/+
 kILfcH0g06ATN9WTNs5o+uo2TtwvO2mEAGzBKwVDuczqRMkefDME/6TehNb210VY5IX4
 Dj2w==
X-Gm-Message-State: ABy/qLZ4KLmIcBaTQnDKILQ2dasKCbSJsoTCVBxqVsq67UEM2/INhHpi
 /RUT1/SzJXTfeHXgfVs6tNa7KwZxq+30vXC4K9riccDTgzpsLQKM
X-Google-Smtp-Source: APBJJlHNswA8/ljkQ3GU0geEOlc1GUGdFeJW3v5wdylSC0yVgr8BVKn6qCvrmkB3hOIVhEuim+VNU2fT+5sEVX9fc8s=
X-Received: by 2002:aa7:c90f:0:b0:51e:54ad:ba8f with SMTP id
 b15-20020aa7c90f000000b0051e54adba8fmr5223876edt.24.1689338659367; Fri, 14
 Jul 2023 05:44:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230714113834.1186117-1-mjt@tls.msk.ru>
In-Reply-To: <20230714113834.1186117-1-mjt@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Jul 2023 13:44:08 +0100
Message-ID: <CAFEAcA9RjLeu2pqFMaKzCOd7GeSwYbCs-E7kXwuvTEy59W70=Q@mail.gmail.com>
Subject: Re: [PATCH, trivial 00/29] tree-wide spelling fixes in comments and
 some messages
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
X-List-Received-Date: Fri, 14 Jul 2023 12:44:24 -0000

On Fri, 14 Jul 2023 at 12:39, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> This is a set of tree-wide spelling fixes, grouped a little bit, to be
> a bit easier to manage.  Every change has been manually accepted, some
> needed minor reformatting.
>
> In order to reduce size of the emails, I used `git format-patch -U1' to
> show less context in diffs.
>
> This shuold be safe to apply for 8.1, as it does not touch actual code.
> There are a few message texts touched, mostly error messages.
>
> Michael Tokarev (29):
>   tree-wide spelling fixes in comments and some messages: block
>   tree-wide spelling fixes in comments and some messages: bsd-user

This would be easier to deal with if it followed our
standard convention of putting the subsystem name at the
front of the subject line, not the end. As it is, in
my email client I have a whole series of emails that look
like

 "[PATCH 02/29] tree-wide spelling fixes in comments and some m..."
 "[PATCH 03/29] tree-wide spelling fixes in comments and some m..."

and it's not possible to tell which I might care about
reviewing from the list-of-emails pane without clicking
through each time...

thanks
-- PMM

