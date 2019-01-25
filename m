Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gn4bB-0005HX-Dy
	for mharc-qemu-trivial@gnu.org; Fri, 25 Jan 2019 11:44:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55260)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gn4b8-0005Fd-LE
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2019 11:44:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gn4b7-0006mo-Ow
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2019 11:44:54 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43305)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gn4b7-0006lA-Ih
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2019 11:44:53 -0500
Received: by mail-wr1-f68.google.com with SMTP id r10so10973680wrs.10
	for <qemu-trivial@nongnu.org>; Fri, 25 Jan 2019 08:44:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ZvUN5aD8GYlLh1eExFQZ/Y/KmDVoMwb5Bwpn6h3TBhA=;
	b=V4cQON2V0izOeNzN8Mc0ha4iq88xkLz2HcXIdbdkTyFS7KQbHnceTQYWTbs/OdudXA
	8oy1TxDFdG7fBsGhtkionZs0Po/TQgljLvmmHiJozxNFeJP4iph4a+E9RluCMk154qAf
	6xHBT3J513k1NDNFfF7I2eaHRWCq8+33+Lrtv3+vhrRwt5Q9lgODkLISkHPaUK3fqYAt
	6mh4kKvfh6DW6DUg0uFyyinj2gEXIRTxbHc+RP456g+fOWqmDYfQZQqGWYq5SOjHYrYp
	E5GqDBnfCdVpGWwzL4+Fp9wd5THTnDjtu/xH/G8cHhja4pjQMWcGiz627/PYi9qyAj+Y
	gzUA==
X-Gm-Message-State: AJcUukdqJBt1yX5oAz1VHoAyUJyiLVokX3vuIY14ZweEULx0cSPPWqCa
	WAFgYwehpJMIdjx2oj2EOmtBvw==
X-Google-Smtp-Source: ALg8bN5Bi0FXNgJK560CmVCZdqApaIcQTwa5cMESBiVnkccS9ijkl+EmjzTwSTRvpIBUYj/B7WMvOA==
X-Received: by 2002:adf:ed46:: with SMTP id u6mr12521561wro.262.1548434691633; 
	Fri, 25 Jan 2019 08:44:51 -0800 (PST)
Received: from [192.168.1.39] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	o5sm118481246wmg.25.2019.01.25.08.44.50
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 08:44:51 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, kumar sourav <sourav.jb1988@gmail.com>,
	qemu-trivial@nongnu.org
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, mst@redhat.com
References: <20190125151440.13794-1-sourav.jb1988@gmail.com>
	<f9288ca3-1f07-3409-ac16-ce4dc958940e@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <cc09d469-56bc-9438-acc0-0d4ccf67e6a5@redhat.com>
Date: Fri, 25 Jan 2019 17:44:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <f9288ca3-1f07-3409-ac16-ce4dc958940e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw: input: set category of
 the i8042 device
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
X-List-Received-Date: Fri, 25 Jan 2019 16:44:55 -0000

On 1/25/19 4:24 PM, Thomas Huth wrote:
> On 2019-01-25 16:14, kumar sourav wrote:
>> Sets the category of i8042 device as DEVICE_CATEGORY_INPUT
>> Devices should be assigned to one of DEVICE_CATEGORY_XXXX.
>>
>> Signed-off-by: kumar sourav <sourav.jb1988@gmail.com>
>> ---
>>  hw/input/pckbd.c | 1 +

It seems we have other potential cases:

$ git grep -L 'set_bit(DEVICE_CATEGORY_INPUT' hw/input/*c
hw/input/adb.c
hw/input/hid.c
hw/input/lm832x.c
hw/input/milkymist-softusb.c
hw/input/pckbd.c
hw/input/pl050.c
hw/input/ps2.c
hw/input/pxa2xx_keypad.c
hw/input/stellaris_input.c
hw/input/tsc2005.c
hw/input/tsc210x.c
hw/input/virtio-input-hid.c
hw/input/virtio-input-host.c

>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
>> index 3e66713b47..72e7d5f6cc 100644
>> --- a/hw/input/pckbd.c
>> +++ b/hw/input/pckbd.c
>> @@ -574,6 +574,7 @@ static void i8042_class_initfn(ObjectClass *klass, void *data)
>>  
>>      dc->realize = i8042_realizefn;
>>      dc->vmsd = &vmstate_kbd_isa;
>> +    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
>>  }
>>  
>>  static const TypeInfo i8042_info = {
>>
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


