Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SJj2g-0006QJ-JR
	for mharc-qemu-trivial@gnu.org; Mon, 16 Apr 2012 06:20:18 -0400
Received: from eggs.gnu.org ([208.118.235.92]:58479)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SJj2Z-00066w-2Q
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2012 06:20:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SJj2S-00018T-7p
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2012 06:20:10 -0400
Received: from mail-ob0-f173.google.com ([209.85.214.173]:47385)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SJj2S-00014a-46
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2012 06:20:04 -0400
Received: by obbwd18 with SMTP id wd18so1100136obb.4
	for <qemu-trivial@nongnu.org>; Mon, 16 Apr 2012 03:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=p8RbL2gXqq0C1s6r/HEQBFYfUiduz1bmILYZC83PPoE=;
	b=PrxizQC76PZqiRZf27tEasgvi08vV027UjhgVrPClsj66EMHxrbw4tCg2FFiLAG/Ks
	U23VhB2LV9TAgVJuazvvolTfeXCxMJYKoleNJltKV/KqFJoCYXq6yra9v9z7ubHh3lRX
	GznkocQPqw5tVzXIoxvn+XWU3TojWFbwZwO7aczX5mP+zfFSrEGRApxu2R/Yj3gUgp1B
	95uets+RsRVa2TU4zNC6LNOQAvEf1LhtcYLgLqM7Ojz7LAs5yzq0W0T8yB28KyCZOVP+
	prvfYCX/726JSKMuLcpp5LyZEX8FOwPeDmerpV7w7gwI7yB1TrFXKpcb5ap1Si0wM2qW
	Jc1Q==
MIME-Version: 1.0
Received: by 10.50.187.231 with SMTP id fv7mr1086893igc.51.1334571602009; Mon,
	16 Apr 2012 03:20:02 -0700 (PDT)
Received: by 10.50.100.198 with HTTP; Mon, 16 Apr 2012 03:20:01 -0700 (PDT)
In-Reply-To: <CAFEAcA_Cae2rL97RZRyVxn-hT8p32vrrkJw3g_aXFopVp5WNpA@mail.gmail.com>
References: <1334217107-24540-1-git-send-email-eric@eukrea.com>
	<CAFEAcA_Cae2rL97RZRyVxn-hT8p32vrrkJw3g_aXFopVp5WNpA@mail.gmail.com>
Date: Mon, 16 Apr 2012 11:20:01 +0100
Message-ID: <CAFEAcA_D_Qv5RtHZGk3Q_i1hWJzdNXmyyVQddGa3QKnBycONMA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQnZ2OsWVZX+GGLJICi+mmRXZj/0PC1lm37cYDFaT2kmanVnI4WvdsgkQA0D4UKnmi3AOy90
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.173
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org,
	paul@codesourcery.com
Subject: Re: [Qemu-trivial] [PATCH 1/2] pflash_cfi01: remove redundant line
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
X-List-Received-Date: Mon, 16 Apr 2012 10:20:16 -0000

On 16 April 2012 11:16, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 12 April 2012 08:51, Eric B=C3=A9nard <eric@eukrea.com> wrote:
>> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
>> ---
>> =C2=A0hw/pflash_cfi01.c | =C2=A0 =C2=A01 -
>> =C2=A01 files changed, 0 insertions(+), 1 deletions(-)
>>
>> diff --git a/hw/pflash_cfi01.c b/hw/pflash_cfi01.c
>> index b03f623..d1c7423 100644
>> --- a/hw/pflash_cfi01.c
>> +++ b/hw/pflash_cfi01.c
>> @@ -144,7 +144,6 @@ static uint32_t pflash_read (pflash_t *pfl, target_p=
hys_addr_t offset,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D p[offset=
];
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret |=3D p[offse=
t + 1] << 8;
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret |=3D p[offs=
et + 1] << 8;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret |=3D p[offse=
t + 2] << 16;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret |=3D p[offse=
t + 3] << 24;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Oh, and I think this change should go through qemu-trivial [cc'd],
since this device isn't ARM-specific and the second patch in this
series doesn't depend on it.

thanks
-- PMM

