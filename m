Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h0GQJ-0004M0-Sd
	for mharc-qemu-trivial@gnu.org; Sat, 02 Mar 2019 21:00:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35648)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h0GQI-0004Lo-7i
	for qemu-trivial@nongnu.org; Sat, 02 Mar 2019 21:00:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h0GQH-0001kc-Bn
	for qemu-trivial@nongnu.org; Sat, 02 Mar 2019 21:00:14 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40254)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1h0GQH-0001jp-47
	for qemu-trivial@nongnu.org; Sat, 02 Mar 2019 21:00:13 -0500
Received: by mail-wm1-f67.google.com with SMTP id g20so1484388wmh.5
	for <qemu-trivial@nongnu.org>; Sat, 02 Mar 2019 18:00:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=DLtYDlr1eL+S4/h7VUDBdIaFzk/ChHj7RijOpTXyJ5g=;
	b=n1uxWZQ4oGOUk1EDu4oCrQ9c4nIbb673Lko+QXD4UAjX++TpdCMJY4VuiZLTu3qM7K
	GokeMS5DLaeBxkG00vrh0UmtKyAUNE1gux4hGyan6b6k4GgzLDCislgTC8aoT5pWVnrZ
	61GSp9cipOMIV1RQu7ZARsZ+9ki8cD7rcu2ny/i1n9T6bHW3GiiXdLiSUD14B1kbG3k6
	IQfucOx7bSNwQqS0qnJ8+0vFvcJYHUTg/6Gtfq+0lKfBAJ0CfuzHos28xwd3VHBQxwKU
	VY0sLm3aNSaSS6ATU+RqmCHqxJxoJ2X1+IivuKUdeMQFg6RPQVFrdgPy34KsjIP5XMWd
	v7zw==
X-Gm-Message-State: AHQUAuYUzlWPgU9YKcEBrrc7pRYnZqXZttwwRVzPxHVoskG/m8TCFIpF
	DW7QrUo1y86O8FGalF5v52kjLw==
X-Google-Smtp-Source: APXvYqyrigwTiARar+UVMYj9B6SQf72gwTRiAfVEQAfT7BI1cGWh5lS8Vr51oc0XCqktJPuDWKR0cQ==
X-Received: by 2002:a05:600c:219a:: with SMTP id
	e26mr7590110wme.93.1551578411621; 
	Sat, 02 Mar 2019 18:00:11 -0800 (PST)
Received: from [192.168.1.37] (43.red-88-25-181.staticip.rima-tde.net.
	[88.25.181.43]) by smtp.gmail.com with ESMTPSA id
	i16sm2056681wru.16.2019.03.02.18.00.09
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Mar 2019 18:00:10 -0800 (PST)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20190302223825.11192-1-philmd@redhat.com>
	<20190302223825.11192-3-philmd@redhat.com>
	<26f2a83e-588a-c26c-86dc-51d5b8170ae9@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <9a96c8ce-1e3c-f88d-322a-b12645796a3d@redhat.com>
Date: Sun, 3 Mar 2019 03:00:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <26f2a83e-588a-c26c-86dc-51d5b8170ae9@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] util/error: Remove
 unnecessary saved_errno
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
X-List-Received-Date: Sun, 03 Mar 2019 02:00:15 -0000

On 3/3/19 2:12 AM, Eric Blake wrote:
> On 3/2/19 4:38 PM, Philippe Mathieu-Daudé wrote:
>> Since 552375088a8, error_set_errno() calls error_setv() which
>> already protect errno for clobbering.
>> Remove the now unnecessary saved_errno.
>>
>> Suggested-by: Thomas Huth <thuth@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  util/error.c | 3 ---
>>  1 file changed, 3 deletions(-)
>>
>> diff --git a/util/error.c b/util/error.c
>> index 934a78e1b1..0402fa1b9d 100644
>> --- a/util/error.c
>> +++ b/util/error.c
>> @@ -101,14 +101,11 @@ void error_setg_errno_internal(Error **errp,
>>                                 int os_errno, const char *fmt, ...)
>>  {
>>      va_list ap;
>> -    int saved_errno = errno;
>>  
>>      va_start(ap, fmt);
>>      error_setv(errp, src, line, func, ERROR_CLASS_GENERIC_ERROR, fmt, ap,
>>                 os_errno != 0 ? strerror(os_errno) : NULL);
>>      va_end(ap);
>> -
>> -    errno = saved_errno;
> 
> NACK. strerror() can clobber errno, so you still need to restore
> saved_errno, regardless of what error_setv() does internally.

Oops, I thought only strerror_r() would change errno, but checking the
man page I now see you are right:

  POSIX.1-2001 and POSIX.1-2008 require that a successful call to
  strerror() or strerror_l() shall leave errno unchanged, and note
  that, since no function return value is reserved to indicate an
  error, an application that wishes to check for errors should
  initialize errno to zero before the call, and then check errno
  after the call.

Thanks for catching that!

Phil.

