Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gopSQ-0000UN-R7
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 07:59:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59365)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1gopSP-0000Sk-2a
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 07:59:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1gopSO-00069W-8G
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 07:59:08 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:33189)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.weiyang@gmail.com>)
	id 1gopSM-00066R-AN; Wed, 30 Jan 2019 07:59:06 -0500
Received: by mail-ed1-x541.google.com with SMTP id p6so18975120eds.0;
	Wed, 30 Jan 2019 04:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=+rJCRWzsduVI/OAVQMTyBKtU/1kRBfzFCQhl9oGwzKY=;
	b=q1+rCLX/KrSxVjdDBLBrv8KmXgt8h0kKFM4C5Ba8yQ7wOlmiFzNVxAXVMhN/554Pm7
	E+6hiuAk6x5Ze85hfRYENwoL9ltcLIQ/R6VPCbrM0XZWwFFxRzaH+vrM2c8Hv2QDI3JD
	EXNYvqXcaB9po/RKSs85BtujGBp0xZi7dlgQceF29xzYllsOtlh9fe/e3A8Bdt1fVZi+
	qI4aZq16fZrGIh9HhC0h8cyJzgt8Cf3fMLA54F/i3/3tii+sPJNuNgrmtT/VmxYDuS2S
	+GH0ZLDVVCm047pa/Hp0teqSowN7XhMl3b5VKe20r58DBCVWHJG8YvT+1JtbPWerPPSO
	J53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=+rJCRWzsduVI/OAVQMTyBKtU/1kRBfzFCQhl9oGwzKY=;
	b=ftTM3kvNtSLjihf1KPHCS0g4EE9rw3F/gXuBCWnxp1QE+pnsxYkPwYxZwVbM+skBZ8
	PqscfZNm2rVOsutwutlrSJkLAEyg5kp12f091sWf+FUoLwuVRhrxns+xqAZ5ia2N0fgQ
	1YnQT7O2dsxnJsmc2Zah+WiNc9YgRpNkPFVLEHRPJq3dJ9Aj7NIHhX4UVy5ftIya27v3
	80DPFNgFK2lzcJ2BXiCgbszNccpd7G0bBE65M4kuVt4p6euTQXz7Z5/FAg9K9CExIvBk
	aTYIUUNXWhofaXSEc1gyHINHQxwMMAeWkMjjXXekGcE5tXnSBbLYcZ1hy7dEAt3WoBGj
	/H3w==
X-Gm-Message-State: AJcUukcyr/DSzvXW9WJGYzUHxtI6EnDg6xT7zKSNiePhI92LEF4dfhn9
	la9fKcnEPQb9bn2P9VB2iP4=
X-Google-Smtp-Source: ALg8bN6YXmgeSlANgBFabIAEtcZlta7hwtkw8mRakXDwJolcbEmT7IXr14DZnemUre6wmgLmu3yt5Q==
X-Received: by 2002:a17:906:6582:: with SMTP id
	x2mr15171708ejn.62.1548853145276; 
	Wed, 30 Jan 2019 04:59:05 -0800 (PST)
Received: from localhost ([185.92.221.13])
	by smtp.gmail.com with ESMTPSA id g21sm490212edc.63.2019.01.30.04.59.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 30 Jan 2019 04:59:04 -0800 (PST)
Date: Wed, 30 Jan 2019 12:59:03 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: Wei Yang <richardw.yang@linux.intel.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, imammedo@redhat.com, mst@redhat.com
Message-ID: <20190130125903.bewxhjvlyud5mdqh@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20190130030207.6770-1-richardw.yang@linux.intel.com>
	<3e847da2-8ced-fefd-b566-30093d9fe331@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e847da2-8ced-fefd-b566-30093d9fe331@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::541
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] i386,
 acpi: cleanup build_facs by removing second unused argument
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
X-List-Received-Date: Wed, 30 Jan 2019 12:59:09 -0000

On Wed, Jan 30, 2019 at 12:15:57PM +0100, Philippe Mathieu-Daudé wrote:
>On 1/30/19 4:02 AM, Wei Yang wrote:
>> The second argument of build_facs() is not used, just remove it.
>> 
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>
>Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Thanks :-)

>
>> ---
>>  hw/i386/acpi-build.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>> index 236a20eaa8..023729c1f2 100644
>> --- a/hw/i386/acpi-build.c
>> +++ b/hw/i386/acpi-build.c
>> @@ -292,7 +292,7 @@ static void acpi_align_size(GArray *blob, unsigned align)
>>  
>>  /* FACS */
>>  static void
>> -build_facs(GArray *table_data, BIOSLinker *linker)
>> +build_facs(GArray *table_data)
>>  {
>>      AcpiFacsDescriptorRev1 *facs = acpi_data_push(table_data, sizeof *facs);
>>      memcpy(&facs->signature, "FACS", 4);
>> @@ -2643,7 +2643,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>>       * requirements.
>>       */
>>      facs = tables_blob->len;
>> -    build_facs(tables_blob, tables->linker);
>> +    build_facs(tables_blob);
>>  
>>      /* DSDT is pointed to by FADT */
>>      dsdt = tables_blob->len;
>> 

-- 
Wei Yang
Help you, Help me

