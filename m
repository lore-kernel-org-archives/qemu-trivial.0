Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fYfnO-00013g-9Z
	for mharc-qemu-trivial@gnu.org; Thu, 28 Jun 2018 18:53:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48193)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fYfnL-00011A-Kj
	for qemu-trivial@nongnu.org; Thu, 28 Jun 2018 18:53:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fYfnK-0003R8-L1
	for qemu-trivial@nongnu.org; Thu, 28 Jun 2018 18:53:43 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:42988)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fYfnG-0003Kk-BF; Thu, 28 Jun 2018 18:53:38 -0400
Received: by mail-qk0-x244.google.com with SMTP id u62-v6so3963702qkf.9;
	Thu, 28 Jun 2018 15:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=i5ULdSp/hOF9d4lnFvrkwxP9CSLsoKtrd1JdRy4D49M=;
	b=pFxLUSxntsBmyE7muG7SVbCkR9dDpijbH8IAw2M3n2uKJA1TK0IC3L7utqOugYwT1s
	c0kRYyqo4+acjBxyHzb6hamslPnmCelMUhY3fGnFq+rgsrqVzf+4oH6fUB9mOsLs+gcb
	50rN9w8+gC6xF5UHUJCu/q+opeR3gOx/iTvBYfM1vEni1gwghcJzdUsH32j+geRLUoCk
	XGD44NM722xFC41NlpMjSoRoksGjnBKP3loZR2CwMJs1BmZzLMOkKxpPyYKqNP1QyR7m
	GP63CzkxznmkTUdVq+SQdckmvphjT/kRs01Yuky3Ox+LMHvfz2w5XKOuu05uvcC5eAUb
	w1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=i5ULdSp/hOF9d4lnFvrkwxP9CSLsoKtrd1JdRy4D49M=;
	b=iW6tme2xYtB9wbejeFnV4iPM1iTur8eP1zxPEBY1oQSMEsAFnB7j7MJbiDOD3hkJOu
	gGmb9lSMc9qg8YU4yt+eigB9bFn0iWd+rA61Ntq2C33uuDL/3xqcQrcKnutZXErY59sF
	qwVvbMZyq1oQCE/pmtNe+QP7TqqndA6QDcWz214k/IDHsxXsqZ3QJ6dsn0/nVfsAJsnT
	wIewinWSTErwYyQ2+OR4g8WZDhk5oiffYt9f1ObqTfsE8ZGWCuWvOWM+hqvqgl976LLH
	4FEz5egw9sljiOJZb8m8Y3Ut4rwLf5vmAQRlo8s8wBmDQ4tlDbHc3nqjkSfo7sbmAA3U
	GKgw==
X-Gm-Message-State: APt69E07WC/gs+dY8FBsKNcM+bvCN7Rz9LCJzTieOO6w0KibHLq+UPHQ
	VV5Se5JClZqiKzfmjmJr0c52hCZQ
X-Google-Smtp-Source: AAOMgpceFFdCkLNQg050R1l1yANG4LeB4XQy2DI7g95tepbcX22kLWGPjwjuPFAXmNGPx9GvgsNT+A==
X-Received: by 2002:a37:192:: with SMTP id
	u18-v6mr10981350qkg.254.1530226417549; 
	Thu, 28 Jun 2018 15:53:37 -0700 (PDT)
Received: from [192.168.100.74] (host8.190-229-104.telecom.net.ar.
	[190.229.104.8]) by smtp.gmail.com with ESMTPSA id
	e11-v6sm5476507qkb.4.2018.06.28.15.53.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Jun 2018 15:53:36 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Eric Blake <eblake@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-trivial@nongnu.org,
	Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-2-f4bug@amsat.org>
	<20180627132747.76773eb9@redhat.com>
	<3dd9341a-f4e6-c107-2f1f-0745d039f03e@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <15aad1db-2f4c-ea49-9966-a969f0c769f5@amsat.org>
Date: Thu, 28 Jun 2018 19:53:31 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <3dd9341a-f4e6-c107-2f1f-0745d039f03e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 01/46] include: Add IEC
 binary prefixes in "qemu/units.h"
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
X-List-Received-Date: Thu, 28 Jun 2018 22:53:44 -0000

On 06/27/2018 09:26 AM, Eric Blake wrote:
> On 06/27/2018 06:27 AM, Igor Mammedov wrote:
>> On Mon, 25 Jun 2018 09:41:53 -0300
>> Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>>> Loosely based on 076b35b5a56.
>>>
>>> Suggested-by: Stefan Weil <sw@weilnetz.de>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
> 
>>> +#ifndef QEMU_UNITS_H
>>> +#define QEMU_UNITS_H
>>> +
>>> +#define KiB     (INT64_C(1) << 10)
>>> +#define MiB     (INT64_C(1) << 20)
>>> +#define GiB     (INT64_C(1) << 30)
>>> +#define TiB     (INT64_C(1) << 40)
>>> +#define PiB     (INT64_C(1) << 50)
>>> +#define EiB     (INT64_C(1) << 60)
>> Shouldn't above use UINT64_C()
> 
> Since the decision of signed vs. unsigned was intentional based on
> review on earlier versions, it may be worth a comment in this file that
> these constants are intentionally signed (in usage patterns, these tend
> to be multiplied by another value; and while it is easy to go to
> unsigned by doing '1U * KiB', you can't go in the opposite direction if
> you want a signed number for '1 * KiB' unless KiB is signed).

OK.

I'll also change this tests using your suggestion:

diff --git a/tests/test-qemu-opts.c b/tests/test-qemu-opts.c
@@ -709,8 +709,7 @@ static void test_opts_parse_size(void)
                            false, &error_abort);
-    g_assert_cmphex(qemu_opt_get_size(opts, "size2", 0),
-                     ==, 16777215 * T_BYTE);
+    g_assert_cmphex(qemu_opt_get_size(opts, "size2", 0), ==, 16777215U
* TiB);

to avoid this error on 32-bit archs:

source/qemu/tests/test-qemu-opts.c: In function 'test_opts_parse_size':
source/qemu/tests/test-qemu-opts.c:713:71: error: integer overflow in
expression [-Werror=overflow]
  g_assert_cmphex(qemu_opt_get_size(opts, "size2", 0), ==, 16777215 * TiB);
                                                                       ^

