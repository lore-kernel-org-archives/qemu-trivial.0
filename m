Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SS8a0-0005TU-11
	for mharc-qemu-trivial@gnu.org; Wed, 09 May 2012 11:13:28 -0400
Received: from eggs.gnu.org ([208.118.235.92]:33519)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SS8Zs-0005QY-RD
	for qemu-trivial@nongnu.org; Wed, 09 May 2012 11:13:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SS8Zm-0004yN-7H
	for qemu-trivial@nongnu.org; Wed, 09 May 2012 11:13:20 -0400
Received: from mail-wi0-f175.google.com ([209.85.212.175]:49975)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SS8Zm-0004to-1p
	for qemu-trivial@nongnu.org; Wed, 09 May 2012 11:13:14 -0400
Received: by wibhn19 with SMTP id hn19so513617wib.10
	for <qemu-trivial@nongnu.org>; Wed, 09 May 2012 08:13:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=MGDCN6SWh7+gYlTnAhDHbQGBbbcCgqJ0vxnBbaivX8Q=;
	b=QbuseqadsHhbACHWZLgYFJm+Z7KBoHH2SsRrpC7GJoI9BXSmdawBt5AuA+Nu+VfCux
	ofOCU94MEEjiJ/9PuXypORgBjB9H8Faf4qnsr5JYNJIECcSQmQrx43jqu0qbn0r2M+WP
	8iP+w4Kfiqca8ZZfgp/WhI8TzZsMs5uqSFn43+JEIhoS5G+I8l/qiWK3EZD31JDVzm2k
	17P4kGXaEauHw69wrf22dCvnzSaNCZzzbgjRJarDFdYoRDLqUYS15IUi0/PqO3SrkWLY
	Q0QTwD6fPlydyGoKWj6Z3yLFr6BaA0Ox3valwFfV8f4aML6u1r5e41/17DAoyOZa/oeO
	JOXA==
MIME-Version: 1.0
Received: by 10.50.149.132 with SMTP id ua4mr1429596igb.41.1336576390378; Wed,
	09 May 2012 08:13:10 -0700 (PDT)
Received: by 10.50.100.198 with HTTP; Wed, 9 May 2012 08:13:10 -0700 (PDT)
In-Reply-To: <87k40lwfqz.fsf_-_@rho.meyering.net>
References: <87y5p1wh42.fsf@rho.meyering.net>
	<CAFEAcA8-piOQNSZ_r9Rd7_-2UjBYnZm+cAu9WHo-nYbMCLO0Sg@mail.gmail.com>
	<87k40lwfqz.fsf_-_@rho.meyering.net>
Date: Wed, 9 May 2012 16:13:10 +0100
Message-ID: <CAFEAcA-kRtsuiKxLf2EnuegmMy7GHCD8khsXZ-unpZvGW27HQg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Jim Meyering <jim@meyering.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQmXC1wpezpXHpAlgfmXhow/wF01jt5WKEGaWvMeqQXRNmqlxWr3wb0WwnZXvtkKBbAUgorR
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.175
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCHv2] fix some common typos
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
X-List-Received-Date: Wed, 09 May 2012 15:13:26 -0000

On 9 May 2012 16:12, Jim Meyering <jim@meyering.net> wrote:
>
> These were identified using: http://github.com/lyda/misspell-check
> and run like this to create a bourne shell script using GNU sed's
> -i option:
>
> git ls-files|grep -vF .bin | misspellings -f - |grep -v '^ERROR:' |perl \
> -pe 's/^(.*?)\[(\d+)\]: (\w+) -> "(.*?)"$/sed -i '\''${2}s!$3!$4!'\'' $1/=
'
>
> Manually eliding the FP, "rela->real" and resolving "addres" to
> address (not "adders") we get this:
>
> =C2=A0sed -i '450s!thru!through!' Changelog
> =C2=A0sed -i '260s!neccessary!necessary!' coroutine-sigaltstack.c
> =C2=A0sed -i '54s!miniscule!minuscule!' disas.c
> =C2=A0sed -i '1094s!thru!through!' hw/usb/hcd-ehci.c
> =C2=A0sed -i '1095s!thru!through!' hw/usb/hcd-ehci.c
> =C2=A0sed -i '21s!unecessary!unnecessary!' qapi-schema-guest.json
> =C2=A0sed -i '307s!explictly!explicitly!' qemu-ga.c
> =C2=A0sed -i '490s!preceeding!preceding!' qga/commands-posix.c
> =C2=A0sed -i '792s!addres!address!' qga/commands-posix.c
> =C2=A0sed -i '6s!beeing!being!' tests/tcg/test-mmap.c
>
> Also, manually fix "arithmentic", spotted by Peter Maydell:
>
> =C2=A0sed -i 's!arithmentic!arithmetic!' coroutine-sigaltstack.c
>
> Signed-off-by: Jim Meyering <meyering@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

