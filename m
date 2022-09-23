Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1obeyv-0004rJ-1o
	for mharc-qemu-trivial@gnu.org; Fri, 23 Sep 2022 05:28:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obeyZ-0004nl-Tk; Fri, 23 Sep 2022 05:28:10 -0400
Received: from mail-vs1-f50.google.com ([209.85.217.50]:44656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obeyW-0000RI-Rp; Fri, 23 Sep 2022 05:28:03 -0400
Received: by mail-vs1-f50.google.com with SMTP id h1so13015751vsr.11;
 Fri, 23 Sep 2022 02:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=1fZ3phByiX51M1NegfUMUajhFEsY8uvOlYPU9nf0HiM=;
 b=rTThUFo+AFyoPlynALsOPq412N9aCqEpCOs+48VFoWfYWTmJYarpprdpv/BN3NTBfc
 gXnY1KwreRxcqR18rLyhxvXA4y6rhTWXpsYRR/mb4HFAs0zw0Sb/sdkZvQP4n9xcWJB6
 SPTB4AsPht+dET0ZzhRR3AYW1EdHDDiIsjGk1C7b0tbdc3/dn0ZECZQYbbws7Y7t0+d3
 sCJaE8TSMaA3tdPD/gxRJ9zqyml/R0xIq5yPGZiiKip0QlG1KVDd3SP9wCku+sV8h4TV
 UxgeddQP1W+zhgmUzRjAwuiSxrHWZmx4iggktEOLEXdvTnK0WovUxmn1t4b4oTwt1XPQ
 njbg==
X-Gm-Message-State: ACrzQf1zNjP+5sNbGjmC34TFjdwLXfORB8/EWuxo8UcBBh27ItmeiscX
 Wq5MPmCTnJzi2S2MuWpYlxT6Fgf+VXUEvAE7cig=
X-Google-Smtp-Source: AMsMyM72lGAexl+jkPy8PUzKfA3I5iFzpNrn1G8D2QBFS58jZud80mzkWyDx8WMBw0NT8xavRkM3EUOK/VNBH03dcdE=
X-Received: by 2002:a67:ab0a:0:b0:39a:c8e4:fde9 with SMTP id
 u10-20020a67ab0a000000b0039ac8e4fde9mr3180706vse.23.1663925279325; Fri, 23
 Sep 2022 02:27:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220923090428.93529-1-armbru@redhat.com>
In-Reply-To: <20220923090428.93529-1-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Fri, 23 Sep 2022 11:27:47 +0200
Message-ID: <CAAdtpL7TikHLMEtYhZ1NbXcKwiRswpi0qjWevaN3kkkE3tja_w@mail.gmail.com>
Subject: Re: [PATCH] Drop superfluous conditionals around g_free()
To: Markus Armbruster <armbru@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, 
 Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, 
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.217.50;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-vs1-f50.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 23 Sep 2022 09:28:20 -0000

On Fri, Sep 23, 2022 at 11:13 AM Markus Armbruster <armbru@redhat.com> wrot=
e:
>
> There is no need to guard g_free(P) with if (P): g_free(NULL) is safe.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  replay/replay.c             |  6 ++----
>  target/i386/kvm/kvm.c       | 12 ++++--------
>  target/i386/whpx/whpx-all.c | 14 ++++++--------
>  3 files changed, 12 insertions(+), 20 deletions(-)

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

