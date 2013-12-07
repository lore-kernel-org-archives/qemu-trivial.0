Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VpKxD-000440-Tv
	for mharc-qemu-trivial@gnu.org; Sat, 07 Dec 2013 11:42:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56170)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VpKx8-0003yL-El
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 11:42:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VpKwz-0008Q7-QC
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 11:42:02 -0500
Received: from mail-pb0-f42.google.com ([209.85.160.42]:50471)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VpKwz-0008Pn-KE
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 11:41:53 -0500
Received: by mail-pb0-f42.google.com with SMTP id uo5so2829366pbc.29
	for <qemu-trivial@nongnu.org>; Sat, 07 Dec 2013 08:41:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=DDCd+mYaFPn/y6BHHUZgC8mblzgLzMvJiOl2ikRYxjQ=;
	b=SAIIhf6s+2BcZZui40tjmoatmfzCgSoY1JvFY6XWS6q6q898xfpazfUZ1FOY0ESNuA
	V0pM0qQN0Op/uw3adKL6HshSlqWutUJUFGBV4VJpOTMzRZJ3L8cAZf2HSPHVH4Ckmlkk
	FFbU45cn0Qe7JqMTSdLGJg2Hv04KoDbwjoDuMqshA0QkWB8qXX/VOVQquxSmdzDy1DTJ
	rhrQoqbKkY9YJx809BPJ1NHwC05A+wHftLKBPxW7A8vdVW9p1HetkwCAmZyV/pf1OgAZ
	xqmJK5dG7gVFqH6X94Y2Aj/kkXCGePrO4PONtDABH3CrL5IpGKgb5UC6IcN1lWbx5utx
	Y7Yg==
X-Gm-Message-State: ALoCoQnT8T8uwy46/Gp4baFBQVHTsSRG/sPbgUqnXuBYBjUhObroThAGDSF1R8S3eoRA/HcnzzCt
X-Received: by 10.66.218.226 with SMTP id pj2mr10953005pac.62.1386434512235;
	Sat, 07 Dec 2013 08:41:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.70.82.227 with HTTP; Sat, 7 Dec 2013 08:41:32 -0800 (PST)
In-Reply-To: <1386424088-23196-1-git-send-email-sw@weilnetz.de>
References: <1386424088-23196-1-git-send-email-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 7 Dec 2013 16:41:32 +0000
Message-ID: <CAFEAcA_U+5NRXk212ULfPuTjoNxTAGFAPFxrDPMAfRbTcrswGg@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.42
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 0/5] Replace
	sizeof(array) / sizeof(*array)
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 07 Dec 2013 16:42:06 -0000

On 7 December 2013 13:48, Stefan Weil <sw@weilnetz.de> wrote:
> These patches were previously sent as single patches instead of
> a patch series. They all replace sizeof(array) / sizeof(*array)
> by macros.
>
> v2: Fix typos in commit messages (thanks to Peter Maydell).

Whole series:
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

