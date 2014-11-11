Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xo4hA-00035o-AA
	for mharc-qemu-trivial@gnu.org; Tue, 11 Nov 2014 01:12:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48835)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xo4h2-0002r0-2E
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 01:12:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xo4gv-0005sj-Ty
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 01:12:44 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:36452)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xo4gi-0005pt-Ve; Tue, 11 Nov 2014 01:12:25 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id AEC2A41C62;
	Tue, 11 Nov 2014 09:12:23 +0300 (MSK)
Message-ID: <5461A8C7.5070104@msgid.tls.msk.ru>
Date: Tue, 11 Nov 2014 09:12:23 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: Chen Gang <gang.chen.5i5j@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
	Peter Maydell <peter.maydell@linaro.org>
References: <54574A46.3060709@gmail.com>
In-Reply-To: <54574A46.3060709@gmail.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
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
X-List-Received-Date: Tue, 11 Nov 2014 06:12:50 -0000

03.11.2014 12:26, Chen Gang wrote:
> For Linux upstream kernel (e.g. 3.17-rc7), the related compatible string
> 'xlnx,xps-ethernetlite-2.00.a' is supported, but 'b' is not supported,
> so change qemu dtb file to match kernel driver.
> 
> The related operation for qemu (after this patch):
> 
>    yum install libvirt
>    yum install tunctl
>    tunctl -b
>    ip link set tap0 up
>    brctl addif virbr0 tap0
> 
>    ./configure
>    make
>    ./microblaze-softmmu/qemu-system-microblaze -M petalogix-s3adsp1800 \
>      -kernel ../linux-stable.microblaze/arch/microblaze/boot/linux.bin \
>      -no-reboot -append "console=ttyUL0,115200 doreboot" -nographic \
>      -net nic,vlan=0,model=xlnx.xps-ethernetlite,macaddr=00:16:35:AF:94:00 \
>      -net tap,vlan=0,ifname=tap0,script=no,downscript=no
> 
>    in microblaze qemu bash (guest machine):
> 
>      ifconfig eth0 add 192.168.122.2 netmask 255.255.255.0
>      ifconfig eth0 up
> 
>    Then can telnet 192.168.122.2 directly without password from the host
>    machine.
> 
> The related operation for generating new dtb:
> 
>    building Linux kernel firstly, then get dts tool "./scripts/dts/dts".
>    "./scripts/dtc/dtc -I dtb -O dts  -o ../work.dts ../qemu/petalogix-s3adsp1800.dtb"
>    edit work.dts (replace 'xlnx,xps-ethernetlite-2.00.b')
>    "./scripts/dtc/dtc -I dts -O dtb  -o ..qemu/petalogix-s3adsp1800.dtb ../work.dts"

Oh well.  I don't like this patch to be lost, but I must admit I don't
understand what's happening here.  Applied to -trivial.

Thanks,

/mjt

