Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hURTA-0006GM-Vn
	for mharc-qemu-trivial@gnu.org; Sat, 25 May 2019 03:51:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hURT9-0006FP-1N
	for qemu-trivial@nongnu.org; Sat, 25 May 2019 03:51:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hURAY-0000xd-2W
	for qemu-trivial@nongnu.org; Sat, 25 May 2019 03:32:42 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:44398)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hURAX-0000vO-PZ
	for qemu-trivial@nongnu.org; Sat, 25 May 2019 03:32:42 -0400
Received: by mail-wr1-x442.google.com with SMTP id w13so3653191wru.11
	for <qemu-trivial@nongnu.org>; Sat, 25 May 2019 00:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=vVl9V4zuTn5tE2qNAT4YMa/w5EjFrpthmm04wHF3sk4=;
	b=m+PNkRuutMe56Bbta+KYOG+E7QnLT/kbfjlUlyfyUCTRI8ZtBKz4/ZEEE6aDuOVvk2
	Efqwh3RoM0tHqysH2jZ+HY6/Q18vadDlEQ7dICA7Eot2XXFSrKoFPdfvf9RQAr7dWVwQ
	VbUasQNI2NQGljTnktlekvyL6GkYi0rOEGV89eWPLqSO+PJ0oensWicsHjI71XdceB5p
	UkrpnJ/Kp1tg29KJ/+dCwblbMiMjtGSWhtY+la/YaY+wtpHJl41mizXBURA9lrGiN/ij
	ChPsTd/8duGQSBGkvwLfZr45B5ijJc6xdh5tEKmqVk5SKlPSmvrV7c8HNKN2gF3uAMEz
	glTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=vVl9V4zuTn5tE2qNAT4YMa/w5EjFrpthmm04wHF3sk4=;
	b=mQG26dc+UpXo4BhIn9KCIlBQKasHqVJQ0usAA8LfZQNUaxn7DU0JIhhJTWuXfg6y3Y
	DRsRIpGe2M8kg/6b8gBu46l65Q/B4aBVq8kUYoFfHzOePeqZlBKODwnzOlXhkwgeAXt3
	au7SFhy7HHNTWsv8+aZRbRSxe9Bbg0COh81N96DR8eVPz6tA3vO6paHMn88Zau/2NyR5
	9/MKyDI9xV0el1OFwSD/YgGLsNtGLMSdv5Ku8Aig8706bV1bAHq3jBmYUvccXLClFP87
	F0dB5CFUMKMz0djipxcLwD5JtUzfPuBrN2VisMBxuI2fBiBoCvSwFbL6IBsgoSI+hZyC
	lOPw==
X-Gm-Message-State: APjAAAVyS6LpZSWC+q4byGcoPu+i4mawxbJYc8W37dkoG90wGCqw8zZ1
	ppPow7UgbadfPW/SIKe4T/G/rQ==
X-Google-Smtp-Source: APXvYqyrO+97oU1HtGYQHKbCcgswX4otJOxbLNXwCVtyGfZKWHPP9vTSX7AG5Zv/7Qr5Iav1JlsjsQ==
X-Received: by 2002:adf:fd45:: with SMTP id h5mr2790026wrs.128.1558769559906; 
	Sat, 25 May 2019 00:32:39 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	t194sm21207234wmt.3.2019.05.25.00.32.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 25 May 2019 00:32:39 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id CF59A1FF87;
	Sat, 25 May 2019 08:32:38 +0100 (BST)
References: <20190525062832.18009-1-liq3ea@163.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, qemu-trivial@nongnu.org,
	Li Qiang <liq3ea@163.com>
In-reply-to: <20190525062832.18009-1-liq3ea@163.com>
Date: Sat, 25 May 2019 08:32:38 +0100
Message-ID: <87sgt3q99l.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] migration: fix a typo
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
X-List-Received-Date: Sat, 25 May 2019 07:51:56 -0000


Li Qiang <liq3ea@163.com> writes:

> 'postocpy' should be 'postcopy'.
>
> CC: qemu-trivial@nongnu.org
> Signed-off-by: Li Qiang <liq3ea@163.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  migration/ram.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/migration/ram.c b/migration/ram.c
> index 4c60869226..359dc8f1bc 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2236,7 +2236,7 @@ static RAMBlock *unqueue_page(RAMState *rs, ram_add=
r_t *offset)
>  }
>
>  /**
> - * get_queued_page: unqueue a page from the postocpy requests
> + * get_queued_page: unqueue a page from the postcopy requests
>   *
>   * Skips pages that are already sent (!dirty)
>   *


--
Alex Benn=C3=A9e

