Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1emNT4-0000fI-9k
	for mharc-qemu-trivial@gnu.org; Thu, 15 Feb 2018 12:37:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50755)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1emNT1-0000cs-W9
	for qemu-trivial@nongnu.org; Thu, 15 Feb 2018 12:37:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1emNT1-0001fd-9s
	for qemu-trivial@nongnu.org; Thu, 15 Feb 2018 12:37:08 -0500
Received: from mail-yw0-x235.google.com ([2607:f8b0:4002:c05::235]:33852)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jcmvbkbc@gmail.com>)
	id 1emNSz-0001eh-DE; Thu, 15 Feb 2018 12:37:05 -0500
Received: by mail-yw0-x235.google.com with SMTP id z77so295423ywa.1;
	Thu, 15 Feb 2018 09:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=mBNQ7VgSwTWo+Eb3WdWOvgDOmN66cesnjLWGa7+rZM8=;
	b=oBUqlPHmbnhTLb5IoQlR/kTxBT4AhT+UL/sFrT4pBDRgmbwe1Ml+LIXfjIPyXnN/Sn
	Au5jfEaONIRX5R9oWLWfF08BWFY1xZ94nK1AHMgnhdFAqMQXIWj5qH71Wm4JmI3H66dj
	L611t3R62CSHCCLI4f66+UOfLZgeUzWyqhS2eP46npgAFY9M1+2H3bvE92TuYYRfxG0k
	0E6feV7+RC5ZwBq2bB9ymiOIGt8xORurz03P2XZcuYtDG7MMS88eH9JoSdKkdfffGwem
	RMczeLXsqzoTjipHjfHIjxKuP6CYx9uIqmAJuMjuaQMNpKPFTq7+q8Fszju33XlWucJP
	BCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=mBNQ7VgSwTWo+Eb3WdWOvgDOmN66cesnjLWGa7+rZM8=;
	b=ZTutVzYgjQNVU9hZ1WYC0rf8jynPX9jUl+gKYMQ3twoQhK0VPwNIUfPgwrLCROGrhB
	bUFkzJjFL9KgTnY5JLRVzNJBqU9ZwCxl0HHa5DtG4yZnvga3EWr/T7frsPaHib/s8ZdY
	W4jKOotBA1N93yy5SvbZbS1mspa28QV1QcgvlchLukdXZ8hg7BXVlA2vgHODcWauo7DH
	Si8/sUASkrxJvjM1VYDFZ+cmh+LzhugeTiAepfh7mOmQ9zi4eUGb3wwIOHIu/XFImslt
	BWDGI23fcumYb5+atjsd8M6t+OVRa0XPPycw6Z+i5W0MD8p3EDNK3dmmZMSEttPfrEzM
	6xkA==
X-Gm-Message-State: APf1xPCrPvbvBcC1MYt+o8vJeiFPDc8TinFGe0K5ZbOj40DsJQfmV25L
	RbhOdK+XPinqQYPjEqKuq1IeJH+CTqQHPBSodlU=
X-Google-Smtp-Source: AH8x224U7ggtCGrpFlNm6P0d6GT6su5v05HmA5sbYDUGsdC+eetVkKzSdJmAr0r/VnaOt/mQTYBrvEd7soiWyojXk0A=
X-Received: by 10.129.153.5 with SMTP id q5mr2597568ywg.389.1518716224643;
	Thu, 15 Feb 2018 09:37:04 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a25:2d4d:0:0:0:0:0 with HTTP; Thu, 15 Feb 2018 09:37:04
	-0800 (PST)
In-Reply-To: <20180215042900.16078-14-f4bug@amsat.org>
References: <20180215042900.16078-1-f4bug@amsat.org>
	<20180215042900.16078-14-f4bug@amsat.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 15 Feb 2018 09:37:04 -0800
Message-ID: <CAMo8BfJoU3b8aphOs1szfGh9StkHP-W3tuxA7V6aqPE1YgJovA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c05::235
Subject: Re: [Qemu-trivial] [PATCH 13/30] hw/xtensa: use the BYTE-based
 definitions
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
X-List-Received-Date: Thu, 15 Feb 2018 17:37:09 -0000

On Wed, Feb 14, 2018 at 8:28 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> It ease code review, unit is explicit.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/xtensa/xtfpga.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

Michael, could you please take it into the qemu-trivial?

--=20
Thanks.
-- Max

