Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDEh1-00087Q-87
	for mharc-qemu-trivial@gnu.org; Sat, 14 Mar 2020 17:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42062)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <programmingkidx@gmail.com>) id 1jDEgy-000851-Uc
 for qemu-trivial@nongnu.org; Sat, 14 Mar 2020 17:51:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <programmingkidx@gmail.com>) id 1jDEgy-00033T-0Z
 for qemu-trivial@nongnu.org; Sat, 14 Mar 2020 17:51:36 -0400
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:46971)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <programmingkidx@gmail.com>)
 id 1jDEgv-00031M-Rr; Sat, 14 Mar 2020 17:51:33 -0400
Received: by mail-qt1-x843.google.com with SMTP id t13so10862435qtn.13;
 Sat, 14 Mar 2020 14:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=56Kp4JXpbhhEQslD7WyJmIJ4es/f/OW5cO7FdR+86A0=;
 b=NAEfQG3BpmidRGEh54qtiicWn04KqBIL/lMMbgdBRsggFxKbT8hHnuIKqRn6NXKD1h
 Ck5T6zonH7hv/wUmlR18iZZwSfZx9rudWKeRMZFHvfOIgta5TpjGCGY8faSOFAFcpgHU
 ofjZrf9X9T9Rv/ueUWxCu5oYJeiqC6/nwqwUHrm8EwG/YVy6M9gf8dM2fksU8jFQxOGh
 fD07u0zQhf3Dj96yQuVS7hsGWKrWOfABenNJezwUhJf1lkCUYqDJBHBgS+JDmy/aX2wa
 okDxr7PplxG899zM3+u7KlKJPOBIyDgK0SoFWjngwh6bYkNE0UPkfElzcznVGvxV1rWp
 Wy0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=56Kp4JXpbhhEQslD7WyJmIJ4es/f/OW5cO7FdR+86A0=;
 b=HA4UCxS93MiTPzQe9KnukUNaqCvD1Tj0IHRuicrpDRCRzYO5GqLddmr/v/uJarV8mo
 ieulhjgJJoDh2AWbxFTeKTJc65xIRKJM5agIk/+IL8WVTGfOaJx4dP/pMAVgyW9b25Nj
 XGclzdjodTIZqcYlOfmRhRck6cHPCaixRnwzRwTlsWZ7yWDqrCbPKBTVGDF5NjMBkgxq
 B1iNMCJlJbg8NFBZS6/yw/W7dNBhYc1v29O4aTqSH2MvAlcR0+h1cWuvMBpxFXcblbuF
 KWCqLES29aNCwCKRK/fZSeEordRBmcsa2ZLM9g2GpxoTnfN6u1c1oghWZzZKkgFQmF9x
 AJXA==
X-Gm-Message-State: ANhLgQ3R4Vi175II4fEcYp4pbaB/vN+cv9r9/0GTnmxOiy2v3mXeLIiM
 J8WukAupip+YiMKvtccc2Ho=
X-Google-Smtp-Source: ADFU+vvGUr7yuCqZRhYDbkWS0ehkXsy1Nm31AZ1kz1TfaNjR73pCt4t39ZMsG5lDUdiM8ePIhONPEg==
X-Received: by 2002:ac8:6f36:: with SMTP id i22mr19297786qtv.122.1584222693187; 
 Sat, 14 Mar 2020 14:51:33 -0700 (PDT)
Received: from [192.168.0.4] (d149-67-30-58.try.wideopenwest.com.
 [67.149.58.30])
 by smtp.gmail.com with ESMTPSA id j15sm1861451qki.66.2020.03.14.14.51.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 14 Mar 2020 14:51:32 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH] qemu-common.h: Update copyright string to include 2020
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <20200314213312.28282-1-philmd@redhat.com>
Date: Sat, 14 Mar 2020 17:51:31 -0400
Cc: qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <CB1E6D82-053A-4FFE-9E61-7EE5EDF2C3FC@gmail.com>
References: <20200314213312.28282-1-philmd@redhat.com>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>
X-Mailer: Apple Mail (2.3273)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::843
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
X-List-Received-Date: Sat, 14 Mar 2020 21:51:38 -0000


> On Mar 14, 2020, at 5:33 PM, Philippe Mathieu-Daud=C3=A9 =
<philmd@redhat.com> wrote:
>=20
> Extend the copyright range to include the current year.
>=20
> Reported-by: John Arbuckle <programmingkidx@gmail.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> include/qemu-common.h | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/qemu-common.h b/include/qemu-common.h
> index 082da59e85..d0142f29ac 100644
> --- a/include/qemu-common.h
> +++ b/include/qemu-common.h
> @@ -13,7 +13,7 @@
> #define TFR(expr) do { if ((expr) !=3D -1) break; } while (errno =3D=3D =
EINTR)
>=20
> /* Copyright string for -version arguments, About dialogs, etc */
> -#define QEMU_COPYRIGHT "Copyright (c) 2003-2019 " \
> +#define QEMU_COPYRIGHT "Copyright (c) 2003-2020 " \
>     "Fabrice Bellard and the QEMU Project developers"
>=20
> /* Bug reporting information for --help arguments, About dialogs, etc =
*/
> --=20
> 2.21.1
>=20

Thank you for making this patch. I tried my best to apply it but I kept =
seeing 'malformed patch at line' errors. It was probably an issue with =
my email client.=

