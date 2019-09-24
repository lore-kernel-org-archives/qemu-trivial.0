Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iClaD-0001Qh-ED
	for mharc-qemu-trivial@gnu.org; Tue, 24 Sep 2019 10:14:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38253)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iCla9-0001KU-6q
 for qemu-trivial@nongnu.org; Tue, 24 Sep 2019 10:14:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iCla7-00006u-SY
 for qemu-trivial@nongnu.org; Tue, 24 Sep 2019 10:14:20 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:38835)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iCla7-00006E-MV
 for qemu-trivial@nongnu.org; Tue, 24 Sep 2019 10:14:19 -0400
Received: by mail-oi1-x244.google.com with SMTP id m16so1757294oic.5
 for <qemu-trivial@nongnu.org>; Tue, 24 Sep 2019 07:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Mhd/FJiamKV8bgwxvhSM1XmfViMLPDMRpLbPk1h8UFQ=;
 b=j4yagwqXqS6lcOkOx5LSGKWlLY7JFtE0BSiUDKdT/0FUEo1UqAlkUOmbTGRRCzlYQd
 0tH7T1+Gffnwm7zqlAzsr8aoQsWIMlsiFYsW1Ii58h7uXiPoElHc8mwCXHRugHNH4eim
 fI38tAv+rKuucYWaAa1KAfpC80eYWTfqeF2a6kOcA4zNzKhAWp7b9ULGsPrDeEdPMAd5
 dVToJBdinNNvbzgJkJOM+NNBgeN5Aw6o+4mNwuvXHZjbmiFDC4ifq2As5wVh0MHO8rRW
 BEtnDgNNrNoOozizNFmaIQBn1OZngb016lQmCXLeudMN6LAdO4KTi2/Hi/juPoAoFAY4
 z+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Mhd/FJiamKV8bgwxvhSM1XmfViMLPDMRpLbPk1h8UFQ=;
 b=V9M+bdVzKmFFi6iBULHdpctJ8ZIlugopoybvONzrMbbMpP5TVo2s3XAZh6AcHjhoPk
 6CRCAXtUpdu9tg0wJlLDsH6TfvJgdmcvtiA0eLQAwKIRVoAMJJxAA+exCxvhUQ9dAiJS
 rn2pcmsesg9qNP2HE2HWl7SyuPPANhW5ABOvELt5x9iirNAvOiqcO77UfHm74ZGyXxbr
 c4G6PCfNj9mQGD4ZvWQ0vEzUYlqt+kLQEhUYht1jYtTB1mg5mQnluZTQM6T33Ok1RvqU
 znKNbW26fSaBhyl115vl05Y1Z+7tAeNAkXyl3GU+4Q5fpo4gDjqLWImgK3If/eslx40Z
 kKFg==
X-Gm-Message-State: APjAAAUJHtrcU4tdfFTSF2tjFjGe3C8FM6cDp0GPjqMi6bSovS6TGB3W
 eYh1FcNLX0leihOWNtrjXDmEVcQda+riV/QWMdoMig==
X-Google-Smtp-Source: APXvYqyCHKxkL301M500Wq7L6Lv/EDs9iq+Q0krCF/oLYOe5OqnzTO2xYvrOB+osqHBO3nNrhIrC40YpcSs8q8zYVvw=
X-Received: by 2002:aca:50d8:: with SMTP id e207mr255616oib.48.1569334458739; 
 Tue, 24 Sep 2019 07:14:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190924141228.25009-1-philmd@redhat.com>
In-Reply-To: <20190924141228.25009-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Sep 2019 15:14:07 +0100
Message-ID: <CAFEAcA9a-OdpzLgqeO+iRTr3PNYxGZ+ECX_GVOQD0NLNk8OynA@mail.gmail.com>
Subject: Re: [PATCH] hw/timer/pl031: Add warning "do not use as model to
 implement a RTC"
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
X-List-Received-Date: Tue, 24 Sep 2019 14:14:23 -0000

On Tue, 24 Sep 2019 at 15:12, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Peter said we should "not use the pl031 as a good model of how
> to do an RTC, it has some definite flaws."
> Add this information to the PL031 header for other developers.

Lots of our code is less than great. I'm not sure this
specific case really justifies blazoning it in a comment header
at the top of the file... (If you do want to put in a comment,
being more specific about exactly what the problems are would
be better.)

thanks
-- PMM

