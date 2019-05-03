Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hMbXz-0005sJ-I4
	for mharc-qemu-trivial@gnu.org; Fri, 03 May 2019 13:00:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59132)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hMbXx-0005oW-24
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 13:00:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hMbXw-0002FG-0e
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 13:00:28 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:35446)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hMbXv-0002DD-Nf
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 13:00:27 -0400
Received: by mail-wr1-x443.google.com with SMTP id h15so3025005wrb.2
	for <qemu-trivial@nongnu.org>; Fri, 03 May 2019 10:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=EIi4K2dkSBbuhfS2t70Kzgd4m/ZSCWhAQBd5+AA+hJM=;
	b=asgfMBOtomdN8aCDKZAOO2DEUwKq6iVGJhawyklo26ErrHVll+FJ2+FRuBNNkVXEGB
	sU3QFqn3uUQoDWtagpo+UJhXTXRIt88XswZWOAay+ZuGxQyYvmq83smE5X1yBHIKXkB7
	BO2wzFFhJpcSMsuC6FpzS/DZmgTykz6+hAuyzWYbsH8N1pokdlha1FrTigJVMxm3R199
	1JdZgYPv9SNVfEy3WG3cXe2jW34hHZeK+Ixg4KHrymekq7nrYa9Xl6wZbNkagLzftekh
	rADFpkxonWLnYTs4o/K71pgPajX7UdPCk0WLsxAkBPGWlVhk1IzauXK4Qc+FemG/em8x
	hTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=EIi4K2dkSBbuhfS2t70Kzgd4m/ZSCWhAQBd5+AA+hJM=;
	b=fgNqG9n8nQ9Gd2H7wZNT/hXlF7Fs+h8G+dQbfpKIZAjgLV5QwXpatm3QyzaXfpwfow
	7c6udimgfYRuhwWT/RyHSjSF+QAkZmr4H34bC4Ow9vDwHrNPWsZwWFtsopq8Exkkh2I5
	5+4+4S6FQBgQ9cuELzmLMi/9xMt8auDwisrqctOoXb37U6At4jE4VNoRaDW26XW8X+2e
	c+4FKZS7cBSvFzm5yyEw/3pAHL6ZbGJ0a2y9TC+/mubRfukSXl17cU1+1iLTTM+L8PIl
	EOlr2ADX7undslY9NrvdgRuhlmZ0jp0aj6Fflujkn0Ha6TjG+PTzAxyMJJFYaSVKWEQG
	HoMw==
X-Gm-Message-State: APjAAAUAYZCCZCvHu9KGcjwADKZXqpCmqBWg5hkYk2tchtPhws5OL+Us
	pnvhTpnzgnXKHzpPIa0aLhiZuw==
X-Google-Smtp-Source: APXvYqxB3Erbn6n5CoH9GnWhM9Q3MK2m5U0VE1h4JogAF+x0D2VP4DpbSNtj3FYRo/dcJJpZF5Y6nQ==
X-Received: by 2002:adf:e74b:: with SMTP id c11mr1351828wrn.221.1556902826282; 
	Fri, 03 May 2019 10:00:26 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id t67sm3935497wmg.0.2019.05.03.10.00.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 03 May 2019 10:00:25 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5DDBD1FF87;
	Fri,  3 May 2019 18:00:25 +0100 (BST)
References: <20190503154424.73933-1-liboxuan@connect.hku.hk>
	<87bm0j4im0.fsf@zen.linaroharston>
	<CALM0=-=b+z2aW-cuM=hmk3_oKG7w3ianMo_ZA7gj8zMgCOfC3g@mail.gmail.com>
User-agent: mu4e 1.3.1; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "LI\, BO XUAN" <liboxuan@connect.hku.hk>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Eric Blake
	<eblake@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
	<philmd@redhat.com>, Yuval Shaia <yuval.shaia@oracle.com>, "Michael S.
	Tsirkin" <mst@redhat.com>
In-reply-to: <CALM0=-=b+z2aW-cuM=hmk3_oKG7w3ianMo_ZA7gj8zMgCOfC3g@mail.gmail.com>
Date: Fri, 03 May 2019 18:00:25 +0100
Message-ID: <878svn4gnq.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: Re: [Qemu-trivial] [PATCH v4] hw/virtio/virtio-mmio: Convert
 DPRINTF to trace and log
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
X-List-Received-Date: Fri, 03 May 2019 17:00:30 -0000


LI, BO XUAN <liboxuan@connect.hku.hk> writes:

> Hi Alex,
>
> Sorry about that, I am still trying to get familiar with the patch
> submission process. Since my patch has been changed from your last review,
> I thought it would be safe to not include the r-b tag from last time. Will
> take care next time!

That's ok. As a general rule as long as you haven't substantially
changed a patch it's safe to keep previous r-b tags. You can always
mention it in your cover letter if you are unsure.

--
Alex Benn=C3=A9e

