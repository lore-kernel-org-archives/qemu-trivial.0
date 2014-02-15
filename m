Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WEiSn-0000vE-AW
	for mharc-qemu-trivial@gnu.org; Sat, 15 Feb 2014 11:51:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60457)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WEiSh-0000re-3A
	for qemu-trivial@nongnu.org; Sat, 15 Feb 2014 11:51:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WEiSa-0008Or-BI
	for qemu-trivial@nongnu.org; Sat, 15 Feb 2014 11:51:31 -0500
Received: from mail-lb0-f170.google.com ([209.85.217.170]:61112)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WEiSa-0008OZ-3n
	for qemu-trivial@nongnu.org; Sat, 15 Feb 2014 11:51:24 -0500
Received: by mail-lb0-f170.google.com with SMTP id u14so10176574lbd.15
	for <qemu-trivial@nongnu.org>; Sat, 15 Feb 2014 08:51:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=XeyWxVJVTB0+eHIyav02T4obxQEsL/lxVJKzVINXFq0=;
	b=iqoaW/kp9PFV1d7/YFtQkI3UOQI6tp9D33kfRHngIUVxVigLzIFW4ofE6fI05ROOLN
	teMUaV9GgTptUCA6Ekg6AgjhFe6br1vHjdnUQZ86S7TYRK1CPZ1zY9oj5m29aG41QKQM
	oQiitI/URjAGC4ucgp/y6FS550DxXgpn0xOjH3Sv13cOzSGBOCr5O3XOHLGM5nru8byW
	Hd3jXVxOc2nOusPvq8cydP649hX6+KlnQZtKhTUBa6bqwUV95iSmay9lhw2IjHPIL1rn
	iQfgcmYe/9urpjFLDg5QnYgtt05KfwbC9BfWzX0dnTQBjV+8fAhAvba+pV+dRfvkptnw
	Ouig==
X-Gm-Message-State: ALoCoQmo8ve/NrkQG1gaf+Qo6VSx7cQptLOQ/Y7pZw6Lj/JzkbT43E2QgCSOTNfGQ4ANngWRM9MB
X-Received: by 10.152.180.4 with SMTP id dk4mr2107732lac.49.1392483082857;
	Sat, 15 Feb 2014 08:51:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.118.34 with HTTP; Sat, 15 Feb 2014 08:51:02 -0800 (PST)
In-Reply-To: <1392466700-21770-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1392466700-21770-1-git-send-email-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 15 Feb 2014 16:51:02 +0000
Message-ID: <CAFEAcA-s=NiWRZTva+C+jh4pARTpeg46bgzj3uX_hQJx=nKyQg@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.170
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/10] Trivial patches for
	2014-02-15
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
X-List-Received-Date: Sat, 15 Feb 2014 16:51:36 -0000

On 15 February 2014 12:18, Michael Tokarev <mjt@tls.msk.ru> wrote:
> This is a trivial-patches pull request for 2014-02-15.
> Amount of patches this time is small, but some of them deserves some
> explanation.
>
>  vl: trim includes  -- this one removes many #include statements from vl.c.
>   I actually verified that qemu builds fine on linux and several variants
>   of *BSD with this patch applied, so those includes really aren't needed.
>   There _might_ be an issue on windows, but the chances are rather small.
>
>  gitignore: anchor all ignored names  -- I haven't got any comments about
>   this one, probably no one cares one or another way.  But I think it is
>   better to include exact names and miss some (to be added later) than to
>   include wildcarded names and ignore too much, like what happens with,
>   for example, debian/patches directory because "patches" is listed in
>   .gitignore.  I plan to reduce this file a bit further too.
>
> Please consider applying/pulling.

Applied, thanks.
-- PMM

