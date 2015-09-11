Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaIuZ-0003jr-F7
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 03:38:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41477)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jerome.forissier@linaro.org>) id 1ZaIuX-0003hW-9p
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 03:38:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jerome.forissier@linaro.org>) id 1ZaIuU-0007uj-2a
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 03:38:17 -0400
Received: from mail-wi0-f181.google.com ([209.85.212.181]:33943)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jerome.forissier@linaro.org>) id 1ZaIuT-0007tg-Ht
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 03:38:13 -0400
Received: by wicfx3 with SMTP id fx3so53730488wic.1
	for <qemu-trivial@nongnu.org>; Fri, 11 Sep 2015 00:38:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=XQd3cBFahwu+AaSD/WvnqHiSc7kYARe/aF7+o+RP+YY=;
	b=eh8rp/gVhl6n+8eMQHoWF82/hGJDi5Lt7aVKtsSS3dd78cbndXzSUb5pOfScXv1nS0
	mjVNlsQQ+pDxExOmRpztO1wopncA6Gn25MabVg7wdU/XZN4K0r03XcC0+qtXuQMfohg+
	+fHHicy6DsoGQCWuNOPJuELw3+d5tG+kM9VKFdOXgJg04hsStiJ6DSWJmRfyfGSs5fuS
	9hCrfnUM1a4EA1EEcoAD+tGNyz2/ojJyf1b7CwNGoJAlyPIxd3XPlnQwXX6Fm8JPCuk5
	TUry2d7c85/Laj2XpD6VZLhumTLg5JqwyCdoD1x7JaMmz5yVRXM4AnWdGWS26QBr1WIX
	efwg==
X-Gm-Message-State: ALoCoQl+QFmPpH9Z6NzQqGr7uG0esp0KQfNDrPHVYX0pTi+b8PT1urZVumdNaDXOC9SN0IEosYUN
X-Received: by 10.194.110.37 with SMTP id hx5mr79231275wjb.149.1441957092497; 
	Fri, 11 Sep 2015 00:38:12 -0700 (PDT)
Received: from [192.168.0.11] (mou06-2-88-169-86-104.fbx.proxad.net.
	[88.169.86.104]) by smtp.googlemail.com with ESMTPSA id
	bu19sm297186wjb.45.2015.09.11.00.38.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Sep 2015 00:38:12 -0700 (PDT)
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
References: <1441185266-25643-1-git-send-email-jerome.forissier@linaro.org>
	<55F27F7B.7080104@msgid.tls.msk.ru>
From: =?UTF-8?B?SsOpcsO0bWUgRm9yaXNzaWVy?= <jerome.forissier@linaro.org>
Message-ID: <55F284E1.2050200@linaro.org>
Date: Fri, 11 Sep 2015 09:38:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <55F27F7B.7080104@msgid.tls.msk.ru>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.181
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] Makefile: suppress command echoing in
 silent mode (make -s)
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Sep 2015 07:38:18 -0000



On 09/11/2015 09:15 AM, Michael Tokarev wrote:
> 02.09.2015 12:14, Jerome Forissier wrote:
>> Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
> 
> Please Cc qemu-devel on patches.

OK, sorry. I wrongly assumed that trivial patches were to be sent to
qemu-trivial only to avoid "polluting" qemu-devel. Obviously I read
http://wiki.qemu.org/Contribute/TrivialPatches too quickly.

>>  rules.mak | 13 ++++++++++++-
>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/rules.mak b/rules.mak
>> index 4551b9e..a44ba29 100644
>> --- a/rules.mak
>> +++ b/rules.mak
>> @@ -125,7 +125,18 @@ modules:
>>  %.a:
>>  	$(call quiet-command,rm -f $@ && $(AR) rcs $@ $^,"  AR    $(TARGET_DIR)$@")
>>  
>> -quiet-command = $(if $(V),$1,$(if $(2),@echo $2 && $1, @$1))
>> +# Suppress command echoing in silent mode (make -s)
>> +ifneq ($(filter 4.%,$(MAKE_VERSION)),)  # make-4
>> +ifneq ($(filter %s ,$(firstword x$(MAKEFLAGS))),)
>> +SILENT := 1
>> +endif
>> +else                                    # make-3.8x
>> +ifneq ($(findstring s, $(MAKEFLAGS)),)
>> +SILENT := 1
>> +endif
>> +endif
>> +
>> +quiet-command = $(if $(V),$1,$(if $(2),$(if $(SILENT),@$1,@echo $2 && $1),@$1))
> 
> I'm not sure this is needed.  We have V=1/V=0 way of controlling silent mode
> already,

Unless I'm mistaken, V does not allow silent mode. The current behavior is:

- "make" prints short commands only. For instance: " CC file.o".
- "make V=1" prints the full commands instead (and BTW "make V=0" does
the same, which is a bit unexpected). For instance: "cc <flags> -c -o
file.o file.c".

But, AFAICT, there is no way to suppress all output altogether. With the
proposed patch, you can use "make -s" and get *no* output unless there
is an error.

Silent mode is useful in continuous integration scenarios, where nobody
is sitting in front of the terminal to watch the progress of the build,
and it's better not to fill up the build logs with stuff unless we have
an error.

> why add another way, which is also twisted (depends on make version
> and complicates already complex makefiles)?

Yeah it's a bit unfortunate that make changed its behavior :(

Thanks,
-- 
Jerome

