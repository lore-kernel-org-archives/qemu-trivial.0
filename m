Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVw1h-0001be-I8
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 04:32:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVw1f-0001aF-3Y
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:32:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVw1b-000792-WA
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:32:39 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:33153)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dVw1b-00078r-R7; Fri, 14 Jul 2017 04:32:35 -0400
Received: by mail-qk0-x243.google.com with SMTP id a66so10259966qkb.0;
	Fri, 14 Jul 2017 01:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Bm9f+OnElTzSN5ZIRYFPn+iwRPae6V0jepujNeeLEFo=;
	b=hbtEXXDd4ddNpg88Kfety06xDLVDbi9J5HERoIBh6DqthnsUiHCHaNNYp3Tq42vHYD
	eAiU6Gky14geitZs2ZtOIptxNafrLYr2nFRBYmoDrzK0/kIeDCl9oHIjsTf7qFvXwyFp
	cUa/tC9sJHt3C5Qw8K7Lo5yLBaclD1wrSoaVouY7rL9GGIscqBsztJQ/VrSI4qTfO/ro
	GZoPJDFYF/qEhMWI7HcK2k4kbyg3ZFplKNs8hiFZpqBPnF2Wysp9EIQCfDWVmswoHg98
	a4n+zy0nQML0tBrI/L1Xk6u9DQ3GAA4XcON1tL0v6XZAbkDTL9FdpBZFTgF7NyM1W8/U
	11GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Bm9f+OnElTzSN5ZIRYFPn+iwRPae6V0jepujNeeLEFo=;
	b=deve4U7Ecer6LeopVjakACRXI3N4tDF4XLrP61uMEC673pjOblqIx5HH8/12PPMCzs
	ehLyD0Axn0fWPwfTCWRia8MlkRdFMu4GHqJKoWQyZhQeSvj/zD1BbQNYpZ6WoZkolQP+
	DF+lNlLNxnTDv8MXFvjQKhnxrT7CKue1XF/vCFudvLQTcshdvLs/bmc+OzmILne9DWXJ
	vZDNxKax/tOld2ZU6y0I03RvtaZKD+qJU+sgpqPBYyDQrtWkiRKP/xemVXInJd9y27b4
	TNntA5IdFdhUPvUOs7eI7ma4OY9FF1IahJLIzEWRFTNzH75fhCdfvN+YvEHgZHiMUYhD
	3wdg==
X-Gm-Message-State: AIVw110RJSfVkJ6nMpGG/BcibuxXIvroj1zyWvgBRYtg5RsW9mQ8Ugg+
	eTyBI8YoW613VA==
X-Received: by 10.55.168.206 with SMTP id r197mr10306432qke.142.1500021155286; 
	Fri, 14 Jul 2017 01:32:35 -0700 (PDT)
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com.
	[173.197.98.123]) by smtp.googlemail.com with ESMTPSA id
	s12sm6483257qtc.52.2017.07.14.01.32.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 01:32:34 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, peter.maydell@linaro.org,
	"open list:qcow2" <qemu-block@nongnu.org>, qemu-trivial@nongnu.org,
	Max Reitz <mreitz@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-9-marcandre.lureau@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <a5b0eec8-9682-b352-191b-288d1d375bf7@twiddle.net>
Date: Thu, 13 Jul 2017 22:32:29 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-9-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 08/29] qcow2: use
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
X-List-Received-Date: Fri, 14 Jul 2017 08:32:40 -0000

On 07/13/2017 06:31 AM, Marc-André Lureau wrote:
> I used the clang-tidy qemu-round check to generate the fix:
> https://github.com/elmarco/clang-tools-extra
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   block/qcow2-cluster.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~

