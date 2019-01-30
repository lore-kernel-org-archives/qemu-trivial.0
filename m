Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1goni1-0006q9-AJ
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 06:07:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gonhz-0006om-Bv
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 06:07:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gonhx-0007lO-QN
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 06:07:07 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40050)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gonhx-0007l8-LD
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 06:07:05 -0500
Received: by mail-wr1-f66.google.com with SMTP id p4so25569766wrt.7
	for <qemu-trivial@nongnu.org>; Wed, 30 Jan 2019 03:07:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=6dHStAzFGlvlXN/w1mwu8d4R4FDhDpP5lXJEJm2HnVg=;
	b=NL8HDgCc+8ft3Ye6kTnOkj7vXhwM7vpgDDNKVuRVg3tS+P6nFxo1oq06G+yzZUPMdZ
	5ygTz9Vh+l5vcs05ewRszL5UKeAc4qkuVoiW6JZm/acbTtA/9mRRxAGwxIIWq7ubpp31
	oQvKzvxl9q0cHb6ecL8fL2HJzSfD9CJUj/A5NSEq8chGVc6M/+7S5zi1YCHLGuGRAE7X
	gsqhppY7DnMT5m3+5WfXme/MyrtTHxsHPZowith38VUbI6b+TugMnQTnrN1rxDaDL0QL
	MY5E9UevmaNJmexFsnWBiB08ej7pzD4ewQ2sBldc8IP1xRQYSOWK0Ws2RWiRWdleUIT4
	ECQQ==
X-Gm-Message-State: AJcUukc+NqMtoaRM7hC+Z5AfS3OPwOPsTCdzj0TQASHlzPg09DqQxoIK
	GB/tK3AXAaRzGeIq3VHj4ydtMg==
X-Google-Smtp-Source: ALg8bN6/25ywC9Uy57oBw7MZHqxlzviIFXFrdhCHQjqOEB27zybQSkamPF9FBWHw4yYIt0Z44t4NrQ==
X-Received: by 2002:adf:f848:: with SMTP id d8mr31626690wrq.178.1548846424337; 
	Wed, 30 Jan 2019 03:07:04 -0800 (PST)
Received: from [10.32.224.134] (red-hat-inc.vlan560.asr1.mad1.gblx.net.
	[159.63.51.90]) by smtp.gmail.com with ESMTPSA id
	h184sm6562438wmf.0.2019.01.30.03.07.03
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 03:07:03 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, Wei Yang <richardw.yang@linux.intel.com>, 
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Cc: imammedo@redhat.com, laurent@vivier.eu, mst@redhat.com
References: <20190130000653.16267-1-richardw.yang@linux.intel.com>
	<20190130000653.16267-2-richardw.yang@linux.intel.com>
	<69177d59-02c9-c6cd-be5a-092bf2476af1@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <0dcf35c6-1b12-9e20-a0f5-b3fe2ea0ae74@redhat.com>
Date: Wed, 30 Jan 2019 12:07:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <69177d59-02c9-c6cd-be5a-092bf2476af1@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 1/3] hw/i386/pc.c: remove
 unused function pc_acpi_init()
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
X-List-Received-Date: Wed, 30 Jan 2019 11:07:08 -0000

On 1/30/19 10:50 AM, Thomas Huth wrote:
> On 2019-01-30 01:06, Wei Yang wrote:
>> Function pc_acpi_init() is not used anymore.
>>
>> Remove the definition and declaration.
>>
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> Reviewed-by: Philippe Mathieu-Daud茅 <philmd@redhat.com>
>> Tested-by: Philippe Mathieu-Daud茅 <philmd@redhat.com>
> 
>  Hi,
> 
> at least in my e-mail client here, it looks like Philippe's last name
> got mojibaked here. It should be "Daudé", not "Daud茅", as far as I know.
> Same thing also happened in patch 2 and 3.

Thanks!

> 
> Apart from that:
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 

