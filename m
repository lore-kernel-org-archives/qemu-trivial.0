Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVvhL-0005bg-2w
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 04:11:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39972)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVvhI-0005Z5-PF
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:11:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVvhF-0004dn-FS
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:11:36 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:32987)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dVvhF-0004dI-Ae; Fri, 14 Jul 2017 04:11:33 -0400
Received: by mail-qk0-x242.google.com with SMTP id a66so10215928qkb.0;
	Fri, 14 Jul 2017 01:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=OECHRrufAEFFQSUxdtGb+Pi8hAni2oBRc3WpCHH1dr8=;
	b=NeqT447VFsJOs5bjmf00xuKK7XOlvtgyODju8jnd7tVb51Cr8a2hu7FKWmJTOWB9Xf
	zx8cEsXf6c3IAzFZwKbfUBt6VQ6LOxyKHmKquSaluRtSoR3UxQROiNx9y1pd4hGJ0Ygk
	6nXeU7ZR7uYAzOVAnu+x2x38b+MFZRFRj+vQn5ZUVYYI2PyPE3RbA7LN75LhKWZ5JQYV
	8rxzwvUcM0XDozq0FYMZNMwQHFhfSMRg1dtY86b2m703j6Vej7RexVl90CUrQX0frsqK
	EdmgNIQIh1tzrtUvtuCK+zjy2CqgFWBmZJwACW0tn205G6Vbqb1H9PadiNvzHPa3QEk/
	FTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=OECHRrufAEFFQSUxdtGb+Pi8hAni2oBRc3WpCHH1dr8=;
	b=QDd2x2HFUvvYFT73oC3SP8vPRwTuRgFkl+bZH/SuFWA8ajSfGS7ClExJrCeaTF6v39
	gaeBGnt++vtheMbIxGfNLFYf+XQ6fR94qnbFOHS72SATQjSM3y0+nkJtqaNqwrEnFZLV
	XnWvETsmAedcobiUlwaI2EylCVLWLMrZBDrcMUOSf92NFHnccB5zKXHAljut1o++OQOm
	3nghZNdXD6eaZmeM3BVWUH4Hsq2aOJNWm8l1qiUb578i8D+UCexve9zWUsf5D+FK4zji
	FKfBm0ST6ApDhL7eW7k9uH7fDr8kMw/t3m8I7F24ez4Sjxf1hqu5s4XD9NnlEH93X6Ko
	W6UQ==
X-Gm-Message-State: AIVw112ArMOi/6Eknkb0DT4xqs66OMX29GNOySRlB/STmQq4gtt7zTlR
	lKQCaTSmiYJyrw==
X-Received: by 10.55.156.193 with SMTP id f184mr10086513qke.102.1500019892849; 
	Fri, 14 Jul 2017 01:11:32 -0700 (PDT)
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com.
	[173.197.98.123]) by smtp.googlemail.com with ESMTPSA id
	d14sm6162782qtc.58.2017.07.14.01.11.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 01:11:32 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	Gerd Hoffmann <kraxel@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-3-marcandre.lureau@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <e0a05a80-59ec-52d8-402f-abb35e33e3e2@twiddle.net>
Date: Thu, 13 Jul 2017 22:11:28 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-3-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 02/29] vnc: use
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
X-List-Received-Date: Fri, 14 Jul 2017 08:11:37 -0000

On 07/13/2017 06:31 AM, Marc-André Lureau wrote:
> I used the clang-tidy qemu-round check to generate the fix:
> https://github.com/elmarco/clang-tools-extra
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   ui/vnc.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~


