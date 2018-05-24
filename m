Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fLydp-0001fU-KX
	for mharc-qemu-trivial@gnu.org; Thu, 24 May 2018 18:23:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60151)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fLydn-0001dQ-D3
	for qemu-trivial@nongnu.org; Thu, 24 May 2018 18:23:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fLydj-0008GR-Ce
	for qemu-trivial@nongnu.org; Thu, 24 May 2018 18:23:23 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:44552)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fLydj-0008GL-7s; Thu, 24 May 2018 18:23:19 -0400
Received: by mail-qk0-x241.google.com with SMTP id 185-v6so2613347qkk.11;
	Thu, 24 May 2018 15:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Uc6PuDgJhXZ3QH1OcxQlBrgN06Jum7VYiJHuh8pBp68=;
	b=CJ9OkLrIaCpwGQP9RO+jHlWEcEsxv/9MdvCBQ39A8zzxFozz3DfUwZ2kAuNuNjbULH
	T0kezEBvRkJWSsEIeSmfRHgMWzaf1pAqGpKaM3VbMiGlM6NHKUngyMDuLheff4ko3WFR
	jLO0NQtJFgmJnfnliNdBVT1yexAifWm3Kvi9b61kAUlGqMe1wZ3dMp69KgOAnAALoMPZ
	3UxihBzJk+7eG9oSDE5cu3P7ciKVuTuiNWNV7jUixBnTxDqNjX1xd9UkScrNKUvJA8CK
	XvJIXCgwTCWcMzILAW6YysWkzkvkjoMkU9OpANx7RytA0AUK0Ul4w/mFFrO+GZk5ze6J
	wGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=Uc6PuDgJhXZ3QH1OcxQlBrgN06Jum7VYiJHuh8pBp68=;
	b=i5aVO3imVQfCHRs2+OrserpZtuJYbPPoW/Q3rmisJZ0drsKY0wqk7rKH9Ae/XVrTLx
	jz+nzBJK72y0iLZGIFIzqUUlcRUpTluPZR1G8CwHVFKdZrffxorzrMPYA7tapm51hkN5
	yN2QjNk9LRuZ4agrXZvp3UIfk3RidEJlz9TIE3ErafQM9fbepRo7HlJzJ739UOV999Ft
	YdUsxKpyRqpapwZgR8rgDHEgkIbjbRJhA9z1jXJHFQAVLeJN8OyOF93393UFVJy2yzs0
	cycRadofsEnR3t6MsJsnfx66PFIrl9+qU9PijvfFIMWVbBOUK8iK16Y8/roiuTz5rDTR
	rrkg==
X-Gm-Message-State: ALKqPwevUTaliFS3I1LK15zek0dgszdcwoxYg5HAl/VgkFvVbsHX0/Jj
	zlv53gXBHnSjxren4iXcT0o=
X-Google-Smtp-Source: ADUXVKIlqXJuFMaKgq9C9A8nfyxfGP7CbMOshYYmr4Zh170jVmj7l1mBSLFldd6ZDDxU/5ZM/eYCSQ==
X-Received: by 2002:a37:7244:: with SMTP id
	n65-v6mr8538298qkc.17.1527200598625; 
	Thu, 24 May 2018 15:23:18 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	p72-v6sm437683qkl.32.2018.05.24.15.23.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 May 2018 15:23:17 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
	<2f652224f76c115f6c991766b7acac1e22580954.1526796813.git.mjt@msgid.tls.msk.ru>
	<d3acfa93-ee93-fce8-36bb-f481637b0140@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <1c5300ad-e7cb-b43b-764e-931365eb56fa@amsat.org>
Date: Thu, 24 May 2018 19:23:14 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <d3acfa93-ee93-fce8-36bb-f481637b0140@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 20/22] gdbstub: Handle errors
 in gdb_accept()
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
X-List-Received-Date: Thu, 24 May 2018 22:23:24 -0000

On 05/24/2018 06:35 PM, Paolo Bonzini wrote:
> On 20/05/2018 08:15, Michael Tokarev wrote:
>> From: Peter Maydell <peter.maydell@linaro.org>
>>
>> In gdb_accept(), we both fail to check all errors (notably
>> that from socket_set_nodelay(), as Coverity notes in CID 1005666),
>> and fail to return an error status back to our caller. Correct
>> both of these things, so that errors in accept() result in our
>> stopping with a useful error message rather than ignoring it.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>> ---
>>  gdbstub.c | 16 ++++++++++++----
>>  1 file changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/gdbstub.c b/gdbstub.c
>> index b99980d2e2..e4ece2f5bc 100644
>> --- a/gdbstub.c
>> +++ b/gdbstub.c
>> @@ -1814,7 +1814,7 @@ void gdb_signalled(CPUArchState *env, int sig)
>>      put_packet(s, buf);
>>  }
>>  
>> -static void gdb_accept(void)
>> +static bool gdb_accept(void)
>>  {
>>      GDBState *s;
>>      struct sockaddr_in sockaddr;
>> @@ -1826,7 +1826,7 @@ static void gdb_accept(void)
>>          fd = accept(gdbserver_fd, (struct sockaddr *)&sockaddr, &len);
>>          if (fd < 0 && errno != EINTR) {
>>              perror("accept");
>> -            return;
>> +            return false;
>>          } else if (fd >= 0) {
>>              qemu_set_cloexec(fd);
>>              break;
>> @@ -1834,7 +1834,10 @@ static void gdb_accept(void)
>>      }
>>  
>>      /* set short latency */
>> -    socket_set_nodelay(fd);
>> +    if (socket_set_nodelay(fd)) {
>> +        perror("setsockopt");
>> +        return false;
> 
> Coverity notes that this leaks fd.

Oops didn't noticed. It this is so trivial than Coverity could directly
send the fix to the list, like modern compilers.
>> +    }
>>  
>>      s = g_malloc0(sizeof(GDBState));
>>      s->c_cpu = first_cpu;
>> @@ -1843,6 +1846,7 @@ static void gdb_accept(void)
>>      gdb_has_xml = false;
>>  
>>      gdbserver_state = s;
>> +    return true;
>>  }
>>  
>>  static int gdbserver_open(int port)
>> @@ -1883,7 +1887,11 @@ int gdbserver_start(int port)
>>      if (gdbserver_fd < 0)
>>          return -1;
>>      /* accept connections */
>> -    gdb_accept();
>> +    if (!gdb_accept()) {
>> +        close(gdbserver_fd);
>> +        gdbserver_fd = -1;
>> +        return -1;
>> +    }
>>      return 0;
>>  }

