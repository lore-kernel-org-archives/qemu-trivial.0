Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fGAto-0003jF-Kr
	for mharc-qemu-trivial@gnu.org; Tue, 08 May 2018 18:15:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41846)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1fGAtm-0003hb-P4
	for qemu-trivial@nongnu.org; Tue, 08 May 2018 18:15:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1fGAtj-0001xx-Kf
	for qemu-trivial@nongnu.org; Tue, 08 May 2018 18:15:54 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:37783)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1fGAtj-0001w8-Er
	for qemu-trivial@nongnu.org; Tue, 08 May 2018 18:15:51 -0400
Received: by mail-wm0-f68.google.com with SMTP id l1-v6so24211880wmb.2
	for <qemu-trivial@nongnu.org>; Tue, 08 May 2018 15:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=/2K+R8AYVuPdwN4v2vLn6GToiHwnwZDc9uPAy5O5ux4=;
	b=Z56VvvDSr4bvrReet6d8/NJhCJQ+wto1DT7U5iBX/2woDfF1lThdMPPLTflx/mV/8m
	/zJtm4E3t5EZjgLQMgbd1ijLjVg+wOyCfJWc6Lu+SciKi5dPgcVzy0+ULb3+qGfWKP/d
	7vvSolAYQ5EVcmvQYWJhq6TK+TwRHAYGglQH6C5lHMXePAWnk1QLrDVn6LhKwoXXjicY
	klG5fVXFQrb6Mg9bQu8Q9NYIhzDixSqEEyh4X3ZRHmjVnuxLx1/1KhPQhW43xXFmjM7Z
	ZJIhwm+9JuVHKln3vK6nBZighf6soGhRob4Bm73/261MpBakGpB1KqCfwowVLAmoBwPN
	c3vw==
X-Gm-Message-State: ALQs6tDgc0DESU4X2EAKTy7GhPDZ59DAeMcASq3G162RvU9aGRUK6smR
	4gVjDwHNZIymJxuAbHIaAp+iyg==
X-Google-Smtp-Source: AB8JxZpQ+uU07vMkDZLHKMsBE6pdR/SfeLxLnNRRH/jEba5ZMAkFtokiFtjpDkP+FTr6JYU7lcHhtg==
X-Received: by 2002:a50:8bbd:: with SMTP id
	m58-v6mr58454942edm.165.1525817750413; 
	Tue, 08 May 2018 15:15:50 -0700 (PDT)
Received: from [192.168.10.165] (dynamic-adsl-78-12-189-60.clienti.tiscali.it.
	[78.12.189.60]) by smtp.gmail.com with ESMTPSA id
	q6-v6sm14659210edb.66.2018.05.08.15.15.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 May 2018 15:15:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Olaf Hering <olaf@aepfle.de>, qemu-trivial@nongnu.org
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, Fam Zheng <famz@redhat.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<f4bug@amsat.org>
References: <20180418075045.27393-1-olaf@aepfle.de>
	<41df38a4-dc02-7c17-4877-26541fddd209@redhat.com>
Message-ID: <d058d5e6-710b-2f34-9828-9ddde18069a1@redhat.com>
Date: Wed, 9 May 2018 00:15:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <41df38a4-dc02-7c17-4877-26541fddd209@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.68
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1] configure: recognize
 more rpmbuild macros
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
X-List-Received-Date: Tue, 08 May 2018 22:15:55 -0000

On 18/04/2018 11:23, Paolo Bonzini wrote:
> On 18/04/2018 09:50, Olaf Hering wrote:
>> Extend the list of recognized, but ignored options from rpms %configure
>> macro. This fixes build on hosts running SUSE Linux.
>>
>> Signed-off-by: Olaf Hering <olaf@aepfle.de>
>> ---
>>  configure | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/configure b/configure
>> index 0a19b033bc..6e9b994f21 100755
>> --- a/configure
>> +++ b/configure
>> @@ -959,6 +959,9 @@ for opt do
>>    ;;
>>    --firmwarepath=*) firmwarepath="$optarg"
>>    ;;
>> +  --host=*|--build=*|\
>> +  --program-prefix=*|--exec-prefix=*|\
>> +  --disable-dependency-tracking|\

Actually, --program-prefix= and --exec-prefix= have a meaning, they
cannot just be ignored.  For now I've removed this line; what is the
exact incantation used by SUSE Linux?

Thanks,

Paolo

>>    --sbindir=*|--sharedstatedir=*|\
>>    --oldincludedir=*|--datarootdir=*|--infodir=*|--localedir=*|\
>>    --htmldir=*|--dvidir=*|--pdfdir=*|--psdir=*)
>>
> 
> Queued, thanks.
> 
> Paolo
> 


