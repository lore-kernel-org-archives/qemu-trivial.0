Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVw18-0001FN-Re
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 04:32:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44670)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVw16-0001Dk-LE
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:32:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVw13-0006xj-Ih
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:32:04 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:34003)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dVw13-0006xT-F8; Fri, 14 Jul 2017 04:32:01 -0400
Received: by mail-qk0-x244.google.com with SMTP id q66so11270020qki.1;
	Fri, 14 Jul 2017 01:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Sup4YrYc3dyVBGarE9XCHADI8Az2nQ/SjbdelGRZ9sw=;
	b=NORKpzUhyWjJBkMZ6P27wjs2VDSIAQmIKu2FA4AWa90CDBeSklvhvmxAIW0I94Rph0
	qPXxjJYu4vJrn9wIPaPscst94S17ya9e/zdFZc5RC4ICYx3YWL4ENno8pFtcPjw5+UDw
	hNdVbhJj75YT2mG8Jpb3a5NTJ27X2CbvGyn0YU2X5S/GDvf2SUuFYUBNvPHZbMy/oS5N
	tgkezs6i/N5Wcxvbc4hzzb+pZ3kIDWHAC//OV4xrzxIOGsjVS2LYW3cdR/Dbpex2eqXP
	Y8dnmxmXtrncgJ4NTyOqXw3aNKLHRghiQVpeAQ5k3kxI8e2JAocNxzUg5HaP+ogr9/iY
	pc/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Sup4YrYc3dyVBGarE9XCHADI8Az2nQ/SjbdelGRZ9sw=;
	b=Zt/TqFIOj1X2z32qRdiZge0T4qt+cwXcS2jsmEa2B4KhXI1NTLGoGuY5WK8TO+1/OU
	uPGskLpiAekkUv5k4dWnJGWyk3tRGD/I9d0RVBLEMJciDK+D+eRJxsvJHtJ7hHW/nEfj
	2eOvZuGM8lJYRSjRqfZaVrjwFb6ueyhd/FYRh54FdJBUEPO75cXWkt7JOgRYRO/GycYG
	qKwMs5S/OKaXv1QgNMSOVdFLTLZdqMe7/NYqmRNSMSacXEcMq3+TL3A4RBDby/uKUVfR
	FbBAONKpPsj63beqEjMo9xASobJ1Y9SKD4phh7RTk/HfhFJZQ/fgaePsIaYdh9Or/KkD
	4RFQ==
X-Gm-Message-State: AIVw113NTfMr3n88hXh78i+XcNiPKK+lzdH8JKzGHlLiCqK4ag9S48I9
	ihoVxylHfuU0vw==
X-Received: by 10.55.79.131 with SMTP id d125mr9478364qkb.169.1500021120659;
	Fri, 14 Jul 2017 01:32:00 -0700 (PDT)
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com.
	[173.197.98.123]) by smtp.googlemail.com with ESMTPSA id
	m49sm6528289qtf.32.2017.07.14.01.31.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 01:32:00 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, peter.maydell@linaro.org,
	"open list:dmg" <qemu-block@nongnu.org>, qemu-trivial@nongnu.org,
	Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-8-marcandre.lureau@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <abbaf8fc-1b11-72c2-40b9-a0a74f14826c@twiddle.net>
Date: Thu, 13 Jul 2017 22:31:54 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-8-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 07/29] dmg: use
 DIV_ROUND_UP
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
X-List-Received-Date: Fri, 14 Jul 2017 08:32:05 -0000

On 07/13/2017 06:31 AM, Marc-André Lureau wrote:
> I used the clang-tidy qemu-round check to generate the fix:
> https://github.com/elmarco/clang-tools-extra
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> Reviewed-by: Stefan Hajnoczi<stefanha@redhat.com>
> ---
>   block/dmg.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~

