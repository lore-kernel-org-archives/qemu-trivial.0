Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fqLZF-0001R9-RE
	for mharc-qemu-trivial@gnu.org; Thu, 16 Aug 2018 12:56:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37630)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqLZD-0001OA-MI
	for qemu-trivial@nongnu.org; Thu, 16 Aug 2018 12:56:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqLZC-0007SC-Mw
	for qemu-trivial@nongnu.org; Thu, 16 Aug 2018 12:56:11 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:37222)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fqLZC-0007RZ-Fa
	for qemu-trivial@nongnu.org; Thu, 16 Aug 2018 12:56:10 -0400
Received: by mail-oi0-x241.google.com with SMTP id j205-v6so9246812oib.4
	for <qemu-trivial@nongnu.org>; Thu, 16 Aug 2018 09:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RELQi3a0jfOPeqjiwGIzgfnkZp8WcXahKXSfJMCUBeM=;
	b=FHDC+X/6ur01g2ddgJQqs8oUsOENWI0wX6BemRYhBmBwDvccP0qtxg6EMyjebgv1Dz
	7OLQY9Fm0w7BdMCpG4ka047TjMQyliVN54tsBujVfGb5vnjT053sliq7znGilYBGzBD0
	H7bddQ6GFRefF7r3ieFCuDhLUZq3SMlLTMpB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RELQi3a0jfOPeqjiwGIzgfnkZp8WcXahKXSfJMCUBeM=;
	b=hu4RdD5k1f4nggWuWmQJuGOd6c7gyw9uKvSaQpKnPYqtrkdeqE3bJPteahuzc/CFbJ
	i2c+421xiHhcciWfv8S/NGjvu8tdyqyO2pp9nqidWO5Impzh5lgaKdP0I7maq1ETR2gi
	EmVmCQ6OhHDDfAoPsTcCxDVoDPz5vgZ1apgtzQNeqPz67p4/2+fWEW99mg4iq6pJ8UZ4
	0a7v7UBDQcEJgHpZcHPrHql2mB5TUI/FXebxDvfs4Oz61kZ+/DVuXwnm6iJ6ps220oUg
	5VXM8iBqFoRaHPYnUSSQI8Yq0cxl5YM4qWSI/DguuMtFt4lSphv1SC8FVKHl45G1cwe0
	ZSDA==
X-Gm-Message-State: AOUpUlEv06zWfX3or8G0aFsFbX4ijzOdj3kJa352+TP8L/84QA/zUWCd
	C5xYIHSe7K7ur/bC9Fus7t4Lk6RJc/s8jc8a917idQ==
X-Google-Smtp-Source: AA+uWPy6NVUmcMa236LGOdCNPN37cR/tOg3fUjwJLhlKEfIw2O7n6QxnH96gyu56AiICdX6vSfvfAtyMi5IVmYKzFTE=
X-Received: by 2002:aca:2c89:: with SMTP id
	s131-v6mr30829143ois.171.1534438569650; 
	Thu, 16 Aug 2018 09:56:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 16 Aug 2018 09:55:49
	-0700 (PDT)
In-Reply-To: <1534341354-11956-1-git-send-email-hans-erik.floryd@rt-labs.com>
References: <1534341354-11956-1-git-send-email-hans-erik.floryd@rt-labs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Aug 2018 17:55:49 +0100
Message-ID: <CAFEAcA9DdtZ6+vrX9e30DX-9-68oFo5+FBeVq-B7QQsiQRM7BA@mail.gmail.com>
To: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	"open list:i.MX31" <qemu-arm@nongnu.org>,
	Peter Chubb <peter.chubb@nicta.com.au>, 
	"open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] imx_serial: Generate
 interrupt on receive data ready if enabled
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
X-List-Received-Date: Thu, 16 Aug 2018 16:56:12 -0000

On 15 August 2018 at 14:55, Hans-Erik Floryd
<hans-erik.floryd@rt-labs.com> wrote:
> Generate an interrupt if USR2_RDR and UCR4_DREN are both set.
>
> Signed-off-by: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
> ---
>  hw/char/imx_serial.c         | 3 ++-
>  include/hw/char/imx_serial.h | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM

