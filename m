Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwcij-0001uY-8H
	for mharc-qemu-trivial@gnu.org; Mon, 25 Sep 2017 19:23:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45040)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dwcig-0001sP-Rr
	for qemu-trivial@nongnu.org; Mon, 25 Sep 2017 19:23:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dwcif-0003J3-Fd
	for qemu-trivial@nongnu.org; Mon, 25 Sep 2017 19:23:22 -0400
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c]:45710)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dwcif-0003IS-A8
	for qemu-trivial@nongnu.org; Mon, 25 Sep 2017 19:23:21 -0400
Received: by mail-wm0-x22c.google.com with SMTP id q124so2247630wmb.0
	for <qemu-trivial@nongnu.org>; Mon, 25 Sep 2017 16:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=XUKJcc7YuSoJ0FIRjp1nCq0JTrFOvWMM3xHG4ctfcCQ=;
	b=WH/N31ZVr8ocnpoUf3qdgIINbq2M7pKEJsNLFpnqgBBhq7SQ6UShM7IvZUpJNvySsU
	7O0svYtzVQ3SeEiB2Ker57CKIG9Z/5EMqrFsnpZ3QImOXiiZHCOERH648oQFOAP5vu/C
	clPsb95MzaF2d2ifbfJRTOD0e+HwJtdx5ECE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=XUKJcc7YuSoJ0FIRjp1nCq0JTrFOvWMM3xHG4ctfcCQ=;
	b=Dh0IMeul9gUs0HNCjIrOspo0LYyzYwi3aHxtA+NbsulNXBXGjYf/Jyn8T0Esvqzqvy
	SeZvbaXob0swlhfWEKNLRxGRpemu7G0cCdgHeeAS55/kzu4d0QFeJltv18GyGyCOY3wW
	AJG68YiW04lep7gKb9ea6Yd2JN5FMMnFWml5/9a3mQZ+Gvs5e2mCnYV8IRjjW9+gvdEa
	gdTQ1ca+dINYt02Df9KEPQgYBTCPxflXNr/aCUdGZiHGyJlGxD08ocYZMEuNRiN43gbJ
	fHHUOfHbFUatSzRFJYuIzeyFzpBwezPuDEPn0GD7ZLBufg0FMyng2XxrOTAieeS3I5tN
	FC7w==
X-Gm-Message-State: AHPjjUhKsR8NaG3oXktGV1EgUxWcNwTnZNHtQ4S1deREcshT45oLP3n8
	quYTq1FDPPt2pSizhCQpTDbBXvc6ngjUWPLJBtUuvA==
X-Google-Smtp-Source: AOwi7QAGsJjoFtsiQ9kNaoZnvO5GCkCX5JqYUYKNQUin1c7e8Qqo/ZRD3PeQK+0bGYKUvDUFSYg1usHeaomYMSvDJ1E=
X-Received: by 10.28.103.195 with SMTP id b186mr1484838wmc.101.1506381800044; 
	Mon, 25 Sep 2017 16:23:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Mon, 25 Sep 2017 16:22:59 -0700 (PDT)
In-Reply-To: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
References: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Sep 2017 00:22:59 +0100
Message-ID: <CAFEAcA9GtLniZNyO7Uv=vL9HiSBGjvWRYdR-Zi1E+W4N9qiB6A@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22c
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/31] Trivial patches for
 2017-09-25
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Sep 2017 23:23:23 -0000

On 24 September 2017 at 22:22, Michael Tokarev <mjt@tls.msk.ru> wrote:
> This is a collection of trivial stuff collected for quite some time.
> It includes various stuff, and just one series from
> Philippe Mathieu-Daud=C3=A9 (MAINTAINERS update), - other his series are
> in the works.
>
> Thanks,
>
> /mjt
>
> The following changes since commit 460b6c8e581aa06b86f59eebd9e52edfe7adf4=
17:
>
>   Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream' into s=
taging (2017-09-23 12:55:40 +0100)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/trivial-patches-fetch
>
> for you to fetch changes up to 97fb016a2aae686098f01d1c2dc194ed0f8e1c36:
>
>   hw/isa/pc87312: Mark the device with user_creatable =3D false (2017-09-=
25 00:09:11 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2017-09-25

This fails 'make check' on most of my configs:

  GTESTER check-qtest-ppc64
qemu-system-ppc64: -object
filter-mirror,id=3Dqtest-f0,netdev=3Dqtest-bn0,queue=3Dtx,outdev=3Dmirror0:
Device 'qtest-bn0' not found
Broken pipe
GTester: last random seed: R02Sb816ff80b7d08ef6a5328ff373d8cd65

GLib-CRITICAL **: void g_hook_destroy_link(GHookList *, GHook *):
assertion `hook !=3D NULL' failed
aborting...
  GTESTER check-qtest-ppcemb
  GTESTER check-qtest-s390x
qemu-system-s390x: -object
filter-mirror,id=3Dqtest-f0,netdev=3Dqtest-bn0,queue=3Dtx,outdev=3Dmirror0:
Device 'qtest-bn0' not found
Broken pipe
GTester: last random seed: R02S61c57a88e229192da22afbf90262d768

GLib-CRITICAL **: void g_hook_destroy_link(GHookList *, GHook *):
assertion `hook !=3D NULL' failed
aborting...
  GTESTER check-qtest-sh4
  GTESTER check-qtest-sh4eb
  GTESTER check-qtest-sparc
  GTESTER check-qtest-sparc64
  GTESTER check-qtest-tricore
  GTESTER check-qtest-unicore32
  GTESTER check-qtest-x86_64
qemu-system-x86_64: -object
filter-mirror,id=3Dqtest-f0,netdev=3Dqtest-bn0,queue=3Dtx,outdev=3Dmirror0:
Device 'qtest-bn0' not found
Broken pipe
GTester: last random seed: R02S2210aede2be05fdbaceb0c1e23378915

GLib-CRITICAL **: void g_hook_destroy_link(GHookList *, GHook *):
assertion `hook !=3D NULL' failed
aborting...
  GTESTER check-qtest-xtensa


thanks
-- PMM

