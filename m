Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVw6l-0005ri-Jn
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 04:37:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46732)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVw6j-0005q0-OK
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:37:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVw6g-0001Kv-MU
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:37:53 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:35814)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dVw6g-0001Kr-Hb; Fri, 14 Jul 2017 04:37:50 -0400
Received: by mail-qk0-x244.google.com with SMTP id c18so1142351qkb.2;
	Fri, 14 Jul 2017 01:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=vzsom7GyspQy7rNZ/P8/HaiZDZFr9GDDCNPVOkiqNow=;
	b=IwhPr8++V48rQYmAnuK/PVu659bH55A5b72T4kTrAMYjeCIY24QKs9t5ciSX5VTTdb
	l1GZF8mhgnIt7YtEoG+BP4MYzIkEHubEN0bLRUXhE4+zG3q01Om4FhilsOcNgLBMgtUz
	kiGkLCqpPI679qFfBoohOTBEd8E9eaAgxPDeRZDvvePdDM8q2OzyBcUsgbtYTLfY6Tw2
	SfZHbeF0QlX6rLoOrKSUjUT7XRL1YiytXma+qkMA+IprT7+M9HcZ2f+z2pjLG9kSdULB
	i8YBO2FKeZrPJFPAfaz7KYdwgu1hHf8VA7kwqB+1Jd6dG4Rg8xuen2HARAw937mWbfWk
	Lu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=vzsom7GyspQy7rNZ/P8/HaiZDZFr9GDDCNPVOkiqNow=;
	b=F7V65+Qbtf7eujQV0NI+l3gCNWjXzSQiw4Phrl8DVuvAbdPMIIGRWtZWPXJinhc625
	hPFIqK3hbQmvZSV0PPkl2TrTQaQKp1IwFGaTDpn7pu8hXc8ky70NjCT5Dly5OZCd2x2F
	vN4l+PSpsRYARDLkXBOWQbQycipfleHfIRXSICiXyK9/fs3vL7DMxXlwsTt3BFCAniJ0
	C3Pt/r5BlVWZnDb94ohhVs1CZnu0uLIt/TKhGV8eSqAPxryQIY+GFx1QJDJ3KGkQ0XRV
	lHW/1trzSzrm1N7br9Jgumd1GaquJcXyqMXk6iXY3FI5e+kvYaFFZ3wd+4CYWrqi+5lP
	Gqsw==
X-Gm-Message-State: AIVw110bVKvVQKO+gDSCcQqNx5d+wPpK9MR4VNPpjFcotCX8psDoYs40
	NWOQlmm9R7e5gg==
X-Received: by 10.55.19.138 with SMTP id 10mr9562058qkt.34.1500021469994;
	Fri, 14 Jul 2017 01:37:49 -0700 (PDT)
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com.
	[173.197.98.123]) by smtp.googlemail.com with ESMTPSA id
	h5sm5760796qkc.6.2017.07.14.01.37.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 01:37:49 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	"Michael S. Tsirkin" <mst@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-15-marcandre.lureau@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <15e46265-60e7-6238-47ae-13800688fe5e@twiddle.net>
Date: Thu, 13 Jul 2017 22:37:46 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-15-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 14/29] virtio-gpu: use
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
X-List-Received-Date: Fri, 14 Jul 2017 08:37:54 -0000

On 07/13/2017 06:32 AM, Marc-André Lureau wrote:
> I used the clang-tidy qemu-round check to generate the fix:
> https://github.com/elmarco/clang-tools-extra
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   hw/display/virtio-gpu.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~

