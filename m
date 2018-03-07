Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1etaLD-0006qV-2F
	for mharc-qemu-trivial@gnu.org; Wed, 07 Mar 2018 09:46:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54393)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1etaLA-0006ny-GI
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2018 09:46:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1etaL5-000780-HF
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2018 09:46:48 -0500
Received: from mail-wm0-f67.google.com ([74.125.82.67]:40285)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1etaL5-00077c-9w
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2018 09:46:43 -0500
Received: by mail-wm0-f67.google.com with SMTP id t6so5199303wmt.5
	for <qemu-trivial@nongnu.org>; Wed, 07 Mar 2018 06:46:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=c3mX4eYloTeAfpdSbRb101Uoj2aEEBgV6WfOuunaPoM=;
	b=CfwjWZZsFIq9W53jdGnKCId8KiJNYCLjFdO3Woppqtm3MAgFahp0d+3WyO3evkLCLh
	YI+aMKMx9qZX/zVtYmmVrwO15rNOIvssffvau6B1+Y21UOyQnCgyL3Qn1iTeZr6HtbO3
	6EvIuDFCn0mHsVeVGKabIG5fu4Ab5OCFncWbQYNuZaSvV7+DLUhr150ECf39vw/9rX7c
	iA7Cqc+2XIr/PMKxxZlCI7hGg+TrcWjS+fDt0qwhKI7qmPlidBr2TELVRPO5VGCU+vFO
	fw8+umtFbvDUEd28i3Mg93LHGjqqPrlu2LWwkyJzQlwQSIetUeO3GuPmsZYJSu7zctXi
	evgg==
X-Gm-Message-State: AElRT7F4k7UtQZcBItLg0Vc5UphaObSR82s2vnvV9Ysv0WOg+OnnaqEm
	b40wdkF/jIvf/kr2MnvdH0q5BQ==
X-Google-Smtp-Source: AG47ELuj0sr7fqAsGj7T6A+Ql1Ax3d1yFaCRGuctWnXcrcE3JphNxiiv9Gv2qg9oT/555B4hl4ljfQ==
X-Received: by 10.28.13.136 with SMTP id 130mr15667145wmn.123.1520434001936;
	Wed, 07 Mar 2018 06:46:41 -0800 (PST)
Received: from [192.168.10.165] (94-36-191-219.adsl-ull.clienti.tiscali.it.
	[94.36.191.219]) by smtp.gmail.com with ESMTPSA id
	c56sm29560151wrc.82.2018.03.07.06.46.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Mar 2018 06:46:41 -0800 (PST)
To: Fam Zheng <famz@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20180306161728.20890-1-marcandre.lureau@redhat.com>
	<20180307013831.GF13844@lemon.usersys.redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2dc92ab1-b655-ba85-76cd-dd433bfe643f@redhat.com>
Date: Wed, 7 Mar 2018 15:46:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180307013831.GF13844@lemon.usersys.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.67
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] build-sys: make help could
 have 'modules' target
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
X-List-Received-Date: Wed, 07 Mar 2018 14:46:49 -0000

On 07/03/2018 02:38, Fam Zheng wrote:
> On Tue, 03/06 17:17, Marc-André Lureau wrote:
>> Available when configure --enable-modules.
>>
>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> ---
>>  Makefile | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/Makefile b/Makefile
>> index 9a75c48ae0..5d9ef3b8fd 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -1046,6 +1046,9 @@ include $(SRC_PATH)/tests/vm/Makefile.include
>>  help:
>>  	@echo  'Generic targets:'
>>  	@echo  '  all             - Build all'
>> +ifdef CONFIG_MODULES
>> +	@echo  '  modules         - Build all modules'
>> +endif
> 
> Hi Marc-André,
> 
> I'd just remove the 'ifdef' condition and include the line everywhere, since
> this is the help. The behavior is fine even without running ./configure:
> 
> $ make modules
> make: Nothing to be done for 'modules'.
> $ make all
> make: Nothing to be done for 'all'.
> 
> Fam
> 

Queued, thanks.

Paolo

