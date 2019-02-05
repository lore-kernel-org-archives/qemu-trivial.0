Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gr0Ww-0004T0-0q
	for mharc-qemu-trivial@gnu.org; Tue, 05 Feb 2019 08:12:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46133)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gr0Wu-0004PN-6M
	for qemu-trivial@nongnu.org; Tue, 05 Feb 2019 08:12:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gr0Ws-000787-7h
	for qemu-trivial@nongnu.org; Tue, 05 Feb 2019 08:12:48 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:41483)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gr0Wq-0006ve-FH
	for qemu-trivial@nongnu.org; Tue, 05 Feb 2019 08:12:45 -0500
Received: by mail-ot1-x344.google.com with SMTP id u16so5504826otk.8
	for <qemu-trivial@nongnu.org>; Tue, 05 Feb 2019 05:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3Se6kJ861pDNMo8K2JjSXoogjg42sAVY693j32ENaMA=;
	b=Jf5G8TWQt1dwK+w0z+M+QpH5PAB/y5XJdDXRdMkukITSK9MquxzROsDkrYQfT64OAp
	qyXBYUinWoWPKQCxwHXP1hZ0RcxT9RhRtSB1QrBwtFMu9jup++1owNGTx3/LLRLtmyBL
	lZfM/ysAyBF7ALiyokjy9aUqfdWX+ewyXlLBJy0FoZMWdRtn7pDH+uUtG6Zo7c+vKreN
	TZf80YTCpY/NOEFtmC4zRNAKeWP5Y+8z5FrfKFziSuoepV1lsJxRMbAMe7S8xXdPksWI
	MiCgffeki0WbTTb7tou8yy7yRjfHTa7GYHAF0CVe7twLt4oV/YWUaQPNbVBcOp7e82Yk
	fJfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3Se6kJ861pDNMo8K2JjSXoogjg42sAVY693j32ENaMA=;
	b=Nir53pHAMKe59SbPMrTjCtdvw22pqbrBdKMBmZdQiMbBz0KJbRvga4IBshwyXfBB3Y
	Z8+mOMgnZTgfuSRCuw6PyQilydmlA6MhOjgTB1eHIqM+VhGLRK7Ye1FjsSLbP2VD+R0J
	jcZ327yGRuxChfqv/5Yrmqouk95GdUfJBnjTAweKMHLWaJOmdI304pr3pUzXO49ulHO4
	HMpvIKAF29qvchghd/UDpwKXM3mJs3woD4ocqh1U5p0MVj1gzyjwOSkONvQZy2pTXRiu
	wQ/DOL/oBN+WlHqEomBQOCjd2cvrbSeNuB09rQrzHXXyHVoaUsm3ebqdgBLjttUW6U7A
	uVwg==
X-Gm-Message-State: AHQUAuYBiYgHgvdSwlyAZqKIKqUijmrngqjTWtOKyj16819/3IcXra0Q
	3NViBxt5HIvd8xnR0rfCVMQvDNnrhpWA6H6LPdZUow==
X-Google-Smtp-Source: AHgI3IaGXrBxhV9UN/gTEs+bcWoIDhCTtBvkMEwapKfB2as/reZVOZcJ29qdK6h7jCF+pzgesHTehoziTMKvCRTwhM8=
X-Received: by 2002:aca:5c05:: with SMTP id q5mr2403260oib.146.1549372347371; 
	Tue, 05 Feb 2019 05:12:27 -0800 (PST)
MIME-Version: 1.0
References: <20190205023937.18245-1-eblake@redhat.com>
In-Reply-To: <20190205023937.18245-1-eblake@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Feb 2019 13:12:12 +0000
Message-ID: <CAFEAcA_zxFJWqzD22d2f2Kj3fwQ2jxHu9SoSFojOLVU1bMS0Vg@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Avoid
 non-portable 'test -o/-a'
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
X-List-Received-Date: Tue, 05 Feb 2019 13:12:49 -0000

On Tue, 5 Feb 2019 at 02:46, Eric Blake <eblake@redhat.com> wrote:
>
> POSIX says that it is better to use &&/|| and two separate test
> invocations than it is to try and use -a and -o (in fact, there
> are some tests that are inherently ambiguous to parse if the
> user passes in corner-case input like "(").
>
> Since we cannot guarantee which shell runs configure, we cannot
> rely on -o/-a always following bash's parser rules.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

