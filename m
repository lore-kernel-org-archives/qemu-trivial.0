Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fz4hp-0000VN-R4
	for mharc-qemu-trivial@gnu.org; Sun, 09 Sep 2018 14:45:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54233)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <programmingkidx@gmail.com>) id 1fz4hl-0000BP-Te
	for qemu-trivial@nongnu.org; Sun, 09 Sep 2018 14:45:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <programmingkidx@gmail.com>) id 1fz4Sp-0004KU-It
	for qemu-trivial@nongnu.org; Sun, 09 Sep 2018 14:29:42 -0400
Received: from mail-it0-x242.google.com ([2607:f8b0:4001:c0b::242]:40594)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <programmingkidx@gmail.com>)
	id 1fz4Nu-0007Cq-9F; Sun, 09 Sep 2018 14:24:34 -0400
Received: by mail-it0-x242.google.com with SMTP id h23-v6so25886685ita.5;
	Sun, 09 Sep 2018 11:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=S/MnFczXhfZnk2YXBgUHDg5phq5otmWLMp+Faspgq0M=;
	b=Qcltaa/ThZrfY3xZEF/pr3FgGklfiw63N/t/RfQr+1Uv46p1bFGFO+TO4aW0SDEi64
	Tul85/3tpzRGqAe+LIF8ARQYGV770lKdINAGJ3F2FpSL7MzJI8xpeXd2wpQGvk+qVTC1
	DzztP2OqmMnwRRIaJAIUzh6U+axTHUL/+sOuA4hs3/kKJmzK2FejBmeRpcp0RWo4IpR5
	lrM52ozDal2U9Z2Ss7dhSPnV7/rKwtPXfLHNdGq44uqn1B/eoddWErFO6GzJuECz3nEy
	CDKuDutKlh+3796HNP24Jk01gAS2a7spyu1ea06ky+bCf1hv6HPig9C1VMl//uhveCwb
	IUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=S/MnFczXhfZnk2YXBgUHDg5phq5otmWLMp+Faspgq0M=;
	b=aJjZScvDpQjVMJiUIwqKoYo15GoQHCpw/MCEvj0Zd+PIBWmnZ3NsKxIUhuzAlO6Qsz
	7UX5LGeG1WgYI9v9QDfFp4g6o41Ge9Z+J4JpJ2YLiJBlRuY117sjpvYfdkwaCbQWSEgE
	sfbS3OahoqH83CgBUsrcNH8sUorOM78AxmGkqbAIRMZ1O4HLjVTdI99Ll53u3s57Ty2V
	6CJosTDO1nH5L6/IM72WJ/SewPW7wvp6W1kpj6aPUfWZqO27rFijhtxInEjjflclxXqn
	SKMbSgRumnHenq8385lyyVspFXRrGFCfgKStHPKMrK3Yi3NSmxPSCq/+2nI5I92Fnn2d
	CawQ==
X-Gm-Message-State: APzg51BXb+TkxwPIFTNmi5N3VVQeOmFMTLAtO1HtzukVYdyPqEvzQvMS
	HgH57Pd8eO57K2Q+mRJywI0=
X-Google-Smtp-Source: ANB0VdYrPDOhmNJqBCf73edMCUvnC7AduvCK1XaOqcU3GvIqyxhdBOvDXkf7FsmpBjcc1VL35ryqww==
X-Received: by 2002:a02:41d8:: with SMTP id
	n85-v6mr15564012jad.108.1536517473597; 
	Sun, 09 Sep 2018 11:24:33 -0700 (PDT)
Received: from [192.168.0.5] ([69.14.184.20]) by smtp.gmail.com with ESMTPSA id
	r139-v6sm6738859ita.14.2018.09.09.11.24.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 09 Sep 2018 11:24:32 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <817e08da-e255-7d1f-4668-503bd3c009d1@weilnetz.de>
Date: Sun, 9 Sep 2018 14:24:31 -0400
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2DD892A7-1C5C-452E-9D5D-4FEABB5CB48B@gmail.com>
References: <20180909153238.4046-1-programmingkidx@gmail.com>
	<817e08da-e255-7d1f-4668-503bd3c009d1@weilnetz.de>
To: Stefan Weil <sw@weilnetz.de>
X-Mailer: Apple Mail (2.3273)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-common.h: update
 copyright date to 2018
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
X-List-Received-Date: Sun, 09 Sep 2018 18:45:08 -0000


> On Sep 9, 2018, at 1:34 PM, Stefan Weil <sw@weilnetz.de> wrote:
>=20
> Am 09.09.2018 um 17:32 schrieb John Arbuckle:
>> Currently the copyright date is set to 2017. Update the date to say
>> 2018.
>>=20
>> Signed-off-by: John Arbuckle <programmingkidx@gmail.com>
>> ---
>> include/qemu-common.h | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/include/qemu-common.h b/include/qemu-common.h
>> index 85f4749aef..ed60ba251d 100644
>> --- a/include/qemu-common.h
>> +++ b/include/qemu-common.h
>> @@ -17,7 +17,7 @@
>> #define TFR(expr) do { if ((expr) !=3D -1) break; } while (errno =3D=3D=
 EINTR)
>>=20
>> /* Copyright string for -version arguments, About dialogs, etc */
>> -#define QEMU_COPYRIGHT "Copyright (c) 2003-2017 " \
>> +#define QEMU_COPYRIGHT "Copyright (c) 2003-2018 " \
>>     "Fabrice Bellard and the QEMU Project developers"
>>=20
>> /* Bug reporting information for --help arguments, About dialogs, etc =
*/
>>=20
>=20
>=20
> Reviewed-by: Stefan Weil <sw@weilnetz.de>
>=20
> I think this is trivial enough for qemu-trivial.
>=20
> Thanks,
> Stefan

Thank you for reviewing my patch. Yeah it probably should be considered =
trivial.=

