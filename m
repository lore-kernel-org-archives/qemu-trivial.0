Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gDNBN-0002uR-Jc
	for mharc-qemu-trivial@gnu.org; Fri, 19 Oct 2018 01:18:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41990)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gDNBJ-0002sX-Jp
	for qemu-trivial@nongnu.org; Fri, 19 Oct 2018 01:18:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gDNBE-0006Dv-1L
	for qemu-trivial@nongnu.org; Fri, 19 Oct 2018 01:18:41 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52674)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gDNAz-0005wU-Vg
	for qemu-trivial@nongnu.org; Fri, 19 Oct 2018 01:18:24 -0400
Received: by mail-wm1-f67.google.com with SMTP id 189-v6so2336547wmw.2
	for <qemu-trivial@nongnu.org>; Thu, 18 Oct 2018 22:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Ebj+bkZcnFTklezsrJkUgTx+PvLkpK8gHbKIn/UBOKc=;
	b=tbd/C9B1ha1cTtSo4uskTrtZBDoDy0IXq+2K4c7kOrk7DnDGSX81J0fTpGhefGhA9n
	jjL/EJUdF0Z2aKqrRjVI7gYb80Pts2pWCvwZpzq6TNjuVR4PytNZP7TEqvPuKx/v2DvY
	qHKbKYP4SGU2nwakG4WPoIdotxoSO0Uif0l7TO2I4PIO5ithe76AdYFrKVIyJpPE9Y0U
	eOW9ap1+RFOqumJfWKyZyYv9CH7OJJJcnqRASUsneHdwiuO/PCwuT3AOlGrYibSrAWnW
	Jqwl6GrdHc99gyiN8coKk01vagh3fo7qr0z1zDOKeKy4f4F8kuCfJYXTfmlbJwKwDZ+q
	rxIg==
X-Gm-Message-State: ABuFfohZ+hxjZFymo3kGe2WlrIfIZE4U5ao+7EIsFEzM+Vn5niNKCbik
	8mRcqCLtg4t0HqYL3P+xHIG4kfDiI1Q=
X-Google-Smtp-Source: ACcGV62TtDB7Q8KPvx5CW41nZKjnJAfwNFxIKHccEqu6tSdFJgtTcv3avVc9cfe6CyKRZ99aKBGNDg==
X-Received: by 2002:a1c:af07:: with SMTP id y7-v6mr3305647wme.33.1539926297587;
	Thu, 18 Oct 2018 22:18:17 -0700 (PDT)
Received: from [10.124.10.192] (smb-adpcdg1-05.hotspot.hub-one.net.
	[213.174.99.133]) by smtp.gmail.com with ESMTPSA id
	v129-v6sm1370661wme.45.2018.10.18.22.18.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Oct 2018 22:18:16 -0700 (PDT)
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: "Bonzini, Paolo" <pbonzini@redhat.com>, qemu-devel
	<qemu-devel@nongnu.org>, qemu-trivial@nongnu.org
References: <20181011171254.32428-1-philmd@redhat.com>
	<CAMxuvay4Hs_Aa1km5vav75GAdxtzo0YO=xfe8H-_=-7oS1ej-w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2c64df66-6949-56f8-02a2-8a61b2c9fd98@redhat.com>
Date: Fri, 19 Oct 2018 07:18:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAMxuvay4Hs_Aa1km5vav75GAdxtzo0YO=xfe8H-_=-7oS1ej-w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-trivial] [PATCH] vl: Print error when using incorrect
 backend for debugcon
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
X-List-Received-Date: Fri, 19 Oct 2018 05:18:44 -0000

Cc'ing qemu-trivial@

On 11/10/2018 23:48, Marc-André Lureau wrote:
> On Thu, Oct 11, 2018 at 9:13 PM Philippe Mathieu-Daudé
> <philmd@redhat.com> wrote:
>>
>> When using an incorrect backend for the debugcon, QEMU exits silently
>> without any error indication, which is confusing.
>> Add a message that the character backend is invalid.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
>> ---
>>  vl.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/vl.c b/vl.c
>> index 4e25c78bff..61305b5891 100644
>> --- a/vl.c
>> +++ b/vl.c
>> @@ -2466,6 +2466,7 @@ static int debugcon_parse(const char *devname)
>>      QemuOpts *opts;
>>
>>      if (!qemu_chr_new_mux_mon("debugcon", devname)) {
>> +        error_report("invalid character backend '%s'", devname);
>>          exit(1);
>>      }
>>      opts = qemu_opts_create(qemu_find_opts("device"), "debugcon", 1, NULL);
>> --
>> 2.17.1
>>

