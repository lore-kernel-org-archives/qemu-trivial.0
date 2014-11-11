Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xo6S3-0005A8-5U
	for mharc-qemu-trivial@gnu.org; Tue, 11 Nov 2014 03:05:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36288)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Xo6Rr-0004v4-EE
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 03:05:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Xo6Ri-0000ga-De
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 03:05:11 -0500
Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f]:44654)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1Xo6RP-0000br-2n; Tue, 11 Nov 2014 03:04:43 -0500
Received: by mail-pd0-f175.google.com with SMTP id y13so9661184pdi.34
	for <multiple recipients>; Tue, 11 Nov 2014 00:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=QrLzdwguS2tzxkXgupKHGSGXm+GBoDuWSr3geP9ekvU=;
	b=oljniTAJRzrBzzoFbtDdfHmXe/1bCs4luw23A8A22MD8RSu9cggeOnREVobUVf9DIk
	AXA5lqX8xRCq87dcYAEyBUNvoTBbg43kkLz1poHwZD+Cd+SNfCyj6vhFqmqOHWtA7trw
	fjne/CLZJxQqSgV5smzznqPTDNbPVYSQYHRlhOUlkDp2kSbYpGLJAXW0EWtGTYWqQrD1
	/qsiVIE97GT97XUaNIaBiu93JCpxCsvF4n58sc+aFg64n8Bcvnl4LExk0Ta21iwZla2U
	JW7b3Tj2tOGlHxaH/FUHInslzU5K+LDs4v/Iwq9GKKocaEdsSOxbxlnp4F3iyRP8JYAA
	95NA==
X-Received: by 10.66.161.197 with SMTP id xu5mr37490890pab.3.1415693081064;
	Tue, 11 Nov 2014 00:04:41 -0800 (PST)
Received: from ShengShiZhuChengdeMacBook-Pro.local ([124.127.118.42])
	by mx.google.com with ESMTPSA id
	wa3sm18653944pac.18.2014.11.11.00.04.34 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Nov 2014 00:04:39 -0800 (PST)
Message-ID: <5461C48B.5040307@gmail.com>
Date: Tue, 11 Nov 2014 16:10:51 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, Guenter Roeck <linux@roeck-us.net>, 
	Peter Maydell <peter.maydell@linaro.org>
References: <54574A46.3060709@gmail.com> <5461A8C7.5070104@msgid.tls.msk.ru>
In-Reply-To: <5461A8C7.5070104@msgid.tls.msk.ru>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::22f
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] pc-bios: petalogix-s3adsp1800.dtb: Use
 'xlnx, xps-ethernetlite-2.00.a' instead of 'xlnx, xps-ethernetlite-2.00.b'
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
X-List-Received-Date: Tue, 11 Nov 2014 08:05:20 -0000

On 11/11/14 14:12, Michael Tokarev wrote:
> 03.11.2014 12:26, Chen Gang wrote:
>> For Linux upstream kernel (e.g. 3.17-rc7), the related compatible string
>> 'xlnx,xps-ethernetlite-2.00.a' is supported, but 'b' is not supported,
>> so change qemu dtb file to match kernel driver.
>>
>> The related operation for qemu (after this patch):
>>
>>    yum install libvirt
>>    yum install tunctl
>>    tunctl -b
>>    ip link set tap0 up
>>    brctl addif virbr0 tap0
>>
>>    ./configure
>>    make
>>    ./microblaze-softmmu/qemu-system-microblaze -M petalogix-s3adsp1800 \
>>      -kernel ../linux-stable.microblaze/arch/microblaze/boot/linux.bin \
>>      -no-reboot -append "console=ttyUL0,115200 doreboot" -nographic \
>>      -net nic,vlan=0,model=xlnx.xps-ethernetlite,macaddr=00:16:35:AF:94:00 \
>>      -net tap,vlan=0,ifname=tap0,script=no,downscript=no
>>
>>    in microblaze qemu bash (guest machine):
>>
>>      ifconfig eth0 add 192.168.122.2 netmask 255.255.255.0
>>      ifconfig eth0 up
>>
>>    Then can telnet 192.168.122.2 directly without password from the host
>>    machine.
>>
>> The related operation for generating new dtb:
>>
>>    building Linux kernel firstly, then get dts tool "./scripts/dts/dts".
>>    "./scripts/dtc/dtc -I dtb -O dts  -o ../work.dts ../qemu/petalogix-s3adsp1800.dtb"
>>    edit work.dts (replace 'xlnx,xps-ethernetlite-2.00.b')
>>    "./scripts/dtc/dtc -I dts -O dtb  -o ..qemu/petalogix-s3adsp1800.dtb ../work.dts"
> 
> Oh well.  I don't like this patch to be lost, but I must admit I don't
> understand what's happening here.  Applied to -trivial.
> 

OK, thank you for your work. And I shall try to make another patch for
qemu within this month.


Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

