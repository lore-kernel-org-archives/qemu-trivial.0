Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVvyY-0007oO-C4
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 04:29:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44112)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVvyV-0007hP-Df
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:29:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVvyS-0005dZ-AK
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:29:23 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:36412)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dVvyS-0005dP-5t; Fri, 14 Jul 2017 04:29:20 -0400
Received: by mail-qk0-x243.google.com with SMTP id v17so8954362qka.3;
	Fri, 14 Jul 2017 01:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=8D1QGWGKUgpU8H7otoxIwBZY+dmhjqX95bKFobQCUJI=;
	b=A07FKvUOAJNgFcEN4F9Tq28mnxBNE1Bsi2utjX767MFWrf9HHgtzHFxGI+BF2kJQLf
	au/SXIh+rwfJkgaut7lx6Kq+OGXS3qg+ove01UYBY6kuVz+M/58mmdFFJIB7g7laWoeF
	ltbiFI1tHwdp8qJe1RuXnp5ZrOOhb/gez9JRAGcb6yjWtakyWxbqhBBuB2pkbxAAuw+J
	Krqh1/Tdv/TijRPStiegMHn1TxG3eFGKZBQcK/ctuC2hXHh/TEKt7goo3QPKVTMwqiPl
	3XQgw+aNZAeCkayTqmMo+jtagF1RGgaZbtx8efR56FZ/CsvVEkdZAwt8dwJpfcNerAXy
	KYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8D1QGWGKUgpU8H7otoxIwBZY+dmhjqX95bKFobQCUJI=;
	b=A0hS72B6Yisv6b3lenRrE7U5VaXnunAkgGdF6zVdymXjvMChpR8FttrmYZhXRSmXYP
	MkxLj0kHmgsuntEj3rHl3wEgzCHGJHV4hju3KD94atE/rzNpbFQBcZj3n6YFkGLTqtvg
	wOWTlrOFJy7Ma8m5Dp2YaFlR6SKyMVFjgt+fIyVREXzQw1MtZScqpGCUpey2utHMU6En
	Ko+wG6BBo64kY5rIhdHJ2+9ykHz2SMsCLw8dDi9AKnuC1hCf0/u+lOuvVGx7SW1DycZf
	4rN8JctReMM3Mlx2+P1keslaCHKozgTjeXP0m1mhYqm5oqX3Ban0eFXch0eAJHwQbaMg
	cbtw==
X-Gm-Message-State: AIVw110N4uYyMZt6f6N5EnHsRdbuPAvt3b3k5jb6xnY78aNYFtrZg1wZ
	XkJdsEIe5a7S9Q==
X-Received: by 10.55.76.71 with SMTP id z68mr9432404qka.8.1500020959607;
	Fri, 14 Jul 2017 01:29:19 -0700 (PDT)
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com.
	[173.197.98.123]) by smtp.googlemail.com with ESMTPSA id
	g25sm6179093qte.57.2017.07.14.01.29.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 01:29:19 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	Gerd Hoffmann <kraxel@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-7-marcandre.lureau@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <5943fdc0-cacd-a93a-d9c8-f65b1e8d00ca@twiddle.net>
Date: Thu, 13 Jul 2017 22:29:15 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-7-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 06/29] pcspk: use
 QEMU_ALIGN_DOWN
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
X-List-Received-Date: Fri, 14 Jul 2017 08:29:24 -0000

On 07/13/2017 06:31 AM, Marc-André Lureau wrote:
> -        s->samples = (PCSPK_BUF_LEN * PIT_FREQ / m * m / (PIT_FREQ >> 1) + 1) >> 1;
> +        s->samples = (QEMU_ALIGN_DOWN(PCSPK_BUF_LEN * PIT_FREQ, m) / (PIT_FREQ >> 1) + 1) >> 1;

Wow.  Um.  Two divisions?

Irritatingly, "m" appears to be the only non-constant.

This a true and correct conversion, so

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~

