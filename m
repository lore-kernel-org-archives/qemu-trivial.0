Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fY3ho-0008Aa-D5
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jun 2018 02:13:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35957)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY3hm-00089Y-Qy
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 02:13:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY3hj-00006U-L0
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 02:13:26 -0400
Received: from mail-pf0-x229.google.com ([2607:f8b0:400e:c00::229]:36132)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY3hj-00005P-FB
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 02:13:23 -0400
Received: by mail-pf0-x229.google.com with SMTP id u16-v6so504051pfh.3
	for <qemu-trivial@nongnu.org>; Tue, 26 Jun 2018 23:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=jM/0gQcny134n9U710h4HQ3MS4XvI/libnP37f6q6PE=;
	b=Fl070bbRXkai0nMuvU6Vp0yTqWlrYW0i3R8tCLFJZauV875R5IkcLmwL6VkGBm56r+
	HeDCS5/plYmZkM4ZjS+GanNqsMv5Gq0geH1RXRHtdwXGYTu1MYFFMlBsShWWPTM/AQdp
	iJF/Tkr7nYPUn5U40YY8GWNvpiXkoofLqBl+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=jM/0gQcny134n9U710h4HQ3MS4XvI/libnP37f6q6PE=;
	b=NS8g000khlICLnYd1ZLi1aNEF1p2BQi8qn0UqAYBh/+RRWZJldyV8IuPLPmRNKMnaK
	0Rd6IAvgDhag1LAiUr1Hsn6un0YDcIRVJw4N1thAYIBxKS+Kq+WcGkd5yYd9QXJKc0OI
	4l/kN9F4o+A7VdMEZc6DzT1gKOwsHkxgVIIpHpjA2NoJ32RNhDCScUivOLFWeTB7xZAo
	+1MdmEVaUyGybu+jRium4LrIc8GFo6nCehrmqPXw3G0rJ8ILXLMULjiEg8JDvVYkVj/9
	L7Mh4YmKYV0a5JNYyKsJsqkR3uWT+CWDuoxwu5y80lIa7G6qO68jimwIiV6GhB33z+P8
	qwgg==
X-Gm-Message-State: APt69E3OJ4ehzOJJYHeflVqjD20pkwM97LH2zpvbdZ9XrqO+Y/B3c9qx
	bm5VSu30UFIVVgWCUetvgTlHsJDIpKo=
X-Google-Smtp-Source: ADUXVKJ4Qb0E6Wt2W5AL6SO2kSfywx9QkGrQDQU1eqyHt80gq/F+iTRTvbVpmfDzU0+znv5Lua2+6A==
X-Received: by 2002:a65:6491:: with SMTP id
	e17-v6mr4007584pgv.44.1530080002634; 
	Tue, 26 Jun 2018 23:13:22 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	y10-v6sm5119694pgr.44.2018.06.26.23.13.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Jun 2018 23:13:21 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>
Cc: qemu-trivial@nongnu.org, Jiri Slaby <jslaby@suse.cz>, qemu-devel@nongnu.org
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-16-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <78b2acfa-0f42-b764-7469-d6768027c30b@linaro.org>
Date: Tue, 26 Jun 2018 23:13:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180625124238.25339-16-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::229
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 15/46] hw/misc: Use the
 IEC binary prefix definitions
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
X-List-Received-Date: Wed, 27 Jun 2018 06:13:27 -0000

On 06/25/2018 05:42 AM, Philippe Mathieu-Daudé wrote:
> It eases code review, unit is explicit.
> 
> Patch generated using:
> 
>   $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/
> 
> and modified manually.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/misc/auxbus.c | 3 ++-
>  hw/misc/edu.c    | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


