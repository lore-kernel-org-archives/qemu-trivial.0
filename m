Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eEOb4-0005F0-C3
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 18:56:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57842)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eEOb2-0005A4-IT
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 18:56:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eEOay-0008ES-K1
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 18:56:56 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:44998)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eEOay-0008EO-En; Mon, 13 Nov 2017 18:56:52 -0500
Received: by mail-qt0-x242.google.com with SMTP id 8so21832659qtv.1;
	Mon, 13 Nov 2017 15:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=wCPQRE627w4DK+DPqYBsMomdOay4Lk8z/HlTUQvXmSo=;
	b=S/fzMmdytJfhxiwSJ6KFsXSKtaaFkBZyNwww6KU8SSwz3oeilJLTK1qxyNXiEqPF6Y
	vu5yu/uZqeVaJ2Vn8FzYvaFvIkpgW3LBC1aAi4rWaShJT3qpFoyHVIJV1UuEO0ASgBlu
	pMNnTrNNrVwijeARaPO4qon/hRGQq5ZuURsnC5dj35lG40tcsUz4ai6Bi/G4SYAJIdPS
	0OT6tvQ2/TFxq8HiFnIRgVcarcYqiF5XMr3xiDYQ7JS7B4E1FbAnnyt+1Sh0+ttP+vhg
	MUO521GjI/9MjdrV5pM50CU3mZbMOm65yoHYJsDALQL8DSR8n2Jzpp6fThApDz2v7+M5
	m9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=wCPQRE627w4DK+DPqYBsMomdOay4Lk8z/HlTUQvXmSo=;
	b=PPpF1A2jThworZStvMxDELJ93gKFaSa7c9YhLaUOP0cFPerboVKCp7Ng5T4/9E45Uc
	UMd5RTZKF0kV8arDklMY79v4esz2pIApOwkmn+aGiQ/Xj6FRc8XAbNhXDaPW2GzoLWq/
	EMET0ALWnnWVJPL849AYdOeJWRgeM45O3PPrzu1hdAW4JAkozyOitChDs+JoZCy26Trs
	6rz11oGqp4287Law/R20AMNVOuxJstQIzMkmduGIdY0CgfFKj9xYlgQKOdtEuxuw91i0
	spjOD0R2F/WR9UOlbnJbHFIv80AYVglzlfhj70Tvkt5upI0fgLpDgxazCpfAnRPv+S2l
	JyUg==
X-Gm-Message-State: AJaThX5lj68otrLP4o39LKqiFJIPTpqWglpq0PyHsimDtOqNQSUl/eIa
	F2wIFLyWXQ/5qnpuRA72KaU=
X-Google-Smtp-Source: AGs4zMY0qs/iagX29HdJ6Y3tzfNeo4wR1auOissZwSrWB5lv0KEmEKm1xcOSSMz7hMc8GgTjPYvkcw==
X-Received: by 10.200.27.116 with SMTP id p49mr17459516qtk.118.1510617411737; 
	Mon, 13 Nov 2017 15:56:51 -0800 (PST)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	j7sm11594139qth.25.2017.11.13.15.56.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Nov 2017 15:56:51 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: alistair23@gmail.com, armbru@redhat.com
References: <cover.1510612380.git.alistair.francis@xilinx.com>
	<83aa5da9c3f6220edf68b49c6f16bf84108616ab.1510612380.git.alistair.francis@xilinx.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <e7e93010-6a95-3c11-1ccc-a3e009b2a5a7@amsat.org>
Date: Mon, 13 Nov 2017 20:56:47 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <83aa5da9c3f6220edf68b49c6f16bf84108616ab.1510612380.git.alistair.francis@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-trivial] [PATCH v5 17/29] hw/nvram: Replace
 fprintf(stderr, "*\n" with error_report()
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
X-List-Received-Date: Mon, 13 Nov 2017 23:56:57 -0000

On 11/13/2017 07:35 PM, Alistair Francis wrote:
> Replace a large number of the fprintf(stderr, "*\n" calls with
> error_report(). The functions were renamed with these commands and then
> compiler issues where manually fixed.
> 
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> 
> Some lines where then manually tweaked to pass checkpatch.
> 
> Some of the message in put_unused() was removed and replaced with
> g_assert_not_reached() and some of the messages were updated.
> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
> V3:
>  - Add g_assert_not_reached() in unused function
> V2:
>  - Split hw patch into individual directories
> 
>  hw/nvram/eeprom93xx.c | 7 ++++---
>  hw/nvram/fw_cfg.c     | 5 +++--
>  2 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/nvram/eeprom93xx.c b/hw/nvram/eeprom93xx.c
> index 2fd0e3c29f..6ffce745ae 100644
> --- a/hw/nvram/eeprom93xx.c
> +++ b/hw/nvram/eeprom93xx.c
> @@ -36,6 +36,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/error-report.h"
>  #include "hw/hw.h"
>  #include "hw/nvram/eeprom93xx.h"
>  
> @@ -105,9 +106,9 @@ static int get_uint16_from_uint8(QEMUFile *f, void *pv, size_t size,
>  static int put_unused(QEMUFile *f, void *pv, size_t size, VMStateField *field,
>                        QJSON *vmdesc)
>  {
> -    fprintf(stderr, "uint16_from_uint8 is used only for backwards compatibility.\n");
> -    fprintf(stderr, "Never should be used to write a new state.\n");
> -    exit(0);
> +    error_report("uint16_from_uint8 is used only for backwards compatibility.");
> +    error_report("It should never be used to write a new state.");
> +    g_assert_not_reached();
>  
>      return 0;
>  }
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index 753ac0e4ea..1c66052f1f 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -518,8 +518,9 @@ static int get_uint32_as_uint16(QEMUFile *f, void *pv, size_t size,
>  static int put_unused(QEMUFile *f, void *pv, size_t size, VMStateField *field,
>                        QJSON *vmdesc)
>  {
> -    fprintf(stderr, "uint32_as_uint16 is only used for backward compatibility.\n");
> -    fprintf(stderr, "This functions shouldn't be called.\n");
> +    error_report("uint32_as_uint16 is only used for backward compatibility.");

> +

Maybe Michael can remove this extra line, anyway:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +    g_assert_not_reached();
>  
>      return 0;
>  }
> 

