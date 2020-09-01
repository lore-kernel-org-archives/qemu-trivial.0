Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kD8ZO-000144-GT
	for mharc-qemu-trivial@gnu.org; Tue, 01 Sep 2020 11:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kD8ZN-00013B-Qq
 for qemu-trivial@nongnu.org; Tue, 01 Sep 2020 11:51:37 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:42821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kD8ZM-0002n8-3V
 for qemu-trivial@nongnu.org; Tue, 01 Sep 2020 11:51:37 -0400
Received: by mail-ed1-x541.google.com with SMTP id l63so1930787edl.9
 for <qemu-trivial@nongnu.org>; Tue, 01 Sep 2020 08:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/3r0V5XaWzpq03UXQxRhWPAEfoInKgh4VrLacrOfRHk=;
 b=y2FoEqnTpKJ8yZ6xQbESB03fyV4FpWOkpiXvUxfH9A2HnDGKr/Q9mrWG+TTBPWS9aK
 Tt5Q1ZVhKxYG7qqqgR3XMEU95d6rZxmzmf30M6BWVB7GJQA68SaG0qqbR+MYnxHAvAhb
 GbEgA2w/EMXKNZrNlHb+Qh/WkcQLXGBPJENxkPLlQ06IRsq7hHM4Os4YcfhjGNwfbcAI
 j/4O2UGeI86G45RqcHBb6i9ETm6eCjTEx0MJbqZeCPAJrJj7SIu49EeSZ3F+ilH3VpSE
 sjeXkd3zsXHtsMMGwGmUa/jhJ2/B65N39MoDZa2clraA9qthsZTVj3/Nv0NHSIOnWvGG
 cEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/3r0V5XaWzpq03UXQxRhWPAEfoInKgh4VrLacrOfRHk=;
 b=uJuVthWuNcf6e68821qSpistoiBj1Uw1OJBbuTsG2h7xz3XUYpjeyXXI3racHsDWrp
 EakfWqp707QWbA3ABlUlsceifEfgHFrxMtoA6Tiw93XF59RA9aiDn4dbIk2qHXRRfVwI
 4r1auBTNSn0yTZABaDElvnukecLQ0bdjdtgV1WYbmz9tqeZ1m35X2CdtycsrMhdLXE8r
 vDW2qV4gUDxE/lT46TSRCuBO8koiiDz/E6Vc6ACKR21vlE4sJKKpCNC5vEx3eljd9O6Z
 CkF7losVtPAmDvktUj8MPgAdLhhveqq2J706nFc54f5aH+odjFAwHpML9N7D5XBIfZXr
 KlyA==
X-Gm-Message-State: AOAM5304pbSELqHQtUV5suInyANy818cn46qgEueRR/0MsU75J8SnXgj
 ZS012/dEYGjM2NC4/0uvUQpXi7zVCPgDNJv2JU7Nag==
X-Google-Smtp-Source: ABdhPJwNfFpSHwO1xiJbcqKIqWq8tcKjeBQs9PJeYoxt7WHzXpjVw8/7yjcLcZedTErCJYNQogfmw1ctnMcsD5D97JA=
X-Received: by 2002:aa7:d596:: with SMTP id r22mr2344387edq.204.1598975494113; 
 Tue, 01 Sep 2020 08:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200901140803.888852-1-laurent@vivier.eu>
 <c63cde35-2959-f119-5c22-fccdf23a23d7@vivier.eu>
In-Reply-To: <c63cde35-2959-f119-5c22-fccdf23a23d7@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Sep 2020 16:51:20 +0100
Message-ID: <CAFEAcA-OMRhuZFZO3S4-g7BCX0BQVvqaivSN6E5WXCxeoo_eAg@mail.gmail.com>
Subject: Re: [PULL 00/44] Trivial branch for 5.2 patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 01 Sep 2020 15:51:38 -0000

On Tue, 1 Sep 2020 at 15:42, Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 01/09/2020 =C3=A0 16:07, Laurent Vivier a =C3=A9crit :
> > The following changes since commit 39335fab59e11cfda9b7cf63929825db2dd3=
a3e0:
> >
> >   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-5.2=
-pull-=3D
> > request' into staging (2020-08-28 22:30:11 +0100)
> >
> > are available in the Git repository at:
> >
> >   git://github.com/vivier/qemu.git tags/trivial-branch-for-5.2-pull-req=
uest
> >
> > for you to fetch changes up to 1eef4ba6be30f8b95c8cda1bcb50a176d680a34d=
:
> >
> >   docs/system: Fix grammar in documentation (2020-09-01 12:09:30 +0200)

> Please ignore this PR, it failed after the first patch.
>
> The second attempt is the one to take (same name, no versioning but
> completed).

The two are identical from my point of view because they refer
to the same tag (and even the same commit hash in this case).
The merge process doesn't care about the emails that go to the
list: those are just for others' information and the historical
record.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

