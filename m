Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7bfS-0005b8-Vl
	for mharc-qemu-trivial@gnu.org; Tue, 10 Sep 2019 04:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34763)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i7bfO-0005Xa-NI
 for qemu-trivial@nongnu.org; Tue, 10 Sep 2019 04:38:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i7bfN-0003yq-2n
 for qemu-trivial@nongnu.org; Tue, 10 Sep 2019 04:38:26 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:40188)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i7bfM-0003xI-QV
 for qemu-trivial@nongnu.org; Tue, 10 Sep 2019 04:38:24 -0400
Received: by mail-ot1-x32e.google.com with SMTP id y39so17247666ota.7
 for <qemu-trivial@nongnu.org>; Tue, 10 Sep 2019 01:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=n3EdLZ/I+9KgAyrX3nxszcZrA5OOqP42Y3tI2lwoT8Q=;
 b=Hh2Vc7Pv9uFaSRK3z8ll1rZZU5FlGVkvIafMQp68JyjRkEir64gn8GAA6wav+Nn3ni
 rwGYmSjqAKHiTcWfIyYQJ2zwVyvZxxeplCiIIVqymC5toqRIj4wVftWvXNTJAjaiAXj0
 x+V0NCLGHgJ2bZc7docEkvzQcleLCurBzHLos6BUeqthvkR5Qd9Bj02RLmNaWt1lukr8
 3LCoGjc7Xvm0hkUJoNXqw+7e4xElQBIgFVQ9QqsX0nWw8U3Mm5QQwNTLz9t4CI8BmFOR
 GLHSvE3gWERr1UcWswPF2+5197+2Tg0f3cgpUTcGEhGkLlua+Nt1LWtx/TJ5yZS5OcAX
 GRRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=n3EdLZ/I+9KgAyrX3nxszcZrA5OOqP42Y3tI2lwoT8Q=;
 b=Ht5oIeGRffc9z6z+m1KnkbhBJa+J8pxnx+zQ/hsvOv3Y78ovboBnDRd2mLUCfFBL/E
 SGTJ8gO6AFXplegc9XQ536yWv3BMosy8Yr2xw4ppZZWHYYJDouXSf6S86kg6Y0bXXg5V
 NkZ4xCJ7ljYa+/VB/jee7MigXKFU0scL7C0MdeALNhiBbq0W8rPQB6iS+4GrzBG0MneX
 5JrNXgmq0DxUUH1jEwGsk2Aa1tD45zN3MUzWNJmPifz4mtW/jaVvp6pk8r6JzESBefsu
 opEcMjvVPCIcBotUv9iPZXVdRqvjqL4sV7weKS62UMZJfTKhFgk5olb0vB5bZq6KTI8e
 yRlA==
X-Gm-Message-State: APjAAAUhjiDf37iOhrzflgX507oTaOWljC2TFVO8msrmql7ivM2EyJBE
 7MsQPx/Z88Vko1G5GIU1js8lHJ3TDth1YsSWXzAqOw==
X-Google-Smtp-Source: APXvYqx2QCjn9T8il6e5esMVWZwDclM+C0oF+5iBhCVx2pgvnJCQpi6B0aq76E669LFwlQzQWSLYLLrSx1iZN3i5U+A=
X-Received: by 2002:a9d:5e10:: with SMTP id d16mr25207209oti.91.1568104703388; 
 Tue, 10 Sep 2019 01:38:23 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Sep 2019 09:38:12 +0100
Message-ID: <CAFEAcA-14O3vYbUzCP7stDPffvHKaLrA-=apPXvGzRWoD1SXuw@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 Qemu-block <qemu-block@nongnu.org>, qemu-discuss <qemu-discuss@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 qemu-s390x <qemu-s390x@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32e
Subject: [Qemu-trivial] ANNOUNCE: emails from this mailing list will soon
 drop the [qemu-*] subject tag
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
X-List-Received-Date: Tue, 10 Sep 2019 08:38:28 -0000

Hi; this is an announcement to let you know that in future
emails to all QEMU project mailing lists (including this one)
will no longer have the [qemu-*] tag in their Subject line.

We need to make this config change because having the mailing
list server edit subject lines like this conflicts with the
increasingly common DKIM/DMARC anti-email-forgery system. We
used to work around this by having the list server rewrite
email From addresses instead, but this has proven to have
bad consequences (notably that patches applied from emails
to QEMU can end up with incorrect authorship by accident).

If you were using the Subject line tag to filter QEMU emails,
you'll need to change your mail client's config to instead
look at the "List-Id:" message header to identify list traffic
(you can do this now without waiting for us to change the
list config to drop the subject tags).

Apologies for any inconvenience that this upcoming config
change might cause you.

thanks
-- PMM

