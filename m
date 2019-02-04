Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gqbui-0004id-Ls
	for mharc-qemu-trivial@gnu.org; Mon, 04 Feb 2019 05:55:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44296)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gqbud-0004gZ-Bd
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 05:55:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gqbub-0000ZQ-Qz
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 05:55:39 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43301)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gqbub-0000Wg-Ag
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 05:55:37 -0500
Received: by mail-wr1-x432.google.com with SMTP id r2so2151020wrv.10
	for <qemu-trivial@nongnu.org>; Mon, 04 Feb 2019 02:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=P/1qe5jewFte44yripUBNfvoFR9KJAGEpFuCUBYrKDg=;
	b=MoGHF6oLN1S2tW6xYzzdBGx5v+m1kpvptG0B/2a6acuFtrSeMgQhWaDL+u1vdezimk
	Q5Hh4E+j+SIUNReIW4/25vXer5kDL2F5abA6tZCrDGol/p6e6jOwrZ01nvmSe+OFIf43
	MKZ7ZwiBp0raBJv+4BBkPAC8Fwxw+3+I8n3gg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=P/1qe5jewFte44yripUBNfvoFR9KJAGEpFuCUBYrKDg=;
	b=qGO7x3bH7iEzAp9J2jCCQVohTJ6Wk+b8K6JOP1UMKok+AIgbLgmAwt0wgJXVC/TtnG
	2Yns4eMVHVJmZXyIqndAJUYpP6EKEoL77kHqEOQ/ymBGWcdcwqzmZ/sT8I1Y1z9h7WVw
	XiLkLFFrbnnrfYqtfcqdlKC2ThYwpjjw4be40yipKu9YHWUIx25Ba2HHncR1lsYa0q31
	vTKZL/06NadBIQxD9we5FXjxYhFIWf88+yYdtlSNGMOq3VWZFvpYE7hSXaRUlzBWW0Zr
	Pnh25Lve2C0mjWxtwNoQC7r+yeagQjEg+jLcH+E90CJWJgCe36du8TYRKkGf0+FFO36J
	8CCw==
X-Gm-Message-State: AHQUAuYkShsBSbc7xlKG4J7ckr+3aU2HxAcUlRwqCK/uMTXFY/xrCQ8z
	Ti3dyIgZeQ5kk3XCCCcXQEGmcQ==
X-Google-Smtp-Source: AHgI3Iah80uTw+AEZBHOsGpAIJNMLMXiWXU0oaUlWlErOGvIqIPl3iGViL1q9io4fPd+9XLKdk2oew==
X-Received: by 2002:adf:80a9:: with SMTP id 38mr33193781wrl.137.1549277733203; 
	Mon, 04 Feb 2019 02:55:33 -0800 (PST)
Received: from cloudburst.twiddle.net
	(host81-133-38-158.in-addr.btopenworld.com. [81.133.38.158])
	by smtp.gmail.com with ESMTPSA id t5sm8102382wmg.43.2019.02.04.02.55.31
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 02:55:32 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Anthony Green <green@moxielogic.com>
References: <1549266858-5043-1-git-send-email-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <61f149b0-0b67-c692-df9e-5f4c9a5e561c@linaro.org>
Date: Mon, 4 Feb 2019 10:55:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1549266858-5043-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::432
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target/moxie: Fix LGPL
 information in the file headers
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
X-List-Received-Date: Mon, 04 Feb 2019 10:55:44 -0000

On 2/4/19 7:54 AM, Thomas Huth wrote:
> It's either "GNU *Library* General Public License version 2" or "GNU
> Lesser General Public License version *2.1*", but there was no "version
> 2.0" of the "Lesser" license. So assume that version 2.1 is meant here.
> Also the files mentioned the GPL instead of the LGPL after declaring
> that the files are licensed under the LGPL, so change these spots to
> use LGPL, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  target/moxie/cpu.c       | 2 +-
>  target/moxie/cpu.h       | 4 ++--
>  target/moxie/helper.c    | 4 ++--
>  target/moxie/mmu.c       | 4 ++--
>  target/moxie/translate.c | 4 ++--
>  5 files changed, 9 insertions(+), 9 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

