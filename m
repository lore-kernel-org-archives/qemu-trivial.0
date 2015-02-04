Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YJ8ri-0002sX-64
	for mharc-qemu-trivial@gnu.org; Wed, 04 Feb 2015 17:56:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44187)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YJ8rf-0002p3-LK
	for qemu-trivial@nongnu.org; Wed, 04 Feb 2015 17:56:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YJ8re-0005Di-4w
	for qemu-trivial@nongnu.org; Wed, 04 Feb 2015 17:56:07 -0500
Received: from out21.biz.mail.alibaba.com ([205.204.114.132]:53314)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>)
	id 1YJ8rZ-0005CQ-BA; Wed, 04 Feb 2015 17:56:01 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07424364|-1; FP=0|0|0|0|0|-1|-1|-1;
	HT=r41f05022; MF=gang.chen@sunrus.com.cn; PH=DS; RN=5; RT=5;
	SR=0; 
Received: from
	ShengShiZhuChengdeMacBook-Pro.local(mailfrom:gang.chen@sunrus.com.cn
	ip:223.72.65.53) by smtp.aliyun-inc.com(10.194.100.109);
	Thu, 05 Feb 2015 06:55:47 +0800
Message-ID: <54D2A547.8090404@sunrus.com.cn>
Date: Thu, 05 Feb 2015 07:03:35 +0800
From: Chen Gang S <gang.chen@sunrus.com.cn>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <54C4DC4E.3080306@sunrus.com.cn>
	<CAFEAcA_hGO-R85yYXDU7eoC7FHF_v96y7Oh54SX9HXBAss6Vpg@mail.gmail.com>
	<54C5672D.4080800@sunrus.com.cn>
	<CAFEAcA9mqzpHsWcyDdzBYDWdxsR1AoDy3akgHCaMUbjZ0zh=0Q@mail.gmail.com>
	<54C6566B.6050205@sunrus.com.cn>
	<CAFEAcA8q7jNqL8DFygnHaiiv=2pGKXBQ_Gi1icOn9H=diOXK5Q@mail.gmail.com>
	<20150128142705.GA22971@afflict.kos.to>
	<54C95E09.1030107@sunrus.com.cn>
	<CAFEAcA-GviCfmB3vZVFRNXK7BDHoKON7ZCE9-=bE0SrYCQj9gg@mail.gmail.com>
	<54C98EF3.3070405@sunrus.com.cn>
In-Reply-To: <54C98EF3.3070405@sunrus.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 205.204.114.132
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user/syscall.c: Let
 all lock_user_struct() and unlock_user_struct() paired with each other
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
X-List-Received-Date: Wed, 04 Feb 2015 22:56:08 -0000

On 1/29/15 09:37, Chen Gang S wrote:
> On 1/29/15 06:36, Peter Maydell wrote:
>> On 28 January 2015 at 22:09, Chen Gang S <gang.chen@sunrus.com.cn> wrote:
>>>  - Is what I said above really correct (e.g. is linux-user really mainly
>>>    for cpu emulation)?.
>>
>> Not really. linux-user is mainly for running single Linux binaries.
>> It has a secondary use for running gcc test binaries which think
>> they are "bare metal" but actually use some kind of semihosting API.
>> (You should check whether tile has one of those.)
>>
>> As well as linux-user mode, QEMU has system emulation mode, where
>> we emulate a complete machine.
>>
>> Both modes need CPU emulation.
>>
> 
> OK, thanks.
> 
> For coding and test, is linux-user a good starting position for me? (I
> guess it is).
> 

At present, I make a static program which will print "Hello world" for
microblaze architecture, and can excute successfully.

  [root@localhost qemu]# cat test.c
  #include <stdio.h>
  
  int main()
  {
  	printf("Hello world!\n");
  	return 0;
  }
  [root@localhost qemu]# /upstream/release/bin/microblaze-gchen-linux-gcc -Wall -O2 -static -o test.mb test.c
  [root@localhost qemu]# file ./test.mb
  ./test.mb: ELF 32-bit MSB executable, Xilinx MicroBlaze 32-bit RISC, version 1 (SYSV), statically linked, for GNU/Linux 2.6.32, not stripped
  [root@localhost qemu]# ls -l ./test.mb
  -rwxr-xr-x. 1 root root 3224540 Feb  5 06:39 ./test.mb
  [root@localhost qemu]# ./microblaze-linux-user/qemu-microblaze ./test.mb
  Hello world!
  
And I also generate tile "Hello world" static program:

  [root@localhost qemu]# /upstream/release-tile/bin/tilegx-gchen-linux-gcc -Wall -O2 -static -o test.tgx test.c
  [root@localhost qemu]# file ./test.tgx 
  ./test.tgx: ELF 64-bit LSB executable, Tilera TILE-Gx, version 1 (SYSV), statically linked, for GNU/Linux 2.6.32, not stripped
  [root@localhost qemu]# ls -l ./test.tgx 
  -rwxr-xr-x. 1 root root 3611376 Feb  5 06:42 ./test.tgx

I shall try to let tile "Hello world" static program run successfully
within this month:

 - 1st patch: can run an empty elf64 tile executable in linux-user.
   (try to finish within 2015-02-15).

 - 2nd patch: can run "Hello world" elf64 tile program in linux-user.
   (try to finish within 2015-02-25, it seems hard to finish in time).

 - 3rd patch: for completion, or fixing issues, or documentations.
   (try to finish within 2015-02-28).


Welcome any ideas, suggestions, and completions.

Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

