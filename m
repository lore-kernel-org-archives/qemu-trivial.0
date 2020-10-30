Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kYaKC-00061E-Bu
	for mharc-qemu-trivial@gnu.org; Fri, 30 Oct 2020 15:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYaKA-00060v-Bk
 for qemu-trivial@nongnu.org; Fri, 30 Oct 2020 15:44:34 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:45419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYaK8-0002qF-MR
 for qemu-trivial@nongnu.org; Fri, 30 Oct 2020 15:44:33 -0400
Received: by mail-ed1-x52e.google.com with SMTP id dg9so7793918edb.12
 for <qemu-trivial@nongnu.org>; Fri, 30 Oct 2020 12:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hwd/sGRMmS6NYhHXnZ2qmdx4sh7ls5tI2LhbXvO/RWo=;
 b=tJ9QezteLo5EGmIEucITgD/WbyWawc1cUSVYe+Y3znRtLf1PM66sUd72ZYuWu9e2en
 Gw2L0VTSzxmnxwfJ+6Ax4jD8G/XfwalUY97iH7uRkwG0FoyDcu650fkjiHHE3E31lCaZ
 8yJQJ8H45wzVAfOWMX1JhVtDQ/ixsvj3PxPehPqw0A3vfHJmgSq5raA5wHaA4nAchrEs
 97i8HKgoA6pT+N7D94mD9nyfjfKw3fZsMQHHvubf1SufkmGts326nOfwAJw2Lm4Az2uK
 lVwCM7V2pqMn1omhP09TSB7tflC0nxmrkEHe7E6F0BIDafs5bC4/9ebiEgqOYFcW/q0W
 +Z1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hwd/sGRMmS6NYhHXnZ2qmdx4sh7ls5tI2LhbXvO/RWo=;
 b=qoyqJ/EGfaYNH/g5Cxp7ehflAALqZhu1qlvbBKZv+HHrTOALtYb8pPoT4aL3weyUG/
 CSHS/n0fVi6qhDwHZqICvZQo0Slcbl797JTX2j60oZVJ9ALohseheJoKjzTWLQJ88D43
 AgC86wTSbykYuvEFIgk1g38FC4wZH+WBn5xeYuXVVPSL/XV+i9VubVkdjLD6nw9PS06b
 CT52Vbxlv24u1WlttKAQwR//2hmT0ZA3ZV+FTv3Dl6sah0Ywe3jDO04dCFUHq5HE9+sP
 zHQ16S8IfSthquzMQeAlXnrUYYJtgUEN0cfvJFGNGAwtchkn2K/ci4VeTO0YGCjZzANK
 C8gg==
X-Gm-Message-State: AOAM530BzMlARNWtT+pmgnIRTZPYSNcjS8g27n0KBwMzf34f6axAp6bG
 keuCAdemf4929hBnRt6i/3R4E2kWbeGuIFz50p09xg==
X-Google-Smtp-Source: ABdhPJyf7JdHK7+3SAme7Y6Uhs+hz0mu67KlD6SY05j+/eZkRXH9PuFFLqPX+zVli6WkwDe2O5PMX+Gp3cI3s6KKh24=
X-Received: by 2002:aa7:d699:: with SMTP id d25mr4151997edr.44.1604087071158; 
 Fri, 30 Oct 2020 12:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <20201027163014.247336-1-laurent@vivier.eu>
In-Reply-To: <20201027163014.247336-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Oct 2020 19:44:20 +0000
Message-ID: <CAFEAcA_pVT+-xSD_U61dTJF=tKFJRWcTqTenurXk2ETR5n6JzA@mail.gmail.com>
Subject: Re: [PULL 0/8] Trivial branch for 5.2 patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Fri, 30 Oct 2020 19:44:34 -0000

On Tue, 27 Oct 2020 at 16:33, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 4c5b97bfd0dd54dc27717ae8d1cd10e14eef1430:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/modules-20201022-pull-req=
> uest' into staging (2020-10-22 12:33:21 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-for-5.2-pull-request
>
> for you to fetch changes up to e83029fa605d6aa475be60b191f2af3954591093:
>
>   CHANGELOG: remove disused file (2020-10-27 16:48:50 +0100)
>
> ----------------------------------------------------------------
> Pull request trivial branch 20201027
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

