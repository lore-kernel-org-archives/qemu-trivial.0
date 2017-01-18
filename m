Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cTf9K-0000Qb-IK
	for mharc-qemu-trivial@gnu.org; Tue, 17 Jan 2017 20:34:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60770)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <skiver.cloud.yzy@gmail.com>) id 1cTf9I-0000PR-Qt
	for qemu-trivial@nongnu.org; Tue, 17 Jan 2017 20:34:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <skiver.cloud.yzy@gmail.com>) id 1cTf9H-0004Lc-OR
	for qemu-trivial@nongnu.org; Tue, 17 Jan 2017 20:34:52 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:33318)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <skiver.cloud.yzy@gmail.com>)
	id 1cTf9E-0004IB-Vx; Tue, 17 Jan 2017 20:34:49 -0500
Received: by mail-qt0-x244.google.com with SMTP id n13so25283006qtc.0;
	Tue, 17 Jan 2017 17:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ufxz5vPMlLEHiezUmCjXmDaTUVjrcF86fJcZ2zsNYWM=;
	b=XTxU6vPJHaPE61Q15VAVENZylE0ATJbQMxIvoIcV/GJ2E7+swscYgjPPktCaScZCQ2
	Pfvqt/Kb3ivEkGd3518h7amApnjv4aNENx9fFs8BQuMeP8YTe8x2qWnqkwE9JKv39qQ8
	8suMLyf28R13Lt/6rtDrDoNzdPLipSdFPgMd5vdhW1S+0e+AZXznydoyJYzmLj0/d9gu
	HuyPCP47Zny/RBWkHwJdO11L8NE/YIdu1CAK7du3OiZ7Bg0fuob/8KMEfkk8s2PZUNqa
	8lAA/4i76O+qSdRWZTrOJbGNLm9HMKR//qnmNcUCbLYU3gtA6K30V4/kX1Rm8G7S6NAn
	63pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ufxz5vPMlLEHiezUmCjXmDaTUVjrcF86fJcZ2zsNYWM=;
	b=jCplijVDQK1eYK4DWUDomeHZFE8JsWqxcu9dhHqRvUvowTK2NhKGZnJubxhpSlV9Mv
	5ZOrBIG3UxBhMtZuot6YhJXMOfEeq0azibrXMNd0tWgn4S6GoUO2MESnYovEcw25JUWl
	ZBux8bh8gDwr9xP8Hw8hiSm7imRJu0/mZhEH0xk4PYEwfVuTEl5EZp3fcsyWnkdrrRlG
	I5oxmx9orwthfGvaQAMqj3kqiRZy6Gwes8GN7F/YeZj2kqpWJIRtvJ/lPPnCoAP+W12J
	VMH6rd5P0Qnv913M4bDCJtj0K78DqHgT3CURz0yrBaEaU8dAMwg55ozqytjGE01cdxCh
	+PYQ==
X-Gm-Message-State: AIkVDXI7MsfSD7MVboBO8uiKiOtvhpLMeSikkm/qSK8REE/Z0K0tv/aow+4QXcdtDkf74WTkeOKmilSKJv/aKg==
X-Received: by 10.200.34.155 with SMTP id f27mr562978qta.129.1484703288188;
	Tue, 17 Jan 2017 17:34:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.82.231 with HTTP; Tue, 17 Jan 2017 17:34:47 -0800 (PST)
In-Reply-To: <148470234043.214.7219322137444222645@790289a7ca88>
References: <1484702052-7900-1-git-send-email-skiver.cloud.yzy@gmail.com>
	<148470234043.214.7219322137444222645@790289a7ca88>
From: Yang Ziyue <skiver.cloud.yzy@gmail.com>
Date: Wed, 18 Jan 2017 09:34:47 +0800
Message-ID: <CAHkcwafqx4-vMsCVJOZS04Kb1cRVbu2ea802hjdOhJp2JoPA+A@mail.gmail.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <famz@redhat.com>, qemu-trivial@nongnu.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	Ziyue Yang <yzylivezh@hotmail.com>, Anthony Liguori <aliguori@us.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] gdbstub.c: fix GDB
 connection segfault caused by empty machines
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
X-List-Received-Date: Wed, 18 Jan 2017 01:34:54 -0000

Oops seems I forgot to check the patch before submitting. Sorry for that.
The new patch is tagged as v3 now, but I'm not sure whether it should
be tagged as v2 since the origin v2 failed. Is there any specification
about this? Thanks!

2017-01-18 9:19 GMT+08:00  <no-reply@patchew.org>:
> Hi,
>
> Your series seems to have some coding style problems. See output below for
> more information:
>
> Message-id: 1484702052-7900-1-git-send-email-skiver.cloud.yzy@gmail.com
> Type: series
> Subject: [Qemu-devel] [PATCH v2] gdbstub.c: fix GDB connection segfault caused by empty machines
>
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
>
> BASE=base
> n=1
> total=$(git log --oneline $BASE.. | wc -l)
> failed=0
>
> # Useful git options
> git config --local diff.renamelimit 0
> git config --local diff.renames True
>
> commits="$(git log --format=%H --reverse $BASE..)"
> for c in $commits; do
>     echo "Checking PATCH $n/$total: $(git log -n 1 --format=%s $c)..."
>     if ! git show $c --format=email | ./scripts/checkpatch.pl --mailback -; then
>         failed=1
>         echo
>     fi
>     n=$((n+1))
> done
>
> exit $failed
> === TEST SCRIPT END ===
>
> Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
> From https://github.com/patchew-project/qemu
>  * [new tag]         patchew/1484702052-7900-1-git-send-email-skiver.cloud.yzy@gmail.com -> patchew/1484702052-7900-1-git-send-email-skiver.cloud.yzy@gmail.com
> Switched to a new branch 'test'
> 4daee16 gdbstub.c: fix GDB connection segfault caused by empty machines
>
> === OUTPUT BEGIN ===
> Checking PATCH 1/1: gdbstub.c: fix GDB connection segfault caused by empty machines...
> ERROR: Error messages should not contain newlines
> #48: FILE: gdbstub.c:640:
> +            error_report("Error: Bad gdb register numbering for '%s'\n"
>
> ERROR: Error messages should not contain newlines
> #49: FILE: gdbstub.c:641:
> +                         "Expected %d got %d\n", xml, g_pos, s->base_reg);
>
> ERROR: Error messages should not contain newlines
> #58: FILE: gdbstub.c:893:
> +        error_report("\nQEMU: Terminated via GDBstub\n");
>
> ERROR: Error messages should not contain newlines
> #68: FILE: gdbstub.c:1361:
> +                error_report("gdbstub: Bad syscall format string '%s'\n",
>
> ERROR: Error messages should not contain newlines
> #79: FILE: gdbstub.c:1737:
> +                     "machine without any CPU.\n");
>
> total: 5 errors, 0 warnings, 47 lines checked
>
> Your patch has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
>
> === OUTPUT END ===
>
> Test command exited with code: 1
>
>
> ---
> Email generated automatically by Patchew [http://patchew.org/].
> Please send your feedback to patchew-devel@freelists.org

