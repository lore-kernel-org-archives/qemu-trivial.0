Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVwDN-0005Js-TE
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 04:44:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48912)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVwDL-0005H6-30
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:44:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVwDG-0004pV-7o
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:44:43 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:32783)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dVwDG-0004pI-1v; Fri, 14 Jul 2017 04:44:38 -0400
Received: by mail-qk0-x241.google.com with SMTP id a66so10283933qkb.0;
	Fri, 14 Jul 2017 01:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=WObtlRBqvF+9Ptc8nnbbgta0G8+W2w24BFwGvpcLewI=;
	b=sj30c5eewTMLoSncPEb9l4PjD/dHfwDoAY8aWIuGQ3n2j9EF8tLPLdHwa5sQw6uIk1
	Xq8bD2foDZEYpo91SM6D+Ol9oHY7e8PViOLNPambNo+W5a7VeHzEv7bQXK6NFH9MdfPh
	4IDVzalVHr0HD31+KfsT8/VWOG5olmrmR43lq+zCDPJ1XNGoiw052Ydw2C2fuQyeazIX
	xdEga9Ksq0thIwNQzZ8o3+ykIU3jjJ/H3Ui5lsZp3VuSKz9ddwt89emHEKJA/5Z+7Aa8
	SHdVG3aeeMzYlNBd7HynRXZG9+PxOOiKoaClsp+VBtyWeTX5xhxqoAQ1baXGOz6OGeYg
	m30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=WObtlRBqvF+9Ptc8nnbbgta0G8+W2w24BFwGvpcLewI=;
	b=fLQ3dStvyJ2WJAL27g79wBB8leM7KD1GWKVL+7K69bERfSfnxtxQhAGoWyC5zobi/j
	kgWbrdU2cqVLVxemOytL0ilnL4m2F2rC1IKPIkl7sNxxxDtZMayRul0qRbxQAcI69npl
	DkG6dGFzpZ9Ws6fAkcyfvzagER2u7v95WefLSjBV0+edqW6sSQgLYIQkko0NZfHcLN8u
	HwMAKfUMFW8mlL8Qlp9RZ6yv1jQ+OHQerLeZkdH3Ci67IR3UBoaoZm8ghXgoA2sWR22K
	sSkCRI4wExin9Yoy9WyGrwL20SVyIGehh4o+lQLjq0f9YvJEjJl+jamp9TQImEV+xKsg
	Fm+g==
X-Gm-Message-State: AIVw113Mzr03jWcgjpa02tpaT6Ier6HKzTuJ6AIJsDvzJkxsOjrtTnXJ
	tGaTHAPTkVtBPlKZfas=
X-Received: by 10.55.69.66 with SMTP id s63mr10016151qka.229.1500021877525;
	Fri, 14 Jul 2017 01:44:37 -0700 (PDT)
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com.
	[173.197.98.123]) by smtp.googlemail.com with ESMTPSA id
	t35sm6577401qtc.69.2017.07.14.01.44.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 01:44:36 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-28-marcandre.lureau@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <8e9a2632-ec30-99f3-3492-4d7c5ef12be5@twiddle.net>
Date: Thu, 13 Jul 2017 22:44:33 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-28-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 27/29] i386: replace
 g_malloc()+memcpy() with g_memdup()
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
X-List-Received-Date: Fri, 14 Jul 2017 08:44:44 -0000

On 07/13/2017 06:32 AM, Marc-André Lureau wrote:
> I found these pattern via grepping the source tree. I don't have a
> coccinelle script for it!
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   hw/i386/multiboot.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~

