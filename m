Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iiIpl-0000Hg-L6
	for mharc-qemu-trivial@gnu.org; Fri, 20 Dec 2019 09:00:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35581)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iiIph-00009E-Ir
 for qemu-trivial@nongnu.org; Fri, 20 Dec 2019 09:00:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iiIpg-0003p7-33
 for qemu-trivial@nongnu.org; Fri, 20 Dec 2019 09:00:45 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:36685)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iiIpf-0003n2-RJ
 for qemu-trivial@nongnu.org; Fri, 20 Dec 2019 09:00:43 -0500
Received: by mail-oi1-x231.google.com with SMTP id c16so4509099oic.3
 for <qemu-trivial@nongnu.org>; Fri, 20 Dec 2019 06:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7tYwsPLRFtYT+gosi+FZ9G04KAY4ATDB/3QakomYNjY=;
 b=tP/XeM9OYBCQD8W+9kQndcPQUcZKsCTTHQwc254gfMkxjm4Bit5Jd4ob4uAwttQX27
 Nd8euWQK9P+ntfHkm0ex17IvWcTzMziQ5xaoBLzhwBX9ja5pej6elk8sTdYJ/lUcxBZI
 qihPYkJtUfWt0gtkltQXfTCadf0FEg2bljMSaNGYzJHPvtiED2dn2J737iUP38k7MB6F
 9Bews8hbZA8PK+w26S7K3TBi0+qv2Kwm6DDjyTtyYtaOJEf3wawIIF+BoIeCr9FzJ25W
 UmrS2UqxIpT6Xn3wfc7wvwU5jjZZ2UJYlY6hCFBGuE0ip34rjTOAPbA7rmAsSp/OyQKm
 FQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7tYwsPLRFtYT+gosi+FZ9G04KAY4ATDB/3QakomYNjY=;
 b=jKjeJROIUL+V8kVA9KFLDeNf+On5DsfZTm1VUal1QPxffVsPAnP2giNx5d3QkY4a7r
 ZpWWA/OxcanfJHNDXiLcnDt4fL4wJIza3ZEpLErIrUBVdq8I6gjGgmnjal/e65HPFjS3
 x6jYQZyxIJn5AzA4Z1y9ROCN++NfI44o2ZcCq64PkY3QuQB0mg4N1XJvYaLK334pPo4D
 6zZdi+EuwNpmZH+KSOlqJ8wML2SwHJwBKtiwylv1a3AOjKxJdROkHuNDMwyK7g9Twv+2
 Ax+gDNnlAQj0bAhqe0Z0KUMushwqznkCTLOiFMWdH4ronukOPbkz2EgjD3CAx8P3lEvg
 KQhQ==
X-Gm-Message-State: APjAAAVTvhVosIAvs/hqY5AWcqD8skTeqVllkc3WgXDd8mLXLPuRgZj8
 L+wl4s4huzkRK/JkY7DAAA/pq6+c9yMuNeoi+1FzHw==
X-Google-Smtp-Source: APXvYqzEdTf5R6y51LQzsdcn3m6qUo+eRMdrICORD/yeyZOFGKjIC13QtKIdokED53WP3om4kbY3kty/FL8cCyQZq3c=
X-Received: by 2002:aca:3d7:: with SMTP id 206mr360707oid.98.1576850442632;
 Fri, 20 Dec 2019 06:00:42 -0800 (PST)
MIME-Version: 1.0
References: <20191218130105.125981-1-laurent@vivier.eu>
In-Reply-To: <20191218130105.125981-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Dec 2019 14:00:31 +0000
Message-ID: <CAFEAcA-k+aahB2Sn+ON9T71HHwKa_vgcmtc8tkwMASx1tfoZgA@mail.gmail.com>
Subject: Re: [PULL 0/7] Trivial branch patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::231
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
X-List-Received-Date: Fri, 20 Dec 2019 14:00:48 -0000

On Wed, 18 Dec 2019 at 13:03, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit aceeaa69d28e6f08a24395d0aa6915b687d0a681:
>
>   Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2019-12-17' into staging (2019-12-17 15:55:20 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-pull-request
>
> for you to fetch changes up to 80bc935eaaf93e5b9a4efe97abd7c51d645f2612:
>
>   qemu-doc: Remove the unused "Guest Agent" node (2019-12-18 13:31:01 +0100)
>
> ----------------------------------------------------------------
> Trivial fixes (20191218)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

