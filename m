Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dz5de-0001cp-0i
	for mharc-qemu-trivial@gnu.org; Mon, 02 Oct 2017 14:40:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34628)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dz5dW-0001Za-Oy
	for qemu-trivial@nongnu.org; Mon, 02 Oct 2017 14:40:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dz5dR-0001wC-1O
	for qemu-trivial@nongnu.org; Mon, 02 Oct 2017 14:40:14 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:52357)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dz5dF-0001i6-6G; Mon, 02 Oct 2017 14:39:57 -0400
Received: by mail-wm0-x243.google.com with SMTP id k4so10263150wmc.1;
	Mon, 02 Oct 2017 11:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=5vUx+m6hOhc9JlVKRnAAZnS8WNOhu7pmPTqNWkRTheg=;
	b=osZ73NBuUCJXaSpD4nB7zlKF2blikB2DDnOdRAwKPwA2h2hd3C/RCZ/oCFZoD40Jd+
	69+94Mw02vlPTv2t1YC/U94aKJxPsTKEJaY3n2QwYBVO3xmZYwNegy6X2AT7xVnI9Cdr
	4oP2L+qmxOm6uF3CmN0rlknJHTVO9xS6g3dunCEfTBvqp466boM7ws2WU135RBUhllen
	+lnFI2UyCaAVXmJZfKsGMbLTaUT5Ar/LuU2UZiwJ2hw1j7QCTr4DzMnBVW5pti03ROlJ
	u9zW4lzvxrTSTfWunGGyPNc/Zhv/UlXd7XPZ2ENlydufMcrjUCCido2CAiyjT8pUzMrH
	IhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=5vUx+m6hOhc9JlVKRnAAZnS8WNOhu7pmPTqNWkRTheg=;
	b=NSNhEDn+JhyL+VzTu8/SL5DIC7GcG3jpsuoiioagCWb6YE71LiZS9FZmrMC7dHlii3
	PBax8DQ14K7kUVRm7LB5EC2BFl7x/+8MBSuLa+Qq5JNC854BqiIXO1sOuodeNWN8YLiJ
	p+zx9GyPitMvuK7w0Y6ssRzqsBxmryHc7kjPL09c4RnkiGpadx+5NPaLu9WxqCkRPnkE
	3sby6uWPnSza+RXq1enq4Msu7nQI68NG7zcRC0bt3sqhokVLWu4UC/YII2CFLptaF0hd
	C36z9xI3hfhf/9J3EJXj5lIl2sV3yZ8SUVNeT1fYM2yiDgwMEt2/7HmKR2N+87Uux1m4
	K+gA==
X-Gm-Message-State: AMCzsaXvqR2BqlBDLwYRzY5z4qSklhS0jzmVrQgfeFwOPG3h/eXnkTrP
	mI1iKG2p18pZ7ERci6jiGFGw6aGnZ9z8rhDG1WA=
X-Google-Smtp-Source: AOwi7QAEUEVy+Jr2j6J5HjJaRPvnSTleDt0uGvuoNpJrE0zDrJ3Fo/Cwt1D1LRb6BJb5Jc1gOFWMWD0r3eY86STF//E=
X-Received: by 10.28.159.16 with SMTP id i16mr1839312wme.27.1506969596080;
	Mon, 02 Oct 2017 11:39:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.167.88 with HTTP; Mon, 2 Oct 2017 11:39:25 -0700 (PDT)
In-Reply-To: <20170926202512.37670-1-carenas@gmail.com>
References: <20170926202512.37670-1-carenas@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 2 Oct 2017 11:39:25 -0700
Message-ID: <CAKmqyKMQOWqOJmhcTMfex_O-SvSARGAdRHuOYnsw=7izM3p=KQ@mail.gmail.com>
To: =?UTF-8?Q?Carlo_Marcelo_Arenas_Bel=C3=B3n?= <carenas@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] gitignore: ignore
 check-qlit test
X-BeenThere: qemu-trivial@gnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.gnu.org>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@gnu.org>
List-Help: <mailto:qemu-trivial-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@gnu.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Oct 2017 18:40:20 -0000

On Tue, Sep 26, 2017 at 1:25 PM, Carlo Marcelo Arenas Bel=C3=B3n
<carenas@gmail.com> wrote:
> Signed-off-by: Carlo Marcelo Arenas Bel=C3=B3n <carenas@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,
Alistair

> ---
>  tests/.gitignore | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tests/.gitignore b/tests/.gitignore
> index cf6d99c91e..53cb2efaee 100644
> --- a/tests/.gitignore
> +++ b/tests/.gitignore
> @@ -6,6 +6,7 @@ check-qdict
>  check-qnum
>  check-qjson
>  check-qlist
> +check-qlit
>  check-qnull
>  check-qstring
>  check-qom-interface
> --
> 2.13.5 (Apple Git-94)
>
>

