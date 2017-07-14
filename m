Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVw9g-0001CW-Ng
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 04:40:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVw9e-0001AX-Fh
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:40:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVw9b-0002xS-DY
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:40:54 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:36143)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dVw9b-0002x9-8U; Fri, 14 Jul 2017 04:40:51 -0400
Received: by mail-qk0-x243.google.com with SMTP id v17so8978857qka.3;
	Fri, 14 Jul 2017 01:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=aWKlDEL7JX8Lq4862ZCNA+3FW8KbkAfiSroQCoH0bpg=;
	b=rj9u52p7feF4lZFEClkTzA/nJ5xPr7jGjnmPWNaRK7fZoKG9Ht4MzjDqzwKYYTOM38
	EgOsQkM3QcGSDtZapTpyMMyN+nh7KzSiGvU/tcPgKzZ0G4RQnd/OJp1PePI9JQtgLJBp
	2i3qyvdelPLodCCGQMyx+6gL5waJK93Ka0v3pYDbxjAETPMtxqYXOJd1jswmZAmCg5/F
	jNL4uEz7fehhJ9kmxVEzOhiZxYAWAcE9UpdPL8/QifJ5bj5ylpJPyHrumCy1okbM2tWu
	zLxU40nf1XIPLWR9mhApIUCmGIhYcT/rQcuUfkTsJQ0eLw/megzJFIAoxbCT3FmeZGHT
	2gCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=aWKlDEL7JX8Lq4862ZCNA+3FW8KbkAfiSroQCoH0bpg=;
	b=IZVZpTzkOpxei19YDLBkhhW7VuoB7vCIRFwq2z5+ylk4InzIgAQIZ88eidMOlkR5Yk
	/QRLMslYl4mIMAWcTysHoQMnK8/tHMvzB4ui7FyZagmoe1fJFEieuSaBuNKwgg9bV8Fi
	XP55zVBbYwjnLg85Mng+Sm/xcrcq+TjSBsnw5c7ORMfCfHPep+W8V90JYxds1P66QxMg
	31NUJvxXrwOxpzEX16JX0orCHJa5ntjrNHcK2s8GWz3fjqPYNu1udOkUKz6nHU3PYikT
	iJrY4iRGJkuJn8JBGeJy20T8Tw0qbaBbrk/+JeJSD5ZH3JUwmI8zVXgHzAfvvQhdKG3x
	EydA==
X-Gm-Message-State: AIVw111eRMhnllnFleLaVqYpLnrAnmuOkuTxqtMLqGZhZVs5KxaD57XI
	eW/VdPbT66USug==
X-Received: by 10.55.185.6 with SMTP id j6mr9489436qkf.14.1500021650517;
	Fri, 14 Jul 2017 01:40:50 -0700 (PDT)
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com.
	[173.197.98.123]) by smtp.googlemail.com with ESMTPSA id
	p197sm5475158qke.16.2017.07.14.01.40.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 01:40:49 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	Gerd Hoffmann <kraxel@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-21-marcandre.lureau@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <18ff9a5f-68a9-3c51-9867-b05b954749a7@twiddle.net>
Date: Thu, 13 Jul 2017 22:40:46 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-21-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 20/29] usb-hub: use
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
X-List-Received-Date: Fri, 14 Jul 2017 08:40:55 -0000

On 07/13/2017 06:32 AM, Marc-André Lureau wrote:
> I used the clang-tidy qemu-round check to generate the fix:
> https://github.com/elmarco/clang-tools-extra
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   hw/usb/dev-hub.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~

