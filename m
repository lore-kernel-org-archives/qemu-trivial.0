Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVs2k-0005XR-51
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 00:17:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52084)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dVs2h-0005XG-SZ
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 00:17:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dVs2e-0001Kc-NC
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 00:17:27 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:33452)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dVs2e-0001Jf-JB; Fri, 14 Jul 2017 00:17:24 -0400
Received: by mail-qt0-x242.google.com with SMTP id c20so8657164qte.0;
	Thu, 13 Jul 2017 21:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=z5Sm0cHI+ofnZ6eP8gkpTC9nSlIxw7q99/zzeRA5zkA=;
	b=VLB5dXHDhZpDclT1JCMJw8VcS8UT548LtxlOYjXRRV1P66y1XMtgnFdPD69Ozh5052
	fjwZSUW80fj2zKIf1SMNw6g3LdzSzVHahBsnEQWHo2AiS1zR7qwR7xxn3OCyVWnwqp4m
	tkQr0XgVvKC2ytiy5kAnfyF00E99BezOCacQWZkck2B6Mil8DuAW93F/sQLuw8bDNG+3
	GYbZt89i1OC8V58zqjdUKOggQr/lBVeUUNDQUGs5o14PpKo7jhCczUTZOBm3WUg/iF8M
	Xooopi8vM6F6KotHiB4+lXAHPNTaIuz3m7mlsiVWXsStb98BXsD6xLF/H4zJ4ko6wk9V
	gjmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=z5Sm0cHI+ofnZ6eP8gkpTC9nSlIxw7q99/zzeRA5zkA=;
	b=J+VRa1tmUOyAoO2WCTZBpNL/wEyj+3emg2cQ41SJgJhS94jI+lYWL7yXK2IfXrQ/9o
	ErdtOzFK0DF97kNVxzo5QYB2KvFjitA/8DLTzdraq9OUNYS3nB+yN6X6FV3nRQonnUSv
	AL42oObuHscmpGwvbBPt2Zq8hwRDWOKBrPSvExMFR4MGLtm4upaCgCin3HPm0BnC9Gly
	gmO8Wiuz8BSCUxofS9T7sphPmuUg73Tl269vImkMtC1uGYNT88ug3yGOWWE6SD/cB+x2
	UWmHoi16WpVSVpMlq390Ie/bv//ba0PjY1s/js2sA0GaNfhHqn6yCrCmSKj3QKIDgSqt
	HTZQ==
X-Gm-Message-State: AIVw11178Ky2zP5xvEn2cOH/mJxPh+YbSBPHlwVg00RLkieAwvA4N4wa
	nUDEt32StlH6zw==
X-Received: by 10.200.38.70 with SMTP id v6mr8789006qtv.157.1500005843929;
	Thu, 13 Jul 2017 21:17:23 -0700 (PDT)
Received: from [192.168.1.240] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	d125sm5587430qkg.43.2017.07.13.21.17.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jul 2017 21:17:23 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	"Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-6-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <41cf79c5-2042-a011-4162-b85dfcdd5af3@amsat.org>
Date: Fri, 14 Jul 2017 01:17:20 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-6-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-trivial] [PATCH v2 05/29] i8254: use QEMU_ALIGN_DOWN
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
X-List-Received-Date: Fri, 14 Jul 2017 04:17:29 -0000

On 07/13/2017 01:31 PM, Marc-André Lureau wrote:
> I used the clang-tidy qemu-round check to generate the fix:
> https://github.com/elmarco/clang-tools-extra
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   hw/timer/i8254_common.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/timer/i8254_common.c b/hw/timer/i8254_common.c
> index 976d5200f1..ee064aa819 100644
> --- a/hw/timer/i8254_common.c
> +++ b/hw/timer/i8254_common.c
> @@ -93,7 +93,7 @@ int64_t pit_get_next_transition_time(PITChannelState *s, int64_t current_time)
>           }
>           break;
>       case 2:
> -        base = (d / s->count) * s->count;
> +        base = QEMU_ALIGN_DOWN(d, s->count);
>           if ((d - base) == 0 && d != 0) {
>               next_time = base + s->count;
>           } else {
> @@ -101,7 +101,7 @@ int64_t pit_get_next_transition_time(PITChannelState *s, int64_t current_time)
>           }
>           break;
>       case 3:
> -        base = (d / s->count) * s->count;
> +        base = QEMU_ALIGN_DOWN(d, s->count);
>           period2 = ((s->count + 1) >> 1);
>           if ((d - base) < period2) {
>               next_time = base + period2;
> 

