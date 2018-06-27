Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fY4V1-0000C0-CA
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jun 2018 03:04:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46255)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY4Uy-0000AR-Po
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 03:04:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY4Ut-0001hc-TD
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 03:04:16 -0400
Received: from mail-pf0-x22a.google.com ([2607:f8b0:400e:c00::22a]:34136)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY4Ut-0001hL-NC
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 03:04:11 -0400
Received: by mail-pf0-x22a.google.com with SMTP id g3-v6so569322pfi.1
	for <qemu-trivial@nongnu.org>; Wed, 27 Jun 2018 00:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=XBWAj1t1pstEYwkgcUlMTJFdTKhEDXw7GX8T5SW9CYE=;
	b=kyE27RIoperKBHHP4g8KODDfxeZr55qTn0Lg+XaOghkY6YoiHLn73mlwk9XDV90Kvk
	nrRl9fdW/JTLYuRdFmj/g/Ej4V03+3lJgskUepOYMXa2R07ZEqfOWKohIb+XQpBdZQvC
	8N3pT2OJDDlE3YLa5tP8GMnqaf+65Hs+OXdD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=XBWAj1t1pstEYwkgcUlMTJFdTKhEDXw7GX8T5SW9CYE=;
	b=J26Ld5Yvjpsw4EcemLKo0QQ7Jn+besYe7iKHPOM79IxpUxxCjilzeX0017B+XnsfL1
	5qEbCKiAlSAAiSlMcbDer67vyc/b6ZHhWSWkJ73jJdVSAn6i3fcdeELXAwixwTZTKj8W
	4Hfy+Nfx21b0LEfrusyQpMAk9Xtlzb8u7A0dxuIQgTUY7fWx/uqXX3EwsCHkaMp9XIan
	YGg9L6pmD54dOd7HcUzwicbopVV99ywiTEVUAyrJPdw0mjodbEkjoa84FV9RY8UI0see
	sfCtPZpN+LR/pjlf/ISfePoTaJcNX8qj24XYVjZ97XuRkgo2Gl8iBd9akvD6xM4LUqE7
	PDNA==
X-Gm-Message-State: APt69E3QT/BuPGn3vEyPc6Z8PMpO1fL1erknTkYiCyn/395Y98CGy2sb
	TxN4+hgZ1t+RsWjYF0uoO2vsaA==
X-Google-Smtp-Source: ADUXVKICsj5XvGOFICDmBLHK3uPPPpnrQO3lxw9quNCjWFi0Mj2W0sohUSCsrSk4CknXIgQgd3cN5g==
X-Received: by 2002:a63:af49:: with SMTP id s9-v6mr4191441pgo.49.1530083050781;
	Wed, 27 Jun 2018 00:04:10 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	d15-v6sm8775477pfh.92.2018.06.27.00.04.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Jun 2018 00:04:09 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	qemu-devel@nongnu.org
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-36-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3c5eef2f-115c-9c6d-2dba-0407fcebcdc4@linaro.org>
Date: Wed, 27 Jun 2018 00:04:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180625124238.25339-36-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::22a
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 35/46] hw/usb: Use the
 IEC binary prefix definitions
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
X-List-Received-Date: Wed, 27 Jun 2018 07:04:17 -0000

On 06/25/2018 05:42 AM, Philippe Mathieu-Daudé wrote:
> -#define VSCARD_IN_SIZE 65536
> +#define VSCARD_IN_SIZE      (64 * KiB)
>  
>  /* maximum size of ATR - from 7816-3 */
>  #define MAX_ATR_SIZE        40
> @@ -276,7 +277,7 @@ static void ccid_card_vscard_read(void *opaque, const uint8_t *buf, int size)
>  
>      if (card->vscard_in_pos + size > VSCARD_IN_SIZE) {
>          error_report(
> -            "no room for data: pos %d +  size %d > %d. dropping connection.",
> +            "no room for data: pos %u +  size %d > %ld. dropping connection.",
>              card->vscard_in_pos, size, VSCARD_IN_SIZE);

Did you test this with i686 host?  %ld doesn't look right.


r~

