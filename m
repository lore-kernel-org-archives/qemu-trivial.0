Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNZKU-0004gz-Qq
	for mharc-qemu-trivial@gnu.org; Wed, 30 Sep 2020 06:27:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kNZKS-0004cs-Us; Wed, 30 Sep 2020 06:27:20 -0400
Received: from mail-ej1-f68.google.com ([209.85.218.68]:38847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kNZKR-00075O-F3; Wed, 30 Sep 2020 06:27:20 -0400
Received: by mail-ej1-f68.google.com with SMTP id dd13so2027268ejb.5;
 Wed, 30 Sep 2020 03:27:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oQxfUPzUTo48hgWzSnaXYGhmp7yZ8JjPWtAJyTqWoCA=;
 b=KpvfBiqdL03HxUv6TKkgmaKS/dMZK2GgrOV6n1tNuIu4rr1aQl7jpFbvqboWNjnyix
 mly5YCfzHGLAGXW1o4sB/6CM/loq+ogKHBRQfBQK3yBJfestZUp2xbrU8QbuCTi4T/jX
 KUryHWtYXm29C3oTLcIz6oVpsJRX7+vs6MjSrZZxb9zwLsWKPl9Y4Py4dLWqTXbRnCM/
 V4CZLFI8mkD0DQPZSBgqVdYbch2G45RG+f/WV+q1Q0yfd6Bes2N91+BU9HqUfvDhPE/P
 fKUj7F3bzK4C864MjM4XgjrDFa4MV0YP9ZBV/HSRqADsrBAcaJvAxdU08QrRVAAuqlkG
 sqzg==
X-Gm-Message-State: AOAM533OJjgv3/hYxaiLuih3bIV5PWRbs1APNEsIS+Oz0Zwcp1bTeH8x
 KGDg1G0cO1k8rVLTTnW8NKTWwf852X5WCfkxI0w=
X-Google-Smtp-Source: ABdhPJwYI2SPl8qTRpIakb0rl52eOny2pnHq+ieU8mkCwh9kHeR3JQYPJuQTu2Nm53xhLob/YYZzq5cRr2t+CrA8hO4=
X-Received: by 2002:a17:906:50e:: with SMTP id
 j14mr1122839eja.138.1601461637576; 
 Wed, 30 Sep 2020 03:27:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200930095321.2006-1-zhaolichang@huawei.com>
 <20200930095321.2006-7-zhaolichang@huawei.com>
 <220f3754-7599-3e45-32e7-20fa1322ce85@amsat.org>
In-Reply-To: <220f3754-7599-3e45-32e7-20fa1322ce85@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Wed, 30 Sep 2020 12:27:06 +0200
Message-ID: <CAAdtpL6FRbbo6o9vx69QtWZnM9Wv3uR6wDB1PMe8ftXhX2kUZA@mail.gmail.com>
Subject: Re: [PATCH RFC 06/14] mips/: fix some comment spelling errors
To: zhaolichang <zhaolichang@huawei.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.218.68;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-f68.google.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 06:27:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.199,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 30 Sep 2020 10:27:21 -0000

On Wed, Sep 30, 2020 at 12:23 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> On 9/30/20 11:53 AM, zhaolichang wrote:
> > I found that there are many spelling errors in the comments of qemu/tar=
get/mips.
> > I used spellcheck to check the spelling errors and found some errors in=
 the folder.
> >
> > Signed-off-by: zhaolichang <zhaolichang@huawei.com>
> > ---
> >  target/mips/internal.h           |  2 +-
> >  target/mips/translate.c          | 10 +++++-----
> >  target/mips/translate_init.c.inc |  2 +-
> >  3 files changed, 7 insertions(+), 7 deletions(-)
>
> Acked-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Err:
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

