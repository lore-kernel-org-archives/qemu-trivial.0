Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hLr35-0002Gv-B5
	for mharc-qemu-trivial@gnu.org; Wed, 01 May 2019 11:21:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60920)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hLr31-0002GK-8w
	for qemu-trivial@nongnu.org; Wed, 01 May 2019 11:21:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hLr2x-0007I9-O7
	for qemu-trivial@nongnu.org; Wed, 01 May 2019 11:21:26 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44823)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hLr2x-0007HV-Hz
	for qemu-trivial@nongnu.org; Wed, 01 May 2019 11:21:23 -0400
Received: by mail-wr1-f66.google.com with SMTP id c5so24919397wrs.11
	for <qemu-trivial@nongnu.org>; Wed, 01 May 2019 08:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=sBs20C05q7Q4dXs5W3ZxCu8LQI6WkJBlf/BuMXV4l7U=;
	b=IJnjq5CTLnYr4j5Y2gh+LRtIYTZkIK1mWRMeSRHeOLrgxCZxurYDb8n9i8l5DCkKIG
	+5hBuFYizUE54aGbbbpjVj/VcKB/Co5pbLm/k5v9Avr0QVQ5UX5m+SjkOlJfthfIP5Qo
	MB42v6IEtASE0XI1QVzsP5tR1mmzLRGtiWoJDZwZzPL04QxE4jUElj1eXW+rEjPWo3mv
	5i2dqYhu0MRqM2393b+eqZuAri0A+4sOi6AqbzWvAJYvwkSytG28cF+4x5GY+f5DAUg1
	nrDjzHImDs3rrROUCe99LvQVAvBC7cdcPoj41z8wA1CrMe5NOuILJ61Wum5w3r0hB49T
	rtKg==
X-Gm-Message-State: APjAAAXBFBWC2H99GbnHT0/XMYpjenPz/xljeMnD4QwKWWlw7fY8q+o/
	ZpIVApPa1e/bUz7jgdKYF0Ia8w==
X-Google-Smtp-Source: APXvYqxtEk0zhywY8z7NRjfcTz9EAXK4PySquk7UaUMt5G66ZiFA7p15NiAj1xlWgt0sYqjuXNGDjQ==
X-Received: by 2002:a05:6000:c2:: with SMTP id
	q2mr11346983wrx.324.1556724082674; 
	Wed, 01 May 2019 08:21:22 -0700 (PDT)
Received: from [192.168.1.37] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	c131sm5754821wma.31.2019.05.01.08.21.21
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 May 2019 08:21:22 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"alistair23@gmail.com" <alistair23@gmail.com>,
	"riku.voipio@iki.fi" <riku.voipio@iki.fi>,
	"laurent@vivier.eu" <laurent@vivier.eu>,
	"kraxel@redhat.com" <kraxel@redhat.com>
References: <cover.1556666645.git.alistair.francis@wdc.com>
	<ff51c73e3095fa503d14aafece54f8565fe99900.1556666645.git.alistair.francis@wdc.com>
	<0d585793-20a8-8dc8-98fa-13789113f672@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <9abcc3db-0749-e092-ab59-8144de027ba6@redhat.com>
Date: Wed, 1 May 2019 17:21:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <0d585793-20a8-8dc8-98fa-13789113f672@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 2/5] hw/usb/hcd-xhci: Fix
 GCC 9 build warning
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
X-List-Received-Date: Wed, 01 May 2019 15:21:30 -0000

On 5/1/19 4:12 PM, Richard Henderson wrote:
> On 4/30/19 4:28 PM, Alistair Francis wrote:
>>      for (i = 0; i < usbports; i++) {
>> +        g_assert(i < MAX(MAXPORTS_2, MAXPORTS_3));
> 
> I would hope that it works to move this out of the loop:
> 
>   g_assert(usbports <= MAX(MAXPORTS_2, MAXPORTS_3));

With Richard suggestion:

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

