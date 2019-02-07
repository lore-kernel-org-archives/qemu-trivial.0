Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grrLa-0001dn-HE
	for mharc-qemu-trivial@gnu.org; Thu, 07 Feb 2019 16:36:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1grrLX-0001da-Ox
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 16:36:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1grrLW-0007jg-Sm
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 16:36:35 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55443)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1grrLW-0007ee-Hm
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 16:36:34 -0500
Received: by mail-wm1-f68.google.com with SMTP id r17so1395930wmh.5
	for <qemu-trivial@nongnu.org>; Thu, 07 Feb 2019 13:36:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=dSg9sRXgF5rPjmc3yqnnm24jTZkwnsGei7OGtmzL04I=;
	b=cbBY0r2dtpE68KtHWLwl+SpZVNdl+DQahG50K7dS1X0z9kH4+2bY83HVjyN1BqBKzD
	soe5hgzvrMHEraq/Y3rQnEAFYGWCZmITuAuInU+sbSRiTEYPg7VkDvNExGuHI9FrfWlm
	0BdM+aq0egm9ifRQ75Yz+UqlapRozWNdBHOQystDjjxlGRNdKUnNYLHiRIKImy98v0Ue
	SxgByqw5qQePa4xux8qn6Z/uMe69FmEwvWSSHTi10gD/z4fDYuS9d6r8rHf+6RjcN93V
	QvBV4Rs04nrQ8SWlNtAlE0rzhalEkKbBPSulgSh694FOH8yxTpPL6Sw288QlOnG3JuHR
	ikPA==
X-Gm-Message-State: AHQUAuZl5jMED/alp9vZagnKujMBgOAcCcziNa2gvN96X5e89egCnnTy
	+LMnc/bN8pPUfjsS25jfsbk6mw==
X-Google-Smtp-Source: AHgI3IYLHAElWpJ67v7LhZAmHSzUVfh2KKhiEJEBR9oK3Koy94P/bvn/FMqXnF9NtIU4lOwYhO8MkQ==
X-Received: by 2002:a1c:c303:: with SMTP id t3mr8439133wmf.94.1549575386334;
	Thu, 07 Feb 2019 13:36:26 -0800 (PST)
Received: from [192.168.1.103] (10.red-83-35-153.dynamicip.rima-tde.net.
	[83.35.153.10])
	by smtp.gmail.com with ESMTPSA id f15sm169481wrt.10.2019.02.07.13.36.25
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Feb 2019 13:36:25 -0800 (PST)
To: Laurent Vivier <laurent@vivier.eu>, Cleber Rosa <crosa@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Eduardo Habkost <ehabkost@redhat.com>
References: <20190207193605.25676-1-crosa@redhat.com>
	<20190207193605.25676-3-crosa@redhat.com>
	<eb52ed3a-e2fb-d5d2-5d7e-ceb41e8a7987@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <ae5fa4e8-24aa-4d00-8d74-21f6539dc59f@redhat.com>
Date: Thu, 7 Feb 2019 22:36:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <eb52ed3a-e2fb-d5d2-5d7e-ceb41e8a7987@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/4] configure: fix qemu-img
 name
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
X-List-Received-Date: Thu, 07 Feb 2019 21:36:36 -0000

On 2/7/19 9:11 PM, Laurent Vivier wrote:
> On 07/02/2019 20:36, Cleber Rosa wrote:
>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>> ---
>>  configure | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/configure b/configure
>> index ff55e2273e..c8fc1647fe 100755
>> --- a/configure
>> +++ b/configure
>> @@ -1768,7 +1768,7 @@ disabled with --disable-FEATURE, default is enabled if available:
>>    virglrenderer   virgl rendering support
>>    xfsctl          xfsctl support
>>    qom-cast-debug  cast debugging support
>> -  tools           build qemu-io, qemu-nbd and qemu-image tools
>> +  tools           build qemu-io, qemu-nbd and qemu-img tools
>>    vxhs            Veritas HyperScale vDisk backend support
>>    bochs           bochs image format support
>>    cloop           cloop image format support
>>
> 
> Fixes: c12d66aac1aa ("configure: add the missing help output for
> optional features")
> 
> Perhaps the list can be updated with qemu-edid, ivshmem-client and elf2dmp?

Good idea! Eventually the trivial@ maintainer is willing to fulfil your
request if he takes this patch :D

> Reviewed-by: Laurent Vivier <laurent@vivier.eu>

As it or with Laurent's suggestion:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


