Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1edT7c-0002hV-Q2
	for mharc-qemu-trivial@gnu.org; Sun, 21 Jan 2018 22:50:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33525)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1edT7a-0002cY-8K
	for qemu-trivial@nongnu.org; Sun, 21 Jan 2018 22:50:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1edT7Z-00021V-JP
	for qemu-trivial@nongnu.org; Sun, 21 Jan 2018 22:50:10 -0500
Received: from mail-pg0-x232.google.com ([2607:f8b0:400e:c05::232]:41265)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1edT7Z-00020w-F6
	for qemu-trivial@nongnu.org; Sun, 21 Jan 2018 22:50:09 -0500
Received: by mail-pg0-x232.google.com with SMTP id 136so6096042pgd.8
	for <qemu-trivial@nongnu.org>; Sun, 21 Jan 2018 19:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Th+oNakTVW6Ib8qNPisJ2guXhgUaLhVNwx+ReeGVYxs=;
	b=OFjS2fH33ID1mX6+56fpQ67Xv354QJOU6khwwrGO/ZJTIvYlCvYZQvwfTk/5k9p0gk
	z3XhWnNv5JfOmMqdiBvEqXZu4014A/Tx5VC4fsfJXEK4XAgPKF+pqMxZDg1gBmVAnba1
	JCW+S4iJt0aVYPtoCKga9F+H2V+I83xyUBR5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Th+oNakTVW6Ib8qNPisJ2guXhgUaLhVNwx+ReeGVYxs=;
	b=dF4kf0l6P6Nq3DGb5iIOejP1xcJhihxSkVM620ry2szQAkV749A+dtLjiDOSQpoK+n
	Z71PwkIuZnr5ivP8NVPX23QKD5hStLCOozBtvAA+K2wm3H14pj35tztlFsQzW7OFe1/2
	A2NRZsSj94I0NE/SBlp8Q9OLXcjM4oAV3L/d6wBJOgkWKYgC+GGulg4qbYzqaN+mex1q
	mn0wWX+U4daYnMqMzSSwvvFvyPywg8uuX7WshlRIH1rntUbnUi16A7zppSG0gfiHIAPv
	CY0PGxYgreQwcEOFT95FZ6qnsoR70C9dmMp7rYmNJSmxmIC8+2hzGS4gGc8rA4OM+V1F
	IQWQ==
X-Gm-Message-State: AKwxytcORSiWTj0ipgAk21oawMx41C41D033FaElrQ4gyWyJ3ExRjhMp
	2pgFSGsAJna1JKD2wlpbCL70aHPKo/o=
X-Google-Smtp-Source: AH8x227wk4kqoxeI8u9p9TJcR7U6ydW8183bQoiuaa7mJs6QyOB+FxIxccamDYnSvGRTWg/hh2PhcQ==
X-Received: by 10.101.64.67 with SMTP id h3mr6114913pgp.168.1516593008145;
	Sun, 21 Jan 2018 19:50:08 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net.
	[174.21.6.47]) by smtp.gmail.com with ESMTPSA id
	p75sm28840532pfi.148.2018.01.21.19.50.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 Jan 2018 19:50:07 -0800 (PST)
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20180119114444.7590-1-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <58589c41-6866-e26f-8743-015d91fe2fbc@linaro.org>
Date: Sun, 21 Jan 2018 19:50:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180119114444.7590-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::232
Subject: Re: [Qemu-trivial] [PATCH] target/m68k: fix TCG variable double free
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
X-List-Received-Date: Mon, 22 Jan 2018 03:50:11 -0000

On 01/19/2018 03:44 AM, Laurent Vivier wrote:
> t64 is also unconditionally freed after the switch () { ... }
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  target/m68k/translate.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

