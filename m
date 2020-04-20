Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jQbop-0007Rv-Lc
	for mharc-qemu-trivial@gnu.org; Mon, 20 Apr 2020 15:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51882 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jQboo-0007Po-4N
 for qemu-trivial@nongnu.org; Mon, 20 Apr 2020 15:10:58 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jQbob-0000f2-Ly
 for qemu-trivial@nongnu.org; Mon, 20 Apr 2020 15:10:57 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:37873)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jQbob-0000aW-82
 for qemu-trivial@nongnu.org; Mon, 20 Apr 2020 15:10:45 -0400
Received: by mail-ot1-x342.google.com with SMTP id z17so9141416oto.4
 for <qemu-trivial@nongnu.org>; Mon, 20 Apr 2020 12:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P8yPlcsiN05KrZRP9kREIzCaAYz3BNatIa+gv60TYdU=;
 b=kyZwTKQn93h3ojK+U8q5LYoyOvQ17xOAfaSxkyZOR1IOCu8y3Z9sedm01BuoGYCchi
 IFD/kuA+FN7AM07nt9IS0l438e5sfBnJ5l1iSh6f46OmYfinDBqT30Boh7mbLCb8X7Hp
 jf6AjPZFaZVQFRdGIb6r9c1uIbibr9qqku0GP+WwXxVjxcGv947Q64TkleoZqb4tLc0d
 2BZTIaJZCn82yJexWPlZteiQYPBjJPRpRQDEdjF4XUhDp7KmGSvY10asjOzcZuHYOrv8
 H3K+tg2CyOzZaV6t0UXHxhcKlInsokgjle/SNmhDnUpQcZmXxzIaUGj8ALnG0sLAg04K
 4Vfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P8yPlcsiN05KrZRP9kREIzCaAYz3BNatIa+gv60TYdU=;
 b=ecxH7YtOCocJHClDIcoVvzlnZh0B7Lq0yKy4fdho4yh3lPTf7y69XwG7+k+gmnqtqO
 TbvkMeZm5Saw0jHl2YlZ3i8xW0uIA3gCMdf2InMdChqGe98tbse5GSm6JF5fg0Tqr1Hs
 FLz8j1xf1iJQSQZyYSo0xzysLbBsLsn9M+WzwOke05F+IvVgvXsCUjW0PML0HOHN28g3
 W2f9iSQX0mdoaq2Jm0sMZvcmCpoZI3Gm+HUAJkwdsjvfBnvDJ2tZ9lbA9qhq/x+jeh9x
 55frTHA8QaeI0hXXJGb2cgxH9kaZOKF+sUkyTiz9QL1ZmkHtkikOV4LYid51/zlgCAGo
 kbIA==
X-Gm-Message-State: AGi0Pua6jXltmh6Z9fr5DlzNIX/cA7VsXsC341T1B64PtpAmovTIVrkE
 PGlfopnGYg7qEp+eJh7W17etzbmqUhfLdqMQM4MSGg==
X-Google-Smtp-Source: APiQypIyrnNSjvCb54M/GNT/zkuCEqvtyjk6Bhj20izMmdPjmn2hRjUlNCPGSOzJsle61QsWci46/YDLiREJ1AbUCDY=
X-Received: by 2002:a05:6830:22dc:: with SMTP id
 q28mr10254358otc.221.1587409841108; 
 Mon, 20 Apr 2020 12:10:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200420175309.75894-1-eblake@redhat.com>
In-Reply-To: <20200420175309.75894-1-eblake@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Apr 2020 20:10:29 +0100
Message-ID: <CAFEAcA8z_zQC5f2aD1w0ae=P-D3jHRwj_J3yijv2kwnqoYtKTA@mail.gmail.com>
Subject: Re: [PATCH 0/2] fix fcntl(F_SETFD) usage
To: Eric Blake <eblake@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs1p.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::342
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
X-List-Received-Date: Mon, 20 Apr 2020 19:10:58 -0000

On Mon, 20 Apr 2020 at 18:53, Eric Blake <eblake@redhat.com> wrote:
>
> As recently pointed out:
> https://lists.gnu.org/archive/html/qemu-devel/2020-04/msg03133.html
> code that blindly calls fcntl(fd, F_SETFD, 1) rather than performing a
> read-modify-write when it intends to add FD_CLOEXEC is broken, in that
> it can inadvertently clear other bits.
>
> Thankfully, the culprits fixed in this series are unlikely to be
> clearing either FD_CLOFORK (if Linux ever follows Solaris' lead in
> adding that), or the new FD_32BIT_MODE being proposed (as the fds in
> question are unlikely to have that set) - but it is still better to
> write proper code than to set up a bad example prone to copy-and-paste
> propagation.  And as these usages are not new to 5.0, I don't see any
> reason against waiting until 5.1 to apply them.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

